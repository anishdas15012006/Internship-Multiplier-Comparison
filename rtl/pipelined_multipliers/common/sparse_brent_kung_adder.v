`timescale 1ns/1ps

module sparse_brent_kung_adder #(
    parameter N = 32               // Bit width (16, 32, 64)
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // --------------------------------------------------------------------------
    // 1. Compile-Time Constants & Geometry Calculations
    // --------------------------------------------------------------------------
    localparam K          = 4;                 // Sparsity factor (2, 4, 8)
    localparam NUM_SPARSE = N / K;
    localparam STAGES     = $clog2(N);
    localparam K_LOG      = $clog2(K);

    // Number of backward expansion stages needed to reach granularity K
    localparam BWD_STAGES = (STAGES > (K_LOG + 1)) ? (STAGES - K_LOG - 1) : 0;
    
    // Total layers needed across forward and backward trees
    localparam TOTAL_LAYERS = STAGES + BWD_STAGES;
    localparam GRID_SIZE    = N * (TOTAL_LAYERS + 1);
    
    // The line in flat_g/flat_p where sparse carries are sampled
    localparam FINAL_LINE   = TOTAL_LAYERS * N;

    // --------------------------------------------------------------------------
    // PHASE 1: Bitwise Pre-Processing
    // --------------------------------------------------------------------------
    wire [N-1:0] g = A & B;
    wire [N-1:0] p = A ^ B;

    wire [GRID_SIZE-1:0] flat_g;
    wire [GRID_SIZE-1:0] flat_p;

    // Stage 0 setup with Cin
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_stage0
            if (i == 0) begin : bit_0
                assign flat_g[0] = g[0] | (p[0] & Cin);
                assign flat_p[0] = p[0];
            end else begin : bit_n
                assign flat_g[i] = g[i];
                assign flat_p[i] = p[i];
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 2A: Forward Brent-Kung Tree (Logarithmic Reduction)
    // --------------------------------------------------------------------------
    genvar stg, idx;
    generate
        for (stg = 0; stg < STAGES; stg = stg + 1) begin : gen_bk_forward
            localparam CURR_LINE = stg * N;
            localparam NEXT_LINE = (stg + 1) * N;
            localparam STRIDE    = 1 << stg;
            localparam STEP      = 1 << (stg + 1);

            for (idx = 0; idx < N; idx = idx + 1) begin : gen_cells
                if (((idx + 1) % STEP == 0) && (idx >= STRIDE)) begin : active_cell
                    localparam TARGET = idx - STRIDE;
                    assign flat_g[NEXT_LINE + idx] = flat_g[CURR_LINE + idx] | 
                                                     (flat_p[CURR_LINE + idx] & flat_g[CURR_LINE + TARGET]);
                    assign flat_p[NEXT_LINE + idx] = flat_p[CURR_LINE + idx] & 
                                                     flat_p[CURR_LINE + TARGET];
                end else begin : passthrough_cell
                    assign flat_g[NEXT_LINE + idx] = flat_g[CURR_LINE + idx];
                    assign flat_p[NEXT_LINE + idx] = flat_p[CURR_LINE + idx];
                end
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 2B: Dynamic Backward Expansion Tree
    // --------------------------------------------------------------------------
    genvar bwd_step;
    generate
        for (bwd_step = 0; bwd_step < BWD_STAGES; bwd_step = bwd_step + 1) begin : gen_backward_tree
            localparam back_idx        = STAGES - 2 - bwd_step;
            localparam STEP            = 1 << back_idx;
            localparam EXEC_LAYER      = STAGES + bwd_step;
            localparam CURR_STAGE_LINE = EXEC_LAYER * N;
            localparam NEXT_STAGE_LINE = (EXEC_LAYER + 1) * N;

            for (idx = 0; idx < N; idx = idx + 1) begin : gen_backward_cells
                // if (((idx + 1) % (2 * STEP) == STEP) && (idx - STEP >= 0) && ((idx + 1) % K == 0)) begin : black_cell_bwd
                if (((idx + 1) % (2 * STEP) == STEP) && (idx - STEP >= 0)) begin : black_cell_bwd
                    assign flat_g[NEXT_STAGE_LINE + idx] = flat_g[CURR_STAGE_LINE + idx] |
                                                           (flat_p[CURR_STAGE_LINE + idx] & flat_g[CURR_STAGE_LINE + idx - STEP]);
                    assign flat_p[NEXT_STAGE_LINE + idx] = flat_p[CURR_STAGE_LINE + idx] & 
                                                           flat_p[CURR_STAGE_LINE + idx - STEP];
                end else begin : passthrough_bwd
                    assign flat_g[NEXT_STAGE_LINE + idx] = flat_g[CURR_STAGE_LINE + idx];
                    assign flat_p[NEXT_STAGE_LINE + idx] = flat_p[CURR_STAGE_LINE + idx];
                end
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 3: Extract Sparse Carries & Local Block Ripple
    // --------------------------------------------------------------------------
    wire [NUM_SPARSE-1:0] sparse_carries;
    generate
        for (i = 0; i < NUM_SPARSE; i = i + 1) begin : gen_extract_carries
            localparam BIT_POS = (i + 1) * K - 1;
            assign sparse_carries[i] = flat_g[FINAL_LINE + BIT_POS];
        end
    endgenerate

    wire [N:0] full_carries;
    assign full_carries[0] = Cin;

    generate
        for (i = 0; i < NUM_SPARSE; i = i + 1) begin : gen_bind_carries
            assign full_carries[(i + 1) * K] = sparse_carries[i];
        end
    endgenerate

    genvar blk, b_idx;
    generate
        for (blk = 0; blk < NUM_SPARSE; blk = blk + 1) begin : gen_blocks
            for (b_idx = 0; b_idx < K; b_idx = b_idx + 1) begin : gen_local_bits
                localparam BIT_POS = blk * K + b_idx;
                
                if (b_idx > 0) begin : internal_carry
                    assign full_carries[BIT_POS] = g[BIT_POS - 1] |
                                                   (p[BIT_POS - 1] & full_carries[BIT_POS - 1]);
                end

                assign Sum[BIT_POS] = p[BIT_POS] ^ full_carries[BIT_POS];
            end
        end
    endgenerate

    assign Cout = full_carries[N];

endmodule
`timescale 1ns/1ps
`default_nettype none

module sparse_kogge_stone_adder #(
    parameter integer N = 16  // NOW SUPPORTS ANY BITWIDTH! (e.g., 7, 10, 13, 16, 21...)
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // =========================================================================
    // Compile-Time Constants (Ceiling Division for Arbitrary N)
    // =========================================================================
    localparam integer K = 4;   // Sparsity factor (typically 4)
    localparam integer NUM_SPARSE    = (N + K - 1) / K;    // Ceil(N / K)
    localparam integer LOCAL_STAGES  = $clog2(K);          // Stages for K-bit block
    localparam integer GLOBAL_STAGES = $clog2(NUM_SPARSE); // Stages for sparse blocks

    localparam integer LOC_GRID_SIZE  = N * (LOCAL_STAGES + 1);
    localparam integer GLOB_GRID_SIZE = NUM_SPARSE * (GLOBAL_STAGES + 1);

    // Helper macro function: Returns minimum of two integers
    function automatic integer min(input integer a, input integer b);
        min = (a < b) ? a : b;
    endfunction

    // =========================================================================
    // 1. Pre-Processing Phase (Bitwise Generate & Propagate)
    // =========================================================================
    wire [N-1:0] g = A & B;
    wire [N-1:0] p = A ^ B;

    // =========================================================================
    // 2. LEVEL 1: Local Intra-Block Prefix Tree (Flat 1D Vector)
    // =========================================================================
    wire [LOC_GRID_SIZE-1:0] loc_g;
    wire [LOC_GRID_SIZE-1:0] loc_p;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : g_loc_init
            assign loc_g[i] = g[i];
            assign loc_p[i] = p[i];
        end
    endgenerate

    genvar stg, idx;
    generate
        for (stg = 0; stg < LOCAL_STAGES; stg = stg + 1) begin : g_local_tree
            localparam integer CURR_LINE = stg * N;
            localparam integer NEXT_LINE = (stg + 1) * N;
            localparam integer STRIDE    = 1 << stg;

            for (idx = 0; idx < N; idx = idx + 1) begin : g_local_cells
                // Restrict lookback strictly WITHIN block boundaries
                if ((idx % K) >= STRIDE) begin : g_combine
                    localparam integer TARGET = idx - STRIDE;
                    assign loc_g[NEXT_LINE + idx] = loc_g[CURR_LINE + idx] | 
                                                   (loc_p[CURR_LINE + idx] & loc_g[CURR_LINE + TARGET]);
                    assign loc_p[NEXT_LINE + idx] = loc_p[CURR_LINE + idx] & 
                                                   loc_p[CURR_LINE + TARGET];
                end else begin : g_pass
                    assign loc_g[NEXT_LINE + idx] = loc_g[CURR_LINE + idx];
                    assign loc_p[NEXT_LINE + idx] = loc_p[CURR_LINE + idx];
                end
            end
        end
    endgenerate

    // Extract Block-Level Summary G and P at block boundaries or top-most bit of partial block
    wire [NUM_SPARSE-1:0] blk_g;
    wire [NUM_SPARSE-1:0] blk_p;
    localparam integer LOC_FINAL_LINE = LOCAL_STAGES * N;

    genvar b;
    generate
        for (b = 0; b < NUM_SPARSE; b = b + 1) begin : g_blk_extract
            // Clamp BIT_POS so top partial block extracts at N-1 instead of out-of-bounds
            localparam integer BIT_POS = min((b + 1) * K - 1, N - 1);
            assign blk_g[b] = loc_g[LOC_FINAL_LINE + BIT_POS];
            assign blk_p[b] = loc_p[LOC_FINAL_LINE + BIT_POS];
        end
    endgenerate

    // =========================================================================
    // 3. LEVEL 2: Global Inter-Block Prefix Tree (Flat 1D Vector)
    // =========================================================================
    wire [GLOB_GRID_SIZE-1:0] glob_g;
    wire [GLOB_GRID_SIZE-1:0] glob_p;

    // Block 0 incorporates Cin
    assign glob_g[0] = blk_g[0] | (blk_p[0] & Cin);
    assign glob_p[0] = blk_p[0];

    generate
        for (b = 1; b < NUM_SPARSE; b = b + 1) begin : g_glob_init
            assign glob_g[b] = blk_g[b];
            assign glob_p[b] = blk_p[b];
        end
    endgenerate

    generate
        for (stg = 0; stg < GLOBAL_STAGES; stg = stg + 1) begin : g_global_tree
            localparam integer CURR_LINE = stg * NUM_SPARSE;
            localparam integer NEXT_LINE = (stg + 1) * NUM_SPARSE;
            localparam integer STRIDE    = 1 << stg;

            for (b = 0; b < NUM_SPARSE; b = b + 1) begin : g_global_cells
                if (b >= STRIDE) begin : g_combine
                    localparam integer TARGET = b - STRIDE;
                    assign glob_g[NEXT_LINE + b] = glob_g[CURR_LINE + b] | 
                                                  (glob_p[CURR_LINE + b] & glob_g[CURR_LINE + TARGET]);
                    assign glob_p[NEXT_LINE + b] = glob_p[CURR_LINE + b] & 
                                                  glob_p[CURR_LINE + TARGET];
                end else begin : g_pass
                    assign glob_g[NEXT_LINE + b] = glob_g[CURR_LINE + b];
                    assign glob_p[NEXT_LINE + b] = glob_p[CURR_LINE + b];
                end
            end
        end
    endgenerate

    // =========================================================================
    // 4. Post-Processing & Final Carry Output
    // =========================================================================
    wire [N:0] full_carries;
    assign full_carries[0] = Cin;

    // Connect extracted global carries to block boundaries
    localparam integer GLOB_FINAL_LINE = GLOBAL_STAGES * NUM_SPARSE;

    generate
        for (b = 0; b < NUM_SPARSE; b = b + 1) begin : g_bind_carries
            localparam integer BOUNDARY_POS = (b + 1) * K;
            if (BOUNDARY_POS < N) begin : g_valid_boundary
                assign full_carries[BOUNDARY_POS] = glob_g[GLOB_FINAL_LINE + b];
            end
        end
    endgenerate

    // Intra-Block Ripple Carry
    genvar blk, b_idx;
    generate
        for (blk = 0; blk < NUM_SPARSE; blk = blk + 1) begin : g_blocks
            for (b_idx = 0; b_idx < K; b_idx = b_idx + 1) begin : g_local_bits
                localparam integer BIT_POS = blk * K + b_idx;

                if (BIT_POS < N) begin : g_valid_bit
                    if (b_idx > 0) begin : g_internal_carry
                        assign full_carries[BIT_POS] = g[BIT_POS - 1] | 
                                                       (p[BIT_POS - 1] & full_carries[BIT_POS - 1]);
                    end

                    assign Sum[BIT_POS] = p[BIT_POS] ^ full_carries[BIT_POS];
                end
            end
        end
    endgenerate

    // Explicitly compute Cout from the top bit (N-1) to guarantee zero 'z' states:
    assign Cout = g[N-1] | (p[N-1] & full_carries[N-1]);

endmodule
`default_nettype wire
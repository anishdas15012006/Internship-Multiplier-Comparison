`timescale 1ns/1ps
`default_nettype none

module brent_kung_adder #(
    parameter N = 8 // Best evaluated at powers of 2 (8, 16, 32, 64)
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // --------------------------------------------------------------------------
    // 1. Compile-Time Constants
    // --------------------------------------------------------------------------
    // Number of layers for an N-bit Brent-Kung adder is (2 * log2(N)) - 1
    // For N=8, log2(8)=3, so (2*3)-1 = 5 layers inside the prefix grid.
    // We add 1 for the base stage (Stage 0).
    localparam LOG_N = $clog2(N);
    localparam NUM_STAGES = (2 * LOG_N) - 1;

    // Total bits = N * (NUM_STAGES + 1)
    // For N=8, NUM_STAGES=3 -> Total Bits = 8 * 4 = 32 bits wide (indexed 31 down to 0)
    // The +1 stage is for Stage0
    localparam TOTAL_GRID_BITS = N * (NUM_STAGES + 1);

    // --------------------------------------------------------------------------
    // 2. The Flattened 1D Routing Vectors
    // --------------------------------------------------------------------------
    wire [TOTAL_GRID_BITS-1:0] flat_p;      // Propagate
    wire [TOTAL_GRID_BITS-1:0] flat_g;      // Generate

    // --------------------------------------------------------------------------
    // PHASE 1 : Pre-Processing (Stage 0 Generation)
    // --------------------------------------------------------------------------
    genvar idx;     // Here genvar is idx as in the next phase, we will use the genvar i
    generate
        for(idx = 0; idx < N; idx = idx + 1) begin : gen_stage0
            // Stage 0 offset is just (0 * N) + idx = idx
            
            // 1. Calculate Propagate (Same for all bits)
            assign flat_p[idx] = A[idx] ^ B[idx];       // P = A xor B
            
            // 2. Calculate Generate (Conditional for bit 0)
            if (idx == 0) begin : stage0_bit0
                // For column 0, combine (A & B) with the propagated Cin
                // A[0] & B[0], if both are 1, carry is generated
                // A[0] xor B[0] & Cin, carry is propagated from Cin here 
                assign flat_g[0] = (A[0] & B[0]) | ((A[0] ^ B[0]) & Cin);
            end 
            else begin : stage0_bits
                // For all other columns (1 to N-1), use standard standalone generate math
                assign flat_g[idx] = A[idx] & B[idx];   // G = A . B
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 2 : THE FORWARD TREE (Reduction Phase)
    // --------------------------------------------------------------------------
    // Runs for O(log N) layers. 
    // At each layer stage_idx (from 0 to LOG_N-1):
    // - Current layer data is read from: stage_idx * N
    // - Next layer data is written to:   (stage_idx + 1) * N
    // - Step size spans:                 2^stage_idx
    genvar stage_idx;
    generate
        for (stage_idx = 0; stage_idx < LOG_N; stage_idx = stage_idx + 1) begin : gen_forward_tree
            localparam STEP = 1 << stage_idx;   // 1(2^0), 2(2^1), 4(2^2), 8(2^3), ......

            for (idx = 0; idx < N; idx = idx + 1) begin : gen_forward_cells
                // Read and Write flat offsets
                localparam CURR_STAGE_LINE = stage_idx * N;
                localparam NEXT_STAGE_LINE = (stage_idx + 1) * N;

                // Forward tree condition: Only compute at indices matching the binary block span
                if ((idx + 1) % (STEP * 2) == 0) begin : black_cell_fwd
                    assign flat_g[NEXT_STAGE_LINE + idx] = flat_g[CURR_STAGE_LINE + idx] | (flat_p[CURR_STAGE_LINE + idx] & flat_g[CURR_STAGE_LINE + idx - STEP]);
                    assign flat_p[NEXT_STAGE_LINE + idx] = flat_p[CURR_STAGE_LINE + idx] & flat_p[CURR_STAGE_LINE + idx - STEP];
                end
                else begin : passthrough_fwd
                    assign flat_g[NEXT_STAGE_LINE + idx] = flat_g[CURR_STAGE_LINE + idx];
                    assign flat_p[NEXT_STAGE_LINE + idx] = flat_p[CURR_STAGE_LINE + idx];
                end
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 3 : THE BACKWARD TREE (Expansion Phase)
    // --------------------------------------------------------------------------
    // Runs for (LOG_N - 1) layers.
    // We reverse the process to fill intermediate gap carries.
    // The loop tracks back_idx from (LOG_N - 2) down to 0.
    genvar back_idx;
    generate
        for (back_idx = LOG_N - 2; back_idx >= 0; back_idx = back_idx - 1) begin : gen_backward_tree
            // Mapping the physical execution layer index sequentially forward
            // The first backward layer starts right where the forward tree finished (at LOG_N)
            localparam STEP = 1 << back_idx;   // 1(2^0), 2(2^1), 4(2^2), 8(2^3), ......
            localparam EXEC_LAYER = LOG_N + (LOG_N - 2 - back_idx);

            for (idx = 0; idx < N; idx = idx + 1) begin : gen_backward_cells
                localparam CURR_STAGE_LINE = EXEC_LAYER * N;
                localparam NEXT_STAGE_LINE = (EXEC_LAYER + 1) * N;

                // Backward tree condition: Identify intermediate gap points to resolve
                if (((idx + 1) % (2 * STEP) == STEP) && (idx - STEP >= 0)) begin : black_cell_bwd
                    assign flat_g[NEXT_STAGE_LINE + idx] = flat_g[CURR_STAGE_LINE + idx] | 
                                                  (flat_p[CURR_STAGE_LINE + idx] & flat_g[CURR_STAGE_LINE + idx - STEP]);
                    assign flat_p[NEXT_STAGE_LINE + idx] = flat_p[CURR_STAGE_LINE + idx] & flat_p[CURR_STAGE_LINE + idx - STEP];
                end 
                else begin : passthrough_bwd
                    assign flat_g[NEXT_STAGE_LINE + idx] = flat_g[CURR_STAGE_LINE + idx];
                    assign flat_p[NEXT_STAGE_LINE + idx] = flat_p[CURR_STAGE_LINE + idx];
                end
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 4 : OUTPUT SUM GENERATION
    // --------------------------------------------------------------------------
    // The final data state layer resides at stage NUM_STAGES
    localparam FINAL_STAGE_LINE = N * NUM_STAGES;

    generate
        for (idx = 0; idx < N; idx = idx + 1) begin : gen_sum
            if (idx == 0) begin : sum_bit0
                // Bit 0 combines its initial propagate (flat_p[0]) with external Cin
                assign Sum[0] = flat_p[0] ^ Cin;    // Propagate = A xor B and Sum = A xor B xor Cin
            end
            else begin : sum_bits
                // Bit k combines initial propagate flat_p[k] with carry exiting column k-1
                // inside the final stage layer row track
                // flat_p[k] is the A[k] xor B[k] and flat_g[...] is the carry from prev column (column at right)
                assign Sum[idx] = flat_p[idx] ^ flat_g[FINAL_STAGE_LINE + (idx - 1)];
            end
        end
    endgenerate

    // Cout is the final lookahead generate from the absolute highest bit track (MSB)
    assign Cout = flat_g[FINAL_STAGE_LINE + (N - 1)];

endmodule

`default_nettype wire

`timescale 1ns/1ps
`default_nettype none

module kogge_stone_adder #(
    parameter N = 8
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
    localparam NUM_STAGES = $clog2(N);

    // Total bits = N * (NUM_STAGES + 1)
    // For N=8, NUM_STAGES=3 -> Total Bits = 8 * 4 = 32 bits wide (indexed 31 down to 0)
    localparam TOTAL_GRID_BITS = N * (NUM_STAGES + 1);

    // --------------------------------------------------------------------------
    // 2. The Flattened 1D Routing Vectors
    // --------------------------------------------------------------------------
    wire [TOTAL_GRID_BITS-1:0] flat_p;      // Propagate
    wire [TOTAL_GRID_BITS-1:0] flat_g;      // Generate

    // --------------------------------------------------------------------------
    // PHASE 1: Pre-Processing (Stage 0 Generation)
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
    // PHASE 2: Flattened Parallel Prefix Lookahead Network
    // --------------------------------------------------------------------------
    // s here means how many neighbour to its right its suppose to look at 2^s like 1(2^0), 2(2^1), 4(2^2), 8(2^3), ...
    // i here means the neighbour. For e.g. for 8 bit adder, column7 looks at 6(s=1), 5(s=2), 3(s=4)
    genvar s, i;
    generate
        // s = NUM_STAGES. For e.g. for 8 bit adder, NUM_STAGES = log2(8) = 3, so s = 1, 2, 3
        for(s = 1; s <= NUM_STAGES; s = s + 1) begin : gen_stages
            localparam STEP = 1 << (s-1);   // 1(2^0), 2(2^1), 4(2^2), 8(2^3), ......

            // Pre-calculate index offsets for the current layer and previous layer
            localparam CURR_STAGE_OFFSET = s * N;           // For Mapping Bits of Current Stage
            localparam PREV_STAGE_OFFSET = (s - 1) * N;     // For Mapping Bits of Previous Stage

            for (i = 0; i < N; i = i + 1) begin : gen_columns

                // Map the 2D logic to exact 1D wire array destinations
                localparam curr_bit_idx = CURR_STAGE_OFFSET + i; // Row curr = s*N + i
                localparam prev_bit_idx = PREV_STAGE_OFFSET + i; // Row prev = (s-1)*N + i
                localparam lookback_idx = PREV_STAGE_OFFSET + (i - STEP); // 7:6 or 7:5 or 7:3, .... 

                if(i < STEP) begin : bypass_cell
                    // Short-circuit elements forward out of lookahead reach
                    assign flat_p[curr_bit_idx] = flat_p[prev_bit_idx];
                    assign flat_g[curr_bit_idx] = flat_g[prev_bit_idx];
                end
                else begin : prefix_cell
                    // Active Black Cells processing lookahead combinations
                    // G_new = G_prev + P_prev . G_lookback
                    // P_new = P_prev . P_lookback
                    assign flat_g[curr_bit_idx] = flat_g[prev_bit_idx] | (flat_p[prev_bit_idx] & flat_g[lookback_idx]);
                    assign flat_p[curr_bit_idx] = flat_p[prev_bit_idx] & flat_p[lookback_idx];
                end
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 3: Post-Processing (Final Sum Logic)
    // --------------------------------------------------------------------------
    // The final lookahead layer begins at index: NUM_STAGES * N
    // The final lookahead layer stage was completed in Phase 2, this is for calculating Sum and Cout
    localparam FINAL_STAGE_OFFSET = NUM_STAGES * N;

    genvar k; 
    generate
        for (k = 0; k < N; k = k + 1) begin : gen_sum
            if (k == 0) begin : sum_bit0
                // Bit 0 combines its initial propagate (flat_p[0]) with external Cin
                assign Sum[0] = flat_p[0] ^ Cin;    // Propagate = A xor B and Sum = A xor B xor Cin
            end
            else begin : sum_bits
                // Bit k combines initial propagate flat_p[k] with carry exiting column k-1
                // inside the final stage layer row track
                // flat_p[k] is the A[k] xor B[k] and flat_g[...] is the carry from prev column (column at right)
                assign Sum[k] = flat_p[k] ^ flat_g[FINAL_STAGE_OFFSET + (k - 1)];
            end
        end
    endgenerate

    // Cout is the final lookahead generate from the absolute highest bit track (MSB)
    assign Cout = flat_g[FINAL_STAGE_OFFSET + (N - 1)];

endmodule
`default_nettype wire

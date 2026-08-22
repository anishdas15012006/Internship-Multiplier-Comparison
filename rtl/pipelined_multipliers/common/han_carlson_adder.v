`timescale 1ns/1ps
`default_nettype none

module han_carlson_adder #(
    parameter N = 16
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // --------------------------------------------------------------------------
    // 1. Structural Layer Dimensions
    // --------------------------------------------------------------------------
    // Han-Carlson consists of:
    // Stage 0: Setup (Generate initial P & G)
    // Stage 1: Pre-processing (Brent-Kung reduction down to half width)
    // Stage 2 to (2 + CORE_STAGES - 1): Kogge-Stone inner core on odd indices
    // Stage (2 + CORE_STAGES): Post-processing distribution to even indices
    // Total layers = 1 (pre) + $clog2(N/2) (core) + 1 (post)

    localparam CORE_STAGES = $clog2(N / 2);
    localparam TOTAL_STAGES = 1 + CORE_STAGES + 1;
    localparam GRID_SIZE = N * (TOTAL_STAGES + 1);      // +1 is for the Stage0

    // Flattened grid networks to perfectly adapt to Quartus Synthesis boundaries
    wire [GRID_SIZE-1:0] flat_p;
    wire [GRID_SIZE-1:0] flat_g;

    // --------------------------------------------------------------------------
    // STAGE 0: Initial Propagate and Generate (Bit-Level setup)
    // --------------------------------------------------------------------------
    genvar idx;
    generate
        for (idx = 0; idx < N; idx = idx + 1) begin : gen_stage0
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
    // STAGE 1: Pre-processing Layer (Odd/Even Reduction)
    // --------------------------------------------------------------------------
    // Combines adjacent bits to compute sparse terms across odd indices
    localparam S1_CURR = 0;
    localparam S1_NEXT = N;

    generate
        for (idx = 0; idx < N; idx = idx + 1) begin : gen_stage1
            // if ((idx % 2 == 1) && (idx > 0)) begin : step_reduction
            // Redundant Logic -> we find odd (idx % 2 == 1) and all odd numbers are always > 0
            if(idx % 2 == 1) begin : step_reduction
                assign flat_g[S1_NEXT + idx] = flat_g[S1_CURR + idx] | (flat_p[S1_CURR + idx] & flat_g[S1_CURR + idx - 1]);
                assign flat_p[S1_NEXT + idx] = flat_p[S1_CURR + idx] & flat_p[S1_CURR + idx - 1];
            end
            else begin : passthrough_even
                assign flat_g[S1_NEXT + idx] = flat_g[S1_CURR + idx];
                assign flat_p[S1_NEXT + idx] = flat_p[S1_CURR + idx];
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // STAGES 2 to (2 + CORE_STAGES - 1): Kogge-Stone Dense Inner Core
    // --------------------------------------------------------------------------
    // Executes a parallel prefix computation exclusively over odd array columns
    genvar stage;
    generate
        for (stage = 0; stage < CORE_STAGES; stage = stage + 1) begin : gen_core_network
            localparam STEP = 1 << (stage + 1);       // Core strides jump by 2, 4, 8, 16...
            localparam CURR_LINE = N * (stage + 1);
            localparam NEXT_LINE = N * (stage + 2);

            for (idx = 0; idx < N; idx = idx + 1) begin : gen_core_cells
                if ((idx % 2 == 1) && (idx >= STEP)) begin : black_cell_core
                    assign flat_g[NEXT_LINE + idx] = flat_g[CURR_LINE + idx] | (flat_p[CURR_LINE + idx] & flat_g[CURR_LINE + idx - STEP]);
                    assign flat_p[NEXT_LINE + idx] = flat_p[CURR_LINE + idx] & flat_p[CURR_LINE + idx - STEP];
                end
                else begin : passthrough_core
                    assign flat_g[NEXT_LINE + idx] = flat_g[CURR_LINE + idx];
                    assign flat_p[NEXT_LINE + idx] = flat_p[CURR_LINE + idx];
                end
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // STAGE (2 + CORE_STAGES): Post-processing Layer (Final Carry Interpolation)
    // --------------------------------------------------------------------------
    // Collects computed carries from odd indexes and expands them to even indexes
    localparam POST_CURR = N * (CORE_STAGES + 1);
    localparam POST_NEXT = N * (CORE_STAGES + 2);
    generate
        for (idx = 0; idx < N; idx = idx + 1) begin : gen_post_processing
            if ((idx % 2 == 0) && (idx > 0)) begin : interpolate_even
                assign flat_g[POST_NEXT + idx] = flat_g[POST_CURR + idx] | (flat_p[POST_CURR + idx] & flat_g[POST_CURR + idx - 1]);
                assign flat_p[POST_NEXT + idx] = flat_p[POST_CURR + idx] & flat_p[POST_CURR + idx - 1];
            end
            else begin : passthrough_final
                assign flat_g[POST_NEXT + idx] = flat_g[POST_CURR + idx];
                assign flat_p[POST_NEXT + idx] = flat_p[POST_CURR + idx];
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 5: Output Sum & Cout Mapping
    // --------------------------------------------------------------------------
    localparam FINAL_LINE = TOTAL_STAGES * N;
    generate
        for (idx = 0; idx < N; idx = idx + 1) begin : gen_sum_output
            if(idx == 0) begin : sum_bit0
                assign Sum[0] = flat_p[0] ^ Cin;        // Sum = A xor B xor Cin and P = A xor B
            end
            else begin : sum_bits
                assign Sum[idx] = flat_p[idx] ^ flat_g[FINAL_LINE + (idx - 1)]; // Same Principle as before
            end
        end
    endgenerate

    // Global Carry Out is the carry out of the highest column index
    assign Cout = flat_g[FINAL_LINE + (N - 1)];

endmodule

`default_nettype wire

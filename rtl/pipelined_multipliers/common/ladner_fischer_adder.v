`timescale 1ns/1ps
`default_nettype none

module ladner_fischer_adder #(
    parameter N = 64 // Recommended powers of 2 (8, 16, 32, 64, 128)
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // --------------------------------------------------------------------------
    // 1. Grid Dimensions
    // --------------------------------------------------------------------------
    // Logic Depth = log2(N)
    localparam STAGES = $clog2(N);
    localparam GRID_SIZE = N * (STAGES + 1);

    // Flat tracks for synthesizable 2D mapping
    wire [GRID_SIZE-1:0] flat_p;
    wire [GRID_SIZE-1:0] flat_g;

    // --------------------------------------------------------------------------
    // PHASE 1: Pre-Processing (Bit-Level Propagate & Generate)
    // --------------------------------------------------------------------------
    genvar idx;
    generate
        for (idx = 0; idx < N; idx = idx + 1) begin : gen_stage0
            assign flat_p[idx] = A[idx] ^ B[idx];
            assign flat_g[idx] = (idx == 0) ? (A[0] & B[0]) | ((A[0] ^ B[0]) & Cin) : (A[idx] & B[idx]);
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 2: Ladner-Fischer Prefix Network
    // --------------------------------------------------------------------------
    genvar stg;
    generate
        for (stg = 0; stg < STAGES; stg = stg + 1) begin : gen_prefix_stages
            localparam CURR_LINE = stg * N;
            localparam NEXT_LINE = (stg + 1) * N;
            localparam STRIDE    = 1 << stg; // 1, 2, 4, 8, 16...
            localparam GROUP     = 2 * STRIDE;

            for (idx = 0; idx < N; idx = idx + 1) begin : gen_prefix_cells
                // Ladner-Fischer condition:
                // An operator cell is placed at index 'idx' if it falls into the 
                // upper half of a 2^stg block AND index is greater than or equal to STRIDE
                if (((idx % GROUP) >= STRIDE) && (idx >= STRIDE)) begin : black_cell
                    // Target node connects to the highest bit of the preceding group
                    // First look this looks stupid but idx / STRIDE * STRIDE is not always idx
                    // Ex idx = 2, STRIDE = 2 -> TARGET_REF = 2/2 * 2 - 1 = 1
                    // Ex idx = 3, STRIDE = 2 -> TARGET_REF = 3/2 * 2 - 1 = 1
                    // If you had done idx - 1, then this would have been TARGET_REF = 3 - 1 = 2
                    // which is wrong for LADNER-FISCHER ADDER
                    localparam TARGET_REF = ((idx / STRIDE) * STRIDE) - 1;

                    assign flat_g[NEXT_LINE + idx] = flat_g[CURR_LINE + idx] | 
                                                     (flat_p[CURR_LINE + idx] & flat_g[CURR_LINE + TARGET_REF]);
                    assign flat_p[NEXT_LINE + idx] = flat_p[CURR_LINE + idx] & 
                                                     flat_p[CURR_LINE + TARGET_REF];
                end 
                else begin : passthrough
                    assign flat_g[NEXT_LINE + idx] = flat_g[CURR_LINE + idx];
                    assign flat_p[NEXT_LINE + idx] = flat_p[CURR_LINE + idx];
                end
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 3: Post-Processing & Output Sum Generation
    // --------------------------------------------------------------------------
    localparam FINAL_LINE = STAGES * N;

    generate
        for (idx = 0; idx < N; idx = idx + 1) begin : gen_sum_outputs
            if (idx == 0) begin : bit_0
                assign Sum[0] = flat_p[0] ^ Cin;
            end 
            else begin : bits_n
                assign Sum[idx] = flat_p[idx] ^ flat_g[FINAL_LINE + (idx - 1)];
            end
        end
    endgenerate

    // Final Global Carry Out
    assign Cout = flat_g[FINAL_LINE + (N - 1)];

endmodule
`default_nettype wire 

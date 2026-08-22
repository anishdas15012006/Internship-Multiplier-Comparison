// ==============================================================================
// Standard Baugh-Wooley Signed Partial Product Generator (PPG)
// Built strictly for parameterized N x N signed matrix configurations.
// ==============================================================================
`timescale 1ns/1ps

module baugh_wooley_ppg #(
    parameter N = 8,
    parameter SIGNED_A = 1, // Assumed 1 for strict Baugh-Wooley
    parameter SIGNED_B = 1  // Assumed 1 for strict Baugh-Wooley
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    output wire [(N * N) - 1:0] pp,      // Flat matrix of N rows x N bits
    output wire [(2 * N) - 1:0] pp_corr  // Exposes structural Baugh-Wooley constants
);

    // Baugh-Wooley generates exactly N rows, each containing exactly N bits
    localparam ROWS = N;
    localparam W = N;

    // --------------------------------------------------------------------------
    // Static Fixed Correction Vector Assignment
    // --------------------------------------------------------------------------
    // Cleanly clear all bits, then drive the specific Baugh-Wooley constants:
    // 1'b1 at column N, and 1'b1 at column 2N-1
    assign pp_corr[2*N-1:0] = (1'b1 << N) | (1'b1 << (2*N - 1));

    // --------------------------------------------------------------------------
    // Generation Loop
    // --------------------------------------------------------------------------
    genvar i, j;
    generate
        for (i = 0; i < ROWS; i = i + 1) begin : gen_rows
            for (j = 0; j < W; j = j + 1) begin : gen_columns
                wire raw_and = A[j] & B[i];
                wire final_bit;

                if ((i == N-1) && (j == N-1)) begin : gen_msb_intersection
                    // Intersection of both sign bits: Uninverted
                    assign final_bit = raw_and;
                end 
                else if ((i == N-1) || (j == N-1)) begin : gen_sign_boundary_inversions
                    // Cross product involving exactly one sign bit: Inverted
                    assign final_bit = ~raw_and;
                end 
                else begin : gen_normal_payload
                    // Standard magnitude body bits: Uninverted
                    assign final_bit = raw_and;
                end

                // Map into flat 1D output matrix port array
                assign pp[i*W + j] = final_bit;
            end
        end
    endgenerate

endmodule

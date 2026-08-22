`timescale 1ns/1ps
`default_nettype none

module ling_adder #(
    parameter N = 16
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
    localparam STAGES = $clog2(N);
    localparam GRID_SIZE = (STAGES + 1) * N;

    // Flat arrays for pseudo generate (d) and pseudo propagate (t)
    wire [GRID_SIZE-1:0] flat_d;
    wire [GRID_SIZE-1:0] flat_t;

    // Bit-level bitwise OR propagates and XOR sum propagates
    wire [N-1:0] p_or;      // p_i* = A_i | B_i
    wire [N-1:0] p_xor;     // p_i  = A_i ^ B_i
    wire [N-1:0] g;         // g_i  = A_i & B_i

    wire [N-1:0] H;         // Final pseudo-Carries
    wire [N-1:0] C;         // True Carries

    // --------------------------------------------------------------------------
    // PHASE 1: Pre-Processing (Ling Initial Setup)
    // --------------------------------------------------------------------------
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_ling_prep
            assign p_or[i]  = A[i] | B[i];
            assign p_xor[i] = A[i] ^ B[i];
            assign g[i]     = A[i] & B[i];
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 1: Pre-Processing (Stage 0 Generation)
    // --------------------------------------------------------------------------
    // Base level (stage 0) for Ling prefix tree:
    // d_0 = g_0 | (p_or_0 & Cin)
    // t_i = p_or[i] & p_or[i-1]
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_stage0
            if (i == 0) begin : bit_0
                assign flat_d[0] = g[0] | (p_or[0] & Cin);
                assign flat_t[0] = p_or[0];
            end
            else begin : bit_n
                assign flat_d[i] = g[i];
                assign flat_t[i] = p_or[i] & p_or[i-1];
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 2: Parallel Prefix Network for Pseudo-Carries (H_i)
    // (Using Kogge-Stone topology for optimum speed)
    // --------------------------------------------------------------------------
    genvar stg, idx;
    generate
        for (stg = 0; stg < STAGES; stg = stg + 1) begin : gen_prefix_stages
            localparam CURR_LINE = stg * N;
            localparam NEXT_LINE = (stg + 1) * N;
            localparam STRIDE = 1 << stg;           // 2 ^ stg

            for (idx = 0; idx < N; idx = idx + 1) begin : gen_cells
                if (idx >= STRIDE) begin : active_cell
                    localparam TARGET = idx - STRIDE;

                    assign flat_d[NEXT_LINE + idx] = flat_d[CURR_LINE + idx] | 
                                                     (flat_t[CURR_LINE + idx] & flat_d[CURR_LINE + TARGET]);
                    assign flat_t[NEXT_LINE + idx] = flat_t[CURR_LINE + idx] &
                                                     flat_t[CURR_LINE + TARGET];
                end
                else begin : passthrough_cell
                    assign flat_d[NEXT_LINE + idx] = flat_d[CURR_LINE + idx];
                    assign flat_t[NEXT_LINE + idx] = flat_t[CURR_LINE + idx];
                end
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 3: Pseudo-Carry to True Carry Conversion
    // C_i = p_or[i] & H[i]
    // --------------------------------------------------------------------------
    // Extract raw pseudo-carries from final stage of prefix tree
    localparam FINAL_LINE = STAGES * N;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_H
            assign H[i] = flat_d[FINAL_LINE + i];
        end
    endgenerate

    generate
        for (i = 0; i < N; i = i + 1) begin : gen_true_carries
            assign C[i] = p_or[i] & H[i];
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 4: Final Sum Generation
    // S_0     = p_xor[0] ^ Cin
    // S_i     = p_xor[i] ^ C[i-1]
    // --------------------------------------------------------------------------
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_sum
            if (i == 0) begin : sum_0
                assign Sum[0] = p_xor[0] ^ Cin;
            end
            else begin : sum_n
                assign Sum[i] = p_xor[i] ^ C[i-1];
            end
        end
    endgenerate

    assign Cout = C[N-1];

endmodule

`default_nettype wire

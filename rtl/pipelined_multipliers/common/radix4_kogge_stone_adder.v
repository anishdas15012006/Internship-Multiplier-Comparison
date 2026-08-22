`timescale 1ns/1ps

module radix4_kogge_stone_adder #(
    parameter N = 16               // Bit width (Must be power of 4, e.g., 16, 64)
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    localparam STAGES    = ($clog2(N) + 1) / 2; // log4(N) -> 2 stages for N=16
    localparam GRID_SIZE = N * (STAGES + 1);

    // --------------------------------------------------------------------------
    // PHASE 1: Bitwise Pre-Processing
    // --------------------------------------------------------------------------
    wire [N-1:0] g_raw = A & B;
    wire [N-1:0] p_raw = A ^ B;

    wire [GRID_SIZE-1:0] flat_g;
    wire [GRID_SIZE-1:0] flat_p;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_stage0
            if (i == 0) begin : bit_0
                assign flat_g[0] = g_raw[0] | (p_raw[0] & Cin);
                assign flat_p[0] = 1'b0; // Carry terminates at bit 0 once Cin is absorbed
            end else begin : bit_n
                assign flat_g[i] = g_raw[i];
                assign flat_p[i] = p_raw[i];
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 2: Radix-4 Kogge-Stone Prefix Network
    // --------------------------------------------------------------------------
    genvar stg, idx;
    generate
        for (stg = 0; stg < STAGES; stg = stg + 1) begin : gen_prefix_stages
            localparam CURR_LINE = stg * N;
            localparam NEXT_LINE = (stg + 1) * N;
            localparam STRIDE    = 1 << (2 * stg); // 4^stg: 1 for stg 0, 4 for stg 1...

            for (idx = 0; idx < N; idx = idx + 1) begin : gen_cells
                
                if (idx < STRIDE) begin : passthrough_0
                    assign flat_g[NEXT_LINE + idx] = flat_g[CURR_LINE + idx];
                    assign flat_p[NEXT_LINE + idx] = flat_p[CURR_LINE + idx];

                end else if (idx < 2 * STRIDE) begin : combine_2
                    localparam T1 = idx - STRIDE;

                    assign flat_g[NEXT_LINE + idx] = flat_g[CURR_LINE + idx] | 
                                                     (flat_p[CURR_LINE + idx] & flat_g[CURR_LINE + T1]);
                    assign flat_p[NEXT_LINE + idx] = flat_p[CURR_LINE + idx] & 
                                                     flat_p[CURR_LINE + T1];

                end else if (idx < 3 * STRIDE) begin : combine_3
                    localparam T1 = idx - STRIDE;
                    localparam T2 = idx - 2 * STRIDE;

                    assign flat_g[NEXT_LINE + idx] = flat_g[CURR_LINE + idx] | 
                                                     (flat_p[CURR_LINE + idx] & flat_g[CURR_LINE + T1]) |
                                                     (flat_p[CURR_LINE + idx] & flat_p[CURR_LINE + T1] & flat_g[CURR_LINE + T2]);
                    assign flat_p[NEXT_LINE + idx] = flat_p[CURR_LINE + idx] & 
                                                     flat_p[CURR_LINE + T1] & 
                                                     flat_p[CURR_LINE + T2];

                end else begin : combine_4
                    localparam T1 = idx - STRIDE;
                    localparam T2 = idx - 2 * STRIDE;
                    localparam T3 = idx - 3 * STRIDE;

                    assign flat_g[NEXT_LINE + idx] = flat_g[CURR_LINE + idx] | 
                                                     (flat_p[CURR_LINE + idx] & flat_g[CURR_LINE + T1]) |
                                                     (flat_p[CURR_LINE + idx] & flat_p[CURR_LINE + T1] & flat_g[CURR_LINE + T2]) |
                                                     (flat_p[CURR_LINE + idx] & flat_p[CURR_LINE + T1] & flat_p[CURR_LINE + T2] & flat_g[CURR_LINE + T3]);
                    assign flat_p[NEXT_LINE + idx] = flat_p[CURR_LINE + idx] & 
                                                     flat_p[CURR_LINE + T1] & 
                                                     flat_p[CURR_LINE + T2] & 
                                                     flat_p[CURR_LINE + T3];
                end
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 3: Sum and Carry Out Output
    // --------------------------------------------------------------------------
    localparam FINAL_LINE = STAGES * N;

    wire [N:0] carries;
    assign carries[0] = Cin;

    generate
        for (i = 0; i < N; i = i + 1) begin : gen_carries
            assign carries[i + 1] = flat_g[FINAL_LINE + i];
        end
    endgenerate

    generate
        for (i = 0; i < N; i = i + 1) begin : gen_sum
            assign Sum[i] = p_raw[i] ^ carries[i];
        end
    endgenerate

    assign Cout = carries[N];

endmodule
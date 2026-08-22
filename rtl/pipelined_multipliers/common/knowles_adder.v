`timescale 1ns/1ps
`default_nettype none

module knowles_adder #(
    parameter N = 16               // Bit width (e.g., 8, 16, 32, 64)
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // --------------------------------------------------------------------------
    // 1. Dynamic Knowles Fan-Out Configuration Function (f_j)
    //
    // Kogge-Stone   : 1, 1, 1, 1, 1, 1, 1, 1, 1
    // Ladner-Fischer: 1, 2, 4, 8, 16, 32, 64, 128, 256
    // Knowles Hybrid: 1, 1, 2, 2, 2, 2, 2, 2, 2 (Bounded Fan-Out 2) 
    // Knowles Hybrid: 1, 1, 2, 4, 4, 4, 4, 4, 4 (Bounded Fan-Out 4)
    //
    // --------------------------------------------------------------------------
    function integer get_fanout(input integer stg);
        case (stg)
            0: get_fanout = 1; // f_0 <= 2^0 = 1
            1: get_fanout = 2; // f_1 <= 2^1 = 2
            2: get_fanout = 4; // f_2 <= 2^2 = 4
            3: get_fanout = 8; // f_3 <= 2^3 = 8
            4: get_fanout = 16; // f_4 <= 2^4 = 16
            5: get_fanout = 32;
            6: get_fanout = 64;
            7: get_fanout = 128;
            default: get_fanout = 1 << stg;
        endcase
    endfunction

    localparam STAGES    = $clog2(N);
    localparam GRID_SIZE = N * (STAGES + 1);

    wire [GRID_SIZE-1:0] flat_p;
    wire [GRID_SIZE-1:0] flat_g;

    // --------------------------------------------------------------------------
    // PHASE 1: Pre-Processing (Bit-Level Setup)
    // --------------------------------------------------------------------------
    genvar idx;
    generate
        for (idx = 0; idx < N; idx = idx + 1) begin : gen_stage0
            assign flat_p[idx] = A[idx] ^ B[idx];
            assign flat_g[idx] = (idx == 0) ? (A[0] & B[0]) | ((A[0] ^ B[0]) & Cin)
                                            : (A[idx] & B[idx]);
        end
    endgenerate

    // --------------------------------------------------------------------------
    // PHASE 2: Knowles Parallel Prefix Network Generator
    // --------------------------------------------------------------------------
    genvar stg;
    generate
        for (stg = 0; stg < STAGES; stg = stg + 1) begin : gen_prefix_stages
            localparam CURR_LINE = stg * N;
            localparam NEXT_LINE = (stg + 1) * N;
            
            localparam STRIDE    = 1 << stg;                     // S_j = 2^j
            localparam RAW_F     = get_fanout(stg);              // Stage Fanout f_j
            // Cap fanout to valid range [1, STRIDE]
            localparam FAN_OUT   = (RAW_F > STRIDE) ? STRIDE : ((RAW_F < 1) ? 1 : RAW_F);

            for (idx = 0; idx < N; idx = idx + 1) begin : gen_prefix_cells

                // Every bit idx >= STRIDE is active in Knowles prefix stage
                if (idx >= STRIDE) begin : cell_active
                    localparam OFFSET     = idx - STRIDE;
                    localparam TARGET_REF = OFFSET + (FAN_OUT - 1 - (OFFSET % FAN_OUT));

                    assign flat_g[NEXT_LINE + idx] = flat_g[CURR_LINE + idx] | 
                                                     (flat_p[CURR_LINE + idx] & flat_g[CURR_LINE + TARGET_REF]);
                    assign flat_p[NEXT_LINE + idx] = flat_p[CURR_LINE + idx] & 
                                                     flat_p[CURR_LINE + TARGET_REF];
                end else begin : cell_passthrough
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

    assign Cout = flat_g[FINAL_LINE + (N - 1)];

endmodule

`default_nettype wire 

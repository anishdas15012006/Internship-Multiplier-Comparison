`timescale 1ns/1ps

module sklansky_adder #(
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
    localparam STAGES    = $clog2(N);
    localparam GRID_SIZE = N * (STAGES + 1);

    // Flattened array grid to avoid dynamic range synthesis errors in Quartus
    wire [GRID_SIZE-1:0] flat_p;
    wire [GRID_SIZE-1:0] flat_g;

    // --------------------------------------------------------------------------
    // PHASE 1: Pre-Processing (Bit-Level Initialization)
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
    // PHASE 2: Sklansky Divide-and-Conquer Prefix Network
    // --------------------------------------------------------------------------
    genvar stg;
    generate
        for (stg = 0; stg < STAGES; stg = stg + 1) begin : gen_prefix_stages
            localparam CURR_LINE = stg * N;
            localparam NEXT_LINE = (stg + 1) * N;
            localparam STRIDE    = 1 << stg;      // 1, 2, 4, 8...
            localparam GROUP     = 2 * STRIDE;    // 2, 4, 8, 16...

            for (idx = 0; idx < N; idx = idx + 1) begin : gen_prefix_cells
                
                // Sklansky condition: Node is active if it falls in upper half of current GROUP
                if ((idx % GROUP) >= STRIDE) begin : black_cell
                    
                    // TARGET_REF points to the highest bit of the lower subgroup
                    localparam TARGET_REF = (idx - (idx % GROUP)) + STRIDE - 1;

                    assign flat_g[NEXT_LINE + idx] = flat_g[CURR_LINE + idx] | 
                                                     (flat_p[CURR_LINE + idx] & flat_g[CURR_LINE + TARGET_REF]);
                    assign flat_p[NEXT_LINE + idx] = flat_p[CURR_LINE + idx] & 
                                                     flat_p[CURR_LINE + TARGET_REF];
                end 
                else begin : passthrough
                    // Lower half of GROUP passes straight down
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

    // Global Carry Out is the prefix carry of the MSB
    assign Cout = flat_g[FINAL_LINE + (N - 1)];

endmodule
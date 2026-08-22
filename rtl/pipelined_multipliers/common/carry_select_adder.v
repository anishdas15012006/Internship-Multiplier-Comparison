`timescale 1ns/1ps

module carry_select_adder #(
    parameter N = 64 // Flexible parameter for any width (16, 32, 64, etc.)
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // --------------------------------------------------------------------------
    // 1. Structural Dimensions (Standard 4-bit uniform blocks)
    // --------------------------------------------------------------------------
    localparam BLOCK_SIZE = 4;
    localparam NUM_BLOCKS = (N + BLOCK_SIZE - 1) / BLOCK_SIZE;

    // Track the selected carries passing between blocks
    wire [NUM_BLOCKS:0] block_carries;
    assign block_carries[0] = Cin;

    // --------------------------------------------------------------------------
    // 2. Block Generation
    // --------------------------------------------------------------------------
    genvar blk;
    generate
        for (blk = 0; blk < NUM_BLOCKS; blk = blk + 1) begin : gen_csla_blocks
            localparam START_BIT = blk * BLOCK_SIZE;
            localparam REM_BITS  = N - START_BIT;
            localparam CURR_BITS = (REM_BITS >= BLOCK_SIZE) ? BLOCK_SIZE : REM_BITS;

            // Slice arrays for inputs
            wire [CURR_BITS-1:0] a_slice = A[START_BIT +: CURR_BITS];
            wire [CURR_BITS-1:0] b_slice = B[START_BIT +: CURR_BITS];

            if (blk == 0) begin : gen_first_block
                // Block 0 does not need speculative dual adders because Cin is known immediately!
                wire [CURR_BITS:0] rc;
                assign rc[0] = Cin;

                genvar i;
                for (i = 0; i < CURR_BITS; i = i + 1) begin : gen_rca
                    wire p = a_slice[i] ^ b_slice[i];
                    wire g = a_slice[i] & b_slice[i];
                    assign rc[i+1] = g | (p & rc[i]);
                    assign Sum[START_BIT + i] = p ^ rc[i];
                end

                assign block_carries[1] = rc[CURR_BITS];
            end 
            else begin : gen_speculative_blocks
                // Speculative Adder 0 (Assumes Cin = 0)
                wire [CURR_BITS:0] rc0;
                wire [CURR_BITS-1:0] sum0;
                assign rc0[0] = 1'b0;

                // Speculative Adder 1 (Assumes Cin = 1)
                wire [CURR_BITS:0] rc1;
                wire [CURR_BITS-1:0] sum1;
                assign rc1[0] = 1'b1;

                genvar i;
                for (i = 0; i < CURR_BITS; i = i + 1) begin : gen_dual_rca
                    // Bit logic for Cin = 0
                    wire p0 = a_slice[i] ^ b_slice[i];
                    wire g0 = a_slice[i] & b_slice[i];
                    assign rc0[i+1] = g0 | (p0 & rc0[i]);
                    assign sum0[i]  = p0 ^ rc0[i];

                    // Bit logic for Cin = 1
                    wire p1 = a_slice[i] ^ b_slice[i];
                    wire g1 = a_slice[i] & b_slice[i];
                    assign rc1[i+1] = g1 | (p1 & rc1[i]);
                    assign sum1[i]  = p1 ^ rc1[i];
                end

                // --- THE SELECTION MULTIPLEXERS ---
                // Choose between spec 0 and spec 1 using the incoming carry
                assign Sum[START_BIT +: CURR_BITS] = block_carries[blk] ? sum1 : sum0;
                assign block_carries[blk + 1]        = block_carries[blk] ? rc1[CURR_BITS] : rc0[CURR_BITS];
            end
        end
    endgenerate

    assign Cout = block_carries[NUM_BLOCKS];

endmodule
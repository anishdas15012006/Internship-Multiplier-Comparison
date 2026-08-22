`timescale 1ns/1ps
`default_nettype none

module carry_skip_adder #(
    parameter N = 8
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // --------------------------------------------------------------------------
    // 1. Structural Dimension Calculations (Blocks of 4 bits)
    // --------------------------------------------------------------------------
    localparam BLOCK_SIZE = 4;
    localparam NUM_BLOCKS = (N + BLOCK_SIZE - 1) / BLOCK_SIZE;

    // Carrying tracks connecting adjacent skip blocks
    wire [NUM_BLOCKS:0] block_carries;
    assign block_carries[0] = Cin;

    // --------------------------------------------------------------------------
    // 2. Structural Generation of Skip Blocks
    // --------------------------------------------------------------------------
    genvar blk;
    generate
        for (blk = 0; blk < NUM_BLOCKS; blk = blk + 1) begin : gen_skip_blocks
            localparam START_BIT = blk * BLOCK_SIZE;    // Start Bit
            localparam REM_BITS = N - START_BIT;        // Remaining Bits
            localparam CURR_BITS = (REM_BITS >= BLOCK_SIZE) ? BLOCK_SIZE : REM_BITS;

            // Internal ripple carry lines for this block
            wire [CURR_BITS:0] rc;
            assign rc[0] = block_carries[blk];

            // Propagate signals within this block
            wire [CURR_BITS-1:0] p;

            // Step A: Basic Ripple Carry execution inside the block span
            genvar bit_idx;
            for (bit_idx = 0; bit_idx < CURR_BITS; bit_idx = bit_idx + 1) begin : gen_rca_cells
                assign p[bit_idx] = A[START_BIT + bit_idx] ^ B[START_BIT + bit_idx];

                wire g = A[START_BIT + bit_idx] & B[START_BIT + bit_idx];
                assign rc[bit_idx + 1] = g | (p[bit_idx] & rc[bit_idx]);

                assign Sum[START_BIT + bit_idx] = p[bit_idx] ^ rc[bit_idx];
            end

            // Step B: Block Propagate Logic (True if ALL bits in the block propagate)
            wire block_propagate = &p;

            // Step C: Skip Multiplexer
            // If block_propagate is 1, bypass the ripple carry chain output (rc[CURR_BITS]) 
            // and immediately route the incoming block carry out to the next stage.
            assign block_carries[blk + 1] = block_propagate ? block_carries[blk] : rc[CURR_BITS];
        end
    endgenerate

    // Final global Carry Out matches the output of our last block's skip multiplexer
    assign Cout = block_carries[NUM_BLOCKS];

endmodule

`default_nettype wire

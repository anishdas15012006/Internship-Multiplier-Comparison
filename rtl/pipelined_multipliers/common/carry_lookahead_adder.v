// This is Parallel Prefix CLA
// This gave the best performance in Quartus even better than Kogge-Stone
// Uncomment to use it and also rename the file in project tree list in the left

`timescale 1ns/1ps
`default_nettype none

module carry_lookahead_adder #(
    parameter N = 17 // Can be ANY number now: 8, 16, 17, 20, 32, 64...
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // --------------------------------------------------------------------------
    // 1. Dynamic Slice Partitioning (Prefer 4, Allow 5)
    // --------------------------------------------------------------------------
    localparam NUM_5BIT = (N % 4 == 0) ? 0 : 
                          (N % 4 == 1) ? 1 : 
                          (N % 4 == 2) ? 2 : 3;
    
    localparam REMAINING_BITS = N - (NUM_5BIT * 5);
    localparam NUM_4BIT = REMAINING_BITS / 4;
    localparam TOTAL_BLOCKS = NUM_5BIT + NUM_4BIT;

    // --------------------------------------------------------------------------
    // 2. Hierarchical Lookahead Tree Dimensions
    // --------------------------------------------------------------------------
    // A block prefix tree requires log2(TOTAL_BLOCKS) layers to resolve.
    // We add 1 to ensure that even if TOTAL_BLOCKS=1, the code compiles safely.
    localparam BLK_LOG    = (TOTAL_BLOCKS <= 1) ? 1 : $clog2(TOTAL_BLOCKS);
    localparam NUM_STAGES = BLK_LOG + 1;
    localparam GRID_SIZE  = TOTAL_BLOCKS * NUM_STAGES;

    // 1D Flattened grid vectors for block-level lookahead
    wire [GRID_SIZE-1:0] tree_p;
    wire [GRID_SIZE-1:0] tree_g;
    wire [TOTAL_BLOCKS:0] final_block_carries;

    assign final_block_carries[0] = Cin;

    // --------------------------------------------------------------------------
    // 3. Leaf Level Slice Instantiations (Stage 0 of Tree)
    // --------------------------------------------------------------------------
    genvar i;
    generate
        // Instantiate 5-bit leaf blocks starting from LSB
        for (i = 0; i < NUM_5BIT; i = i + 1) begin : gen_5bit_blocks
            cla_5bit inst_5bit (
                .A(A[i*5 +: 5]),
                .B(B[i*5 +: 5]),
                .Cin(final_block_carries[i]),
                .Sum(Sum[i*5 +: 5]),
                .Pg(tree_p[i]),
                .Gg(tree_g[i])
            );
        end

        // Align remaining space using 4-bit block allocations
        for (i = 0; i < NUM_4BIT; i = i + 1) begin : gen_4bit_blocks
            localparam base_offset = (NUM_5BIT * 5) + (i * 4);
            localparam block_idx   = NUM_5BIT + i;

            cla_4bit inst_4bit (
                .A(A[base_offset +: 4]),
                .B(B[base_offset +: 4]),
                .Cin(final_block_carries[block_idx]),
                .Sum(Sum[base_offset +: 4]),
                .Pg(tree_p[block_idx]),
                .Gg(tree_g[block_idx])
            );
        end
    endgenerate

    // --------------------------------------------------------------------------
    // 4. Generalized M-Level Block Lookahead Carry Tree Logic
    // --------------------------------------------------------------------------
    genvar stage_idx, blk_idx;
    generate
        for (stage_idx = 0; stage_idx < BLK_LOG; stage_idx = stage_idx + 1) begin : gen_lcu_tree
            localparam STEP = 1 << stage_idx;
            localparam CURR_L = stage_idx * TOTAL_BLOCKS;
            localparam NEXT_L = (stage_idx + 1) * TOTAL_BLOCKS;

            for (blk_idx = 0; blk_idx < TOTAL_BLOCKS; blk_idx = blk_idx + 1) begin : gen_tree_cells
                if (blk_idx >= STEP) begin : black_cell_lcu
                    assign tree_g[NEXT_L + blk_idx] = tree_g[CURR_L + blk_idx] | 
                                                      (tree_p[CURR_L + blk_idx] & tree_g[CURR_L + blk_idx - STEP]);
                    assign tree_p[NEXT_L + blk_idx] = tree_p[CURR_L + blk_idx] & tree_p[CURR_L + blk_idx - STEP];
                end 
                else begin : passthrough_lcu
                    assign tree_g[NEXT_L + blk_idx] = tree_g[CURR_L + blk_idx];
                    assign tree_p[NEXT_L + blk_idx] = tree_p[CURR_L + blk_idx];
                end
            end
        end
    endgenerate

    // --------------------------------------------------------------------------
    // 5. Downward Carry Generation & Flawless Cout Resolution
    // --------------------------------------------------------------------------
    localparam FINAL_L = BLK_LOG * TOTAL_BLOCKS;
    generate
        for (i = 1; i <= TOTAL_BLOCKS; i = i + 1) begin : gen_block_carries
            assign final_block_carries[i] = tree_g[FINAL_L + i - 1] | 
                                            (tree_p[FINAL_L + i - 1] & Cin);
        end
    endgenerate

    // The true global Cout is now perfectly mapped to the carry out of the last block
    assign Cout = final_block_carries[TOTAL_BLOCKS];

endmodule

// --------------------------------------------------------------------------
// Leaf Level Lookahead Slices
// --------------------------------------------------------------------------
module cla_4bit (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire       Cin,
    output wire [3:0] Sum,
    output wire       Pg,
    output wire       Gg
);
    wire [3:0] p = A ^ B; 
    wire [3:0] g = A & B;
    wire [4:0] c;
    assign c[0] = Cin; 
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]); 
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]); 
    assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]); 

    assign Sum = p ^ c[3:0]; 
    assign Pg = &p; 
    assign Gg = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]); 
endmodule

module cla_5bit (
    input  wire [4:0] A,
    input  wire [4:0] B,
    input  wire       Cin,
    output wire [4:0] Sum,
    output wire       Pg,
    output wire       Gg
);
    wire [4:0] p = A ^ B; 
    wire [4:0] g = A & B;
    wire [5:0] c;
    assign c[0] = Cin; 
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]); 
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]); 
    assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]); 
    assign c[5] = g[4] | (p[4] & g[3]) | (p[4] & p[3] & g[2]) | (p[4] & p[3] & p[2] & g[1]) | (p[4] & p[3] & p[2] & p[1] & g[0]) | (p[4] & p[3] & p[2] & p[1] & p[0] & c[0]); 

    assign Sum = p ^ c[4:0]; 
    assign Pg = &p; 
    assign Gg = g[4] | (p[4] & g[3]) | (p[4] & p[3] & g[2]) | (p[4] & p[3] & p[2] & g[1]) | (p[4] & p[3] & p[2] & p[1] & g[0]); 
endmodule
`default_nettype wire 

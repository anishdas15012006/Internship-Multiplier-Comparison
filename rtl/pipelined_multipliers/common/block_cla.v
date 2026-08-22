// // This is the Block CLA
// // Not the most efficient implementation but it works

// `timescale 1ns/1ps
// `default_nettype none

// module carry_lookahead_adder #(
//     parameter N = 16
// )(
//     input  wire [N-1:0] A,
//     input  wire [N-1:0] B,
//     input  wire         Cin,
//     output wire [N-1:0] Sum,
//     output wire         Cout
// );

//     // --------------------------------------------------------------------------
//     // Compile-Time Combinational Block Sizing Algorithm
//     // --------------------------------------------------------------------------
//     // Calculates how many 5-bit vs 4-bit slices fit N based on your greedy hierarchy
//     localparam NUM_5BIT = (N % 4 == 0) ? 0 : 
//                           (N % 4 == 1) ? 1 : 
//                           (N % 4 == 2) ? 2 : 3;
    
//     localparam REMAINING_BITS = N - (NUM_5BIT * 5);
//     localparam NUM_4BIT = REMAINING_BITS / 4;
//     localparam TOTAL_BLOCKS = NUM_5BIT + NUM_4BIT;

//     // Vector tracks interconnect lookahead carry lanes between slices
//     wire [TOTAL_BLOCKS:0] block_carries;
//     wire [TOTAL_BLOCKS-1:0] block_pg;
//     wire [TOTAL_BLOCKS-1:0] block_gg;

//     assign block_carries[0] = Cin;

//     // Hierarchical Lookahead Carry Unit Logic Core
//     genvar k;
//     generate
//         for (k = 0; k < TOTAL_BLOCKS; k = k + 1) begin : gen_lcu_carries
//             assign block_carries[k+1] = block_gg[k] | (block_pg[k] & block_carries[k]);
//         end
//     endgenerate

//     assign Cout = block_carries[TOTAL_BLOCKS];

//     // --------------------------------------------------------------------------
//     // Structural Hardware Block Slice Allocator
//     // --------------------------------------------------------------------------
//     genvar i;
//     generate
//         // Phase A: Instantiate the dominant 5-bit greedy structures starting from LSB side
//         for (i = 0; i < NUM_5BIT; i = i + 1) begin : gen_5bit_blocks
//             cla_5bit inst_5bit (
//                 .A(A[i*5 +: 5]),
//                 .B(B[i*5 +: 5]),
//                 .Cin(block_carries[i]),
//                 .Sum(Sum[i*5 +: 5]),
//                 .Pg(block_pg[i]),
//                 .Gg(block_gg[i])
//             );
//         end

//         // Phase B: Cleanly align remaining space using 4-bit block allocations
//         for (i = 0; i < NUM_4BIT; i = i + 1) begin : gen_4bit_blocks
//             localparam base_offset = (NUM_5BIT * 5) + (i * 4);
//             localparam block_idx   = NUM_5BIT + i;

//             cla_4bit inst_4bit (
//                 .A(A[base_offset +: 4]),
//                 .B(B[base_offset +: 4]),
//                 .Cin(block_carries[block_idx]),
//                 .Sum(Sum[base_offset +: 4]),
//                 .Pg(block_pg[block_idx]),
//                 .Gg(block_gg[block_idx])
//             );
//         end
//     endgenerate

// endmodule

// `timescale 1ns/1ps

// module cla_4bit (
//     input  wire [3:0] A,
//     input  wire [3:0] B,
//     input  wire       Cin,
//     output wire [3:0] Sum,
//     output wire       Pg,
//     output wire       Gg
// );
//     wire [3:0] p = A ^ B;
//     wire [3:0] g = A & B;
//     wire [4:0] c;

//     assign c[0] = Cin;
//     assign c[1] = g[0] | (p[0] & c[0]);
//     assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
//     assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
//     assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);

//     assign Sum = p ^ c[3:0];
    
//     // Group Lookahead Out
//     assign Pg = &p;
//     assign Gg = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
// endmodule

// `timescale 1ns/1ps

// module cla_5bit (
//     input  wire [4:0] A,
//     input  wire [4:0] B,
//     input  wire       Cin,
//     output wire [4:0] Sum,
//     output wire       Pg,
//     output wire       Gg
// );
//     wire [4:0] p = A ^ B;
//     wire [4:0] g = A & B;
//     wire [5:0] c;

//     assign c[0] = Cin;
//     assign c[1] = g[0] | (p[0] & c[0]);
//     assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
//     assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
//     assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);
//     assign c[5] = g[4] | (p[4] & g[3]) | (p[4] & p[3] & g[2]) | (p[4] & p[3] & p[2] & g[1]) | (p[4] & p[3] & p[2] & p[1] & g[0]) | (p[4] & p[3] & p[2] & p[1] & p[0] & c[0]);

//     assign Sum = p ^ c[4:0];

//     // Group Lookahead Out
//     assign Pg = &p;
//     assign Gg = g[4] | (p[4] & g[3]) | (p[4] & p[3] & g[2]) | (p[4] & p[3] & p[2] & g[1]) | (p[4] & p[3] & p[2] & p[1] & g[0]);
// endmodule
// `default_nettype wire 

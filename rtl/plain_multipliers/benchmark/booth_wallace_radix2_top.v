`timescale 1ns/1ps
`default_nettype none

module booth_wallace_radix2_top(

    input wire clk,

    input wire [15:0] A,
    input wire [15:0] B,

    output wire [31:0] P

);

wire [15:0] A_reg;
wire [15:0] B_reg;

wire [31:0] mult_out;

benchmark_wrapper #(
    .N(16)
)
WRAPPER(

    .clk(clk),

    .A(A),
    .B(B),

    .mult_out(mult_out),

    .A_reg(A_reg),
    .B_reg(B_reg),

    .P(P)

);

booth_wallace_radix2_16 DUT(

    .A(A_reg),
    .B(B_reg),
    .P(mult_out)

);

endmodule

`default_nettype wire
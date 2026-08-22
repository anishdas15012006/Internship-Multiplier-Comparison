`timescale 1ns/1ps
`default_nettype none

module benchmark_wrapper #(
    parameter N = 16
)(
    input  wire             clk,

    input  wire [N-1:0]     A,
    input  wire [N-1:0]     B,

    // multiplier output comes INTO wrapper
    input  wire [(2*N)-1:0] mult_out,

    // registered multiplier inputs
    output wire [N-1:0]     A_reg,
    output wire [N-1:0]     B_reg,

    // registered multiplier output
    output wire [(2*N)-1:0] P
);

    //----------------------------------------------------------
    // Input Registers
    //----------------------------------------------------------

    reg [N-1:0] A_ff;
    reg [N-1:0] B_ff;

    always @(posedge clk)
    begin
        A_ff <= A;
        B_ff <= B;
    end

    assign A_reg = A_ff;
    assign B_reg = B_ff;

    //----------------------------------------------------------
    // Output Register
    //----------------------------------------------------------

    reg [(2*N)-1:0] P_ff;

    always @(posedge clk)
    begin
        P_ff <= mult_out;
    end

    assign P = P_ff;

endmodule

`default_nettype wire
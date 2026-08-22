`timescale 1ns/1ps
`default_nettype none

module adder_wrapper #(
    parameter N = 32
)(
    input  wire         clk,
    input  wire         rst,

    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,

    output reg  [N-1:0] Sum,
    output reg          Cout
);

    // ------------------------------------------------------------
    // Input Registers
    // ------------------------------------------------------------
    reg [N-1:0] A_reg;
    reg [N-1:0] B_reg;
    reg         Cin_reg;

    always @(posedge clk) begin
        if (rst) begin
            A_reg   <= {N{1'b0}};
            B_reg   <= {N{1'b0}};
            Cin_reg <= 1'b0;
        end
        else begin
            A_reg   <= A;
            B_reg   <= B;
            Cin_reg <= Cin;
        end
    end

    // ------------------------------------------------------------
    // DUT
    // ------------------------------------------------------------
    wire [N-1:0] Sum_wire;
    wire         Cout_wire;

    sparse_brent_kung_adder #(
        .N(N)
    ) DUT (
        .A   (A_reg),
        .B   (B_reg),
        .Cin (Cin_reg),
        .Sum (Sum_wire),
        .Cout(Cout_wire)
    );

    // ------------------------------------------------------------
    // Output Registers
    // ------------------------------------------------------------
    always @(posedge clk) begin
        if (rst) begin
            Sum  <= {N{1'b0}};
            Cout <= 1'b0;
        end
        else begin
            Sum  <= Sum_wire;
            Cout <= Cout_wire;
        end
    end

endmodule

`default_nettype wire
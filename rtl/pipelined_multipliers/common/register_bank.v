`timescale 1ns/1ps
`default_nettype none

module register_bank #(
    parameter WIDTH = 32
)(
    input  wire             clk,
    input  wire             rst,
    input  wire             en,

    input  wire [WIDTH-1:0] D,
    output reg  [WIDTH-1:0] Q
);

always @(posedge clk)
begin
    if (rst)
        Q <= {WIDTH{1'b0}};
    else if (en)
        Q <= D;
end

endmodule

`default_nettype wire
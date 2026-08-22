`default_nettype none
`timescale 1ns/1ps

module tb_column_reduction_multiplier_4;

reg  [3:0] A;
reg  [3:0] B;

wire [7:0] P;

integer i;
integer j;

column_reduction_multiplier_4 DUT (
    .A(A),
    .B(B),
    .P(P)
);

initial begin

    $dumpfile("waves/column_reduction/column_reduction_multiplier_4.vcd");
    $dumpvars(0, tb_column_reduction_multiplier_4);

    for(i = 0; i < 16; i = i + 1)
    begin
        for(j = 0; j < 16; j = j + 1)
        begin

            A = i;
            B = j;

            #1;

            if(P !== (A * B))
            begin
                $display("FAIL");
                $display("A=%0d B=%0d Expected=%0d Got=%0d",
                         A, B, A*B, P);
                $finish;
            end

        end
    end

    $display("--------------------------------");
    $display("ALL TESTS PASSED");
    $display("--------------------------------");

    $finish;

end

endmodule

`default_nettype wire  
`timescale 1ns/1ps

module tb_row_adder_multiplier_16;

reg [15:0] A;
reg [15:0] B;

wire [31:0] P;

integer i;
integer errors;

row_adder_multiplier_16 DUT(
    .A(A),
    .B(B),
    .P(P)
);

initial begin
    $dumpfile("waves/row_adder/row_adder_multiplier_16.vcd");
    $dumpvars(0,tb_row_adder_multiplier_16);

    errors = 0;

    for(i = 0; i < 10000; i = i + 1)
    begin

        A = $random & 65535;
        B = $random & 65535;

        #1;

        if(P !== (A * B))
        begin

            $display("FAIL");
            $display("A=%0d B=%0d",A,B);
            $display("Expected=%0d",A*B);
            $display("Got=%0d",P);

            errors = errors + 1;

            $finish;
        end

    end

    if(errors == 0)
    begin

        $display("");
        $display("=================================");
        $display("PASS : ALL 10000 TESTS PASSED");
        $display("=================================");
        $display("");

    end

    $finish;
end

endmodule
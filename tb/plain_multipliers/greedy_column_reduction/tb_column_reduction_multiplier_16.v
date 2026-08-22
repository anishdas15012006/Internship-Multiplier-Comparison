`timescale 1ns/1ps
`default_nettype none

module tb_column_reduction_multiplier_16;

reg  [15:0] A;
reg  [15:0] B;

wire [31:0] P;

integer errors;

column_reduction_multiplier_16 DUT(
    .A(A),
    .B(B),
    .P(P)
);

task run_test;
    input [15:0] a_in;
    input [15:0] b_in;

    reg [31:0] expected;
begin

    A = a_in;
    B = b_in;

    expected = a_in * b_in;

    #10;

    if(P !== expected)
    begin
        $display(
            "FAIL A=%0d B=%0d EXP=%0d GOT=%0d",
            a_in,
            b_in,
            expected,
            P
        );
        errors = errors + 1;
    end
    else
    begin
        $display(
            "PASS A=%0d B=%0d P=%0d",
            a_in,
            b_in,
            P
        );
    end

end
endtask

initial begin

    $dumpfile("waves/custom/crm16.vcd");
    $dumpvars(0,tb_column_reduction_multiplier_16);

    errors = 0;

    run_test(16'd0,      16'd0);
    run_test(16'd1,      16'd1);
    run_test(16'd11,     16'd13);
    run_test(16'd255,    16'd255);
    run_test(16'd65305,  16'd23439);

    if(errors == 0)
        $display("ALL TESTS PASSED");
    else
        $display("TOTAL FAILURES = %0d", errors);

    $finish;

end

endmodule

`default_nettype wire
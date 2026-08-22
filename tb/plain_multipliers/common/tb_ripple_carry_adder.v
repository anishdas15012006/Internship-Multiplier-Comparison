`timescale 1ns/1ps
`default_nettype none

module tb_ripple_carry_adder;

parameter N = 16;

reg  [N-1:0] A;
reg  [N-1:0] B;
reg          Cin;

wire [N-1:0] Sum;
wire         Cout;

integer tests_passed;
integer tests_failed;

reg [N:0] expected;

ripple_carry_adder #(
    .N(N)
)
DUT(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

task check_result;
begin

    expected = A + B + Cin;

    if ({Cout, Sum} === expected)
    begin
        tests_passed = tests_passed + 1;

        $display(
            "PASS: A=%0d B=%0d Cin=%0d Result=%0d",
            A, B, Cin, {Cout, Sum}
        );
    end
    else
    begin
        tests_failed = tests_failed + 1;

        $display(
            "FAIL: A=%0d B=%0d Cin=%0d Got=%0d Expected=%0d",
            A, B, Cin,
            {Cout, Sum},
            expected
        );
    end

end
endtask

initial begin

    $dumpfile("waves/common/rca.vcd");
    $dumpvars(0, tb_ripple_carry_adder);

    tests_passed = 0;
    tests_failed = 0;

    //------------------------------------------------
    // Test 1
    //------------------------------------------------
    A   = 10;
    B   = 20;
    Cin = 0;
    #10;
    check_result();

    //------------------------------------------------
    // Test 2
    //------------------------------------------------
    A   = 255;
    B   = 255;
    Cin = 0;
    #10;
    check_result();

    //------------------------------------------------
    // Test 3
    //------------------------------------------------
    A   = 16'hFFFF;
    B   = 16'h0001;
    Cin = 0;
    #10;
    check_result();

    //------------------------------------------------
    // Test 4
    //------------------------------------------------
    A   = 1000;
    B   = 2000;
    Cin = 1;
    #10;
    check_result();

    //------------------------------------------------
    // Summary
    //------------------------------------------------

    $display("");
    $display("================================");
    $display("Tests Passed = %0d", tests_passed);
    $display("Tests Failed = %0d", tests_failed);
    $display("================================");
    $display("");

    $finish;

end

endmodule

`default_nettype wire
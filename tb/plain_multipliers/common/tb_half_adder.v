`timescale 1ns/1ps
`default_nettype none

module tb_half_adder;

reg a;
reg b;

wire sum;
wire carry;

integer expected_sum;
integer expected_carry;

half_adder DUT(
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

task check_result;
begin
    expected_sum = a ^ b;
    expected_carry = a & b;

    if(sum === expected_sum && carry === expected_carry)
    begin
        $display(
            "PASS : a = %b b = %b -> sum = %b carry = %b",
            a, b, sum, carry
        );
    end
    else
    begin
        $display(
            "FAIL : a = %b b = %b -> sum = %b carry = %b expected sum = %b carry = %b",
            a, b, sum, carry, expected_sum, expected_carry
        );
    end
end
endtask

initial begin
    
    $dumpfile("waves/common/half_adder.vcd");
    $dumpvars(0, tb_half_adder);

    a = 0; b = 0; #10; check_result();
    a = 0; b = 1; #10; check_result();
    a = 1; b = 0; #10; check_result();
    a = 1; b = 1; #10; check_result();

    $finish;
end

endmodule

`default_nettype wire
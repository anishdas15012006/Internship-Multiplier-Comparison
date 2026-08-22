`timescale 1ns/1ps
`default_nettype none

module tb_full_adder;

reg a;
reg b;
reg cin;

wire sum;
wire carry;

integer expected;

full_adder DUT(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
);

task check_result;
reg exp_sum;
reg exp_carry;
begin
    
    expected = a + b + cin;

    exp_sum = expected[0];
    exp_carry = expected[1];

    if(sum === exp_sum && carry === exp_carry)
    begin
        $display(
            "PASS : %b+%b+%b => sum=%b carry=%b",
            a, b, cin, sum, carry  
        );
    end
    else
    begin
        $display(
            "FAIL : %b+%b+%b => got sum=%b carry=%b expected sum=%b carry=%b",
            a, b, cin, sum, carry,
            exp_sum, exp_carry
        );
    end
end
endtask

initial begin

    $dumpfile("waves/common/full_adder.vcd");
    $dumpvars(0,tb_full_adder);

    a=0;b=0;cin=0;#10;check_result();
    a=0;b=0;cin=1;#10;check_result();
    a=0;b=1;cin=0;#10;check_result();
    a=0;b=1;cin=1;#10;check_result();

    a=1;b=0;cin=0;#10;check_result();
    a=1;b=0;cin=1;#10;check_result();
    a=1;b=1;cin=0;#10;check_result();
    a=1;b=1;cin=1;#10;check_result();

    $finish;

end

endmodule

`default_nettype wire
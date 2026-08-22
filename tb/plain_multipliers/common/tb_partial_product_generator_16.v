`timescale 1ns/1ps
`default_nettype none

module tb_partial_product_generator_16;

reg [15 : 0] A;
reg [15 : 0] B;

wire [255 : 0] pp;

integer i;
integer j;

integer tests_passed;
integer tests_failed;

reg expected_bit;

partial_product_generator DUT(
    .A(A),
    .B(B),
    .pp(pp)
);

task check_pp_matrix;
begin
    
    for(i = 0; i < 16; i = i + 1)
    begin
        for(j = 0; j < 16; j = j + 1)
        begin
            
            expected_bit = A[j] & B[i];

            if(pp[(i * 16) + j] === expected_bit)
            begin
                tests_passed = tests_passed + 1;
            end
            else
            begin
                tests_failed = tests_failed + 1;

                $display(
                    "FAIL: row = %0d col = %0d expected = %0b got = %0b",
                    i, j, expected_bit, pp[(i * 16) + j]
                );
            end
        end
    end
end
endtask

initial begin

    $dumpfile("waves/common/ppg.vcd");
    $dumpvars(0, tb_partial_product_generator_16);

    tests_passed = 0;
    tests_failed = 0;

    //------------------------------------------------
    // Test 1
    //------------------------------------------------

    A = 16'h000B;
    B = 16'h000D;

    #10;
    check_pp_matrix();

    //------------------------------------------------
    // Test 2
    //------------------------------------------------

    A = 16'hFFFF;
    B = 16'hFFFF;

    #10;
    check_pp_matrix();

    //------------------------------------------------
    // Test 3
    //------------------------------------------------

    A = 16'h0000;
    B = 16'hFFFF;

    #10;
    check_pp_matrix();

    //------------------------------------------------
    // Test 4
    //------------------------------------------------

    A = 16'h1234;
    B = 16'hABCD;

    #10;
    check_pp_matrix();

    //------------------------------------------------
    // Summary
    //------------------------------------------------

    $display("");
    $display("================================");
    $display("    PPG Verification Summary    ");
    $display("PASS = %0d", tests_passed);
    $display("FAIL = %0d", tests_failed);
    $display("================================");
    $display("");

    if(tests_failed == 0)
        $display("PPG Test Passed");
    else
        $display("PPG Test Failed");

    $finish;

end

endmodule

`default_nettype wire
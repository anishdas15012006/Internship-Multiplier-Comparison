`timescale 1ns/1ps
`default_nettype none

module tb_random_multiplier;

// Change parameter here and Multiplier instantiation DUT and dumpfile values
parameter N = 16;
parameter NUM_TESTS = 10000;

reg [N-1:0] A;
reg [N-1:0] B;

wire [(2*N)-1:0] P;

reg [(2*N)-1:0] expected;

integer i;
integer errors;

// DUT
column_reduction_multiplier_16 DUT(
    .A(A),
    .B(B),
    .P(P)
);

initial begin
     
     $dumpfile("waves/custom/random_mult16.vcd");
     $dumpvars(0, tb_random_multiplier);

     errors = 0;

     for(i = 0; i < NUM_TESTS; i = i + 1)
     begin
        
        A = $random;
        B = $random;

        expected = A * B;

        #1;

        if(P !== expected)
        begin
            
            $display(
                "FAIL [%0d] A=%0d B=%0d EXP=%0d GOT=%0d",
                i, A, B, expected, P
            );

            errors = errors + 1;


        end
     end

    if(errors == 0)
    begin
        $display("");
        $display("=================================");
        $display("PASS : ALL %0d TESTS PASSED",
                 NUM_TESTS);
        $display("=================================");
    end
    else
    begin
        $display("");
        $display("=================================");
        $display("FAIL : %0d TESTS FAILED",
                 errors);
        $display("=================================");
    end

    $finish;
end

endmodule

`default_nettype wire
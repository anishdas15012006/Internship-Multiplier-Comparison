`timescale 1ns/1ps
`default_nettype none

module tb_baugh_wooley_wallace_16;

reg signed [15:0] A;
reg signed [15:0] B;

wire signed [31:0] P_ss;

integer i;
integer errors;

baugh_wooley_wallace_16 DUT_SS (.A(A), .B(B), .P(P_ss));

initial begin

    $dumpfile(
        "waves/baugh_wooley/baugh_wooley_wallace/baugh_wooley_wallace_16.vcd"
    );

    $dumpvars(
        0,
        tb_baugh_wooley_wallace_16
    );

    errors = 0;

    for(i = 0; i < 10000; i = i + 1)
    begin

        A = $random;
        B = $random;

        #1;

        // Verify SS Match using native signed behavior
        if(P_ss !== (A * B)) begin
            $display("FAIL [SS] A=%0d B=%0d EXP=%0d GOT=%0d", A, B, (A * B), P_ss);
            errors = errors + 1; $finish;
        end
    end

    if(errors == 0)
    begin
        $display("");
        $display("========================================================");
        $display("PASS : ALL 10000 RANDOM SIGNED TESTS PASSED");
        $display("========================================================");
        $display("");
    end

    $finish;

end

endmodule

`default_nettype wire
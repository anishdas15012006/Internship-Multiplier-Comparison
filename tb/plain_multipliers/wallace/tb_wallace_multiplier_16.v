`timescale 1ns/1ps
`default_nettype none

module tb_wallace_multiplier_16;

reg  [15:0] A;
reg  [15:0] B;

wire [31:0] P;

integer i;
integer errors;

wallace_multiplier_16 DUT
(
    .A(A),
    .B(B),
    .P(P)
);

initial begin

    $dumpfile(
        "waves/wallace/wallace_16.vcd"
    );

    $dumpvars(
        0,
        tb_wallace_multiplier_16
    );

    errors = 0;

    for(i = 0; i < 10000; i = i + 1)
    begin

        A = $random & 65535;
        B = $random & 65535;

        #1;

        if(P !== (A * B))
        begin

            $display("FAIL A=%0d B=%0d EXP=%0d GOT=%0d", A, B, (A * B), P);
            errors = errors + 1;
            $finish;

        end

    end

    if(errors == 0)
    begin

        $display("");
        $display("=================================");
        $display("PASS : ALL 10000 RANDOM TESTS PASSED");
        $display("=================================");
        $display("");

    end

    $finish;

end

endmodule

`default_nettype wire
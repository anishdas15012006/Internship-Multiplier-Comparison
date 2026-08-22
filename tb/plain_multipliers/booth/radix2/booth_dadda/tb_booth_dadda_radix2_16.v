`timescale 1ns/1ps
`default_nettype none

module tb_booth_dadda_radix2_16;

reg  [15:0] A;
reg  [15:0] B;

wire [31:0] P_uu, P_us, P_su, P_ss;

integer i;
integer errors;

booth_dadda_radix2_16 #(.SIGNED_A(0), .SIGNED_B(0)) DUT_UU (.A(A), .B(B), .P(P_uu));
booth_dadda_radix2_16 #(.SIGNED_A(0), .SIGNED_B(1)) DUT_US (.A(A), .B(B), .P(P_us));
booth_dadda_radix2_16 #(.SIGNED_A(1), .SIGNED_B(0)) DUT_SU (.A(A), .B(B), .P(P_su));
booth_dadda_radix2_16 #(.SIGNED_A(1), .SIGNED_B(1)) DUT_SS (.A(A), .B(B), .P(P_ss));

initial begin

    $dumpfile(
        "waves/booth/radix2/booth_dadda/booth_dadda_radix2_16.vcd"
    );

    $dumpvars(
        0,
        tb_booth_dadda_radix2_16
    );

    errors = 0;

    for(i = 0; i < 10000; i = i + 1)
    begin

        A = $random & 65535;
        B = $random & 65535;

        #1;

        // Verify UU Match
        if(P_uu !== (A * B)) begin
            $display("FAIL [UU] A=%0d B=%0d EXP=%0d GOT=%0d", A, B, (A * B), P_uu);
            errors = errors + 1; $finish;
        end

        // Verify US Match
        if($signed(P_us) !== (A * $signed({ {16{B[15]}}, B }))) begin
            $display("FAIL [US] A=%0d B=%0d EXP=%0d GOT=%0d", A, $signed({ {16{B[15]}}, B }), (A * $signed({ {16{B[15]}}, B })), $signed(P_us));
            errors = errors + 1; $finish;
        end

        // Verify SU Match
        if($signed(P_su) !== ($signed({ {16{A[15]}}, A }) * B)) begin
            $display("FAIL [SU] A=%0d B=%0d EXP=%0d GOT=%0d", $signed({ {16{A[15]}}, A }), B, ($signed({ {16{A[15]}}, A }) * B), $signed(P_su));
            errors = errors + 1; $finish;
        end

        // Verify SS Match
        if($signed(P_ss) !== ($signed({ {16{A[15]}}, A }) * $signed({ {16{B[15]}}, B }))) begin
            $display("FAIL [SS] A=%0d B=%0d EXP=%0d GOT=%0d", $signed({ {16{A[15]}}, A }), $signed({ {16{B[15]}}, B }), ($signed({ {16{A[15]}}, A }) * $signed({ {16{B[15]}}, B })), $signed(P_ss));
            errors = errors + 1; $finish;
        end
    end

    if(errors == 0)
    begin
        $display("");
        $display("========================================================");
        $display("PASS : ALL 10000 RANDOM TESTS (ALL SIGN MODES) PASSED");
        $display("========================================================");
        $display("");
    end

    $finish;

end

endmodule

`default_nettype wire
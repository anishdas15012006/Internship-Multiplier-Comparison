`timescale 1ns/1ps

module tb_booth_radix2_ppg;

    parameter N = 4;
    localparam ROW_WIDTH = 2 * N;

    // Testbench signals
    reg [N-1:0] A;
    reg [N-1:0] B;
    reg SIGNED_A;
    reg SIGNED_B;

    wire [((N+1) * ROW_WIDTH) - 1:0] pp;
    wire [N:0] pp_cin;

    // Instantiate the 4x4 configuration dynamically via structural overrides
    booth_radix2_ppg #(
        .N(N),
        .SIGNED_A(0), // Controlled dynamically in test loops by overriding behavior or instantiating conditionally
        .SIGNED_B(0)
    ) uut_uu ( .A(A), .B(B), .pp(pp), .pp_cin(pp_cin) );

    // Since parameters cannot change at runtime, we instantiate 4 distinct copies 
    // to test all 4 combinations (UU, US, SU, SS) cleanly!
    wire [((N+1) * ROW_WIDTH) - 1:0] pp_uu, pp_us, pp_su, pp_ss;
    wire [N:0] pp_cin_uu, pp_cin_us, pp_cin_su, pp_cin_ss;

    booth_radix2_ppg #(.N(N), .SIGNED_A(0), .SIGNED_B(0)) uut_UU (.A(A), .B(B), .pp(pp_uu), .pp_cin(pp_cin_uu));
    booth_radix2_ppg #(.N(N), .SIGNED_A(0), .SIGNED_B(1)) uut_US (.A(A), .B(B), .pp(pp_us), .pp_cin(pp_cin_us));
    booth_radix2_ppg #(.N(N), .SIGNED_A(1), .SIGNED_B(0)) uut_SU (.A(A), .B(B), .pp(pp_su), .pp_cin(pp_cin_su));
    booth_radix2_ppg #(.N(N), .SIGNED_A(1), .SIGNED_B(1)) uut_SS (.A(A), .B(B), .pp(pp_ss), .pp_cin(pp_cin_ss));

    // Helper variables for golden loop checking
    integer i, j, r;
    reg [ROW_WIDTH-1:0] reconstructed_product;
    reg [ROW_WIDTH-1:0] current_row;
    
    // Signed-extended local variables for testbench-side golden reference math
    reg signed [ROW_WIDTH-1:0] signed_A_ext;
    reg signed [ROW_WIDTH-1:0] signed_B_ext;
    reg [ROW_WIDTH-1:0] expected_product;
    
    integer error_count = 0;

    initial begin
        $display("=================================================");
        $display("Starting Booth Radix-2 PPG Comprehensive Testbench");
        $display("=================================================");

        // Loop through all possible combinations for a 4x4 matrix
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i[N-1:0];
                B = j[N-1:0];
                #10; // Wait for combinational settling

                // -------------------------------------------------------------
                // TEST CASE 1: Unsigned A, Unsigned B (UU)
                // -------------------------------------------------------------
                expected_product = A * B;
                reconstructed_product = 0;
                for (r = 0; r < N + 1; r = r + 1) begin
                    current_row = pp_uu[r*ROW_WIDTH +: ROW_WIDTH];
                    reconstructed_product = reconstructed_product + current_row + pp_cin_uu[r];
                end
                if (reconstructed_product !== expected_product) begin
                    $display("FAIL [UU]: A=%d B=%d | EXP=%d GOT=%d", A, B, expected_product, reconstructed_product);
                    error_count = error_count + 1;
                end

                // -------------------------------------------------------------
                // TEST CASE 2: Unsigned A, Signed B (US)
                // -------------------------------------------------------------
                signed_B_ext = {{N{B[N-1]}}, B};
                expected_product = A * signed_B_ext;
                reconstructed_product = 0;
                for (r = 0; r < N + 1; r = r + 1) begin
                    current_row = pp_us[r*ROW_WIDTH +: ROW_WIDTH];
                    reconstructed_product = reconstructed_product + current_row + pp_cin_us[r];
                end
                if (reconstructed_product !== expected_product) begin
                    $display("FAIL [US]: A=%d B=%d | EXP=%d GOT=%d", A, $signed(B), $signed(expected_product), $signed(reconstructed_product));
                    error_count = error_count + 1;
                end

                // -------------------------------------------------------------
                // TEST CASE 3: Signed A, Unsigned B (SU)
                // -------------------------------------------------------------
                signed_A_ext = {{N{A[N-1]}}, A};
                expected_product = signed_A_ext * B;
                reconstructed_product = 0;
                for (r = 0; r < N + 1; r = r + 1) begin
                    current_row = pp_su[r*ROW_WIDTH +: ROW_WIDTH];
                    reconstructed_product = reconstructed_product + current_row + pp_cin_su[r];
                end
                if (reconstructed_product !== expected_product) begin
                    $display("FAIL [SU]: A=%d B=%d | EXP=%d GOT=%d", $signed(A), B, $signed(expected_product), $signed(reconstructed_product));
                    error_count = error_count + 1;
                end

                // -------------------------------------------------------------
                // TEST CASE 4: Signed A, Signed B (SS)
                // -------------------------------------------------------------
                signed_A_ext = {{N{A[N-1]}}, A};
                signed_B_ext = {{N{B[N-1]}}, B};
                expected_product = signed_A_ext * signed_B_ext;
                reconstructed_product = 0;
                for (r = 0; r < N + 1; r = r + 1) begin
                    current_row = pp_ss[r*ROW_WIDTH +: ROW_WIDTH];
                    reconstructed_product = reconstructed_product + current_row + pp_cin_ss[r];
                end
                if (reconstructed_product !== expected_product) begin
                    $display("FAIL [SS]: A=%d B=%d | EXP=%d GOT=%d", $signed(A), $signed(B), $signed(expected_product), $signed(reconstructed_product));
                    error_count = error_count + 1;
                end

            end
        end

        // Final Scoreboard Verification Check
        $display("\n=================================================");
        if (error_count == 0) begin
            $display("  VERIFICATION RESULT: ALL TESTS PASSED! (1024/1024)");
        end else begin
            $display("  VERIFICATION RESULT: FAILED with %d errors.", error_count);
        end
        $display("=================================================");
        $finish;
    end

endmodule
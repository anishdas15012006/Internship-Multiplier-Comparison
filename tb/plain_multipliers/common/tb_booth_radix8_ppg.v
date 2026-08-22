`timescale 1ns/1ps

module tb_booth_radix8_ppg;

    parameter N = 6; 
    localparam ROW_WIDTH = 2 * N;
    localparam NUM_ROWS  = (N / 3) + 1; // For 6-bit, this creates exactly 3 rows

    reg [N-1:0] A;
    reg [N-1:0] B;

    // Output matrix catch vectors for all 4 signed/unsigned permutations
    wire [(NUM_ROWS * ROW_WIDTH) - 1:0] pp_uu, pp_us, pp_su, pp_ss;
    wire [NUM_ROWS-1:0] pp_cin_uu, pp_cin_us, pp_cin_su, pp_cin_ss;

    // Instantiate all 4 signed/unsigned corner modes under 6-bit parameters
    booth_radix8_ppg #(.N(N), .SIGNED_A(0), .SIGNED_B(0)) uut_UU (.A(A), .B(B), .pp(pp_uu), .pp_cin(pp_cin_uu));
    booth_radix8_ppg #(.N(N), .SIGNED_A(0), .SIGNED_B(1)) uut_US (.A(A), .B(B), .pp(pp_us), .pp_cin(pp_cin_us));
    booth_radix8_ppg #(.N(N), .SIGNED_A(1), .SIGNED_B(0)) uut_SU (.A(A), .B(B), .pp(pp_su), .pp_cin(pp_cin_su));
    booth_radix8_ppg #(.N(N), .SIGNED_A(1), .SIGNED_B(1)) uut_SS (.A(A), .B(B), .pp(pp_ss), .pp_cin(pp_cin_ss));

    // Iteration & Matrix accumulator tracking registers
    integer i, j, r;
    reg [ROW_WIDTH-1:0] reconstructed_product;
    reg [ROW_WIDTH-1:0] current_row;
    
    reg signed [ROW_WIDTH-1:0] signed_A_ext;
    reg signed [ROW_WIDTH-1:0] signed_B_ext;
    reg [ROW_WIDTH-1:0] expected_product;
    
    integer total_tests = 0;
    integer error_count = 0;

    initial begin
        $display("=========================================================");
        $display("Starting Booth Radix-8 PPG Exhaustive 6x6 Matrix Testbench");
        $display("Expected iterations: 64 x 64 x 4 modes = 16,384 total tests");
        $display("=========================================================");

        // Outer loops: Sweep exhaustively through all 64 options for A and B (2^6 = 64)
        for (i = 0; i < 64; i = i + 1) begin
            for (j = 0; j < 64; j = j + 1) begin
                A = i[N-1:0];
                B = j[N-1:0];
                #5; // Quick settling delay to optimize simulator execution velocity

                // -------------------------------------------------------------
                // 1. Unsigned A, Unsigned B (UU)
                // -------------------------------------------------------------
                expected_product = A * B;
                reconstructed_product = 0;
                for (r = 0; r < NUM_ROWS; r = r + 1) begin
                    current_row = pp_uu[r*ROW_WIDTH +: ROW_WIDTH];
                    reconstructed_product = reconstructed_product + current_row + pp_cin_uu[r];
                end
                total_tests = total_tests + 1;
                if (reconstructed_product !== expected_product) begin
                    $display("FAIL [UU]: A=%d B=%d | EXP=%d GOT=%d", A, B, expected_product, reconstructed_product);
                    error_count = error_count + 1;
                end

                // -------------------------------------------------------------
                // 2. Unsigned A, Signed B (US)
                // -------------------------------------------------------------
                signed_B_ext = {{N{B[N-1]}}, B};
                expected_product = A * signed_B_ext;
                reconstructed_product = 0;
                for (r = 0; r < NUM_ROWS; r = r + 1) begin
                    current_row = pp_us[r*ROW_WIDTH +: ROW_WIDTH];
                    reconstructed_product = reconstructed_product + current_row + pp_cin_us[r];
                end
                total_tests = total_tests + 1;
                if (reconstructed_product !== expected_product) begin
                    $display("FAIL [US]: A=%d B=%d | EXP=%d GOT=%d", A, $signed(B), $signed(expected_product), $signed(reconstructed_product));
                    error_count = error_count + 1;
                end

                // -------------------------------------------------------------
                // 3. Signed A, Unsigned B (SU)
                // -------------------------------------------------------------
                signed_A_ext = {{N{A[N-1]}}, A};
                expected_product = signed_A_ext * B;
                reconstructed_product = 0;
                for (r = 0; r < NUM_ROWS; r = r + 1) begin
                    current_row = pp_su[r*ROW_WIDTH +: ROW_WIDTH];
                    reconstructed_product = reconstructed_product + current_row + pp_cin_su[r];
                end
                total_tests = total_tests + 1;
                if (reconstructed_product !== expected_product) begin
                    $display("FAIL [SU]: A=%d B=%d | EXP=%d GOT=%d", $signed(A), B, $signed(expected_product), $signed(reconstructed_product));
                    error_count = error_count + 1;
                end

                // -------------------------------------------------------------
                // 4. Signed A, Signed B (SS)
                // -------------------------------------------------------------
                signed_A_ext = {{N{A[N-1]}}, A};
                signed_B_ext = {{N{B[N-1]}}, B};
                expected_product = signed_A_ext * signed_B_ext;
                reconstructed_product = 0;
                for (r = 0; r < NUM_ROWS; r = r + 1) begin
                    current_row = pp_ss[r*ROW_WIDTH +: ROW_WIDTH];
                    reconstructed_product = reconstructed_product + current_row + pp_cin_ss[r];
                end
                total_tests = total_tests + 1;
                if (reconstructed_product !== expected_product) begin
                    $display("FAIL [SS]: A=%d B=%d | EXP=%d GOT=%d", $signed(A), $signed(B), $signed(expected_product), $signed(reconstructed_product));
                    error_count = error_count + 1;
                end
            end
        end

        // Final Scoreboard Report
        $display("\n=========================================================");
        $display("  SIMULATION SCOREBOARD COMPLETE");
        $display("  Total Sub-Tests Run : %d", total_tests);
        if (error_count == 0) begin
            $display("  VERIFICATION RESULT : SUCCESS! All 16,384 Vector States Match Matrix Ref.");
        end else begin
            $display("  VERIFICATION RESULT : FAILED with %d operational failures.", error_count);
        end
        $display("=========================================================");
        $finish;
    end
endmodule
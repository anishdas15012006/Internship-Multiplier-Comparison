`timescale 1ns/1ps
`default_nettype none

module tb_kogge_stone_adder_multi;

    integer tests_passed = 0;
    integer tests_failed = 0;

    // Macro/Task utility to check results easily across different widths
    task check_result(
        input integer width,
        input [32:0] a,
        input [32:0] b,
        input cin,
        input [32:0] sum,
        input cout
    );
        reg [33:0] expected;
        reg [33:0] mask;
        begin
            // Create a mask for the specific bit-width
            mask = (1 << width) - 1;
            
            // Calculate the expected result matching the DUT bit-width
            expected = (a & mask) + (b & mask) + cin;
            
            if ({cout, sum & mask} === expected) begin
                tests_passed = tests_passed + 1;
                $display("PASS [%0d-bit]: A=%0d B=%0d Cin=%0d Result=%0d", width, a & mask, b & mask, cin, {cout, sum & mask});
            end else begin
                tests_failed = tests_failed + 1;
                $display("FAIL [%0d-bit]: A=%0d B=%0d Cin=%0d Got=%0d Expected=%0d", width, a & mask, b & mask, cin, {cout, sum & mask}, expected);
            end
        end
    endtask

    // =========================================================================
    // 4-BIT ADDITION SIGNALS & DUT
    // =========================================================================
    reg  [3:0] A_4;   reg  [3:0] B_4;   reg  Cin_4;
    wire [3:0] Sum_4; wire       Cout_4;

    kogge_stone_adder #(.N(4)) DUT_4 (
        .A(A_4), .B(B_4), .Cin(Cin_4), .Sum(Sum_4), .Cout(Cout_4)
    );

    // =========================================================================
    // 8-BIT ADDITION SIGNALS & DUT
    // =========================================================================
    reg  [7:0] A_8;   reg  [7:0] B_8;   reg  Cin_8;
    wire [7:0] Sum_8; wire       Cout_8;

    kogge_stone_adder #(.N(8)) DUT_8 (
        .A(A_8), .B(B_8), .Cin(Cin_8), .Sum(Sum_8), .Cout(Cout_8)
    );

    // =========================================================================
    // 12-BIT ADDITION SIGNALS & DUT
    // =========================================================================
    reg  [11:0] A_12;  reg  [11:0] B_12;  reg  Cin_12;
    wire [11:0] Sum_12; wire        Cout_12;

    kogge_stone_adder #(.N(12)) DUT_12 (
        .A(A_12), .B(B_12), .Cin(Cin_12), .Sum(Sum_12), .Cout(Cout_12)
    );

    // =========================================================================
    // 16-BIT ADDITION SIGNALS & DUT
    // =========================================================================
    reg  [15:0] A_16;  reg  [15:0] B_16;  reg  Cin_16;
    wire [15:0] Sum_16; wire        Cout_16;

    kogge_stone_adder #(.N(16)) DUT_16 (
        .A(A_16), .B(B_16), .Cin(Cin_16), .Sum(Sum_16), .Cout(Cout_16)
    );

    // =========================================================================
    // 32-BIT ADDITION SIGNALS & DUT
    // =========================================================================
    reg  [31:0] A_32;  reg  [31:0] B_32;  reg  Cin_32;
    wire [31:0] Sum_32; wire        Cout_32;

    kogge_stone_adder #(.N(32)) DUT_32 (
        .A(A_32), .B(B_32), .Cin(Cin_32), .Sum(Sum_32), .Cout(Cout_32)
    );

    // =========================================================================
    // MAIN TEST SEQUENCE
    // =========================================================================
    integer i;
    initial begin
        $dumpfile("waves/common/ksa_multi.vcd");
        $dumpvars(0, tb_kogge_stone_adder_multi);

        #10;

        // ---------------------------------------------------------------------
        // Test 4-bit Addition (4 Random Test Cases)
        // ---------------------------------------------------------------------
        $display("--- Testing 4-bit Kogge-Stone Adder ---");
        for (i = 0; i < 4; i = i + 1) begin
            A_4   = $urandom & 4'hF;
            B_4   = $urandom & 4'hF;
            Cin_4 = $urandom & 1'b1;
            #10;
            check_result(4, A_4, B_4, Cin_4, Sum_4, Cout_4);
        end

        // ---------------------------------------------------------------------
        // Test 8-bit Addition (4 Random Test Cases)
        // ---------------------------------------------------------------------
        $display("\n--- Testing 8-bit Kogge-Stone Adder ---");
        for (i = 0; i < 4; i = i + 1) begin
            A_8   = $urandom & 8'hFF;
            B_8   = $urandom & 8'hFF;
            Cin_8 = $urandom & 1'b1;
            #10;
            check_result(8, A_8, B_8, Cin_8, Sum_8, Cout_8);
        end

        // ---------------------------------------------------------------------
        // Test 12-bit Addition (4 Random Test Cases)
        // ---------------------------------------------------------------------
        $display("\n--- Testing 12-bit Kogge-Stone Adder ---");
        for (i = 0; i < 4; i = i + 1) begin
            A_12   = $urandom & 12'hFFF;
            B_12   = $urandom & 12'hFFF;
            Cin_12 = $urandom & 1'b1;
            #10;
            check_result(12, A_12, B_12, Cin_12, Sum_12, Cout_12);
        end

        // ---------------------------------------------------------------------
        // Test 16-bit Addition (4 Random Test Cases)
        // ---------------------------------------------------------------------
        $display("\n--- Testing 16-bit Kogge-Stone Adder ---");
        for (i = 0; i < 4; i = i + 1) begin
            A_16   = $urandom & 16'hFFFF;
            B_16   = $urandom & 16'hFFFF;
            Cin_16 = $urandom & 1'b1;
            #10;
            check_result(16, A_16, B_16, Cin_16, Sum_16, Cout_16);
        end

        // ---------------------------------------------------------------------
        // Test 32-bit Addition (4 Random Test Cases)
        // ---------------------------------------------------------------------
        $display("\n--- Testing 32-bit Kogge-Stone Adder ---");
        for (i = 0; i < 4; i = i + 1) begin
            A_32   = $urandom;
            B_32   = $urandom;
            Cin_32 = $urandom & 1'b1;
            #10;
            check_result(32, A_32, B_32, Cin_32, Sum_32, Cout_32);
        end

        // ---------------------------------------------------------------------
        // Final Summary
        // ---------------------------------------------------------------------
        $display("");
        $display("========================================");
        $display("TOTAL GLOBAL SUMMARY:");
        $display("  Tests Passed = %0d", tests_passed);
        $display("  Tests Failed = %0d", tests_failed);
        $display("========================================");
        $display("");

        $finish;
    end

endmodule

`default_nettype wire
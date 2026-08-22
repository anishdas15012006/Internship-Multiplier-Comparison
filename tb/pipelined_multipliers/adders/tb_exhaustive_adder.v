`timescale 1ns/1ps

module tb_exhaustive_adder;

    // --------------------------------------------------------------------------
    // Testbench Parameters & Signals
    // --------------------------------------------------------------------------
    parameter N = 8; // Recommended <= 8 for reasonable exhaustive simulation time
    
    reg  [N-1:0] A;
    reg  [N-1:0] B;
    reg          Cin;
    wire [N-1:0] Sum;
    wire         Cout;

    // Loop monitoring iterators
    reg [N:0] golden_ref;
    integer loop_a, loop_b, loop_cin;
    integer error_count = 0;
    integer total_tests = 0;

    // --------------------------------------------------------------------------
    // Unit Under Test (UUT) Instantiation
    // Swap "carry_lookahead_adder" with your future prefix variants right here!
    // --------------------------------------------------------------------------
    sparse_kogge_stone_adder #(.N(N)) uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // --------------------------------------------------------------------------
    // Complete Exhaustive Loops
    // --------------------------------------------------------------------------
    initial begin
        $display("// ========================================================");
        $display("// STARTING EXHAUSTIVE TESTBENCH (N = %0d)", N);
        $display("// Checking all %0d possible input combinations...", (1 << (2*N + 1)));
        $display("// ========================================================");
        
        A   = 0;
        B   = 0;
        Cin = 0;
        #10;

        // Nested loops cycling through 100% of the possible signal space
        for (loop_cin = 0; loop_cin < 2; loop_cin = loop_cin + 1) begin
            for (loop_a = 0; loop_a < (1 << N); loop_a = loop_a + 1) begin
                for (loop_b = 0; loop_b < (1 << N); loop_b = loop_b + 1) begin
                    
                    Cin = loop_cin[0];
                    A   = loop_a[N-1:0];
                    B   = loop_b[N-1:0];
                    
                    #5; // Wait for hardware computation to settle
                    
                    golden_ref = A + B + Cin;
                    total_tests = total_tests + 1;
                    
                    if ({Cout, Sum} !== golden_ref) begin
                        $display("[MISMATCH] Inputs: A=%d, B=%d, Cin=%b | Hardware={%b, %d}, Reference={%b, %d}", 
                                 A, B, Cin, Cout, Sum, golden_ref[N], golden_ref[N-1:0]);
                        error_count = error_count + 1;
                    end
                end
            end
        end

        // Final Report Evaluation
        $display("// ================================================================================");
        $display("// Simulation Done. Total Test Cases Evaluated: %0d", total_tests);
        if (error_count == 0) begin
            $display("// STATUS: PASSED! Entire input space checked with 0 errors.");
        end else begin
            $display("// STATUS: FAILED! Found %0d errors out of total iterations.", error_count);
        end
        $display("// ===============================================================================");
        $finish;
    end

endmodule
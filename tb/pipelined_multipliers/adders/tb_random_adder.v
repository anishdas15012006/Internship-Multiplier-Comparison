`timescale 1ns/1ps

module tb_random_adder;

    // --------------------------------------------------------------------------
    // Testbench Parameters & Signals
    // --------------------------------------------------------------------------
    parameter N = 16;
    
    reg  [N-1:0] A;
    reg  [N-1:0] B;
    reg          Cin;
    wire [N-1:0] Sum;
    wire         Cout;

    // Golden reference variables for validation
    reg [N:0] golden_ref;
    integer i;
    integer error_count = 0;

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
    // Test Stimulus Engine
    // --------------------------------------------------------------------------
    initial begin
        $display("// ========================================================");
        $display("// STARTING RANDOM TESTBENCH (N = %0d)", N);
        $display("// Running 10,000 iterations...");
        $display("// ========================================================");
        
        // Initialize inputs
        A   = 0;
        B   = 0;
        Cin = 0;
        #10;

        for (i = 0; i < 10000; i = i + 1) begin
            // Generate randomized stimuli across the full width
            A   = $urandom & ((1'b1 << N) - 1);
            B   = $urandom & ((1'b1 << N) - 1);
            Cin = $urandom & 1'b1;
            
            // Allow combinational logic settling time
            #10;
            
            // Compute ideal golden reference math
            golden_ref = A + B + Cin;
            
            // Check outputs against UUT
            if ({Cout, Sum} !== golden_ref) begin
                $display("[ERROR @ Iteration %0d] Inputs: A=%h, B=%h, Cin=%b | Expected: Got Output={%b, %h}, Ref={%b, %h}", 
                         i, A, B, Cin, Cout, Sum, golden_ref[N], golden_ref[N-1:0]);
                error_count = error_count + 1;
            end
        end

        // Final Report
        $display("// ================================================================================");
        if (error_count == 0) begin
            $display("// STATUS: PASSED! 10,000 random test cases executed with 0 errors.");
        end else begin
            $display("// STATUS: FAILED! Found %0d mismatches out of 10,000 cases.", error_count);
        end
        $display("// ================================================================================");
        $finish;
    end

endmodule
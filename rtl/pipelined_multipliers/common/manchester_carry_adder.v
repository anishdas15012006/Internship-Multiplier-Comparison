`timescale 1ns/1ps
`default_nettype none

module manchester_carry_adder #(
    parameter integer N = 16   // Width of the adder (typically 4, 8, 16)
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // =========================================================================
    // 1. Pre-Processing Phase: Generate (G), Propagate (P), and Kill (K)
    // =========================================================================
    wire [N-1:0] g = A & B;        // Generate: Creates a carry
    wire [N-1:0] p = A ^ B;        // Propagate: Passes carry through
    wire [N-1:0] k = ~(A | B);     // Kill: Destroys carry (useful for debugging/analysis)

    // =========================================================================
    // 2. The Manchester Carry Chain (Modeled sequentially across bits)
    // =========================================================================
    wire [N:0] c;
    assign c[0] = Cin;             // Initialize carry-in

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : g_mcc_chain
            // Manchester MUX-based Carry Switch Logic:
            // - If Generate = 1 -> Force Carry Output = 1
            // - Else if Propagate = 1 -> Pass previous Carry Input c[i]
            // - Else (Kill = 1) -> Force Carry Output = 0
            
            assign c[i+1] = g[i] ? 1'b1 :
                            p[i] ? c[i] : 1'b0;
        end
    endgenerate

    // =========================================================================
    // 3. Post-Processing Phase: Final Sum Computation
    // =========================================================================
    // Sum = Propagate XOR Carry_In (S_i = A_i ^ B_i ^ C_i)
    assign Sum  = p ^ c[N-1:0];
    assign Cout = c[N];

endmodule
`default_nettype wire
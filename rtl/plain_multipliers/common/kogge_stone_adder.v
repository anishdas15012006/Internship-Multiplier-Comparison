`timescale 1ns/1ps
`default_nettype none

// =============================================================================
// Module: kogge_stone_adder
// Description: Parameterizable Kogge-Stone Parallel Prefix Adder.
//              O(log2 N) depth, full carry prefix tree, synthesis-clean.
//
// Constraints:
//   - N must be a power of 2 (8, 16, 32, 64). Enforced via initial assertion.
//   - All generate loops use only elaboration-time constants (synthesis safe).
//   - No latches: all signals driven by continuous assign or genvar generate.
//
// Port notes:
//   Cin  : ripple-safe carry-in; tied to 1'b0 when unused
//   Cout : combinational carry-out, registered externally if needed
// =============================================================================

module kogge_stone_adder #(
    parameter integer N = 32
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // -------------------------------------------------------------------------
    // Parameter legality check (elaboration-time)
    // -------------------------------------------------------------------------
    // synthesis translate_off
    initial begin
        if (N < 2 || (N & (N - 1)) != 0) begin
            $fatal(1, "kogge_stone_adder: N=%0d is not a power of 2.", N);
        end
    end
    // synthesis translate_on

    localparam integer LOG2N = $clog2(N);

    // -------------------------------------------------------------------------
    // G/P prefix grid  [stage 0..LOG2N][bit 0..N-1]
    // Stage 0 : bit-level pre-process
    // Stage s : prefix result spanning 2^s bits
    // -------------------------------------------------------------------------
    wire [N-1:0] G [0:LOG2N];
    wire [N-1:0] P [0:LOG2N];

    // -------------------------------------------------------------------------
    // Stage 0: bit-level generate and propagate
    // -------------------------------------------------------------------------
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : g_pre
            assign G[0][i] = A[i] & B[i];
            assign P[0][i] = A[i] ^ B[i];
        end
    endgenerate

    // -------------------------------------------------------------------------
    // Stages 1..LOG2N: Kogge-Stone prefix cells
    // At stage s, each bit i combines with bit (i - 2^(s-1)) if it exists.
    // -------------------------------------------------------------------------
    genvar s, b;
    generate
        for (s = 1; s <= LOG2N; s = s + 1) begin : g_stage
            localparam integer STRIDE = 1 << (s - 1);
            for (b = 0; b < N; b = b + 1) begin : g_bit
                if (b < STRIDE) begin
                    // No left neighbour at this stride — pass through
                    assign G[s][b] = G[s-1][b];
                    assign P[s][b] = P[s-1][b];
                end else begin
                    // Standard Kogge-Stone prefix merge
                    // G(i:0) = G(i:j+1) | P(i:j+1) & G(j:0)
                    assign G[s][b] = G[s-1][b] | (P[s-1][b] & G[s-1][b - STRIDE]);
                    assign P[s][b] = P[s-1][b] & P[s-1][b - STRIDE];
                end
            end
        end
    endgenerate

    // -------------------------------------------------------------------------
    // Carry extraction
    // G[LOG2N][i] = group-generate for bits [i:0].
    // carry_in[i] = C(i-1) = G[LOG2N][i-1] | (P[LOG2N][i-1] & Cin)
    //
    // Because the prefix at stage LOG2N already spans from bit i down to bit 0,
    // the only external input needed is Cin (not a chain of carry wires).
    // carry[0] = Cin (external)
    // carry[i+1] = G[LOG2N][i] | P[LOG2N][i] & Cin   for i in [0, N-1]
    // -------------------------------------------------------------------------
    wire [N:0] carry;
    assign carry[0] = Cin;

    genvar ci;
    generate
        for (ci = 0; ci < N; ci = ci + 1) begin : g_carry
            assign carry[ci+1] = G[LOG2N][ci] | (P[LOG2N][ci] & Cin);
        end
    endgenerate

    // -------------------------------------------------------------------------
    // Post-processing: sum = P[0][i] ^ carry[i]
    // P[0][i] = A[i] ^ B[i] = half-sum without carry
    // carry[i] = true carry into bit i
    // -------------------------------------------------------------------------
    genvar si;
    generate
        for (si = 0; si < N; si = si + 1) begin : g_sum
            assign Sum[si] = P[0][si] ^ carry[si];
        end
    endgenerate

    assign Cout = carry[N];

endmodule
`default_nettype wire
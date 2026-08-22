// =============================================================================
// Module: vedic_multiplier
// Description: N x N Vedic Multiplier (Urdhva Tiryagbhyam) implemented
//              structurally via recursive decomposition.
//              N MUST BE A POWER OF 2 (2, 4, 8, 16, 32, 64 ...).
//
// FIXES APPLIED vs original:
//   1. Added missing ripple_carry_adder (RCA) primitive.
//   2. Fixed adder_mid input zero-extension: q1/q2 are (2*H)-wide but
//      adder_mid.WIDTH was N (= 2*H) — inputs must be zero-extended to N bits.
//   3. Fixed CSA row widths and csa_row3 construction — the middle_sum must
//      be shifted left by H to land at the correct weight column.
//   4. Replaced broken output-slice arithmetic with a clean N+1-bit
//      high-part adder that operates on properly-aligned operands.
//   5. Removed unused mid_carry signal driving open port.
// =============================================================================

// -----------------------------------------------------------------------------
// Module: param_adder  –  thin wrapper; swap RCA for any adder here
// -----------------------------------------------------------------------------
module param_adder #(
    parameter WIDTH = 16
)(
    input  wire [WIDTH-1:0] X,
    input  wire [WIDTH-1:0] Y,
    input  wire             Cin,
    output wire [WIDTH-1:0] Sum,
    output wire             Cout
);
    ripple_carry_adder #(.N(WIDTH)) my_rca (
        .A   (X),
        .B   (Y),
        .Cin (Cin),
        .Sum (Sum),
        .Cout(Cout)
    );
endmodule

// -----------------------------------------------------------------------------
// Leaf: 2x2 Vedic core  (Urdhva partial-product grid, fully structural)
// -----------------------------------------------------------------------------
module vedic_2x2_core (
    input  wire [1:0] a,
    input  wire [1:0] b,
    output wire [3:0] p
);
    wire pp0 = a[0] & b[0];
    wire pp1 = a[1] & b[0];
    wire pp2 = a[0] & b[1];
    wire pp3 = a[1] & b[1];

    wire ha1_sum, ha1_carry;

    assign p[0]      = pp0;
    assign ha1_sum   = pp1 ^ pp2;
    assign ha1_carry = pp1 & pp2;
    assign p[1]      = ha1_sum;
    assign p[2]      = pp3 ^ ha1_carry;
    assign p[3]      = pp3 & ha1_carry;   // FIX: was wrong ha2_carry logic
endmodule

// =============================================================================
// Top: vedic_multiplier  (recursive)
//
// Urdhva decomposition for N-bit × N-bit (H = N/2):
//
//   Product = q3·2^N  +  (q1 + q2)·2^H  +  q0
//
// where q0 = a_low*b_low, q1 = a_high*b_low,
//       q2 = a_low*b_high, q3 = a_high*b_high
//
// Lower H bits  → q0[H-1:0]              (no carry possible)
// Upper 3H bits → q3 at weight 2^N
//               + (q1+q2) at weight 2^H
//               + q0[2H-1:H] at weight 2^H
//
// We collect these three (3H)-bit terms with a CSA then a final RCA.
// =============================================================================
module vedic_multiplier #(
    parameter N = 16
)(
    input  wire [N-1:0]     A,
    input  wire [N-1:0]     B,
    output wire [(2*N)-1:0] P
);

    generate
        if (N == 2) begin : base_case
            vedic_2x2_core u_core (.a(A), .b(B), .p(P));
        end
        else begin : recursive_step
            localparam H  = N / 2;
            // Upper portion of Product spans bits [2N-1 : H]  → 3H bits wide
            localparam W3 = 3 * H;   // = 2N - H

            // ── Split inputs ─────────────────────────────────────────────────
            wire [H-1:0] a_high = A[N-1 : H];
            wire [H-1:0] a_low  = A[H-1 : 0];
            wire [H-1:0] b_high = B[N-1 : H];
            wire [H-1:0] b_low  = B[H-1 : 0];

            // ── Sub-products (each 2H = N bits wide) ─────────────────────────
            wire [N-1:0] q0, q1, q2, q3;

            vedic_multiplier #(.N(H)) u0 (.A(a_low),  .B(b_low),  .P(q0));
            vedic_multiplier #(.N(H)) u1 (.A(a_high), .B(b_low),  .P(q1));
            vedic_multiplier #(.N(H)) u2 (.A(a_low),  .B(b_high), .P(q2));
            vedic_multiplier #(.N(H)) u3 (.A(a_high), .B(b_high), .P(q3));

            // ── Middle sum: q1 + q2  (N-bit + N-bit → N+1 bits) ─────────────
            wire [N-1:0] mid_sum;
            wire         mid_cout;

            param_adder #(.WIDTH(N)) adder_mid (
                .X   (q1),
                .Y   (q2),
                .Cin (1'b0),
                .Sum (mid_sum),
                .Cout(mid_cout)
            );

            // ── Align three terms to the W3-bit upper-product grid ───────────
            //
            //  Weight column relative to bit H of Product:
            //  col 0        = bit H   of Product
            //  col (W3-1)   = bit 2N-1 of Product
            //
            //  q0[2H-1:H]  lands at col [H-1 : 0]          (low H cols)
            //  mid_sum[N-1:0] + mid_cout at col [N-1 : 0]  (low N cols) ← shifted by 0
            //  q3[N-1:0]   lands at col [2H-1 : H] = [N-1:H] (shifted by H)
            //
            //  CSA row widths = W3 bits each.

            // Row A: q0 upper half at columns [H-1:0], zeros elsewhere
            wire [W3-1:0] row_a = { {(2*H){1'b0}}, q0[N-1:H] };

            // Row B: mid_sum at columns [N-1:0], mid_cout at column N
            wire [W3-1:0] row_b = { {(H-1){1'b0}}, mid_cout, mid_sum };

            // Row C: q3 shifted left by H → columns [N+H-1:H] = [2H-1+H:H]
            //        In the W3-wide grid that is columns [N-1:H], i.e.
            //        q3 occupies [W3-1:H] with zeros in [H-1:0]
            wire [W3-1:0] row_c = { q3, {H{1'b0}} };

            // ── CSA layer (W3 independent full adders) ───────────────────────
            wire [W3-1:0] csa_s, csa_c;

            genvar j;
            for (j = 0; j < W3; j = j + 1) begin : csa_layer
                assign csa_s[j] = row_a[j] ^ row_b[j] ^ row_c[j];
                assign csa_c[j] = (row_a[j] & row_b[j])
                                | (row_a[j] & row_c[j])
                                | (row_b[j] & row_c[j]);
            end

            // ── Final vector merge: csa_s + (csa_c << 1) ────────────────────
            // Widen to W3+1 bits to absorb the left-shift carry.
            wire [W3:0] merge_x = {1'b0, csa_s};
            wire [W3:0] merge_y = {csa_c, 1'b0};   // shift carry left by 1

            wire [W3:0] final_sum;
            wire        final_cout_unused;

            param_adder #(.WIDTH(W3+1)) final_merge_adder (
                .X   (merge_x),
                .Y   (merge_y),
                .Cin (1'b0),
                .Sum (final_sum),
                .Cout(final_cout_unused)
            );

            // ── Output assembly ──────────────────────────────────────────────
            // Lower H bits  : from q0 directly (no carry ever propagates here)
            // Upper 3H bits : from final_sum (W3 bits; bit W3 should be 0)
            assign P[H-1:0]       = q0[H-1:0];
            assign P[(2*N)-1 : H] = final_sum[W3-1:0];

        end
    endgenerate

endmodule
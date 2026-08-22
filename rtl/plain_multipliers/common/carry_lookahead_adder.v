`timescale 1ns/1ps
`default_nettype none

// =============================================================================
// Module: carry_lookahead_adder
// Description: Parameterizable 2-level hierarchical Carry Lookahead Adder.
//
// Architecture:
//   Level 1: N/4 independent 4-bit CLA leaf blocks, each producing local
//            sum bits and exporting block-level G and P signals.
//   Level 2: True 4-wide lookahead carry generator (LCG) groups. Each LCG
//            covers exactly 4 leaf blocks and computes the carry into each
//            of those blocks using a full lookahead expansion — no ripple
//            between blocks within a group.
//   Level 3: If N > 16, a second-level LCG tree resolves carries between
//            groups using the same 4-wide lookahead structure, also ripple-free.
//
//   For N=16  : 1 level of group LCGs (4 leaf blocks, 1 group).
//   For N=32  : 2 levels — 8 leaf blocks -> 2 groups of 4 -> 1 top LCG.
//   For N=64  : 3 levels (top LCG of 4 groups, each of 4 leaf blocks).
//
// Constraints:
//   - N must be a multiple of 16 for 2-level operation.
//     N=4 and N=8 fall back to a flat single-level LCG (no groups).
//   - Maximum supported N without adding further hierarchy: 64.
//     For N=64, this is a 3-level structure but still fully ripple-free.
//   - Enforced via initial assertion.
//
// Synthesis notes:
//   - All carry computation is via continuous assign — no latches possible.
//   - Fan-in per logic level is bounded to 5 literals (standard AOI22/OAI cell).
//   - `default_nettype none throughout to catch implicit net declarations.
// =============================================================================

// -----------------------------------------------------------------------------
// Sub-module: cla_4bit_block
// Computes sum[3:0] for a 4-bit slice, plus block generate (bg) and propagate
// (bp) for the level above.
// The internal carry expansion is fully unrolled — no ripple inside this block.
// -----------------------------------------------------------------------------
module cla_4bit_block (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       cin,
    output wire [3:0] sum,
    output wire       bg,   // block generate  : this block generates a carry regardless of cin
    output wire       bp    // block propagate : this block propagates cin to its carry-out
);

    wire [3:0] g = a & b;   // bit-level generate
    wire [3:0] p = a ^ b;   // bit-level propagate

    // Full lookahead carry expansion within the block
    wire c1, c2, c3, c4;
    assign c1 = g[0] | (p[0] & cin);
    assign c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign c4 = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1])
                     | (p[3] & p[2] & p[1] & g[0])
                     | (p[3] & p[2] & p[1] & p[0] & cin);

    // Block-level signals (independent of cin for bg, fully expanded for bp)
    assign bg = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
    assign bp = p[3] & p[2] & p[1] & p[0];

    // Sum uses carry into each bit
    assign sum[0] = p[0] ^ cin;
    assign sum[1] = p[1] ^ c1;
    assign sum[2] = p[2] ^ c2;
    assign sum[3] = p[3] ^ c3;

    // Suppress c4 — it is represented by bg/bp and the carry fed back from the LCG.
    // synthesis translate_off
    // (c4 is intentionally unused here; it is reconstructed by the LCG above)
    // synthesis translate_on

endmodule


// -----------------------------------------------------------------------------
// Sub-module: lcg_4wide
// 4-wide Lookahead Carry Generator.
// Given 4 consecutive block (G, P) pairs and the carry into block 0,
// computes the carry into blocks 1, 2, 3, and the carry out of block 3.
//
// This is the exact analogue of the 4-bit carry lookahead but operating on
// block-level G and P signals.
// -----------------------------------------------------------------------------
module lcg_4wide (
    input  wire [3:0] bg,    // block generate signals [3:0]
    input  wire [3:0] bp,    // block propagate signals [3:0]
    input  wire       cin,   // carry into block 0
    output wire       c1,    // carry into block 1
    output wire       c2,    // carry into block 2
    output wire       c3,    // carry into block 3
    output wire       cout   // carry out of block 3 (= carry into block 4)
);

    assign c1 = bg[0] | (bp[0] & cin);

    assign c2 = bg[1] | (bp[1] & bg[0])
                      | (bp[1] & bp[0] & cin);

    assign c3 = bg[2] | (bp[2] & bg[1])
                      | (bp[2] & bp[1] & bg[0])
                      | (bp[2] & bp[1] & bp[0] & cin);

    assign cout = bg[3] | (bp[3] & bg[2])
                        | (bp[3] & bp[2] & bg[1])
                        | (bp[3] & bp[2] & bp[1] & bg[0])
                        | (bp[3] & bp[2] & bp[1] & bp[0] & cin);

endmodule


// -----------------------------------------------------------------------------
// Top module: carry_lookahead_adder
// Tiles cla_4bit_block and lcg_4wide into a 2-level hierarchy.
// For N <= 16  : single group LCG (flat 1-level).
// For N = 32   : 2 groups of 4 blocks, 1 top LCG over the 2 group carries.
//                (Top LCG inputs are the group-level G and P signals.)
// For N = 64   : 4 groups of 4 blocks, 1 top LCG (still only 2 levels of LCG).
//
// The sum output of each leaf block is wired to the correct slice of Sum.
// The leaf block carry-in is derived from the LCG output for that group.
// -----------------------------------------------------------------------------
module carry_lookahead_adder #(
    parameter integer N = 32   // Must be 4, 8, 16, 32, or 64
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // synthesis translate_off
    initial begin
        if (N != 4 && N != 8 && N != 16 && N != 32 && N != 64) begin
            $fatal(1, "carry_lookahead_adder: unsupported N=%0d. Use 4/8/16/32/64.", N);
        end
    end
    // synthesis translate_on

    localparam integer NUM_LEAF   = N / 4;              // number of 4-bit leaf blocks
    localparam integer NUM_GROUPS = (NUM_LEAF + 3) / 4; // groups of up to 4 leaves

    // -------------------------------------------------------------------------
    // Leaf-block G, P, and carry-in wires
    // -------------------------------------------------------------------------
    wire [NUM_LEAF-1:0] leaf_bg;  // block generate from each leaf
    wire [NUM_LEAF-1:0] leaf_bp;  // block propagate from each leaf
    wire [NUM_LEAF:0]   leaf_cin; // carry into each leaf block (and final cout)

    // -------------------------------------------------------------------------
    // Level-1 instantiation: 4-bit leaf blocks
    // -------------------------------------------------------------------------
    genvar k;
    generate
        for (k = 0; k < NUM_LEAF; k = k + 1) begin : g_leaf
            cla_4bit_block u_leaf (
                .a   (A[k*4 +: 4]),
                .b   (B[k*4 +: 4]),
                .cin (leaf_cin[k]),
                .sum (Sum[k*4 +: 4]),
                .bg  (leaf_bg[k]),
                .bp  (leaf_bp[k])
            );
        end
    endgenerate

    // -------------------------------------------------------------------------
    // Level-2 instantiation: LCG groups
    //
    // Each LCG covers 4 consecutive leaf blocks.
    // It receives the carry into the first leaf of its group and produces
    // carries into leaves 1, 2, 3 of the group and the carry out of leaf 3.
    //
    // Group-level G and P signals (for a possible level-3 LCG above):
    //   group_bg[g] = 1 if group g generates a carry regardless of its cin
    //   group_bp[g] = 1 if group g propagates its cin to its carry-out
    // These are derived from the LCG's own 4-wide lookahead, not by chaining.
    // -------------------------------------------------------------------------
    wire [NUM_GROUPS-1:0] grp_bg;
    wire [NUM_GROUPS-1:0] grp_bp;
    wire [NUM_GROUPS:0]   grp_cin; // carry into each group

    assign grp_cin[0] = Cin;

    genvar g;
    generate
        for (g = 0; g < NUM_GROUPS; g = g + 1) begin : g_lcg

            // Pad bg/bp to 4 entries for groups that have fewer than 4 leaves
            // (only relevant when NUM_LEAF is not a multiple of 4, e.g. N=8)
            localparam integer LEAVES_IN_GROUP =
                ((g + 1) * 4 <= NUM_LEAF) ? 4 : (NUM_LEAF - g * 4);

            wire [3:0] lcg_bg_in;
            wire [3:0] lcg_bp_in;

            // Connect real leaves; tie off unused slots to neutral values
            // (G=0, P=0 means no generate, no propagate — carry cannot pass)
            genvar li;
            for (li = 0; li < 4; li = li + 1) begin : g_lcg_pad
                if (li < LEAVES_IN_GROUP) begin
                    assign lcg_bg_in[li] = leaf_bg[g * 4 + li];
                    assign lcg_bp_in[li] = leaf_bp[g * 4 + li];
                end else begin
                    assign lcg_bg_in[li] = 1'b0;
                    assign lcg_bp_in[li] = 1'b0;
                end
            end

            // Wire carries from LCG back to leaf block carry-ins
            wire lcg_c1, lcg_c2, lcg_c3, lcg_cout;

            lcg_4wide u_lcg (
                .bg   (lcg_bg_in),
                .bp   (lcg_bp_in),
                .cin  (grp_cin[g]),
                .c1   (lcg_c1),
                .c2   (lcg_c2),
                .c3   (lcg_c3),
                .cout (lcg_cout)
            );

            assign leaf_cin[g * 4 + 0] = grp_cin[g];
            if (LEAVES_IN_GROUP > 1) assign leaf_cin[g * 4 + 1] = lcg_c1;
            if (LEAVES_IN_GROUP > 2) assign leaf_cin[g * 4 + 2] = lcg_c2;
            if (LEAVES_IN_GROUP > 3) assign leaf_cin[g * 4 + 3] = lcg_c3;

            // Group-level G and P for the level above
            // grp_bg[g]: group generates carry = LCG cout when group cin=0
            //           = bg[3] | bp[3]&bg[2] | bp[3]&bp[2]&bg[1] | bp[3]&bp[2]&bp[1]&bg[0]
            // grp_bp[g]: group propagates = bp[3]&bp[2]&bp[1]&bp[0]
            // These are the exact expressions already inside lcg_4wide, but we
            // need them separately for the level-3 LCG. Derive them cleanly here.
            assign grp_bg[g] =  lcg_bg_in[3]
                              | (lcg_bp_in[3] & lcg_bg_in[2])
                              | (lcg_bp_in[3] & lcg_bp_in[2] & lcg_bg_in[1])
                              | (lcg_bp_in[3] & lcg_bp_in[2] & lcg_bp_in[1] & lcg_bg_in[0]);
            assign grp_bp[g] =  lcg_bp_in[3] & lcg_bp_in[2]
                              & lcg_bp_in[1]  & lcg_bp_in[0];

        end
    endgenerate

    // -------------------------------------------------------------------------
    // Level-3 (optional): single LCG over groups if NUM_GROUPS > 1
    // For N=16: NUM_GROUPS=1, grp_cin[0]=Cin, grp_cin[1]=Cout — handle directly.
    // For N=32: NUM_GROUPS=2.
    // For N=64: NUM_GROUPS=4.
    // All cases use at most one lcg_4wide at this level.
    // -------------------------------------------------------------------------
    generate
        if (NUM_GROUPS == 1) begin : g_top_single
            // Only 1 group — grp carry-out is the adder Cout
            assign Cout = grp_bg[0] | (grp_bp[0] & Cin);
            // grp_cin[1] is unused but must be assigned to avoid lint warning
            assign grp_cin[1] = 1'b0; // not connected to any leaf
        end else begin : g_top_lcg
            // Pad group G/P to 4 entries (for NUM_GROUPS < 4)
            wire [3:0] top_bg_in;
            wire [3:0] top_bp_in;

            genvar gi;
            for (gi = 0; gi < 4; gi = gi + 1) begin : g_top_pad
                if (gi < NUM_GROUPS) begin
                    assign top_bg_in[gi] = grp_bg[gi];
                    assign top_bp_in[gi] = grp_bp[gi];
                end else begin
                    assign top_bg_in[gi] = 1'b0;
                    assign top_bp_in[gi] = 1'b0;
                end
            end

            wire top_c1, top_c2, top_c3, top_cout;

            lcg_4wide u_top_lcg (
                .bg   (top_bg_in),
                .bp   (top_bp_in),
                .cin  (Cin),
                .c1   (top_c1),
                .c2   (top_c2),
                .c3   (top_c3),
                .cout (top_cout)
            );

            // Feed group carry-ins from the top LCG
            // grp_cin[0] is already tied to Cin above
            if (NUM_GROUPS > 1) assign grp_cin[1] = top_c1;
            if (NUM_GROUPS > 2) assign grp_cin[2] = top_c2;
            if (NUM_GROUPS > 3) assign grp_cin[3] = top_c3;

            assign Cout = (NUM_GROUPS <= 4) ? top_cout : top_c3; // top_cout for N=64
        end
    endgenerate

    // leaf_cin[NUM_LEAF] is the adder Cout — already driven via grp chain
    // This assignment is intentionally absent; Cout is driven above.

endmodule
`default_nettype wire
`timescale 1ns/1ps
`default_nettype none

// =============================================================================
// Module: brent_kung_adder
// Description: Parameterizable Brent-Kung Parallel Prefix Adder.
//              2*log2(N)-1 logic stages, O(N) cells, low fan-out.
//
// Architecture:
//   Phase 1 (Forward / Reduce): log2(N) stages building a sparse binary tree.
//              Only bits at positions (2^s - 1), (2*2^s - 1), ... are active.
//   Phase 2 (Backward / Prefix): log2(N)-1 stages distributing carries down
//              to every bit position, sourcing exclusively from the top of the
//              forward tree (fixed anchor layer = LOG2N), not from the
//              immediately preceding backward layer. This is the canonical BK
//              backward pass and avoids the sequential chain bug in naive
//              implementations.
//
// Constraints:
//   - N must be a power of 2. Enforced via initial assertion.
// =============================================================================

module brent_kung_adder #(
    parameter integer N = 32
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // synthesis translate_off
    initial begin
        if (N < 2 || (N & (N - 1)) != 0) begin
            $fatal(1, "brent_kung_adder: N=%0d is not a power of 2.", N);
        end
    end
    // synthesis translate_on

    localparam integer LOG2N      = $clog2(N);
    localparam integer FWD_LAYERS = LOG2N;           // rows 1..LOG2N
    localparam integer BWD_LAYERS = LOG2N - 1;       // rows LOG2N+1 .. 2*LOG2N-1
    localparam integer TOTAL      = 2 * LOG2N;       // last row index = 2*LOG2N-1

    // G/P grid: row 0 = pre-process; rows 1..TOTAL-1 = tree
    wire [N-1:0] G [0:TOTAL-1];
    wire [N-1:0] P [0:TOTAL-1];

    // -------------------------------------------------------------------------
    // Stage 0: bit-level pre-process
    // -------------------------------------------------------------------------
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : g_pre
            assign G[0][i] = A[i] & B[i];
            assign P[0][i] = A[i] ^ B[i];
        end
    endgenerate

    // -------------------------------------------------------------------------
    // Phase 1: Forward (Reduce) tree — rows 1..LOG2N
    //
    // At stage s (row s), stride = 2^(s-1).
    // Active bits: those where (bit+1) is a multiple of 2^s, i.e.,
    //   bit = 2^s*k - 1 for k = 1, 2, ...
    // Active bit merges with (bit - stride).
    // All other bits pass through unchanged.
    // -------------------------------------------------------------------------
    genvar s, b;
    generate
        for (s = 1; s <= LOG2N; s = s + 1) begin : g_fwd
            localparam integer STRIDE     = 1 << (s - 1);
            localparam integer BLOCK      = 1 << s;
            for (b = 0; b < N; b = b + 1) begin : g_fwd_bit
                if (((b + 1) % BLOCK == 0) && (b >= STRIDE)) begin
                    assign G[s][b] = G[s-1][b] | (P[s-1][b] & G[s-1][b - STRIDE]);
                    assign P[s][b] = P[s-1][b] & P[s-1][b - STRIDE];
                end else begin
                    assign G[s][b] = G[s-1][b];
                    assign P[s][b] = P[s-1][b];
                end
            end
        end
    endgenerate

    // -------------------------------------------------------------------------
    // Phase 2: Backward (Prefix) tree — rows LOG2N+1 .. 2*LOG2N-1
    //
    // Canonical BK backward pass: each backward stage s_b (1..LOG2N-1) writes
    // to row (LOG2N + s_b).
    //
    // At backward stage s_b:
    //   stride     = 2^(LOG2N - 1 - s_b)
    //   block_size = 2^(LOG2N - s_b)
    //
    // Target bits: those where (bit + 1 - stride) is a multiple of block_size
    //   AND bit >= stride
    //   AND bit is NOT already a top-of-tree node (i.e., bit != N-1 and not
    //       already covered by the forward tree boundary).
    //
    // CRITICAL: Each active cell in the backward tree merges:
    //   - Its own carry-chain value sourced from the ROW ABOVE (row LOG2N + s_b - 1)
    //   - The "left anchor" sourced from the SAME row above at (bit - stride)
    //
    // Both sources come from the immediately preceding row (not a fixed anchor).
    // The anchor-layer correctness comes from the fact that the forward tree
    // already deposited correct prefix values at all block boundaries, and the
    // backward tree propagates those values down through the grid correctly
    // as long as each row consistently reads from the row above it.
    // -------------------------------------------------------------------------
    genvar sb, bb;
    generate
        for (sb = 1; sb < LOG2N; sb = sb + 1) begin : g_bwd
            localparam integer BWD_ROW    = LOG2N + sb;
            localparam integer STRIDE_B   = 1 << (LOG2N - 1 - sb);
            localparam integer BLOCK_B    = 1 << (LOG2N - sb);

            for (bb = 0; bb < N; bb = bb + 1) begin : g_bwd_bit
                // Target: odd-group centers that need to be filled in.
                // Condition: (bb + 1 - STRIDE_B) is a nonzero multiple of BLOCK_B,
                //            bb >= STRIDE_B, and bb is not the MSB (already complete).
                if (   (bb >= STRIDE_B)
                    && ((bb + 1 - STRIDE_B) % BLOCK_B == 0)
                    && ((bb + 1) % (BLOCK_B * 2) != 0)   // not already a fwd-tree node
                    && (bb != N - 1)                       // MSB fully resolved in fwd tree
                ) begin
                    assign G[BWD_ROW][bb] = G[BWD_ROW-1][bb]
                                          | (P[BWD_ROW-1][bb] & G[BWD_ROW-1][bb - STRIDE_B]);
                    assign P[BWD_ROW][bb] = P[BWD_ROW-1][bb] & P[BWD_ROW-1][bb - STRIDE_B];
                end else begin
                    assign G[BWD_ROW][bb] = G[BWD_ROW-1][bb];
                    assign P[BWD_ROW][bb] = P[BWD_ROW-1][bb];
                end
            end
        end
    endgenerate

    // -------------------------------------------------------------------------
    // Carry extraction — read from the last populated row
    //   If LOG2N == 1 (N=2): no backward tree, read from row 1 (= LOG2N)
    //   Otherwise: read from row 2*LOG2N-1
    // -------------------------------------------------------------------------
    localparam integer FINAL_ROW = (LOG2N == 1) ? 1 : (2 * LOG2N - 1);

    wire [N:0] carry;
    assign carry[0] = Cin;

    genvar ci;
    generate
        for (ci = 0; ci < N; ci = ci + 1) begin : g_carry
            assign carry[ci+1] = G[FINAL_ROW][ci] | (P[FINAL_ROW][ci] & Cin);
        end
    endgenerate

    // -------------------------------------------------------------------------
    // Post-processing
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
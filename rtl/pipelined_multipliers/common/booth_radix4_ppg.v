// ==============================================================================
// Custom Radix-4 Booth Partial Product Generator (PPG)
// Built strictly to specifications.
// ==============================================================================
`timescale 1ns/1ps

module booth_radix4_ppg #(
    parameter N = 4,
    parameter SIGNED_A = 1,
    parameter SIGNED_B = 1
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    output wire [(ROWS * W) - 1:0] pp,       // Flat matrix of ROWS x (N+1) bits
    output wire [ROWS-1:0]         pp_cin,   // 2's complement negation bits (+1) per row
    output wire [(ROWS * 2) - 1:0] pp_corr   // Custom sign-extension prevention array
);

    // --------------------------------------------------------------------------
    // Dynamic Parameter Computations
    // --------------------------------------------------------------------------
    // Number of rows: N/2 for even, N/2 + 1 for odd
    localparam ROWS = (N % 2 == 0) ? (N / 2) : ((N / 2) + 1);
    // Fixed bit-width per partial product row
    localparam W = N + 1;

    // --------------------------------------------------------------------------
    // Internal Term Generation (Width = N+1 Bits)
    // --------------------------------------------------------------------------
    // Define input A with N+1 bits [N:0] where the MSB is the sign bit
    wire [W-1:0] A_ext = {A[N-1], A};

    // Calculate internal terms cleanly via basic operations
    wire [W-1:0] term_pos_A  = A_ext;                  // +A
    wire [W-1:0] term_neg_A  = ~A_ext;                 // -A = ~A + 1
    wire [W-1:0] term_pos_2A = A_ext << 1;             // +2A through shifting
    wire [W-1:0] term_neg_2A = ~(A_ext << 1);          // -2A = ~(A<<1) + 1
    // -A = ~A + 1, here only ~A portion is calculated to go in pp array
    // +1 will later be added into pp_cin array

    // Pad B for Radix-4 Triplet scanning [N:0]
    wire [N:0] B_padded = {B[N-1], B};

    // --------------------------------------------------------------------------
    // Generation Loop
    // --------------------------------------------------------------------------
    genvar i;
    generate
        for (i = 0; i < ROWS; i = i + 1) begin : gen_rows
            // Radix-4 Triplet selection: B[2i+1], B[2i], B[2i-1]
            wire b2 = B_padded[2*i+1];
            wire b1 = B_padded[2*i];
            wire b0 = (i == 0) ? 1'b0 : B_padded[2*i-1];

            // Decode Booth conditions
            wire sel_1x  = b0 ^ b1;
            wire sel_2x  = (b0 & b1 & ~b2) | (~b0 & ~b1 & b2);
            wire sel_neg = b2; // Direct indicator for negative actions (-A or -2A)

            // Dynamic muxing selection of the row contents
            wire [W-1:0] row_bits = (sel_1x && !sel_neg) ? term_pos_A  :
                                    (sel_1x &&  sel_neg) ? term_neg_A  :
                                    (sel_2x && !sel_neg) ? term_pos_2A :
                                    (sel_2x &&  sel_neg) ? term_neg_2A : {W{1'b0}};

            // Flatten row bits into the structural 1D output port array
            assign pp[i*W +: W] = row_bits;

            // Capture the exact +1 complementation carry-in bit for this row
            assign pp_cin[i] = sel_neg && (sel_1x || sel_2x);

            // ------------------------------------------------------------------
            // Structural Matrix Packing of pp_corr
            // ------------------------------------------------------------------
            if (i == 0) begin : gen_corr_row0
                // 0th bit -> sign bit of first row
                assign pp_corr[0] = row_bits[W-1];
                // 1st bit -> sign bit of first row
                assign pp_corr[1] = row_bits[W-1];
                // 2nd bit -> inv sign bit of first row
                assign pp_corr[2] = ~row_bits[W-1];
            end else if (i < ROWS - 1) begin : gen_corr_middle_rows
                // 3rd, 5th, 7th... bits -> inv sign bit of subsequent rows
                assign pp_corr[2*i + 1] = ~row_bits[W-1];
                
                // 4th, 6th, 8th... bits -> fixed +1 constant
                assign pp_corr[2*i + 2] = 1'b1;
            end else begin : gen_corr_last_row
                // ~S (No constant 1 follow-up)
                assign pp_corr[2*i + 1] = ~row_bits[W-1];
            end
        end
    endgenerate

endmodule

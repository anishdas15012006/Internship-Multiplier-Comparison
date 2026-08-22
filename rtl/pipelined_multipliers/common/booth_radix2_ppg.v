// ==============================================================================
// Radix-2 Booth Partial Product Generator with Clean Sign Extension Prevention
// ==============================================================================
`timescale 1ns/1ps

module booth_radix2_ppg #(
    parameter N = 8,
    parameter SIGNED_A = 1,
    parameter SIGNED_B = 1
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    output wire [(N*N)-1:0] pp,            // Flat matrix of N rows x N bits
    output wire [N:0]       pp_cin,        // [N-1:0] are row correction (+1), [N] is the fixed constant +1
    output wire [N-1:0]     sign_inv_bits  // Inverted sign bit per row (positioned at column N + i)
);

    // Internal variants of inputs handling signed/unsigned configurations
    wire [N-1:0] ext_A = A;
    wire [N:0]   B_padded = { {SIGNED_B ? B[N-1] : 1'b0}, B };

    // The fixed constant +1 required by the sign prevention algorithm at column N
    assign pp_cin[N] = 1'b1;

    genvar i, j;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_booth_rows
            // Look at B[i] and B[i-1]. For i=0, B[-1] is structurally 0.
            wire b_curr = B_padded[i];
            wire b_prev = (i == 0) ? 1'b0 : B_padded[i-1];

            // Booth Control Decoding
            wire ppg_zero = (b_curr == b_prev);
            wire ppg_sub  = (b_curr && !b_prev); // 2'b10 -> Subtract A (Invert and add 1)
            wire ppg_add  = (!b_curr && b_prev); // 2'b01 -> Add A

            // Two's complement negation correction bit (+1) for this row
            assign pp_cin[i] = ppg_sub;

            // Generate N bits for row i
            for (j = 0; j < N; j = j + 1) begin : gen_bits
                wire raw_bit = (ppg_add && ext_A[j]) || (ppg_sub && !ext_A[j]);
                assign pp[(i * N) + j] = ppg_zero ? 1'b0 : raw_bit;
            end

            // Sign-extension prevention: Capture the un-inverted sign bit from the row's MSB
            wire raw_sign = ppg_zero ? 1'b0 : ((ppg_add && ext_A[N-1]) || (ppg_sub && !ext_A[N-1]));
            
            // Output the inverted sign bit to be placed at column N + i
            assign sign_inv_bits[i] = !raw_sign;
        end
    endgenerate

endmodule

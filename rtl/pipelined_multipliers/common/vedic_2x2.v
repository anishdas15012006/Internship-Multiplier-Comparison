// ============================================================================
// Leaf Primitive Module: 2x2 Structural Vedic Multiplier Block
// Formula Baseline: Urdhva Tiryagbhyam Sutra (Vertically and Crosswise)
// ============================================================================

`timescale 1ns/1ps
`default_nettype none

module vedic_2x2 (
    input  wire [1:0] A,      // 2-bit Multiplicand Input
    input  wire [1:0] B,      // 2-bit Multiplier Input
    output wire [3:0] P       // 4-bit Natively Extracted Product Output
);

    // ------------------------------------------------------------------------
    // Step 1: Generate Raw Product Terms (AND Array)
    // ------------------------------------------------------------------------
    wire s0, s1, s2, s3;
    
    assign s0 = A[0] & B[0];  // Vertical 1: Bit 0 Product
    assign s1 = A[1] & B[0];  // Crosswise 1
    assign s2 = A[0] & B[1];  // Crosswise 2
    assign s3 = A[1] & B[1];  // Vertical 2: Bit 2/3 Base

    // ------------------------------------------------------------------------
    // Step 2: Crosswise Reduction (Bit 1 Column)
    // ------------------------------------------------------------------------
    wire w_c1;                // Carry out from Column 1
    
    assign P[0] = s0;         // P[0] is resolved natively
    assign P[1] = s1 ^ s2;    // Column 1 Sum bit
    assign w_c1 = s1 & s2;    // Column 1 Carry out

    // ------------------------------------------------------------------------
    // Step 3: Vertical-2 Reduction (Bit 2 & 3 Column)
    // ------------------------------------------------------------------------
    // Summing the Column 1 carry (w_c1) with the final raw product term (s3)
    assign P[2] = s3 ^ w_c1;  // Column 2 Sum bit
    assign P[3] = s3 & w_c1;  // Column 3 overflow (Carry out)

endmodule
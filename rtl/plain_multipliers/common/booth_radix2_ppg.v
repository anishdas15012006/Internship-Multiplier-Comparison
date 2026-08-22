`timescale 1ns/1ps
`default_nettype none

module booth_radix2_ppg #(
    parameter N        = 4, 
    parameter SIGNED_A = 0,  
    parameter SIGNED_B = 0   
)(
    input  wire [N-1:0] A,             
    input  wire [N-1:0] B,             
    
    // If B is Unsigned, we need N+1 rows to capture the overflow.
    // If B is Signed, we only need N rows. 
    // We allocate (N+1) rows to be safe; if SIGNED_B=1, the last row stays all 0s.
    output wire [((N+1) * (2*N)) - 1:0] pp, 
    output wire [N:0]                   pp_cin          
);

    localparam ROW_WIDTH = 2 * N;

    // 1. DYNAMIC MULTIPLIER PADDING USING SIGNED_B
    wire [N+1:0] B_padded;
    assign B_padded[0]   = 1'b0;  // B[-1] is always 0
    assign B_padded[N:1] = B;
    
    // Use SIGNED_B here! If B is unsigned, pad the MSB with 0. 
    // If B is signed, sign-extend B by replicating its sign bit B[N-1].
    assign B_padded[N+1] = (SIGNED_B == 1) ? B[N-1] : 1'b0;


    // Declare wires outside so the generate blocks can drive them
    wire [ROW_WIDTH-1:0] A_extended;

    // 2. YOUR GENERATE APPROACH FOR MULTIPLICAND EXTENSION
    generate
        if (SIGNED_A == 1) begin : signed_A_ext
            assign A_extended = {{(N){A[N-1]}}, A};
        end else begin : unsigned_A_ext
            assign A_extended = {{N{1'b0}}, A};
        end
    endgenerate


    // 3. GENERATE THE PARTIAL PRODUCT ROWS (Loops up to N+1 to catch unsigned leftovers)
    genvar i;
    generate
        for (i = 0; i < N + 1; i = i + 1) begin : gen_rows
            
            wire current_bit  = B_padded[i+1];
            wire previous_bit = B_padded[i];

            wire [ROW_WIDTH-1:0] A_shifted     = A_extended << i;
            wire [ROW_WIDTH-1:0] A_inv_shifted = ~A_shifted; 

            wire [ROW_WIDTH-1:0] row_pp;
            
            assign row_pp = (current_bit == previous_bit) ? {ROW_WIDTH{1'b0}} :
                            (current_bit == 1'b0 && previous_bit == 1'b1) ? A_shifted : 
                                                                            A_inv_shifted;

            assign pp[i*ROW_WIDTH +: ROW_WIDTH] = row_pp;
            assign pp_cin[i] = (current_bit == 1'b1 && previous_bit == 1'b0) ? 1'b1 : 1'b0;

        end
    endgenerate

endmodule
`default_nettype wire
`timescale 1ns/1ps
`default_nettype none

module booth_radix4_ppg #(
    parameter N        = 16, // Bit-width configuration (Must be even for Radix-4)
    parameter SIGNED_A = 0,  // 1 = Signed, 0 = Unsigned
    parameter SIGNED_B = 0   // 1 = Signed, 0 = Unsigned
)(
    input  wire [N-1:0] A,             
    input  wire [N-1:0] B,             
    
    // Matrix size: Max (N/2)+1 rows. Each row is sign-extended to 2N bits.
    output wire [(((N/2) + 1) * (2*N)) - 1:0] pp, 
    output wire [(N/2) : 0]                   pp_cin          
);

    localparam ROW_WIDTH = 2 * N;
    localparam NUM_ROWS  = (N / 2) + 1;

    // 1. Multidatabase Multiplier Padding 
    wire [N+2:0] B_padded;
    assign B_padded[0]   = 1'b0; // B[-1] is always 0
    assign B_padded[N:1] = B;

    // Pad top bits based on Signed/Unsigned status
    generate
        if (SIGNED_B == 1) begin : signed_B_ext
            assign B_padded[N+1] = B[N-1];
            assign B_padded[N+2] = B[N-1];
        end else begin : unsigned_B_ext
            assign B_padded[N+1] = 1'b0;
            assign B_padded[N+2] = 1'b0;
        end
    endgenerate

    // 2. Multiplicand Sign Extension via your Compile-Time Check
    wire [ROW_WIDTH-1:0] A_extended;
    generate
        if (SIGNED_A == 1) begin : signed_A_ext
            assign A_extended = {{(N){A[N-1]}}, A};
        end else begin : unsigned_A_ext
            assign A_extended = {{N{1'b0}}, A};
        end
    endgenerate

    // 3. Radix-4 Parallel Row Decode Step
    genvar i;
    generate
        for (i = 0; i < NUM_ROWS; i = i + 1) begin : gen_rows
            
            // Radix-4 Window: 3 bits at a time, stepping by 2 bits
            wire [2:0] window = {B_padded[2*i+1 + 1], B_padded[2*i + 1], B_padded[2*i-1 + 1]};

            // Spatial alignment based on row index (shifts by 2*i)
            wire [ROW_WIDTH-1:0] A_1x_shifted = A_extended << (2*i);
            wire [ROW_WIDTH-1:0] A_2x_shifted = A_extended << (2*i + 1); // 2x operation is a simple shift by 1 more

            reg [ROW_WIDTH-1:0] row_mux;
            reg                 cin_mux;

            always @(*) begin
                case (window)
                    3'b000: begin row_mux = {ROW_WIDTH{1'b0}}; cin_mux = 1'b0; end //  0
                    3'b001: begin row_mux = A_1x_shifted;      cin_mux = 1'b0; end // +1 * A
                    3'b010: begin row_mux = A_1x_shifted;      cin_mux = 1'b0; end // +1 * A
                    3'b011: begin row_mux = A_2x_shifted;      cin_mux = 1'b0; end // +2 * A
                    3'b100: begin row_mux = ~A_2x_shifted;     cin_mux = 1'b1; end // -2 * A (Invert + carry)
                    3'b101: begin row_mux = ~A_1x_shifted;     cin_mux = 1'b1; end // -1 * A (Invert + carry)
                    3'b110: begin row_mux = ~A_1x_shifted;     cin_mux = 1'b1; end // -1 * A (Invert + carry)
                    3'b111: begin row_mux = {ROW_WIDTH{1'b0}}; cin_mux = 1'b0; end //  0
                endcase
            end

            assign pp[i*ROW_WIDTH +: ROW_WIDTH] = row_mux;
            assign pp_cin[i]                   = cin_mux;
        end
    endgenerate

endmodule
`default_nettype wire
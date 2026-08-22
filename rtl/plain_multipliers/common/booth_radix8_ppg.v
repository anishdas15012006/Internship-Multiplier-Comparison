`timescale 1ns/1ps
`default_nettype none

module booth_radix8_ppg #(
    parameter N        = 6, // Bit-width configuration (Must be multiple of 3)
    parameter SIGNED_A = 0,  
    parameter SIGNED_B = 0   
)(
    input  wire [N-1:0] A,             
    input  wire [N-1:0] B,             
    
    // Matrix size: Max (N/3)+1 rows. Each row packed to 2N bits.
    output wire [(((N/3) + 1) * (2*N)) - 1:0] pp, 
    output wire [(N/3) : 0]                   pp_cin          
);

    localparam ROW_WIDTH = 2 * N;
    localparam NUM_ROWS  = (N / 3) + 1;

    // 1. Multidatabase Multiplier Padding
    wire [N+3:0] B_padded;
    assign B_padded[0]   = 1'b0; // B[-1] = 0
    assign B_padded[N:1] = B;

    generate
        if (SIGNED_B == 1) begin : signed_B_ext
            assign B_padded[N+1] = B[N-1];
            assign B_padded[N+2] = B[N-1];
            assign B_padded[N+3] = B[N-1];
        end else begin : unsigned_B_ext
            assign B_padded[N+1] = 1'b0;
            assign B_padded[N+2] = 1'b0;
            assign B_padded[N+3] = 1'b0;
        end
    endgenerate

    // 2. Multiplicand Sign Extension
    wire [ROW_WIDTH-1:0] A_extended;
    generate
        if (SIGNED_A == 1) begin : signed_A_ext
            assign A_extended = {{(N){A[N-1]}}, A};
        end else begin : unsigned_A_ext
            assign A_extended = {{N{1'b0}}, A};
        end
    endgenerate

    // 3. Pre-calculating the Hard Multiplier Element (3A = 2A + 1A)
    // Runs once in parallel so row allocation stays completely non-blocking
    wire [ROW_WIDTH-1:0] A_3x_base = A_extended + (A_extended << 1);

    // 4. Radix-8 Parallel Row Decode Step
    genvar i;
    generate
        for (i = 0; i < NUM_ROWS; i = i + 1) begin : gen_rows
            
            // Radix-8 Window: 4 bits at a time, stepping by 3 bits
            wire [3:0] window = {B_padded[3*i+2 + 1], B_padded[3*i+1 + 1], B_padded[3*i + 1], B_padded[3*i-1 + 1]};

            // Shift operators based on row spatial indices (shifts by 3*i)
            wire [ROW_WIDTH-1:0] A_1x = A_extended << (3*i);
            wire [ROW_WIDTH-1:0] A_2x = A_extended << (3*i + 1);
            wire [ROW_WIDTH-1:0] A_3x = A_3x_base  << (3*i);
            wire [ROW_WIDTH-1:0] A_4x = A_extended << (3*i + 2);

            reg [ROW_WIDTH-1:0] row_mux;
            reg                 cin_mux;

            always @(*) begin
                case (window)
                    4'b0000: begin row_mux = {ROW_WIDTH{1'b0}}; cin_mux = 1'b0; end //  0
                    4'b0001: begin row_mux = A_1x;              cin_mux = 1'b0; end // +1 * A
                    4'b0010: begin row_mux = A_1x;              cin_mux = 1'b0; end // +1 * A
                    4'b0011: begin row_mux = A_2x;              cin_mux = 1'b0; end // +2 * A
                    4'b0100: begin row_mux = A_2x;              cin_mux = 1'b0; end // +2 * A
                    4'b0101: begin row_mux = A_3x;              cin_mux = 1'b0; end // +3 * A
                    4'b0110: begin row_mux = A_3x;              cin_mux = 1'b0; end // +3 * A
                    4'b0111: begin row_mux = A_4x;              cin_mux = 1'b0; end // +4 * A
                    4'b1000: begin row_mux = ~A_4x;             cin_mux = 1'b1; end // -4 * A
                    4'b1001: begin row_mux = ~A_3x;             cin_mux = 1'b1; end // -3 * A
                    4'b1010: begin row_mux = ~A_3x;             cin_mux = 1'b1; end // -3 * A
                    4'b1011: begin row_mux = ~A_2x;             cin_mux = 1'b1; end // -2 * A
                    4'b1100: begin row_mux = ~A_2x;             cin_mux = 1'b1; end // -2 * A
                    4'b1101: begin row_mux = ~A_1x;             cin_mux = 1'b1; end // -1 * A
                    4'b1110: begin row_mux = ~A_1x;             cin_mux = 1'b1; end // -1 * A
                    4'b1111: begin row_mux = {ROW_WIDTH{1'b0}}; cin_mux = 1'b0; end //  0
                endcase
            end

            assign pp[i*ROW_WIDTH +: ROW_WIDTH] = row_mux;
            assign pp_cin[i]                   = cin_mux;
        end
    endgenerate

endmodule
`default_nettype wire
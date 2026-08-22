// ==============================================================================
// Custom Radix-8 Booth Partial Product Generator (PPG)
// Built strictly to specifications.
// ==============================================================================
`timescale 1ns/1ps

module booth_radix8_ppg #(
    parameter N = 6,
    parameter SIGNED_A = 1,
    parameter SIGNED_B = 1
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    output wire [(ROWS * W) - 1:0] pp,       // Flat matrix of ROWS x (N+2) bits
    output wire [ROWS-1:0]         pp_cin,   // 2's complement negation bits (+1) per row
    output wire [(ROWS * 3):0]     pp_corr   // Sign prevention matrix: 3 * ROWS + 1 bits
);

    // --------------------------------------------------------------------------
    // Dynamic Parameter Computations
    // --------------------------------------------------------------------------
    // Number of rows: ceil(N/3) -> calculated via integer division ceiling math
    localparam ROWS = (N + 2) / 3;
    // Fixed bit-width per partial product row (N+2 bits)
    localparam W = N + 2;

    // --------------------------------------------------------------------------
    // Internal Term Generation (Width = N+2 Bits)
    // --------------------------------------------------------------------------
    // Define input A with N+2 bits where the MSB is the sign bit
    wire [W-1:0] A_ext = {{2{A[N-1]}}, A};

    // Calculate all required Radix-8 magnitude options natively on W-bit widths
    wire [W-1:0] term_pos_A  = A_ext;                            // +A
    wire [W-1:0] term_neg_A  = ~A_ext;                           // -A
    wire [W-1:0] term_pos_2A = A_ext << 1;                       // +2A
    wire [W-1:0] term_neg_2A = ~(A_ext << 1);                    // -2A
    wire [W-1:0] term_pos_3A = ((A_ext << 1) + A_ext);           // +3A
    wire [W-1:0] term_neg_3A = ~((A_ext << 1) + A_ext);          // -3A
    wire [W-1:0] term_pos_4A = A_ext << 2;                       // +4A
    wire [W-1:0] term_neg_4A = ~(A_ext << 2);                    // -4A

    // Pad operand B for 4-bit overlapping window scans
    wire [N:0] B_padded = {B[N-1], B};

    // --------------------------------------------------------------------------
    // Generation Loop
    // --------------------------------------------------------------------------
    genvar i;
    generate
        for (i = 0; i < ROWS; i = i + 1) begin : gen_rows
            // Radix-8 4-bit window selection: B[3i+2], B[3i+1], B[3i], B[3i-1]
            wire b3 = (3*i + 2 < N + 1) ? B_padded[3*i+2] : B_padded[N];
            wire b2 = (3*i + 1 < N + 1) ? B_padded[3*i+1] : B_padded[N];
            wire b1 = (3*i     < N + 1) ? B_padded[3*i]   : B_padded[N];
            wire b0 = (i == 0) ? 1'b0 : ((3*i - 1 < N + 1) ? B_padded[3*i-1] : B_padded[N]);

            // Decode Booth operations according to Radix-8 truth standards
            wire [3:0] window = {b3, b2, b1, b0};
            reg [W-1:0] row_mux;
            reg         neg_mux;

            always @(*) begin
                case (window)
                    4'b0000, 4'b1111: begin row_mux = {W{1'b0}};  neg_mux = 1'b0; end //  0
                    4'b0001, 4'b0010: begin row_mux = term_pos_A;  neg_mux = 1'b0; end // +1A
                    4'b0011, 4'b0100: begin row_mux = term_pos_2A; neg_mux = 1'b0; end // +2A
                    4'b0101, 4'b0110: begin row_mux = term_pos_3A; neg_mux = 1'b0; end // +3A
                    4'b0111:          begin row_mux = term_pos_4A; neg_mux = 1'b0; end // +4A
                    4'b1000:          begin row_mux = term_neg_4A; neg_mux = 1'b1; end // -4A
                    4'b1001, 4'b1010: begin row_mux = term_neg_3A; neg_mux = 1'b1; end // -3A
                    4'b1011, 4'b1100: begin row_mux = term_neg_2A; neg_mux = 1'b1; end // -2A
                    4'b1101, 4'b1110: begin row_mux = term_neg_A;  neg_mux = 1'b1; end // -1A
                    default:          begin row_mux = {W{1'b0}};  neg_mux = 1'b0; end
                endcase
            end

            // Flatten row bits into the structural 1D output port matrix array
            assign pp[i*W +: W] = row_mux;

            // Capture the 2's complement negation carry-in bit (+1) for this row
            assign pp_cin[i] = neg_mux;

            // ------------------------------------------------------------------
            // Structural Matrix Packing of pp_corr
            // ------------------------------------------------------------------
            if (i == 0) begin : gen_corr_row0
                assign pp_corr[0] = row_mux[W-1];   // S
                assign pp_corr[1] = row_mux[W-1];   // S
                assign pp_corr[2] = row_mux[W-1];   // S
                assign pp_corr[3] = ~row_mux[W-1];  // ~S
            end else begin : gen_corr_subsequent_rows
                assign pp_corr[3*i + 1] = ~row_mux[W-1]; // ~S
                assign pp_corr[3*i + 2] = 1'b1;           // 1
                assign pp_corr[3*i + 3] = 1'b1;           // 1
            end
        end
    endgenerate

endmodule

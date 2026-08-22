`timescale 1ns / 1ps

module baugh_wooley_ppg #(
    parameter N = 4 // Bit-width of the inputs
)(
    input  wire signed [N-1:0] A, // Multiplicand
    input  wire signed [N-1:0] B, // Multiplier
    
    // Output matrix flattened into a 1D vector for easy port mapping.
    // There are N rows, and each row is padded/shifted to a 2N width.
    output wire [(N * (2*N)) - 1 : 0] ppg_matrix,
    
    // Baugh-Wooley constant correction vector to be added in your tree
    output wire [2*N-1:0] bw_constant
);

    // 2D packed array for easier internal indexing
    wire [2*N-1:0] pp_rows [0:N-1];

    genvar i, j;
    generate
        for (i = 0; i < N; i = i + 1) begin: row_gen
            // Create a temporary unshifted row of size N
            wire [N-1:0] raw_row;
            
            for (j = 0; j < N; j = j + 1) begin: col_gen
                if (i == N-1 && j == N-1) begin
                    // The MSB x MSB term is NOT inverted
                    assign raw_row[j] = A[j] & B[i];
                end 
                else if (i == N-1 || j == N-1) begin
                    // The rest of the MSB row and MSB column terms ARE inverted
                    assign raw_row[j] = ~(A[j] & B[i]);
                end 
                else begin
                    // All internal terms are standard AND products
                    assign raw_row[j] = A[j] & B[i];
                end
            end

            // Left-shift each row by its weight 'i' and zero-pad the rest
            assign pp_rows[i] = { {(N){1'b0}}, raw_row } << i;
            
            // Flatten the 2D array into the 1D output port
            assign ppg_matrix[(i+1)*(2*N) - 1 : i*(2*N)] = pp_rows[i];
        end
    endgenerate

    // Baugh-Wooley requires adding 1 at position 2^(N-1) and 1 at position 2^(2N-1)
    // You can feed this constant row directly into your Wallace/Dadda tree as an extra input vector.
    assign bw_constant = (1'b1 << (N)) | (1'b1 << (2*N-1));

endmodule
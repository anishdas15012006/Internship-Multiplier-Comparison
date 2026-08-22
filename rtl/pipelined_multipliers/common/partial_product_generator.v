`default_nettype none

module partial_product_generator #(parameter N = 16)(
    input  wire [N - 1 : 0] A,
    input  wire [N - 1 : 0] B,

    output wire [(N * N) - 1: 0] pp
);

genvar i,j;

generate
    
    for(i = 0; i < N; i = i + 1)
    begin : ROW

        for(j = 0; j < N; j = j + 1)
        begin : COL

            assign pp[(i * N) + j] = A[j] & B[i];

        end
    end

endgenerate

endmodule

`default_nettype wire
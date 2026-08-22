`default_nettype none

module carry_save_adder #(parameter N = 16)
(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire [N-1:0] C,

    output wire [N-1:0] SUM,
    output wire [N-1:0] CARRY
);

genvar i;

generate

    for(i = 0; i < N; i = i + 1)
    begin : CSA_STAGE

        full_adder FA(
            .a(A[i]),
            .b(B[i]),
            .cin(C[i]),
            .sum(SUM[i]),
            .carry(CARRY[i])
        );

    end

endgenerate

endmodule

`default_nettype wire
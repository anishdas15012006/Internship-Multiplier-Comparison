`timescale 1ns/1ps
`default_nettype none

module booth_wallace_radix2_4 #(
    parameter SIGNED_A = 0,
    parameter SIGNED_B = 0
)(
   input wire [3:0] A,
   input wire [3:0] B,

   output wire [7:0] P
);

wire [39:0] pp;
wire [4:0] pp_cin;

booth_radix2_ppg #(
    .N(4),
    .SIGNED_A(SIGNED_A),
    .SIGNED_B(SIGNED_B)
) PPG (
    .A(A),
    .B(B),
    .pp(pp),
    .pp_cin(pp_cin)
);


assign rowA = {w42, w40, w38, w36, w34, w24, w0, pp[0]};
assign rowB = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, pp_cin[0]};

wire w0;
wire w1;
wire w2;
wire w3;
wire w4;
wire w5;
wire w6;
wire w7;
wire w8;
wire w9;
wire w10;
wire w11;
wire w12;
wire w13;
wire w14;
wire w15;
wire w16;
wire w17;
wire w18;
wire w19;
wire w20;
wire w21;
wire w22;
wire w23;
wire w24;
wire w25;
wire w26;
wire w27;
wire w28;
wire w29;
wire w30;
wire w31;
wire w32;
wire w33;
wire w34;
wire w35;
wire w36;
wire w37;
wire w38;
wire w39;
wire w40;
wire w41;
wire w42;
wire w43;
wire [7:0] rowA;
wire [7:0] rowB;

full_adder FA_0(
    .a(pp[1]),
    .b(pp[9]),
    .cin(pp_cin[1]),
    .sum(w0),
    .carry(w1)
);

full_adder FA_1(
    .a(pp[2]),
    .b(pp[10]),
    .cin(pp[18]),
    .sum(w2),
    .carry(w3)
);

full_adder FA_2(
    .a(pp[3]),
    .b(pp[11]),
    .cin(pp[19]),
    .sum(w4),
    .carry(w5)
);

full_adder FA_3(
    .a(pp[27]),
    .b(pp_cin[3]),
    .cin(w4),
    .sum(w6),
    .carry(w7)
);

full_adder FA_4(
    .a(pp[4]),
    .b(pp[12]),
    .cin(pp[20]),
    .sum(w8),
    .carry(w9)
);

full_adder FA_5(
    .a(pp[28]),
    .b(pp[36]),
    .cin(pp_cin[4]),
    .sum(w10),
    .carry(w11)
);

full_adder FA_6(
    .a(pp[5]),
    .b(pp[13]),
    .cin(pp[21]),
    .sum(w12),
    .carry(w13)
);

full_adder FA_7(
    .a(pp[29]),
    .b(pp[37]),
    .cin(w12),
    .sum(w14),
    .carry(w15)
);

full_adder FA_8(
    .a(pp[6]),
    .b(pp[14]),
    .cin(pp[22]),
    .sum(w16),
    .carry(w17)
);

full_adder FA_9(
    .a(pp[30]),
    .b(pp[38]),
    .cin(w16),
    .sum(w18),
    .carry(w19)
);

full_adder FA_10(
    .a(pp[7]),
    .b(pp[15]),
    .cin(pp[23]),
    .sum(w20),
    .carry(w21)
);

full_adder FA_11(
    .a(pp[31]),
    .b(pp[39]),
    .cin(w20),
    .sum(w22),
    .carry(w23)
);

full_adder FA_12(
    .a(pp_cin[2]),
    .b(w2),
    .cin(w1),
    .sum(w24),
    .carry(w25)
);

full_adder FA_13(
    .a(w8),
    .b(w10),
    .cin(w5),
    .sum(w26),
    .carry(w27)
);

full_adder FA_14(
    .a(w14),
    .b(w9),
    .cin(w11),
    .sum(w28),
    .carry(w29)
);

full_adder FA_15(
    .a(w18),
    .b(w13),
    .cin(w15),
    .sum(w30),
    .carry(w31)
);

full_adder FA_16(
    .a(w22),
    .b(w17),
    .cin(w19),
    .sum(w32),
    .carry(w33)
);

full_adder FA_17(
    .a(w6),
    .b(w3),
    .cin(w25),
    .sum(w34),
    .carry(w35)
);

full_adder FA_18(
    .a(w7),
    .b(w26),
    .cin(w35),
    .sum(w36),
    .carry(w37)
);

full_adder FA_19(
    .a(w28),
    .b(w27),
    .cin(w37),
    .sum(w38),
    .carry(w39)
);

full_adder FA_20(
    .a(w30),
    .b(w29),
    .cin(w39),
    .sum(w40),
    .carry(w41)
);

full_adder FA_21(
    .a(w32),
    .b(w31),
    .cin(w41),
    .sum(w42),
    .carry(w43)
);


ripple_carry_adder #(
    .N(8)
)
FINAL_RCA(
    .A(rowA),
    .B(rowB),
    .Cin(1'b0),
    .Sum(P),
    .Cout()
);

endmodule

`default_nettype wire
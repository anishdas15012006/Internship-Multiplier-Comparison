`timescale 1ns/1ps
`default_nettype none

module booth_wallace_radix2_8 #(
    parameter SIGNED_A = 0,
    parameter SIGNED_B = 0
)(
   input wire [7:0] A,
   input wire [7:0] B,

   output wire [15:0] P
);

wire [143:0] pp;
wire [8:0] pp_cin;

booth_radix2_ppg #(
    .N(8),
    .SIGNED_A(SIGNED_A),
    .SIGNED_B(SIGNED_B)
) PPG (
    .A(A),
    .B(B),
    .pp(pp),
    .pp_cin(pp_cin)
);


assign rowA = {w182, w180, w178, w176, w174, w172, w170, w168, w166, w164, w162, w160, w140, w96, w0, pp[0]};
assign rowB = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, pp_cin[0]};

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
wire w44;
wire w45;
wire w46;
wire w47;
wire w48;
wire w49;
wire w50;
wire w51;
wire w52;
wire w53;
wire w54;
wire w55;
wire w56;
wire w57;
wire w58;
wire w59;
wire w60;
wire w61;
wire w62;
wire w63;
wire w64;
wire w65;
wire w66;
wire w67;
wire w68;
wire w69;
wire w70;
wire w71;
wire w72;
wire w73;
wire w74;
wire w75;
wire w76;
wire w77;
wire w78;
wire w79;
wire w80;
wire w81;
wire w82;
wire w83;
wire w84;
wire w85;
wire w86;
wire w87;
wire w88;
wire w89;
wire w90;
wire w91;
wire w92;
wire w93;
wire w94;
wire w95;
wire w96;
wire w97;
wire w98;
wire w99;
wire w100;
wire w101;
wire w102;
wire w103;
wire w104;
wire w105;
wire w106;
wire w107;
wire w108;
wire w109;
wire w110;
wire w111;
wire w112;
wire w113;
wire w114;
wire w115;
wire w116;
wire w117;
wire w118;
wire w119;
wire w120;
wire w121;
wire w122;
wire w123;
wire w124;
wire w125;
wire w126;
wire w127;
wire w128;
wire w129;
wire w130;
wire w131;
wire w132;
wire w133;
wire w134;
wire w135;
wire w136;
wire w137;
wire w138;
wire w139;
wire w140;
wire w141;
wire w142;
wire w143;
wire w144;
wire w145;
wire w146;
wire w147;
wire w148;
wire w149;
wire w150;
wire w151;
wire w152;
wire w153;
wire w154;
wire w155;
wire w156;
wire w157;
wire w158;
wire w159;
wire w160;
wire w161;
wire w162;
wire w163;
wire w164;
wire w165;
wire w166;
wire w167;
wire w168;
wire w169;
wire w170;
wire w171;
wire w172;
wire w173;
wire w174;
wire w175;
wire w176;
wire w177;
wire w178;
wire w179;
wire w180;
wire w181;
wire w182;
wire w183;
wire [15:0] rowA;
wire [15:0] rowB;

full_adder FA_0(
    .a(pp[1]),
    .b(pp[17]),
    .cin(pp_cin[1]),
    .sum(w0),
    .carry(w1)
);

full_adder FA_1(
    .a(pp[2]),
    .b(pp[18]),
    .cin(pp[34]),
    .sum(w2),
    .carry(w3)
);

full_adder FA_2(
    .a(pp[3]),
    .b(pp[19]),
    .cin(pp[35]),
    .sum(w4),
    .carry(w5)
);

full_adder FA_3(
    .a(pp[51]),
    .b(pp_cin[3]),
    .cin(w4),
    .sum(w6),
    .carry(w7)
);

full_adder FA_4(
    .a(pp[4]),
    .b(pp[20]),
    .cin(pp[36]),
    .sum(w8),
    .carry(w9)
);

full_adder FA_5(
    .a(pp[52]),
    .b(pp[68]),
    .cin(pp_cin[4]),
    .sum(w10),
    .carry(w11)
);

full_adder FA_6(
    .a(pp[5]),
    .b(pp[21]),
    .cin(pp[37]),
    .sum(w12),
    .carry(w13)
);

full_adder FA_7(
    .a(pp[53]),
    .b(pp[69]),
    .cin(pp[85]),
    .sum(w14),
    .carry(w15)
);

full_adder FA_8(
    .a(pp_cin[5]),
    .b(w12),
    .cin(w14),
    .sum(w16),
    .carry(w17)
);

full_adder FA_9(
    .a(pp[6]),
    .b(pp[22]),
    .cin(pp[38]),
    .sum(w18),
    .carry(w19)
);

full_adder FA_10(
    .a(pp[54]),
    .b(pp[70]),
    .cin(pp[86]),
    .sum(w20),
    .carry(w21)
);

full_adder FA_11(
    .a(pp[102]),
    .b(pp_cin[6]),
    .cin(w18),
    .sum(w22),
    .carry(w23)
);

full_adder FA_12(
    .a(pp[7]),
    .b(pp[23]),
    .cin(pp[39]),
    .sum(w24),
    .carry(w25)
);

full_adder FA_13(
    .a(pp[55]),
    .b(pp[71]),
    .cin(pp[87]),
    .sum(w26),
    .carry(w27)
);

full_adder FA_14(
    .a(pp[103]),
    .b(pp[119]),
    .cin(pp_cin[7]),
    .sum(w28),
    .carry(w29)
);

full_adder FA_15(
    .a(w24),
    .b(w26),
    .cin(w28),
    .sum(w30),
    .carry(w31)
);

full_adder FA_16(
    .a(pp[8]),
    .b(pp[24]),
    .cin(pp[40]),
    .sum(w32),
    .carry(w33)
);

full_adder FA_17(
    .a(pp[56]),
    .b(pp[72]),
    .cin(pp[88]),
    .sum(w34),
    .carry(w35)
);

full_adder FA_18(
    .a(pp[104]),
    .b(pp[120]),
    .cin(pp[136]),
    .sum(w36),
    .carry(w37)
);

full_adder FA_19(
    .a(pp_cin[8]),
    .b(w32),
    .cin(w34),
    .sum(w38),
    .carry(w39)
);

full_adder FA_20(
    .a(pp[9]),
    .b(pp[25]),
    .cin(pp[41]),
    .sum(w40),
    .carry(w41)
);

full_adder FA_21(
    .a(pp[57]),
    .b(pp[73]),
    .cin(pp[89]),
    .sum(w42),
    .carry(w43)
);

full_adder FA_22(
    .a(pp[105]),
    .b(pp[121]),
    .cin(pp[137]),
    .sum(w44),
    .carry(w45)
);

full_adder FA_23(
    .a(w40),
    .b(w42),
    .cin(w44),
    .sum(w46),
    .carry(w47)
);

full_adder FA_24(
    .a(pp[10]),
    .b(pp[26]),
    .cin(pp[42]),
    .sum(w48),
    .carry(w49)
);

full_adder FA_25(
    .a(pp[58]),
    .b(pp[74]),
    .cin(pp[90]),
    .sum(w50),
    .carry(w51)
);

full_adder FA_26(
    .a(pp[106]),
    .b(pp[122]),
    .cin(pp[138]),
    .sum(w52),
    .carry(w53)
);

full_adder FA_27(
    .a(w48),
    .b(w50),
    .cin(w52),
    .sum(w54),
    .carry(w55)
);

full_adder FA_28(
    .a(pp[11]),
    .b(pp[27]),
    .cin(pp[43]),
    .sum(w56),
    .carry(w57)
);

full_adder FA_29(
    .a(pp[59]),
    .b(pp[75]),
    .cin(pp[91]),
    .sum(w58),
    .carry(w59)
);

full_adder FA_30(
    .a(pp[107]),
    .b(pp[123]),
    .cin(pp[139]),
    .sum(w60),
    .carry(w61)
);

full_adder FA_31(
    .a(w56),
    .b(w58),
    .cin(w60),
    .sum(w62),
    .carry(w63)
);

full_adder FA_32(
    .a(pp[12]),
    .b(pp[28]),
    .cin(pp[44]),
    .sum(w64),
    .carry(w65)
);

full_adder FA_33(
    .a(pp[60]),
    .b(pp[76]),
    .cin(pp[92]),
    .sum(w66),
    .carry(w67)
);

full_adder FA_34(
    .a(pp[108]),
    .b(pp[124]),
    .cin(pp[140]),
    .sum(w68),
    .carry(w69)
);

full_adder FA_35(
    .a(w64),
    .b(w66),
    .cin(w68),
    .sum(w70),
    .carry(w71)
);

full_adder FA_36(
    .a(pp[13]),
    .b(pp[29]),
    .cin(pp[45]),
    .sum(w72),
    .carry(w73)
);

full_adder FA_37(
    .a(pp[61]),
    .b(pp[77]),
    .cin(pp[93]),
    .sum(w74),
    .carry(w75)
);

full_adder FA_38(
    .a(pp[109]),
    .b(pp[125]),
    .cin(pp[141]),
    .sum(w76),
    .carry(w77)
);

full_adder FA_39(
    .a(w72),
    .b(w74),
    .cin(w76),
    .sum(w78),
    .carry(w79)
);

full_adder FA_40(
    .a(pp[14]),
    .b(pp[30]),
    .cin(pp[46]),
    .sum(w80),
    .carry(w81)
);

full_adder FA_41(
    .a(pp[62]),
    .b(pp[78]),
    .cin(pp[94]),
    .sum(w82),
    .carry(w83)
);

full_adder FA_42(
    .a(pp[110]),
    .b(pp[126]),
    .cin(pp[142]),
    .sum(w84),
    .carry(w85)
);

full_adder FA_43(
    .a(w80),
    .b(w82),
    .cin(w84),
    .sum(w86),
    .carry(w87)
);

full_adder FA_44(
    .a(pp[15]),
    .b(pp[31]),
    .cin(pp[47]),
    .sum(w88),
    .carry(w89)
);

full_adder FA_45(
    .a(pp[63]),
    .b(pp[79]),
    .cin(pp[95]),
    .sum(w90),
    .carry(w91)
);

full_adder FA_46(
    .a(pp[111]),
    .b(pp[127]),
    .cin(pp[143]),
    .sum(w92),
    .carry(w93)
);

full_adder FA_47(
    .a(w88),
    .b(w90),
    .cin(w92),
    .sum(w94),
    .carry(w95)
);

full_adder FA_48(
    .a(pp_cin[2]),
    .b(w2),
    .cin(w1),
    .sum(w96),
    .carry(w97)
);

full_adder FA_49(
    .a(w8),
    .b(w10),
    .cin(w5),
    .sum(w98),
    .carry(w99)
);

full_adder FA_50(
    .a(w16),
    .b(w9),
    .cin(w11),
    .sum(w100),
    .carry(w101)
);

full_adder FA_51(
    .a(w20),
    .b(w22),
    .cin(w13),
    .sum(w102),
    .carry(w103)
);

full_adder FA_52(
    .a(w15),
    .b(w17),
    .cin(w102),
    .sum(w104),
    .carry(w105)
);

full_adder FA_53(
    .a(w30),
    .b(w19),
    .cin(w21),
    .sum(w106),
    .carry(w107)
);

full_adder FA_54(
    .a(w36),
    .b(w38),
    .cin(w25),
    .sum(w108),
    .carry(w109)
);

full_adder FA_55(
    .a(w27),
    .b(w29),
    .cin(w31),
    .sum(w110),
    .carry(w111)
);

full_adder FA_56(
    .a(w46),
    .b(w33),
    .cin(w35),
    .sum(w112),
    .carry(w113)
);

full_adder FA_57(
    .a(w37),
    .b(w39),
    .cin(w112),
    .sum(w114),
    .carry(w115)
);

full_adder FA_58(
    .a(w54),
    .b(w41),
    .cin(w43),
    .sum(w116),
    .carry(w117)
);

full_adder FA_59(
    .a(w45),
    .b(w47),
    .cin(w116),
    .sum(w118),
    .carry(w119)
);

full_adder FA_60(
    .a(w62),
    .b(w49),
    .cin(w51),
    .sum(w120),
    .carry(w121)
);

full_adder FA_61(
    .a(w53),
    .b(w55),
    .cin(w120),
    .sum(w122),
    .carry(w123)
);

full_adder FA_62(
    .a(w70),
    .b(w57),
    .cin(w59),
    .sum(w124),
    .carry(w125)
);

full_adder FA_63(
    .a(w61),
    .b(w63),
    .cin(w124),
    .sum(w126),
    .carry(w127)
);

full_adder FA_64(
    .a(w78),
    .b(w65),
    .cin(w67),
    .sum(w128),
    .carry(w129)
);

full_adder FA_65(
    .a(w69),
    .b(w71),
    .cin(w128),
    .sum(w130),
    .carry(w131)
);

full_adder FA_66(
    .a(w86),
    .b(w73),
    .cin(w75),
    .sum(w132),
    .carry(w133)
);

full_adder FA_67(
    .a(w77),
    .b(w79),
    .cin(w132),
    .sum(w134),
    .carry(w135)
);

full_adder FA_68(
    .a(w94),
    .b(w81),
    .cin(w83),
    .sum(w136),
    .carry(w137)
);

full_adder FA_69(
    .a(w85),
    .b(w87),
    .cin(w136),
    .sum(w138),
    .carry(w139)
);

full_adder FA_70(
    .a(w6),
    .b(w3),
    .cin(w97),
    .sum(w140),
    .carry(w141)
);

full_adder FA_71(
    .a(w23),
    .b(w106),
    .cin(w103),
    .sum(w142),
    .carry(w143)
);

full_adder FA_72(
    .a(w108),
    .b(w110),
    .cin(w107),
    .sum(w144),
    .carry(w145)
);

full_adder FA_73(
    .a(w114),
    .b(w109),
    .cin(w111),
    .sum(w146),
    .carry(w147)
);

full_adder FA_74(
    .a(w118),
    .b(w113),
    .cin(w115),
    .sum(w148),
    .carry(w149)
);

full_adder FA_75(
    .a(w122),
    .b(w117),
    .cin(w119),
    .sum(w150),
    .carry(w151)
);

full_adder FA_76(
    .a(w126),
    .b(w121),
    .cin(w123),
    .sum(w152),
    .carry(w153)
);

full_adder FA_77(
    .a(w130),
    .b(w125),
    .cin(w127),
    .sum(w154),
    .carry(w155)
);

full_adder FA_78(
    .a(w134),
    .b(w129),
    .cin(w131),
    .sum(w156),
    .carry(w157)
);

full_adder FA_79(
    .a(w138),
    .b(w133),
    .cin(w135),
    .sum(w158),
    .carry(w159)
);

full_adder FA_80(
    .a(w7),
    .b(w98),
    .cin(w141),
    .sum(w160),
    .carry(w161)
);

full_adder FA_81(
    .a(w100),
    .b(w99),
    .cin(w161),
    .sum(w162),
    .carry(w163)
);

full_adder FA_82(
    .a(w104),
    .b(w101),
    .cin(w163),
    .sum(w164),
    .carry(w165)
);

full_adder FA_83(
    .a(w105),
    .b(w142),
    .cin(w165),
    .sum(w166),
    .carry(w167)
);

full_adder FA_84(
    .a(w144),
    .b(w143),
    .cin(w167),
    .sum(w168),
    .carry(w169)
);

full_adder FA_85(
    .a(w146),
    .b(w145),
    .cin(w169),
    .sum(w170),
    .carry(w171)
);

full_adder FA_86(
    .a(w148),
    .b(w147),
    .cin(w171),
    .sum(w172),
    .carry(w173)
);

full_adder FA_87(
    .a(w150),
    .b(w149),
    .cin(w173),
    .sum(w174),
    .carry(w175)
);

full_adder FA_88(
    .a(w152),
    .b(w151),
    .cin(w175),
    .sum(w176),
    .carry(w177)
);

full_adder FA_89(
    .a(w154),
    .b(w153),
    .cin(w177),
    .sum(w178),
    .carry(w179)
);

full_adder FA_90(
    .a(w156),
    .b(w155),
    .cin(w179),
    .sum(w180),
    .carry(w181)
);

full_adder FA_91(
    .a(w158),
    .b(w157),
    .cin(w181),
    .sum(w182),
    .carry(w183)
);


ripple_carry_adder #(
    .N(16)
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
`timescale 1ns/1ps
`default_nettype none

module booth_wallace_radix8_16 #(
    parameter SIGNED_A = 0,
    parameter SIGNED_B = 0
)(
   input wire [15:0] A,
   input wire [15:0] B,

   output wire [31:0] P
);

wire [191:0] pp;
wire [5:0] pp_cin;

booth_radix8_ppg #(
    .N(16),
    .SIGNED_A(SIGNED_A),
    .SIGNED_B(SIGNED_B)
) PPG (
    .A(A),
    .B(B),
    .pp(pp),
    .pp_cin(pp_cin)
);


assign rowA = {w228, w226, w224, w222, w220, w218, w216, w214, w212, w210, w208, w206, w204, w202, w200, w198, w196, w194, w192, w190, w188, w186, w184, w182, w180, w178, w146, w98, w0, pp[2], pp[1], pp[0]};
assign rowB = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, pp_cin[0]};

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
wire w184;
wire w185;
wire w186;
wire w187;
wire w188;
wire w189;
wire w190;
wire w191;
wire w192;
wire w193;
wire w194;
wire w195;
wire w196;
wire w197;
wire w198;
wire w199;
wire w200;
wire w201;
wire w202;
wire w203;
wire w204;
wire w205;
wire w206;
wire w207;
wire w208;
wire w209;
wire w210;
wire w211;
wire w212;
wire w213;
wire w214;
wire w215;
wire w216;
wire w217;
wire w218;
wire w219;
wire w220;
wire w221;
wire w222;
wire w223;
wire w224;
wire w225;
wire w226;
wire w227;
wire w228;
wire w229;
wire [31:0] rowA;
wire [31:0] rowB;

full_adder FA_0(
    .a(pp[3]),
    .b(pp[35]),
    .cin(pp_cin[1]),
    .sum(w0),
    .carry(w1)
);

full_adder FA_1(
    .a(pp[6]),
    .b(pp[38]),
    .cin(pp[70]),
    .sum(w2),
    .carry(w3)
);

full_adder FA_2(
    .a(pp[7]),
    .b(pp[39]),
    .cin(pp[71]),
    .sum(w4),
    .carry(w5)
);

full_adder FA_3(
    .a(pp[8]),
    .b(pp[40]),
    .cin(pp[72]),
    .sum(w6),
    .carry(w7)
);

full_adder FA_4(
    .a(pp[9]),
    .b(pp[41]),
    .cin(pp[73]),
    .sum(w8),
    .carry(w9)
);

full_adder FA_5(
    .a(pp[105]),
    .b(pp_cin[3]),
    .cin(w8),
    .sum(w10),
    .carry(w11)
);

full_adder FA_6(
    .a(pp[10]),
    .b(pp[42]),
    .cin(pp[74]),
    .sum(w12),
    .carry(w13)
);

full_adder FA_7(
    .a(pp[11]),
    .b(pp[43]),
    .cin(pp[75]),
    .sum(w14),
    .carry(w15)
);

full_adder FA_8(
    .a(pp[12]),
    .b(pp[44]),
    .cin(pp[76]),
    .sum(w16),
    .carry(w17)
);

full_adder FA_9(
    .a(pp[108]),
    .b(pp[140]),
    .cin(pp_cin[4]),
    .sum(w18),
    .carry(w19)
);

full_adder FA_10(
    .a(pp[13]),
    .b(pp[45]),
    .cin(pp[77]),
    .sum(w20),
    .carry(w21)
);

full_adder FA_11(
    .a(pp[109]),
    .b(pp[141]),
    .cin(w20),
    .sum(w22),
    .carry(w23)
);

full_adder FA_12(
    .a(pp[14]),
    .b(pp[46]),
    .cin(pp[78]),
    .sum(w24),
    .carry(w25)
);

full_adder FA_13(
    .a(pp[110]),
    .b(pp[142]),
    .cin(w24),
    .sum(w26),
    .carry(w27)
);

full_adder FA_14(
    .a(pp[15]),
    .b(pp[47]),
    .cin(pp[79]),
    .sum(w28),
    .carry(w29)
);

full_adder FA_15(
    .a(pp[111]),
    .b(pp[143]),
    .cin(pp[175]),
    .sum(w30),
    .carry(w31)
);

full_adder FA_16(
    .a(pp_cin[5]),
    .b(w28),
    .cin(w30),
    .sum(w32),
    .carry(w33)
);

full_adder FA_17(
    .a(pp[16]),
    .b(pp[48]),
    .cin(pp[80]),
    .sum(w34),
    .carry(w35)
);

full_adder FA_18(
    .a(pp[112]),
    .b(pp[144]),
    .cin(pp[176]),
    .sum(w36),
    .carry(w37)
);

full_adder FA_19(
    .a(pp[17]),
    .b(pp[49]),
    .cin(pp[81]),
    .sum(w38),
    .carry(w39)
);

full_adder FA_20(
    .a(pp[113]),
    .b(pp[145]),
    .cin(pp[177]),
    .sum(w40),
    .carry(w41)
);

full_adder FA_21(
    .a(pp[18]),
    .b(pp[50]),
    .cin(pp[82]),
    .sum(w42),
    .carry(w43)
);

full_adder FA_22(
    .a(pp[114]),
    .b(pp[146]),
    .cin(pp[178]),
    .sum(w44),
    .carry(w45)
);

full_adder FA_23(
    .a(pp[19]),
    .b(pp[51]),
    .cin(pp[83]),
    .sum(w46),
    .carry(w47)
);

full_adder FA_24(
    .a(pp[115]),
    .b(pp[147]),
    .cin(pp[179]),
    .sum(w48),
    .carry(w49)
);

full_adder FA_25(
    .a(pp[20]),
    .b(pp[52]),
    .cin(pp[84]),
    .sum(w50),
    .carry(w51)
);

full_adder FA_26(
    .a(pp[116]),
    .b(pp[148]),
    .cin(pp[180]),
    .sum(w52),
    .carry(w53)
);

full_adder FA_27(
    .a(pp[21]),
    .b(pp[53]),
    .cin(pp[85]),
    .sum(w54),
    .carry(w55)
);

full_adder FA_28(
    .a(pp[117]),
    .b(pp[149]),
    .cin(pp[181]),
    .sum(w56),
    .carry(w57)
);

full_adder FA_29(
    .a(pp[22]),
    .b(pp[54]),
    .cin(pp[86]),
    .sum(w58),
    .carry(w59)
);

full_adder FA_30(
    .a(pp[118]),
    .b(pp[150]),
    .cin(pp[182]),
    .sum(w60),
    .carry(w61)
);

full_adder FA_31(
    .a(pp[23]),
    .b(pp[55]),
    .cin(pp[87]),
    .sum(w62),
    .carry(w63)
);

full_adder FA_32(
    .a(pp[119]),
    .b(pp[151]),
    .cin(pp[183]),
    .sum(w64),
    .carry(w65)
);

full_adder FA_33(
    .a(pp[24]),
    .b(pp[56]),
    .cin(pp[88]),
    .sum(w66),
    .carry(w67)
);

full_adder FA_34(
    .a(pp[120]),
    .b(pp[152]),
    .cin(pp[184]),
    .sum(w68),
    .carry(w69)
);

full_adder FA_35(
    .a(pp[25]),
    .b(pp[57]),
    .cin(pp[89]),
    .sum(w70),
    .carry(w71)
);

full_adder FA_36(
    .a(pp[121]),
    .b(pp[153]),
    .cin(pp[185]),
    .sum(w72),
    .carry(w73)
);

full_adder FA_37(
    .a(pp[26]),
    .b(pp[58]),
    .cin(pp[90]),
    .sum(w74),
    .carry(w75)
);

full_adder FA_38(
    .a(pp[122]),
    .b(pp[154]),
    .cin(pp[186]),
    .sum(w76),
    .carry(w77)
);

full_adder FA_39(
    .a(pp[27]),
    .b(pp[59]),
    .cin(pp[91]),
    .sum(w78),
    .carry(w79)
);

full_adder FA_40(
    .a(pp[123]),
    .b(pp[155]),
    .cin(pp[187]),
    .sum(w80),
    .carry(w81)
);

full_adder FA_41(
    .a(pp[28]),
    .b(pp[60]),
    .cin(pp[92]),
    .sum(w82),
    .carry(w83)
);

full_adder FA_42(
    .a(pp[124]),
    .b(pp[156]),
    .cin(pp[188]),
    .sum(w84),
    .carry(w85)
);

full_adder FA_43(
    .a(pp[29]),
    .b(pp[61]),
    .cin(pp[93]),
    .sum(w86),
    .carry(w87)
);

full_adder FA_44(
    .a(pp[125]),
    .b(pp[157]),
    .cin(pp[189]),
    .sum(w88),
    .carry(w89)
);

full_adder FA_45(
    .a(pp[30]),
    .b(pp[62]),
    .cin(pp[94]),
    .sum(w90),
    .carry(w91)
);

full_adder FA_46(
    .a(pp[126]),
    .b(pp[158]),
    .cin(pp[190]),
    .sum(w92),
    .carry(w93)
);

full_adder FA_47(
    .a(pp[31]),
    .b(pp[63]),
    .cin(pp[95]),
    .sum(w94),
    .carry(w95)
);

full_adder FA_48(
    .a(pp[127]),
    .b(pp[159]),
    .cin(pp[191]),
    .sum(w96),
    .carry(w97)
);

full_adder FA_49(
    .a(pp[4]),
    .b(pp[36]),
    .cin(w1),
    .sum(w98),
    .carry(w99)
);

full_adder FA_50(
    .a(pp[106]),
    .b(w12),
    .cin(w9),
    .sum(w100),
    .carry(w101)
);

full_adder FA_51(
    .a(pp[107]),
    .b(w14),
    .cin(w13),
    .sum(w102),
    .carry(w103)
);

full_adder FA_52(
    .a(w16),
    .b(w18),
    .cin(w15),
    .sum(w104),
    .carry(w105)
);

full_adder FA_53(
    .a(w22),
    .b(w17),
    .cin(w19),
    .sum(w106),
    .carry(w107)
);

full_adder FA_54(
    .a(w26),
    .b(w21),
    .cin(w23),
    .sum(w108),
    .carry(w109)
);

full_adder FA_55(
    .a(w32),
    .b(w25),
    .cin(w27),
    .sum(w110),
    .carry(w111)
);

full_adder FA_56(
    .a(w34),
    .b(w36),
    .cin(w29),
    .sum(w112),
    .carry(w113)
);

full_adder FA_57(
    .a(w31),
    .b(w33),
    .cin(w112),
    .sum(w114),
    .carry(w115)
);

full_adder FA_58(
    .a(w38),
    .b(w40),
    .cin(w35),
    .sum(w116),
    .carry(w117)
);

full_adder FA_59(
    .a(w42),
    .b(w44),
    .cin(w39),
    .sum(w118),
    .carry(w119)
);

full_adder FA_60(
    .a(w46),
    .b(w48),
    .cin(w43),
    .sum(w120),
    .carry(w121)
);

full_adder FA_61(
    .a(w50),
    .b(w52),
    .cin(w47),
    .sum(w122),
    .carry(w123)
);

full_adder FA_62(
    .a(w54),
    .b(w56),
    .cin(w51),
    .sum(w124),
    .carry(w125)
);

full_adder FA_63(
    .a(w58),
    .b(w60),
    .cin(w55),
    .sum(w126),
    .carry(w127)
);

full_adder FA_64(
    .a(w62),
    .b(w64),
    .cin(w59),
    .sum(w128),
    .carry(w129)
);

full_adder FA_65(
    .a(w66),
    .b(w68),
    .cin(w63),
    .sum(w130),
    .carry(w131)
);

full_adder FA_66(
    .a(w70),
    .b(w72),
    .cin(w67),
    .sum(w132),
    .carry(w133)
);

full_adder FA_67(
    .a(w74),
    .b(w76),
    .cin(w71),
    .sum(w134),
    .carry(w135)
);

full_adder FA_68(
    .a(w78),
    .b(w80),
    .cin(w75),
    .sum(w136),
    .carry(w137)
);

full_adder FA_69(
    .a(w82),
    .b(w84),
    .cin(w79),
    .sum(w138),
    .carry(w139)
);

full_adder FA_70(
    .a(w86),
    .b(w88),
    .cin(w83),
    .sum(w140),
    .carry(w141)
);

full_adder FA_71(
    .a(w90),
    .b(w92),
    .cin(w87),
    .sum(w142),
    .carry(w143)
);

full_adder FA_72(
    .a(w94),
    .b(w96),
    .cin(w91),
    .sum(w144),
    .carry(w145)
);

full_adder FA_73(
    .a(pp[5]),
    .b(pp[37]),
    .cin(w99),
    .sum(w146),
    .carry(w147)
);

full_adder FA_74(
    .a(w37),
    .b(w116),
    .cin(w113),
    .sum(w148),
    .carry(w149)
);

full_adder FA_75(
    .a(w41),
    .b(w118),
    .cin(w117),
    .sum(w150),
    .carry(w151)
);

full_adder FA_76(
    .a(w45),
    .b(w120),
    .cin(w119),
    .sum(w152),
    .carry(w153)
);

full_adder FA_77(
    .a(w49),
    .b(w122),
    .cin(w121),
    .sum(w154),
    .carry(w155)
);

full_adder FA_78(
    .a(w53),
    .b(w124),
    .cin(w123),
    .sum(w156),
    .carry(w157)
);

full_adder FA_79(
    .a(w57),
    .b(w126),
    .cin(w125),
    .sum(w158),
    .carry(w159)
);

full_adder FA_80(
    .a(w61),
    .b(w128),
    .cin(w127),
    .sum(w160),
    .carry(w161)
);

full_adder FA_81(
    .a(w65),
    .b(w130),
    .cin(w129),
    .sum(w162),
    .carry(w163)
);

full_adder FA_82(
    .a(w69),
    .b(w132),
    .cin(w131),
    .sum(w164),
    .carry(w165)
);

full_adder FA_83(
    .a(w73),
    .b(w134),
    .cin(w133),
    .sum(w166),
    .carry(w167)
);

full_adder FA_84(
    .a(w77),
    .b(w136),
    .cin(w135),
    .sum(w168),
    .carry(w169)
);

full_adder FA_85(
    .a(w81),
    .b(w138),
    .cin(w137),
    .sum(w170),
    .carry(w171)
);

full_adder FA_86(
    .a(w85),
    .b(w140),
    .cin(w139),
    .sum(w172),
    .carry(w173)
);

full_adder FA_87(
    .a(w89),
    .b(w142),
    .cin(w141),
    .sum(w174),
    .carry(w175)
);

full_adder FA_88(
    .a(w93),
    .b(w144),
    .cin(w143),
    .sum(w176),
    .carry(w177)
);

full_adder FA_89(
    .a(pp_cin[2]),
    .b(w2),
    .cin(w147),
    .sum(w178),
    .carry(w179)
);

full_adder FA_90(
    .a(w4),
    .b(w3),
    .cin(w179),
    .sum(w180),
    .carry(w181)
);

full_adder FA_91(
    .a(w6),
    .b(w5),
    .cin(w181),
    .sum(w182),
    .carry(w183)
);

full_adder FA_92(
    .a(w10),
    .b(w7),
    .cin(w183),
    .sum(w184),
    .carry(w185)
);

full_adder FA_93(
    .a(w11),
    .b(w100),
    .cin(w185),
    .sum(w186),
    .carry(w187)
);

full_adder FA_94(
    .a(w102),
    .b(w101),
    .cin(w187),
    .sum(w188),
    .carry(w189)
);

full_adder FA_95(
    .a(w104),
    .b(w103),
    .cin(w189),
    .sum(w190),
    .carry(w191)
);

full_adder FA_96(
    .a(w106),
    .b(w105),
    .cin(w191),
    .sum(w192),
    .carry(w193)
);

full_adder FA_97(
    .a(w108),
    .b(w107),
    .cin(w193),
    .sum(w194),
    .carry(w195)
);

full_adder FA_98(
    .a(w110),
    .b(w109),
    .cin(w195),
    .sum(w196),
    .carry(w197)
);

full_adder FA_99(
    .a(w114),
    .b(w111),
    .cin(w197),
    .sum(w198),
    .carry(w199)
);

full_adder FA_100(
    .a(w115),
    .b(w148),
    .cin(w199),
    .sum(w200),
    .carry(w201)
);

full_adder FA_101(
    .a(w150),
    .b(w149),
    .cin(w201),
    .sum(w202),
    .carry(w203)
);

full_adder FA_102(
    .a(w152),
    .b(w151),
    .cin(w203),
    .sum(w204),
    .carry(w205)
);

full_adder FA_103(
    .a(w154),
    .b(w153),
    .cin(w205),
    .sum(w206),
    .carry(w207)
);

full_adder FA_104(
    .a(w156),
    .b(w155),
    .cin(w207),
    .sum(w208),
    .carry(w209)
);

full_adder FA_105(
    .a(w158),
    .b(w157),
    .cin(w209),
    .sum(w210),
    .carry(w211)
);

full_adder FA_106(
    .a(w160),
    .b(w159),
    .cin(w211),
    .sum(w212),
    .carry(w213)
);

full_adder FA_107(
    .a(w162),
    .b(w161),
    .cin(w213),
    .sum(w214),
    .carry(w215)
);

full_adder FA_108(
    .a(w164),
    .b(w163),
    .cin(w215),
    .sum(w216),
    .carry(w217)
);

full_adder FA_109(
    .a(w166),
    .b(w165),
    .cin(w217),
    .sum(w218),
    .carry(w219)
);

full_adder FA_110(
    .a(w168),
    .b(w167),
    .cin(w219),
    .sum(w220),
    .carry(w221)
);

full_adder FA_111(
    .a(w170),
    .b(w169),
    .cin(w221),
    .sum(w222),
    .carry(w223)
);

full_adder FA_112(
    .a(w172),
    .b(w171),
    .cin(w223),
    .sum(w224),
    .carry(w225)
);

full_adder FA_113(
    .a(w174),
    .b(w173),
    .cin(w225),
    .sum(w226),
    .carry(w227)
);

full_adder FA_114(
    .a(w176),
    .b(w175),
    .cin(w227),
    .sum(w228),
    .carry(w229)
);


ripple_carry_adder #(
    .N(32)
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
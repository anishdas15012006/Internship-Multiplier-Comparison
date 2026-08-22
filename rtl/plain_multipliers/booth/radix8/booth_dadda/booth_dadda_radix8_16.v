`timescale 1ns/1ps
`default_nettype none

module booth_dadda_radix8_16 #(
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


assign rowA = {w227, w225, w223, w221, w219, w217, w215, w213, w211, w209, w207, w205, w203, w201, w199, w197, w195, w193, w191, w150, w147, w145, w143, w141, w139, w137, w135, w133, pp_cin[1], pp[2], pp[1], pp[0]};
assign rowB = {w228, w226, w224, w222, w220, w218, w216, w214, w212, w210, w208, w206, w204, w202, w200, w198, w196, w194, w192, w190, w148, w146, w144, w142, w140, w138, w136, w134, w132, 1'b0, 1'b0, pp_cin[0]};

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

half_adder HA_0(
    .a(pp[15]),
    .b(pp[47]),
    .sum(w0),
    .carry(w1)
);

half_adder HA_1(
    .a(pp[16]),
    .b(pp[48]),
    .sum(w2),
    .carry(w3)
);

half_adder HA_2(
    .a(pp[17]),
    .b(pp[49]),
    .sum(w4),
    .carry(w5)
);

half_adder HA_3(
    .a(pp[18]),
    .b(pp[50]),
    .sum(w6),
    .carry(w7)
);

half_adder HA_4(
    .a(pp[19]),
    .b(pp[51]),
    .sum(w8),
    .carry(w9)
);

half_adder HA_5(
    .a(pp[20]),
    .b(pp[52]),
    .sum(w10),
    .carry(w11)
);

half_adder HA_6(
    .a(pp[21]),
    .b(pp[53]),
    .sum(w12),
    .carry(w13)
);

half_adder HA_7(
    .a(pp[22]),
    .b(pp[54]),
    .sum(w14),
    .carry(w15)
);

half_adder HA_8(
    .a(pp[23]),
    .b(pp[55]),
    .sum(w16),
    .carry(w17)
);

half_adder HA_9(
    .a(pp[24]),
    .b(pp[56]),
    .sum(w18),
    .carry(w19)
);

half_adder HA_10(
    .a(pp[25]),
    .b(pp[57]),
    .sum(w20),
    .carry(w21)
);

half_adder HA_11(
    .a(pp[26]),
    .b(pp[58]),
    .sum(w22),
    .carry(w23)
);

half_adder HA_12(
    .a(pp[27]),
    .b(pp[59]),
    .sum(w24),
    .carry(w25)
);

half_adder HA_13(
    .a(pp[28]),
    .b(pp[60]),
    .sum(w26),
    .carry(w27)
);

half_adder HA_14(
    .a(pp[29]),
    .b(pp[61]),
    .sum(w28),
    .carry(w29)
);

half_adder HA_15(
    .a(pp[30]),
    .b(pp[62]),
    .sum(w30),
    .carry(w31)
);

half_adder HA_16(
    .a(pp[31]),
    .b(pp[63]),
    .sum(w32),
    .carry(w33)
);

half_adder HA_17(
    .a(pp[9]),
    .b(pp[41]),
    .sum(w34),
    .carry(w35)
);

half_adder HA_18(
    .a(pp[10]),
    .b(pp[42]),
    .sum(w36),
    .carry(w37)
);

half_adder HA_19(
    .a(pp[11]),
    .b(pp[43]),
    .sum(w38),
    .carry(w39)
);

full_adder FA_0(
    .a(pp[12]),
    .b(pp[44]),
    .cin(pp[76]),
    .sum(w40),
    .carry(w41)
);

full_adder FA_1(
    .a(pp[13]),
    .b(pp[45]),
    .cin(pp[77]),
    .sum(w42),
    .carry(w43)
);

full_adder FA_2(
    .a(pp[14]),
    .b(pp[46]),
    .cin(pp[78]),
    .sum(w44),
    .carry(w45)
);

full_adder FA_3(
    .a(pp[79]),
    .b(pp[111]),
    .cin(pp[143]),
    .sum(w46),
    .carry(w47)
);

full_adder FA_4(
    .a(pp[80]),
    .b(pp[112]),
    .cin(pp[144]),
    .sum(w48),
    .carry(w49)
);

full_adder FA_5(
    .a(pp[81]),
    .b(pp[113]),
    .cin(pp[145]),
    .sum(w50),
    .carry(w51)
);

full_adder FA_6(
    .a(pp[82]),
    .b(pp[114]),
    .cin(pp[146]),
    .sum(w52),
    .carry(w53)
);

full_adder FA_7(
    .a(pp[83]),
    .b(pp[115]),
    .cin(pp[147]),
    .sum(w54),
    .carry(w55)
);

full_adder FA_8(
    .a(pp[84]),
    .b(pp[116]),
    .cin(pp[148]),
    .sum(w56),
    .carry(w57)
);

full_adder FA_9(
    .a(pp[85]),
    .b(pp[117]),
    .cin(pp[149]),
    .sum(w58),
    .carry(w59)
);

full_adder FA_10(
    .a(pp[86]),
    .b(pp[118]),
    .cin(pp[150]),
    .sum(w60),
    .carry(w61)
);

full_adder FA_11(
    .a(pp[87]),
    .b(pp[119]),
    .cin(pp[151]),
    .sum(w62),
    .carry(w63)
);

full_adder FA_12(
    .a(pp[88]),
    .b(pp[120]),
    .cin(pp[152]),
    .sum(w64),
    .carry(w65)
);

full_adder FA_13(
    .a(pp[89]),
    .b(pp[121]),
    .cin(pp[153]),
    .sum(w66),
    .carry(w67)
);

full_adder FA_14(
    .a(pp[90]),
    .b(pp[122]),
    .cin(pp[154]),
    .sum(w68),
    .carry(w69)
);

full_adder FA_15(
    .a(pp[91]),
    .b(pp[123]),
    .cin(pp[155]),
    .sum(w70),
    .carry(w71)
);

full_adder FA_16(
    .a(pp[92]),
    .b(pp[124]),
    .cin(pp[156]),
    .sum(w72),
    .carry(w73)
);

full_adder FA_17(
    .a(pp[93]),
    .b(pp[125]),
    .cin(pp[157]),
    .sum(w74),
    .carry(w75)
);

full_adder FA_18(
    .a(pp[94]),
    .b(pp[126]),
    .cin(pp[158]),
    .sum(w76),
    .carry(w77)
);

full_adder FA_19(
    .a(pp[95]),
    .b(pp[127]),
    .cin(pp[159]),
    .sum(w78),
    .carry(w79)
);

half_adder HA_20(
    .a(pp[6]),
    .b(pp[38]),
    .sum(w80),
    .carry(w81)
);

half_adder HA_21(
    .a(pp[7]),
    .b(pp[39]),
    .sum(w82),
    .carry(w83)
);

half_adder HA_22(
    .a(pp[8]),
    .b(pp[40]),
    .sum(w84),
    .carry(w85)
);

full_adder FA_20(
    .a(pp[73]),
    .b(pp[105]),
    .cin(pp_cin[3]),
    .sum(w86),
    .carry(w87)
);

full_adder FA_21(
    .a(pp[74]),
    .b(pp[106]),
    .cin(w35),
    .sum(w88),
    .carry(w89)
);

full_adder FA_22(
    .a(pp[75]),
    .b(pp[107]),
    .cin(w37),
    .sum(w90),
    .carry(w91)
);

full_adder FA_23(
    .a(pp[108]),
    .b(pp[140]),
    .cin(pp_cin[4]),
    .sum(w92),
    .carry(w93)
);

full_adder FA_24(
    .a(pp[109]),
    .b(pp[141]),
    .cin(w41),
    .sum(w94),
    .carry(w95)
);

full_adder FA_25(
    .a(pp[110]),
    .b(pp[142]),
    .cin(w43),
    .sum(w96),
    .carry(w97)
);

full_adder FA_26(
    .a(pp[175]),
    .b(pp_cin[5]),
    .cin(w0),
    .sum(w98),
    .carry(w99)
);

full_adder FA_27(
    .a(pp[176]),
    .b(w1),
    .cin(w2),
    .sum(w100),
    .carry(w101)
);

full_adder FA_28(
    .a(pp[177]),
    .b(w3),
    .cin(w4),
    .sum(w102),
    .carry(w103)
);

full_adder FA_29(
    .a(pp[178]),
    .b(w5),
    .cin(w6),
    .sum(w104),
    .carry(w105)
);

full_adder FA_30(
    .a(pp[179]),
    .b(w7),
    .cin(w8),
    .sum(w106),
    .carry(w107)
);

full_adder FA_31(
    .a(pp[180]),
    .b(w9),
    .cin(w10),
    .sum(w108),
    .carry(w109)
);

full_adder FA_32(
    .a(pp[181]),
    .b(w11),
    .cin(w12),
    .sum(w110),
    .carry(w111)
);

full_adder FA_33(
    .a(pp[182]),
    .b(w13),
    .cin(w14),
    .sum(w112),
    .carry(w113)
);

full_adder FA_34(
    .a(pp[183]),
    .b(w15),
    .cin(w16),
    .sum(w114),
    .carry(w115)
);

full_adder FA_35(
    .a(pp[184]),
    .b(w17),
    .cin(w18),
    .sum(w116),
    .carry(w117)
);

full_adder FA_36(
    .a(pp[185]),
    .b(w19),
    .cin(w20),
    .sum(w118),
    .carry(w119)
);

full_adder FA_37(
    .a(pp[186]),
    .b(w21),
    .cin(w22),
    .sum(w120),
    .carry(w121)
);

full_adder FA_38(
    .a(pp[187]),
    .b(w23),
    .cin(w24),
    .sum(w122),
    .carry(w123)
);

full_adder FA_39(
    .a(pp[188]),
    .b(w25),
    .cin(w26),
    .sum(w124),
    .carry(w125)
);

full_adder FA_40(
    .a(pp[189]),
    .b(w27),
    .cin(w28),
    .sum(w126),
    .carry(w127)
);

full_adder FA_41(
    .a(pp[190]),
    .b(w29),
    .cin(w30),
    .sum(w128),
    .carry(w129)
);

full_adder FA_42(
    .a(pp[191]),
    .b(w31),
    .cin(w32),
    .sum(w130),
    .carry(w131)
);

half_adder HA_23(
    .a(pp[3]),
    .b(pp[35]),
    .sum(w132),
    .carry(w133)
);

half_adder HA_24(
    .a(pp[4]),
    .b(pp[36]),
    .sum(w134),
    .carry(w135)
);

half_adder HA_25(
    .a(pp[5]),
    .b(pp[37]),
    .sum(w136),
    .carry(w137)
);

full_adder FA_43(
    .a(pp[70]),
    .b(pp_cin[2]),
    .cin(w80),
    .sum(w138),
    .carry(w139)
);

full_adder FA_44(
    .a(pp[71]),
    .b(w81),
    .cin(w82),
    .sum(w140),
    .carry(w141)
);

full_adder FA_45(
    .a(pp[72]),
    .b(w83),
    .cin(w84),
    .sum(w142),
    .carry(w143)
);

full_adder FA_46(
    .a(w34),
    .b(w85),
    .cin(w86),
    .sum(w144),
    .carry(w145)
);

full_adder FA_47(
    .a(w36),
    .b(w87),
    .cin(w88),
    .sum(w146),
    .carry(w147)
);

full_adder FA_48(
    .a(w38),
    .b(w89),
    .cin(w90),
    .sum(w148),
    .carry(w149)
);

full_adder FA_49(
    .a(w39),
    .b(w40),
    .cin(w91),
    .sum(w150),
    .carry(w151)
);

full_adder FA_50(
    .a(w42),
    .b(w93),
    .cin(w94),
    .sum(w152),
    .carry(w153)
);

full_adder FA_51(
    .a(w44),
    .b(w95),
    .cin(w96),
    .sum(w154),
    .carry(w155)
);

full_adder FA_52(
    .a(w45),
    .b(w46),
    .cin(w97),
    .sum(w156),
    .carry(w157)
);

full_adder FA_53(
    .a(w47),
    .b(w48),
    .cin(w99),
    .sum(w158),
    .carry(w159)
);

full_adder FA_54(
    .a(w49),
    .b(w50),
    .cin(w101),
    .sum(w160),
    .carry(w161)
);

full_adder FA_55(
    .a(w51),
    .b(w52),
    .cin(w103),
    .sum(w162),
    .carry(w163)
);

full_adder FA_56(
    .a(w53),
    .b(w54),
    .cin(w105),
    .sum(w164),
    .carry(w165)
);

full_adder FA_57(
    .a(w55),
    .b(w56),
    .cin(w107),
    .sum(w166),
    .carry(w167)
);

full_adder FA_58(
    .a(w57),
    .b(w58),
    .cin(w109),
    .sum(w168),
    .carry(w169)
);

full_adder FA_59(
    .a(w59),
    .b(w60),
    .cin(w111),
    .sum(w170),
    .carry(w171)
);

full_adder FA_60(
    .a(w61),
    .b(w62),
    .cin(w113),
    .sum(w172),
    .carry(w173)
);

full_adder FA_61(
    .a(w63),
    .b(w64),
    .cin(w115),
    .sum(w174),
    .carry(w175)
);

full_adder FA_62(
    .a(w65),
    .b(w66),
    .cin(w117),
    .sum(w176),
    .carry(w177)
);

full_adder FA_63(
    .a(w67),
    .b(w68),
    .cin(w119),
    .sum(w178),
    .carry(w179)
);

full_adder FA_64(
    .a(w69),
    .b(w70),
    .cin(w121),
    .sum(w180),
    .carry(w181)
);

full_adder FA_65(
    .a(w71),
    .b(w72),
    .cin(w123),
    .sum(w182),
    .carry(w183)
);

full_adder FA_66(
    .a(w73),
    .b(w74),
    .cin(w125),
    .sum(w184),
    .carry(w185)
);

full_adder FA_67(
    .a(w75),
    .b(w76),
    .cin(w127),
    .sum(w186),
    .carry(w187)
);

full_adder FA_68(
    .a(w77),
    .b(w78),
    .cin(w129),
    .sum(w188),
    .carry(w189)
);

half_adder HA_26(
    .a(w92),
    .b(w149),
    .sum(w190),
    .carry(w191)
);

half_adder HA_27(
    .a(w151),
    .b(w152),
    .sum(w192),
    .carry(w193)
);

half_adder HA_28(
    .a(w153),
    .b(w154),
    .sum(w194),
    .carry(w195)
);

full_adder FA_69(
    .a(w98),
    .b(w155),
    .cin(w156),
    .sum(w196),
    .carry(w197)
);

full_adder FA_70(
    .a(w100),
    .b(w157),
    .cin(w158),
    .sum(w198),
    .carry(w199)
);

full_adder FA_71(
    .a(w102),
    .b(w159),
    .cin(w160),
    .sum(w200),
    .carry(w201)
);

full_adder FA_72(
    .a(w104),
    .b(w161),
    .cin(w162),
    .sum(w202),
    .carry(w203)
);

full_adder FA_73(
    .a(w106),
    .b(w163),
    .cin(w164),
    .sum(w204),
    .carry(w205)
);

full_adder FA_74(
    .a(w108),
    .b(w165),
    .cin(w166),
    .sum(w206),
    .carry(w207)
);

full_adder FA_75(
    .a(w110),
    .b(w167),
    .cin(w168),
    .sum(w208),
    .carry(w209)
);

full_adder FA_76(
    .a(w112),
    .b(w169),
    .cin(w170),
    .sum(w210),
    .carry(w211)
);

full_adder FA_77(
    .a(w114),
    .b(w171),
    .cin(w172),
    .sum(w212),
    .carry(w213)
);

full_adder FA_78(
    .a(w116),
    .b(w173),
    .cin(w174),
    .sum(w214),
    .carry(w215)
);

full_adder FA_79(
    .a(w118),
    .b(w175),
    .cin(w176),
    .sum(w216),
    .carry(w217)
);

full_adder FA_80(
    .a(w120),
    .b(w177),
    .cin(w178),
    .sum(w218),
    .carry(w219)
);

full_adder FA_81(
    .a(w122),
    .b(w179),
    .cin(w180),
    .sum(w220),
    .carry(w221)
);

full_adder FA_82(
    .a(w124),
    .b(w181),
    .cin(w182),
    .sum(w222),
    .carry(w223)
);

full_adder FA_83(
    .a(w126),
    .b(w183),
    .cin(w184),
    .sum(w224),
    .carry(w225)
);

full_adder FA_84(
    .a(w128),
    .b(w185),
    .cin(w186),
    .sum(w226),
    .carry(w227)
);

full_adder FA_85(
    .a(w130),
    .b(w187),
    .cin(w188),
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
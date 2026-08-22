`timescale 1ns/1ps
`default_nettype none

module booth_dadda_radix4_16 #(
    parameter SIGNED_A = 0,
    parameter SIGNED_B = 0
)(
   input wire [15:0] A,
   input wire [15:0] B,

   output wire [31:0] P
);

wire [287:0] pp;
wire [8:0] pp_cin;

booth_radix4_ppg #(
    .N(16),
    .SIGNED_A(SIGNED_A),
    .SIGNED_B(SIGNED_B)
) PPG (
    .A(A),
    .B(B),
    .pp(pp),
    .pp_cin(pp_cin)
);


assign rowA = {w365, w363, w361, w359, w357, w355, w353, w351, w349, w347, w345, w343, w341, w339, w337, w335, w333, w331, w329, w327, w325, w323, w321, w272, w269, w267, w265, w263, w261, pp_cin[1], pp[1], pp[0]};
assign rowB = {w366, w364, w362, w360, w358, w356, w354, w352, w350, w348, w346, w344, w342, w340, w338, w336, w334, w332, w330, w328, w326, w324, w322, w320, w270, w268, w266, w264, w262, w260, 1'b0, pp_cin[0]};

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
wire w230;
wire w231;
wire w232;
wire w233;
wire w234;
wire w235;
wire w236;
wire w237;
wire w238;
wire w239;
wire w240;
wire w241;
wire w242;
wire w243;
wire w244;
wire w245;
wire w246;
wire w247;
wire w248;
wire w249;
wire w250;
wire w251;
wire w252;
wire w253;
wire w254;
wire w255;
wire w256;
wire w257;
wire w258;
wire w259;
wire w260;
wire w261;
wire w262;
wire w263;
wire w264;
wire w265;
wire w266;
wire w267;
wire w268;
wire w269;
wire w270;
wire w271;
wire w272;
wire w273;
wire w274;
wire w275;
wire w276;
wire w277;
wire w278;
wire w279;
wire w280;
wire w281;
wire w282;
wire w283;
wire w284;
wire w285;
wire w286;
wire w287;
wire w288;
wire w289;
wire w290;
wire w291;
wire w292;
wire w293;
wire w294;
wire w295;
wire w296;
wire w297;
wire w298;
wire w299;
wire w300;
wire w301;
wire w302;
wire w303;
wire w304;
wire w305;
wire w306;
wire w307;
wire w308;
wire w309;
wire w310;
wire w311;
wire w312;
wire w313;
wire w314;
wire w315;
wire w316;
wire w317;
wire w318;
wire w319;
wire w320;
wire w321;
wire w322;
wire w323;
wire w324;
wire w325;
wire w326;
wire w327;
wire w328;
wire w329;
wire w330;
wire w331;
wire w332;
wire w333;
wire w334;
wire w335;
wire w336;
wire w337;
wire w338;
wire w339;
wire w340;
wire w341;
wire w342;
wire w343;
wire w344;
wire w345;
wire w346;
wire w347;
wire w348;
wire w349;
wire w350;
wire w351;
wire w352;
wire w353;
wire w354;
wire w355;
wire w356;
wire w357;
wire w358;
wire w359;
wire w360;
wire w361;
wire w362;
wire w363;
wire w364;
wire w365;
wire w366;
wire w367;
wire [31:0] rowA;
wire [31:0] rowB;

half_adder HA_0(
    .a(pp[16]),
    .b(pp[48]),
    .sum(w0),
    .carry(w1)
);

half_adder HA_1(
    .a(pp[17]),
    .b(pp[49]),
    .sum(w2),
    .carry(w3)
);

half_adder HA_2(
    .a(pp[18]),
    .b(pp[50]),
    .sum(w4),
    .carry(w5)
);

half_adder HA_3(
    .a(pp[19]),
    .b(pp[51]),
    .sum(w6),
    .carry(w7)
);

half_adder HA_4(
    .a(pp[20]),
    .b(pp[52]),
    .sum(w8),
    .carry(w9)
);

half_adder HA_5(
    .a(pp[21]),
    .b(pp[53]),
    .sum(w10),
    .carry(w11)
);

half_adder HA_6(
    .a(pp[22]),
    .b(pp[54]),
    .sum(w12),
    .carry(w13)
);

half_adder HA_7(
    .a(pp[23]),
    .b(pp[55]),
    .sum(w14),
    .carry(w15)
);

half_adder HA_8(
    .a(pp[24]),
    .b(pp[56]),
    .sum(w16),
    .carry(w17)
);

half_adder HA_9(
    .a(pp[25]),
    .b(pp[57]),
    .sum(w18),
    .carry(w19)
);

half_adder HA_10(
    .a(pp[26]),
    .b(pp[58]),
    .sum(w20),
    .carry(w21)
);

half_adder HA_11(
    .a(pp[27]),
    .b(pp[59]),
    .sum(w22),
    .carry(w23)
);

half_adder HA_12(
    .a(pp[28]),
    .b(pp[60]),
    .sum(w24),
    .carry(w25)
);

half_adder HA_13(
    .a(pp[29]),
    .b(pp[61]),
    .sum(w26),
    .carry(w27)
);

half_adder HA_14(
    .a(pp[30]),
    .b(pp[62]),
    .sum(w28),
    .carry(w29)
);

half_adder HA_15(
    .a(pp[31]),
    .b(pp[63]),
    .sum(w30),
    .carry(w31)
);

half_adder HA_16(
    .a(pp[10]),
    .b(pp[42]),
    .sum(w32),
    .carry(w33)
);

half_adder HA_17(
    .a(pp[11]),
    .b(pp[43]),
    .sum(w34),
    .carry(w35)
);

full_adder FA_0(
    .a(pp[12]),
    .b(pp[44]),
    .cin(pp[76]),
    .sum(w36),
    .carry(w37)
);

full_adder FA_1(
    .a(pp[13]),
    .b(pp[45]),
    .cin(pp[77]),
    .sum(w38),
    .carry(w39)
);

full_adder FA_2(
    .a(pp[14]),
    .b(pp[46]),
    .cin(pp[78]),
    .sum(w40),
    .carry(w41)
);

half_adder HA_18(
    .a(pp[110]),
    .b(pp[142]),
    .sum(w42),
    .carry(w43)
);

full_adder FA_3(
    .a(pp[15]),
    .b(pp[47]),
    .cin(pp[79]),
    .sum(w44),
    .carry(w45)
);

half_adder HA_19(
    .a(pp[111]),
    .b(pp[143]),
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
    .a(pp[176]),
    .b(pp[208]),
    .cin(pp[240]),
    .sum(w50),
    .carry(w51)
);

full_adder FA_6(
    .a(pp[81]),
    .b(pp[113]),
    .cin(pp[145]),
    .sum(w52),
    .carry(w53)
);

full_adder FA_7(
    .a(pp[177]),
    .b(pp[209]),
    .cin(pp[241]),
    .sum(w54),
    .carry(w55)
);

full_adder FA_8(
    .a(pp[82]),
    .b(pp[114]),
    .cin(pp[146]),
    .sum(w56),
    .carry(w57)
);

full_adder FA_9(
    .a(pp[178]),
    .b(pp[210]),
    .cin(pp[242]),
    .sum(w58),
    .carry(w59)
);

full_adder FA_10(
    .a(pp[83]),
    .b(pp[115]),
    .cin(pp[147]),
    .sum(w60),
    .carry(w61)
);

full_adder FA_11(
    .a(pp[179]),
    .b(pp[211]),
    .cin(pp[243]),
    .sum(w62),
    .carry(w63)
);

full_adder FA_12(
    .a(pp[84]),
    .b(pp[116]),
    .cin(pp[148]),
    .sum(w64),
    .carry(w65)
);

full_adder FA_13(
    .a(pp[180]),
    .b(pp[212]),
    .cin(pp[244]),
    .sum(w66),
    .carry(w67)
);

full_adder FA_14(
    .a(pp[85]),
    .b(pp[117]),
    .cin(pp[149]),
    .sum(w68),
    .carry(w69)
);

full_adder FA_15(
    .a(pp[181]),
    .b(pp[213]),
    .cin(pp[245]),
    .sum(w70),
    .carry(w71)
);

full_adder FA_16(
    .a(pp[86]),
    .b(pp[118]),
    .cin(pp[150]),
    .sum(w72),
    .carry(w73)
);

full_adder FA_17(
    .a(pp[182]),
    .b(pp[214]),
    .cin(pp[246]),
    .sum(w74),
    .carry(w75)
);

full_adder FA_18(
    .a(pp[87]),
    .b(pp[119]),
    .cin(pp[151]),
    .sum(w76),
    .carry(w77)
);

full_adder FA_19(
    .a(pp[183]),
    .b(pp[215]),
    .cin(pp[247]),
    .sum(w78),
    .carry(w79)
);

full_adder FA_20(
    .a(pp[88]),
    .b(pp[120]),
    .cin(pp[152]),
    .sum(w80),
    .carry(w81)
);

full_adder FA_21(
    .a(pp[184]),
    .b(pp[216]),
    .cin(pp[248]),
    .sum(w82),
    .carry(w83)
);

full_adder FA_22(
    .a(pp[89]),
    .b(pp[121]),
    .cin(pp[153]),
    .sum(w84),
    .carry(w85)
);

full_adder FA_23(
    .a(pp[185]),
    .b(pp[217]),
    .cin(pp[249]),
    .sum(w86),
    .carry(w87)
);

full_adder FA_24(
    .a(pp[90]),
    .b(pp[122]),
    .cin(pp[154]),
    .sum(w88),
    .carry(w89)
);

full_adder FA_25(
    .a(pp[186]),
    .b(pp[218]),
    .cin(pp[250]),
    .sum(w90),
    .carry(w91)
);

full_adder FA_26(
    .a(pp[91]),
    .b(pp[123]),
    .cin(pp[155]),
    .sum(w92),
    .carry(w93)
);

full_adder FA_27(
    .a(pp[187]),
    .b(pp[219]),
    .cin(pp[251]),
    .sum(w94),
    .carry(w95)
);

full_adder FA_28(
    .a(pp[92]),
    .b(pp[124]),
    .cin(pp[156]),
    .sum(w96),
    .carry(w97)
);

full_adder FA_29(
    .a(pp[188]),
    .b(pp[220]),
    .cin(pp[252]),
    .sum(w98),
    .carry(w99)
);

full_adder FA_30(
    .a(pp[93]),
    .b(pp[125]),
    .cin(pp[157]),
    .sum(w100),
    .carry(w101)
);

full_adder FA_31(
    .a(pp[189]),
    .b(pp[221]),
    .cin(pp[253]),
    .sum(w102),
    .carry(w103)
);

full_adder FA_32(
    .a(pp[94]),
    .b(pp[126]),
    .cin(pp[158]),
    .sum(w104),
    .carry(w105)
);

full_adder FA_33(
    .a(pp[190]),
    .b(pp[222]),
    .cin(pp[254]),
    .sum(w106),
    .carry(w107)
);

full_adder FA_34(
    .a(pp[95]),
    .b(pp[127]),
    .cin(pp[159]),
    .sum(w108),
    .carry(w109)
);

full_adder FA_35(
    .a(pp[191]),
    .b(pp[223]),
    .cin(pp[255]),
    .sum(w110),
    .carry(w111)
);

half_adder HA_20(
    .a(pp[6]),
    .b(pp[38]),
    .sum(w112),
    .carry(w113)
);

half_adder HA_21(
    .a(pp[7]),
    .b(pp[39]),
    .sum(w114),
    .carry(w115)
);

full_adder FA_36(
    .a(pp[8]),
    .b(pp[40]),
    .cin(pp[72]),
    .sum(w116),
    .carry(w117)
);

full_adder FA_37(
    .a(pp[9]),
    .b(pp[41]),
    .cin(pp[73]),
    .sum(w118),
    .carry(w119)
);

full_adder FA_38(
    .a(pp[74]),
    .b(pp[106]),
    .cin(pp[138]),
    .sum(w120),
    .carry(w121)
);

full_adder FA_39(
    .a(pp[75]),
    .b(pp[107]),
    .cin(pp[139]),
    .sum(w122),
    .carry(w123)
);

full_adder FA_40(
    .a(pp[108]),
    .b(pp[140]),
    .cin(pp[172]),
    .sum(w124),
    .carry(w125)
);

half_adder HA_22(
    .a(pp[204]),
    .b(pp_cin[6]),
    .sum(w126),
    .carry(w127)
);

full_adder FA_41(
    .a(pp[109]),
    .b(pp[141]),
    .cin(pp[173]),
    .sum(w128),
    .carry(w129)
);

half_adder HA_23(
    .a(pp[205]),
    .b(w37),
    .sum(w130),
    .carry(w131)
);

full_adder FA_42(
    .a(pp[174]),
    .b(pp[206]),
    .cin(pp[238]),
    .sum(w132),
    .carry(w133)
);

full_adder FA_43(
    .a(pp_cin[7]),
    .b(w39),
    .cin(w40),
    .sum(w134),
    .carry(w135)
);

full_adder FA_44(
    .a(pp[175]),
    .b(pp[207]),
    .cin(pp[239]),
    .sum(w136),
    .carry(w137)
);

full_adder FA_45(
    .a(w41),
    .b(w43),
    .cin(w44),
    .sum(w138),
    .carry(w139)
);

full_adder FA_46(
    .a(pp[272]),
    .b(pp_cin[8]),
    .cin(w0),
    .sum(w140),
    .carry(w141)
);

full_adder FA_47(
    .a(w45),
    .b(w47),
    .cin(w48),
    .sum(w142),
    .carry(w143)
);

full_adder FA_48(
    .a(pp[273]),
    .b(w1),
    .cin(w2),
    .sum(w144),
    .carry(w145)
);

full_adder FA_49(
    .a(w49),
    .b(w51),
    .cin(w52),
    .sum(w146),
    .carry(w147)
);

full_adder FA_50(
    .a(pp[274]),
    .b(w3),
    .cin(w4),
    .sum(w148),
    .carry(w149)
);

full_adder FA_51(
    .a(w53),
    .b(w55),
    .cin(w56),
    .sum(w150),
    .carry(w151)
);

full_adder FA_52(
    .a(pp[275]),
    .b(w5),
    .cin(w6),
    .sum(w152),
    .carry(w153)
);

full_adder FA_53(
    .a(w57),
    .b(w59),
    .cin(w60),
    .sum(w154),
    .carry(w155)
);

full_adder FA_54(
    .a(pp[276]),
    .b(w7),
    .cin(w8),
    .sum(w156),
    .carry(w157)
);

full_adder FA_55(
    .a(w61),
    .b(w63),
    .cin(w64),
    .sum(w158),
    .carry(w159)
);

full_adder FA_56(
    .a(pp[277]),
    .b(w9),
    .cin(w10),
    .sum(w160),
    .carry(w161)
);

full_adder FA_57(
    .a(w65),
    .b(w67),
    .cin(w68),
    .sum(w162),
    .carry(w163)
);

full_adder FA_58(
    .a(pp[278]),
    .b(w11),
    .cin(w12),
    .sum(w164),
    .carry(w165)
);

full_adder FA_59(
    .a(w69),
    .b(w71),
    .cin(w72),
    .sum(w166),
    .carry(w167)
);

full_adder FA_60(
    .a(pp[279]),
    .b(w13),
    .cin(w14),
    .sum(w168),
    .carry(w169)
);

full_adder FA_61(
    .a(w73),
    .b(w75),
    .cin(w76),
    .sum(w170),
    .carry(w171)
);

full_adder FA_62(
    .a(pp[280]),
    .b(w15),
    .cin(w16),
    .sum(w172),
    .carry(w173)
);

full_adder FA_63(
    .a(w77),
    .b(w79),
    .cin(w80),
    .sum(w174),
    .carry(w175)
);

full_adder FA_64(
    .a(pp[281]),
    .b(w17),
    .cin(w18),
    .sum(w176),
    .carry(w177)
);

full_adder FA_65(
    .a(w81),
    .b(w83),
    .cin(w84),
    .sum(w178),
    .carry(w179)
);

full_adder FA_66(
    .a(pp[282]),
    .b(w19),
    .cin(w20),
    .sum(w180),
    .carry(w181)
);

full_adder FA_67(
    .a(w85),
    .b(w87),
    .cin(w88),
    .sum(w182),
    .carry(w183)
);

full_adder FA_68(
    .a(pp[283]),
    .b(w21),
    .cin(w22),
    .sum(w184),
    .carry(w185)
);

full_adder FA_69(
    .a(w89),
    .b(w91),
    .cin(w92),
    .sum(w186),
    .carry(w187)
);

full_adder FA_70(
    .a(pp[284]),
    .b(w23),
    .cin(w24),
    .sum(w188),
    .carry(w189)
);

full_adder FA_71(
    .a(w93),
    .b(w95),
    .cin(w96),
    .sum(w190),
    .carry(w191)
);

full_adder FA_72(
    .a(pp[285]),
    .b(w25),
    .cin(w26),
    .sum(w192),
    .carry(w193)
);

full_adder FA_73(
    .a(w97),
    .b(w99),
    .cin(w100),
    .sum(w194),
    .carry(w195)
);

full_adder FA_74(
    .a(pp[286]),
    .b(w27),
    .cin(w28),
    .sum(w196),
    .carry(w197)
);

full_adder FA_75(
    .a(w101),
    .b(w103),
    .cin(w104),
    .sum(w198),
    .carry(w199)
);

full_adder FA_76(
    .a(pp[287]),
    .b(w29),
    .cin(w30),
    .sum(w200),
    .carry(w201)
);

full_adder FA_77(
    .a(w105),
    .b(w107),
    .cin(w108),
    .sum(w202),
    .carry(w203)
);

half_adder HA_24(
    .a(pp[4]),
    .b(pp[36]),
    .sum(w204),
    .carry(w205)
);

half_adder HA_25(
    .a(pp[5]),
    .b(pp[37]),
    .sum(w206),
    .carry(w207)
);

full_adder FA_78(
    .a(pp[70]),
    .b(pp[102]),
    .cin(pp_cin[3]),
    .sum(w208),
    .carry(w209)
);

full_adder FA_79(
    .a(pp[71]),
    .b(pp[103]),
    .cin(w113),
    .sum(w210),
    .carry(w211)
);

full_adder FA_80(
    .a(pp[104]),
    .b(pp[136]),
    .cin(pp_cin[4]),
    .sum(w212),
    .carry(w213)
);

full_adder FA_81(
    .a(pp[105]),
    .b(pp[137]),
    .cin(w117),
    .sum(w214),
    .carry(w215)
);

full_adder FA_82(
    .a(pp[170]),
    .b(pp_cin[5]),
    .cin(w32),
    .sum(w216),
    .carry(w217)
);

full_adder FA_83(
    .a(pp[171]),
    .b(w33),
    .cin(w34),
    .sum(w218),
    .carry(w219)
);

full_adder FA_84(
    .a(w35),
    .b(w36),
    .cin(w123),
    .sum(w220),
    .carry(w221)
);

full_adder FA_85(
    .a(w38),
    .b(w125),
    .cin(w127),
    .sum(w222),
    .carry(w223)
);

full_adder FA_86(
    .a(w42),
    .b(w129),
    .cin(w131),
    .sum(w224),
    .carry(w225)
);

full_adder FA_87(
    .a(w46),
    .b(w133),
    .cin(w135),
    .sum(w226),
    .carry(w227)
);

full_adder FA_88(
    .a(w50),
    .b(w137),
    .cin(w139),
    .sum(w228),
    .carry(w229)
);

full_adder FA_89(
    .a(w54),
    .b(w141),
    .cin(w143),
    .sum(w230),
    .carry(w231)
);

full_adder FA_90(
    .a(w58),
    .b(w145),
    .cin(w147),
    .sum(w232),
    .carry(w233)
);

full_adder FA_91(
    .a(w62),
    .b(w149),
    .cin(w151),
    .sum(w234),
    .carry(w235)
);

full_adder FA_92(
    .a(w66),
    .b(w153),
    .cin(w155),
    .sum(w236),
    .carry(w237)
);

full_adder FA_93(
    .a(w70),
    .b(w157),
    .cin(w159),
    .sum(w238),
    .carry(w239)
);

full_adder FA_94(
    .a(w74),
    .b(w161),
    .cin(w163),
    .sum(w240),
    .carry(w241)
);

full_adder FA_95(
    .a(w78),
    .b(w165),
    .cin(w167),
    .sum(w242),
    .carry(w243)
);

full_adder FA_96(
    .a(w82),
    .b(w169),
    .cin(w171),
    .sum(w244),
    .carry(w245)
);

full_adder FA_97(
    .a(w86),
    .b(w173),
    .cin(w175),
    .sum(w246),
    .carry(w247)
);

full_adder FA_98(
    .a(w90),
    .b(w177),
    .cin(w179),
    .sum(w248),
    .carry(w249)
);

full_adder FA_99(
    .a(w94),
    .b(w181),
    .cin(w183),
    .sum(w250),
    .carry(w251)
);

full_adder FA_100(
    .a(w98),
    .b(w185),
    .cin(w187),
    .sum(w252),
    .carry(w253)
);

full_adder FA_101(
    .a(w102),
    .b(w189),
    .cin(w191),
    .sum(w254),
    .carry(w255)
);

full_adder FA_102(
    .a(w106),
    .b(w193),
    .cin(w195),
    .sum(w256),
    .carry(w257)
);

full_adder FA_103(
    .a(w110),
    .b(w197),
    .cin(w199),
    .sum(w258),
    .carry(w259)
);

half_adder HA_26(
    .a(pp[2]),
    .b(pp[34]),
    .sum(w260),
    .carry(w261)
);

half_adder HA_27(
    .a(pp[3]),
    .b(pp[35]),
    .sum(w262),
    .carry(w263)
);

full_adder FA_104(
    .a(pp[68]),
    .b(pp_cin[2]),
    .cin(w204),
    .sum(w264),
    .carry(w265)
);

full_adder FA_105(
    .a(pp[69]),
    .b(w205),
    .cin(w206),
    .sum(w266),
    .carry(w267)
);

full_adder FA_106(
    .a(w112),
    .b(w207),
    .cin(w208),
    .sum(w268),
    .carry(w269)
);

full_adder FA_107(
    .a(w114),
    .b(w209),
    .cin(w210),
    .sum(w270),
    .carry(w271)
);

full_adder FA_108(
    .a(w115),
    .b(w116),
    .cin(w211),
    .sum(w272),
    .carry(w273)
);

full_adder FA_109(
    .a(w118),
    .b(w213),
    .cin(w214),
    .sum(w274),
    .carry(w275)
);

full_adder FA_110(
    .a(w119),
    .b(w120),
    .cin(w215),
    .sum(w276),
    .carry(w277)
);

full_adder FA_111(
    .a(w121),
    .b(w122),
    .cin(w217),
    .sum(w278),
    .carry(w279)
);

full_adder FA_112(
    .a(w124),
    .b(w126),
    .cin(w219),
    .sum(w280),
    .carry(w281)
);

full_adder FA_113(
    .a(w128),
    .b(w130),
    .cin(w221),
    .sum(w282),
    .carry(w283)
);

full_adder FA_114(
    .a(w132),
    .b(w134),
    .cin(w223),
    .sum(w284),
    .carry(w285)
);

full_adder FA_115(
    .a(w136),
    .b(w138),
    .cin(w225),
    .sum(w286),
    .carry(w287)
);

full_adder FA_116(
    .a(w140),
    .b(w142),
    .cin(w227),
    .sum(w288),
    .carry(w289)
);

full_adder FA_117(
    .a(w144),
    .b(w146),
    .cin(w229),
    .sum(w290),
    .carry(w291)
);

full_adder FA_118(
    .a(w148),
    .b(w150),
    .cin(w231),
    .sum(w292),
    .carry(w293)
);

full_adder FA_119(
    .a(w152),
    .b(w154),
    .cin(w233),
    .sum(w294),
    .carry(w295)
);

full_adder FA_120(
    .a(w156),
    .b(w158),
    .cin(w235),
    .sum(w296),
    .carry(w297)
);

full_adder FA_121(
    .a(w160),
    .b(w162),
    .cin(w237),
    .sum(w298),
    .carry(w299)
);

full_adder FA_122(
    .a(w164),
    .b(w166),
    .cin(w239),
    .sum(w300),
    .carry(w301)
);

full_adder FA_123(
    .a(w168),
    .b(w170),
    .cin(w241),
    .sum(w302),
    .carry(w303)
);

full_adder FA_124(
    .a(w172),
    .b(w174),
    .cin(w243),
    .sum(w304),
    .carry(w305)
);

full_adder FA_125(
    .a(w176),
    .b(w178),
    .cin(w245),
    .sum(w306),
    .carry(w307)
);

full_adder FA_126(
    .a(w180),
    .b(w182),
    .cin(w247),
    .sum(w308),
    .carry(w309)
);

full_adder FA_127(
    .a(w184),
    .b(w186),
    .cin(w249),
    .sum(w310),
    .carry(w311)
);

full_adder FA_128(
    .a(w188),
    .b(w190),
    .cin(w251),
    .sum(w312),
    .carry(w313)
);

full_adder FA_129(
    .a(w192),
    .b(w194),
    .cin(w253),
    .sum(w314),
    .carry(w315)
);

full_adder FA_130(
    .a(w196),
    .b(w198),
    .cin(w255),
    .sum(w316),
    .carry(w317)
);

full_adder FA_131(
    .a(w200),
    .b(w202),
    .cin(w257),
    .sum(w318),
    .carry(w319)
);

half_adder HA_28(
    .a(w212),
    .b(w271),
    .sum(w320),
    .carry(w321)
);

half_adder HA_29(
    .a(w273),
    .b(w274),
    .sum(w322),
    .carry(w323)
);

full_adder FA_132(
    .a(w216),
    .b(w275),
    .cin(w276),
    .sum(w324),
    .carry(w325)
);

full_adder FA_133(
    .a(w218),
    .b(w277),
    .cin(w278),
    .sum(w326),
    .carry(w327)
);

full_adder FA_134(
    .a(w220),
    .b(w279),
    .cin(w280),
    .sum(w328),
    .carry(w329)
);

full_adder FA_135(
    .a(w222),
    .b(w281),
    .cin(w282),
    .sum(w330),
    .carry(w331)
);

full_adder FA_136(
    .a(w224),
    .b(w283),
    .cin(w284),
    .sum(w332),
    .carry(w333)
);

full_adder FA_137(
    .a(w226),
    .b(w285),
    .cin(w286),
    .sum(w334),
    .carry(w335)
);

full_adder FA_138(
    .a(w228),
    .b(w287),
    .cin(w288),
    .sum(w336),
    .carry(w337)
);

full_adder FA_139(
    .a(w230),
    .b(w289),
    .cin(w290),
    .sum(w338),
    .carry(w339)
);

full_adder FA_140(
    .a(w232),
    .b(w291),
    .cin(w292),
    .sum(w340),
    .carry(w341)
);

full_adder FA_141(
    .a(w234),
    .b(w293),
    .cin(w294),
    .sum(w342),
    .carry(w343)
);

full_adder FA_142(
    .a(w236),
    .b(w295),
    .cin(w296),
    .sum(w344),
    .carry(w345)
);

full_adder FA_143(
    .a(w238),
    .b(w297),
    .cin(w298),
    .sum(w346),
    .carry(w347)
);

full_adder FA_144(
    .a(w240),
    .b(w299),
    .cin(w300),
    .sum(w348),
    .carry(w349)
);

full_adder FA_145(
    .a(w242),
    .b(w301),
    .cin(w302),
    .sum(w350),
    .carry(w351)
);

full_adder FA_146(
    .a(w244),
    .b(w303),
    .cin(w304),
    .sum(w352),
    .carry(w353)
);

full_adder FA_147(
    .a(w246),
    .b(w305),
    .cin(w306),
    .sum(w354),
    .carry(w355)
);

full_adder FA_148(
    .a(w248),
    .b(w307),
    .cin(w308),
    .sum(w356),
    .carry(w357)
);

full_adder FA_149(
    .a(w250),
    .b(w309),
    .cin(w310),
    .sum(w358),
    .carry(w359)
);

full_adder FA_150(
    .a(w252),
    .b(w311),
    .cin(w312),
    .sum(w360),
    .carry(w361)
);

full_adder FA_151(
    .a(w254),
    .b(w313),
    .cin(w314),
    .sum(w362),
    .carry(w363)
);

full_adder FA_152(
    .a(w256),
    .b(w315),
    .cin(w316),
    .sum(w364),
    .carry(w365)
);

full_adder FA_153(
    .a(w258),
    .b(w317),
    .cin(w318),
    .sum(w366),
    .carry(w367)
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
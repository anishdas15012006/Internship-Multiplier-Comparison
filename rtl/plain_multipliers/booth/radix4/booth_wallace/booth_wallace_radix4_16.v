`timescale 1ns/1ps
`default_nettype none

module booth_wallace_radix4_16 #(
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


assign rowA = {w366, w364, w362, w360, w358, w356, w354, w352, w350, w348, w346, w344, w342, w340, w338, w336, w334, w332, w330, w328, w326, w324, w322, w320, w318, w316, w314, w272, w184, w0, pp[1], pp[0]};
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

full_adder FA_0(
    .a(pp[2]),
    .b(pp[34]),
    .cin(pp_cin[1]),
    .sum(w0),
    .carry(w1)
);

full_adder FA_1(
    .a(pp[4]),
    .b(pp[36]),
    .cin(pp[68]),
    .sum(w2),
    .carry(w3)
);

full_adder FA_2(
    .a(pp[5]),
    .b(pp[37]),
    .cin(pp[69]),
    .sum(w4),
    .carry(w5)
);

full_adder FA_3(
    .a(pp[6]),
    .b(pp[38]),
    .cin(pp[70]),
    .sum(w6),
    .carry(w7)
);

full_adder FA_4(
    .a(pp[102]),
    .b(pp_cin[3]),
    .cin(w6),
    .sum(w8),
    .carry(w9)
);

full_adder FA_5(
    .a(pp[7]),
    .b(pp[39]),
    .cin(pp[71]),
    .sum(w10),
    .carry(w11)
);

full_adder FA_6(
    .a(pp[8]),
    .b(pp[40]),
    .cin(pp[72]),
    .sum(w12),
    .carry(w13)
);

full_adder FA_7(
    .a(pp[104]),
    .b(pp[136]),
    .cin(pp_cin[4]),
    .sum(w14),
    .carry(w15)
);

full_adder FA_8(
    .a(pp[9]),
    .b(pp[41]),
    .cin(pp[73]),
    .sum(w16),
    .carry(w17)
);

full_adder FA_9(
    .a(pp[105]),
    .b(pp[137]),
    .cin(w16),
    .sum(w18),
    .carry(w19)
);

full_adder FA_10(
    .a(pp[10]),
    .b(pp[42]),
    .cin(pp[74]),
    .sum(w20),
    .carry(w21)
);

full_adder FA_11(
    .a(pp[106]),
    .b(pp[138]),
    .cin(pp[170]),
    .sum(w22),
    .carry(w23)
);

full_adder FA_12(
    .a(pp_cin[5]),
    .b(w20),
    .cin(w22),
    .sum(w24),
    .carry(w25)
);

full_adder FA_13(
    .a(pp[11]),
    .b(pp[43]),
    .cin(pp[75]),
    .sum(w26),
    .carry(w27)
);

full_adder FA_14(
    .a(pp[107]),
    .b(pp[139]),
    .cin(pp[171]),
    .sum(w28),
    .carry(w29)
);

full_adder FA_15(
    .a(pp[12]),
    .b(pp[44]),
    .cin(pp[76]),
    .sum(w30),
    .carry(w31)
);

full_adder FA_16(
    .a(pp[108]),
    .b(pp[140]),
    .cin(pp[172]),
    .sum(w32),
    .carry(w33)
);

full_adder FA_17(
    .a(pp[204]),
    .b(pp_cin[6]),
    .cin(w30),
    .sum(w34),
    .carry(w35)
);

full_adder FA_18(
    .a(pp[13]),
    .b(pp[45]),
    .cin(pp[77]),
    .sum(w36),
    .carry(w37)
);

full_adder FA_19(
    .a(pp[109]),
    .b(pp[141]),
    .cin(pp[173]),
    .sum(w38),
    .carry(w39)
);

full_adder FA_20(
    .a(pp[205]),
    .b(w36),
    .cin(w38),
    .sum(w40),
    .carry(w41)
);

full_adder FA_21(
    .a(pp[14]),
    .b(pp[46]),
    .cin(pp[78]),
    .sum(w42),
    .carry(w43)
);

full_adder FA_22(
    .a(pp[110]),
    .b(pp[142]),
    .cin(pp[174]),
    .sum(w44),
    .carry(w45)
);

full_adder FA_23(
    .a(pp[206]),
    .b(pp[238]),
    .cin(pp_cin[7]),
    .sum(w46),
    .carry(w47)
);

full_adder FA_24(
    .a(w42),
    .b(w44),
    .cin(w46),
    .sum(w48),
    .carry(w49)
);

full_adder FA_25(
    .a(pp[15]),
    .b(pp[47]),
    .cin(pp[79]),
    .sum(w50),
    .carry(w51)
);

full_adder FA_26(
    .a(pp[111]),
    .b(pp[143]),
    .cin(pp[175]),
    .sum(w52),
    .carry(w53)
);

full_adder FA_27(
    .a(pp[207]),
    .b(pp[239]),
    .cin(w50),
    .sum(w54),
    .carry(w55)
);

full_adder FA_28(
    .a(pp[16]),
    .b(pp[48]),
    .cin(pp[80]),
    .sum(w56),
    .carry(w57)
);

full_adder FA_29(
    .a(pp[112]),
    .b(pp[144]),
    .cin(pp[176]),
    .sum(w58),
    .carry(w59)
);

full_adder FA_30(
    .a(pp[208]),
    .b(pp[240]),
    .cin(pp[272]),
    .sum(w60),
    .carry(w61)
);

full_adder FA_31(
    .a(pp_cin[8]),
    .b(w56),
    .cin(w58),
    .sum(w62),
    .carry(w63)
);

full_adder FA_32(
    .a(pp[17]),
    .b(pp[49]),
    .cin(pp[81]),
    .sum(w64),
    .carry(w65)
);

full_adder FA_33(
    .a(pp[113]),
    .b(pp[145]),
    .cin(pp[177]),
    .sum(w66),
    .carry(w67)
);

full_adder FA_34(
    .a(pp[209]),
    .b(pp[241]),
    .cin(pp[273]),
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
    .a(pp[18]),
    .b(pp[50]),
    .cin(pp[82]),
    .sum(w72),
    .carry(w73)
);

full_adder FA_37(
    .a(pp[114]),
    .b(pp[146]),
    .cin(pp[178]),
    .sum(w74),
    .carry(w75)
);

full_adder FA_38(
    .a(pp[210]),
    .b(pp[242]),
    .cin(pp[274]),
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
    .a(pp[19]),
    .b(pp[51]),
    .cin(pp[83]),
    .sum(w80),
    .carry(w81)
);

full_adder FA_41(
    .a(pp[115]),
    .b(pp[147]),
    .cin(pp[179]),
    .sum(w82),
    .carry(w83)
);

full_adder FA_42(
    .a(pp[211]),
    .b(pp[243]),
    .cin(pp[275]),
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
    .a(pp[20]),
    .b(pp[52]),
    .cin(pp[84]),
    .sum(w88),
    .carry(w89)
);

full_adder FA_45(
    .a(pp[116]),
    .b(pp[148]),
    .cin(pp[180]),
    .sum(w90),
    .carry(w91)
);

full_adder FA_46(
    .a(pp[212]),
    .b(pp[244]),
    .cin(pp[276]),
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
    .a(pp[21]),
    .b(pp[53]),
    .cin(pp[85]),
    .sum(w96),
    .carry(w97)
);

full_adder FA_49(
    .a(pp[117]),
    .b(pp[149]),
    .cin(pp[181]),
    .sum(w98),
    .carry(w99)
);

full_adder FA_50(
    .a(pp[213]),
    .b(pp[245]),
    .cin(pp[277]),
    .sum(w100),
    .carry(w101)
);

full_adder FA_51(
    .a(w96),
    .b(w98),
    .cin(w100),
    .sum(w102),
    .carry(w103)
);

full_adder FA_52(
    .a(pp[22]),
    .b(pp[54]),
    .cin(pp[86]),
    .sum(w104),
    .carry(w105)
);

full_adder FA_53(
    .a(pp[118]),
    .b(pp[150]),
    .cin(pp[182]),
    .sum(w106),
    .carry(w107)
);

full_adder FA_54(
    .a(pp[214]),
    .b(pp[246]),
    .cin(pp[278]),
    .sum(w108),
    .carry(w109)
);

full_adder FA_55(
    .a(w104),
    .b(w106),
    .cin(w108),
    .sum(w110),
    .carry(w111)
);

full_adder FA_56(
    .a(pp[23]),
    .b(pp[55]),
    .cin(pp[87]),
    .sum(w112),
    .carry(w113)
);

full_adder FA_57(
    .a(pp[119]),
    .b(pp[151]),
    .cin(pp[183]),
    .sum(w114),
    .carry(w115)
);

full_adder FA_58(
    .a(pp[215]),
    .b(pp[247]),
    .cin(pp[279]),
    .sum(w116),
    .carry(w117)
);

full_adder FA_59(
    .a(w112),
    .b(w114),
    .cin(w116),
    .sum(w118),
    .carry(w119)
);

full_adder FA_60(
    .a(pp[24]),
    .b(pp[56]),
    .cin(pp[88]),
    .sum(w120),
    .carry(w121)
);

full_adder FA_61(
    .a(pp[120]),
    .b(pp[152]),
    .cin(pp[184]),
    .sum(w122),
    .carry(w123)
);

full_adder FA_62(
    .a(pp[216]),
    .b(pp[248]),
    .cin(pp[280]),
    .sum(w124),
    .carry(w125)
);

full_adder FA_63(
    .a(w120),
    .b(w122),
    .cin(w124),
    .sum(w126),
    .carry(w127)
);

full_adder FA_64(
    .a(pp[25]),
    .b(pp[57]),
    .cin(pp[89]),
    .sum(w128),
    .carry(w129)
);

full_adder FA_65(
    .a(pp[121]),
    .b(pp[153]),
    .cin(pp[185]),
    .sum(w130),
    .carry(w131)
);

full_adder FA_66(
    .a(pp[217]),
    .b(pp[249]),
    .cin(pp[281]),
    .sum(w132),
    .carry(w133)
);

full_adder FA_67(
    .a(w128),
    .b(w130),
    .cin(w132),
    .sum(w134),
    .carry(w135)
);

full_adder FA_68(
    .a(pp[26]),
    .b(pp[58]),
    .cin(pp[90]),
    .sum(w136),
    .carry(w137)
);

full_adder FA_69(
    .a(pp[122]),
    .b(pp[154]),
    .cin(pp[186]),
    .sum(w138),
    .carry(w139)
);

full_adder FA_70(
    .a(pp[218]),
    .b(pp[250]),
    .cin(pp[282]),
    .sum(w140),
    .carry(w141)
);

full_adder FA_71(
    .a(w136),
    .b(w138),
    .cin(w140),
    .sum(w142),
    .carry(w143)
);

full_adder FA_72(
    .a(pp[27]),
    .b(pp[59]),
    .cin(pp[91]),
    .sum(w144),
    .carry(w145)
);

full_adder FA_73(
    .a(pp[123]),
    .b(pp[155]),
    .cin(pp[187]),
    .sum(w146),
    .carry(w147)
);

full_adder FA_74(
    .a(pp[219]),
    .b(pp[251]),
    .cin(pp[283]),
    .sum(w148),
    .carry(w149)
);

full_adder FA_75(
    .a(w144),
    .b(w146),
    .cin(w148),
    .sum(w150),
    .carry(w151)
);

full_adder FA_76(
    .a(pp[28]),
    .b(pp[60]),
    .cin(pp[92]),
    .sum(w152),
    .carry(w153)
);

full_adder FA_77(
    .a(pp[124]),
    .b(pp[156]),
    .cin(pp[188]),
    .sum(w154),
    .carry(w155)
);

full_adder FA_78(
    .a(pp[220]),
    .b(pp[252]),
    .cin(pp[284]),
    .sum(w156),
    .carry(w157)
);

full_adder FA_79(
    .a(w152),
    .b(w154),
    .cin(w156),
    .sum(w158),
    .carry(w159)
);

full_adder FA_80(
    .a(pp[29]),
    .b(pp[61]),
    .cin(pp[93]),
    .sum(w160),
    .carry(w161)
);

full_adder FA_81(
    .a(pp[125]),
    .b(pp[157]),
    .cin(pp[189]),
    .sum(w162),
    .carry(w163)
);

full_adder FA_82(
    .a(pp[221]),
    .b(pp[253]),
    .cin(pp[285]),
    .sum(w164),
    .carry(w165)
);

full_adder FA_83(
    .a(w160),
    .b(w162),
    .cin(w164),
    .sum(w166),
    .carry(w167)
);

full_adder FA_84(
    .a(pp[30]),
    .b(pp[62]),
    .cin(pp[94]),
    .sum(w168),
    .carry(w169)
);

full_adder FA_85(
    .a(pp[126]),
    .b(pp[158]),
    .cin(pp[190]),
    .sum(w170),
    .carry(w171)
);

full_adder FA_86(
    .a(pp[222]),
    .b(pp[254]),
    .cin(pp[286]),
    .sum(w172),
    .carry(w173)
);

full_adder FA_87(
    .a(w168),
    .b(w170),
    .cin(w172),
    .sum(w174),
    .carry(w175)
);

full_adder FA_88(
    .a(pp[31]),
    .b(pp[63]),
    .cin(pp[95]),
    .sum(w176),
    .carry(w177)
);

full_adder FA_89(
    .a(pp[127]),
    .b(pp[159]),
    .cin(pp[191]),
    .sum(w178),
    .carry(w179)
);

full_adder FA_90(
    .a(pp[223]),
    .b(pp[255]),
    .cin(pp[287]),
    .sum(w180),
    .carry(w181)
);

full_adder FA_91(
    .a(w176),
    .b(w178),
    .cin(w180),
    .sum(w182),
    .carry(w183)
);

full_adder FA_92(
    .a(pp[3]),
    .b(pp[35]),
    .cin(w1),
    .sum(w184),
    .carry(w185)
);

full_adder FA_93(
    .a(pp[103]),
    .b(w10),
    .cin(w7),
    .sum(w186),
    .carry(w187)
);

full_adder FA_94(
    .a(w12),
    .b(w14),
    .cin(w11),
    .sum(w188),
    .carry(w189)
);

full_adder FA_95(
    .a(w18),
    .b(w13),
    .cin(w15),
    .sum(w190),
    .carry(w191)
);

full_adder FA_96(
    .a(w24),
    .b(w17),
    .cin(w19),
    .sum(w192),
    .carry(w193)
);

full_adder FA_97(
    .a(w26),
    .b(w28),
    .cin(w21),
    .sum(w194),
    .carry(w195)
);

full_adder FA_98(
    .a(w23),
    .b(w25),
    .cin(w194),
    .sum(w196),
    .carry(w197)
);

full_adder FA_99(
    .a(w32),
    .b(w34),
    .cin(w27),
    .sum(w198),
    .carry(w199)
);

full_adder FA_100(
    .a(w40),
    .b(w31),
    .cin(w33),
    .sum(w200),
    .carry(w201)
);

full_adder FA_101(
    .a(w48),
    .b(w37),
    .cin(w39),
    .sum(w202),
    .carry(w203)
);

full_adder FA_102(
    .a(w52),
    .b(w54),
    .cin(w43),
    .sum(w204),
    .carry(w205)
);

full_adder FA_103(
    .a(w45),
    .b(w47),
    .cin(w49),
    .sum(w206),
    .carry(w207)
);

full_adder FA_104(
    .a(w60),
    .b(w62),
    .cin(w51),
    .sum(w208),
    .carry(w209)
);

full_adder FA_105(
    .a(w53),
    .b(w55),
    .cin(w208),
    .sum(w210),
    .carry(w211)
);

full_adder FA_106(
    .a(w70),
    .b(w57),
    .cin(w59),
    .sum(w212),
    .carry(w213)
);

full_adder FA_107(
    .a(w61),
    .b(w63),
    .cin(w212),
    .sum(w214),
    .carry(w215)
);

full_adder FA_108(
    .a(w78),
    .b(w65),
    .cin(w67),
    .sum(w216),
    .carry(w217)
);

full_adder FA_109(
    .a(w69),
    .b(w71),
    .cin(w216),
    .sum(w218),
    .carry(w219)
);

full_adder FA_110(
    .a(w86),
    .b(w73),
    .cin(w75),
    .sum(w220),
    .carry(w221)
);

full_adder FA_111(
    .a(w77),
    .b(w79),
    .cin(w220),
    .sum(w222),
    .carry(w223)
);

full_adder FA_112(
    .a(w94),
    .b(w81),
    .cin(w83),
    .sum(w224),
    .carry(w225)
);

full_adder FA_113(
    .a(w85),
    .b(w87),
    .cin(w224),
    .sum(w226),
    .carry(w227)
);

full_adder FA_114(
    .a(w102),
    .b(w89),
    .cin(w91),
    .sum(w228),
    .carry(w229)
);

full_adder FA_115(
    .a(w93),
    .b(w95),
    .cin(w228),
    .sum(w230),
    .carry(w231)
);

full_adder FA_116(
    .a(w110),
    .b(w97),
    .cin(w99),
    .sum(w232),
    .carry(w233)
);

full_adder FA_117(
    .a(w101),
    .b(w103),
    .cin(w232),
    .sum(w234),
    .carry(w235)
);

full_adder FA_118(
    .a(w118),
    .b(w105),
    .cin(w107),
    .sum(w236),
    .carry(w237)
);

full_adder FA_119(
    .a(w109),
    .b(w111),
    .cin(w236),
    .sum(w238),
    .carry(w239)
);

full_adder FA_120(
    .a(w126),
    .b(w113),
    .cin(w115),
    .sum(w240),
    .carry(w241)
);

full_adder FA_121(
    .a(w117),
    .b(w119),
    .cin(w240),
    .sum(w242),
    .carry(w243)
);

full_adder FA_122(
    .a(w134),
    .b(w121),
    .cin(w123),
    .sum(w244),
    .carry(w245)
);

full_adder FA_123(
    .a(w125),
    .b(w127),
    .cin(w244),
    .sum(w246),
    .carry(w247)
);

full_adder FA_124(
    .a(w142),
    .b(w129),
    .cin(w131),
    .sum(w248),
    .carry(w249)
);

full_adder FA_125(
    .a(w133),
    .b(w135),
    .cin(w248),
    .sum(w250),
    .carry(w251)
);

full_adder FA_126(
    .a(w150),
    .b(w137),
    .cin(w139),
    .sum(w252),
    .carry(w253)
);

full_adder FA_127(
    .a(w141),
    .b(w143),
    .cin(w252),
    .sum(w254),
    .carry(w255)
);

full_adder FA_128(
    .a(w158),
    .b(w145),
    .cin(w147),
    .sum(w256),
    .carry(w257)
);

full_adder FA_129(
    .a(w149),
    .b(w151),
    .cin(w256),
    .sum(w258),
    .carry(w259)
);

full_adder FA_130(
    .a(w166),
    .b(w153),
    .cin(w155),
    .sum(w260),
    .carry(w261)
);

full_adder FA_131(
    .a(w157),
    .b(w159),
    .cin(w260),
    .sum(w262),
    .carry(w263)
);

full_adder FA_132(
    .a(w174),
    .b(w161),
    .cin(w163),
    .sum(w264),
    .carry(w265)
);

full_adder FA_133(
    .a(w165),
    .b(w167),
    .cin(w264),
    .sum(w266),
    .carry(w267)
);

full_adder FA_134(
    .a(w182),
    .b(w169),
    .cin(w171),
    .sum(w268),
    .carry(w269)
);

full_adder FA_135(
    .a(w173),
    .b(w175),
    .cin(w268),
    .sum(w270),
    .carry(w271)
);

full_adder FA_136(
    .a(pp_cin[2]),
    .b(w2),
    .cin(w185),
    .sum(w272),
    .carry(w273)
);

full_adder FA_137(
    .a(w29),
    .b(w198),
    .cin(w195),
    .sum(w274),
    .carry(w275)
);

full_adder FA_138(
    .a(w35),
    .b(w200),
    .cin(w199),
    .sum(w276),
    .carry(w277)
);

full_adder FA_139(
    .a(w41),
    .b(w202),
    .cin(w201),
    .sum(w278),
    .carry(w279)
);

full_adder FA_140(
    .a(w204),
    .b(w206),
    .cin(w203),
    .sum(w280),
    .carry(w281)
);

full_adder FA_141(
    .a(w210),
    .b(w205),
    .cin(w207),
    .sum(w282),
    .carry(w283)
);

full_adder FA_142(
    .a(w214),
    .b(w209),
    .cin(w211),
    .sum(w284),
    .carry(w285)
);

full_adder FA_143(
    .a(w218),
    .b(w213),
    .cin(w215),
    .sum(w286),
    .carry(w287)
);

full_adder FA_144(
    .a(w222),
    .b(w217),
    .cin(w219),
    .sum(w288),
    .carry(w289)
);

full_adder FA_145(
    .a(w226),
    .b(w221),
    .cin(w223),
    .sum(w290),
    .carry(w291)
);

full_adder FA_146(
    .a(w230),
    .b(w225),
    .cin(w227),
    .sum(w292),
    .carry(w293)
);

full_adder FA_147(
    .a(w234),
    .b(w229),
    .cin(w231),
    .sum(w294),
    .carry(w295)
);

full_adder FA_148(
    .a(w238),
    .b(w233),
    .cin(w235),
    .sum(w296),
    .carry(w297)
);

full_adder FA_149(
    .a(w242),
    .b(w237),
    .cin(w239),
    .sum(w298),
    .carry(w299)
);

full_adder FA_150(
    .a(w246),
    .b(w241),
    .cin(w243),
    .sum(w300),
    .carry(w301)
);

full_adder FA_151(
    .a(w250),
    .b(w245),
    .cin(w247),
    .sum(w302),
    .carry(w303)
);

full_adder FA_152(
    .a(w254),
    .b(w249),
    .cin(w251),
    .sum(w304),
    .carry(w305)
);

full_adder FA_153(
    .a(w258),
    .b(w253),
    .cin(w255),
    .sum(w306),
    .carry(w307)
);

full_adder FA_154(
    .a(w262),
    .b(w257),
    .cin(w259),
    .sum(w308),
    .carry(w309)
);

full_adder FA_155(
    .a(w266),
    .b(w261),
    .cin(w263),
    .sum(w310),
    .carry(w311)
);

full_adder FA_156(
    .a(w270),
    .b(w265),
    .cin(w267),
    .sum(w312),
    .carry(w313)
);

full_adder FA_157(
    .a(w4),
    .b(w3),
    .cin(w273),
    .sum(w314),
    .carry(w315)
);

full_adder FA_158(
    .a(w8),
    .b(w5),
    .cin(w315),
    .sum(w316),
    .carry(w317)
);

full_adder FA_159(
    .a(w9),
    .b(w186),
    .cin(w317),
    .sum(w318),
    .carry(w319)
);

full_adder FA_160(
    .a(w188),
    .b(w187),
    .cin(w319),
    .sum(w320),
    .carry(w321)
);

full_adder FA_161(
    .a(w190),
    .b(w189),
    .cin(w321),
    .sum(w322),
    .carry(w323)
);

full_adder FA_162(
    .a(w192),
    .b(w191),
    .cin(w323),
    .sum(w324),
    .carry(w325)
);

full_adder FA_163(
    .a(w196),
    .b(w193),
    .cin(w325),
    .sum(w326),
    .carry(w327)
);

full_adder FA_164(
    .a(w197),
    .b(w274),
    .cin(w327),
    .sum(w328),
    .carry(w329)
);

full_adder FA_165(
    .a(w276),
    .b(w275),
    .cin(w329),
    .sum(w330),
    .carry(w331)
);

full_adder FA_166(
    .a(w278),
    .b(w277),
    .cin(w331),
    .sum(w332),
    .carry(w333)
);

full_adder FA_167(
    .a(w280),
    .b(w279),
    .cin(w333),
    .sum(w334),
    .carry(w335)
);

full_adder FA_168(
    .a(w282),
    .b(w281),
    .cin(w335),
    .sum(w336),
    .carry(w337)
);

full_adder FA_169(
    .a(w284),
    .b(w283),
    .cin(w337),
    .sum(w338),
    .carry(w339)
);

full_adder FA_170(
    .a(w286),
    .b(w285),
    .cin(w339),
    .sum(w340),
    .carry(w341)
);

full_adder FA_171(
    .a(w288),
    .b(w287),
    .cin(w341),
    .sum(w342),
    .carry(w343)
);

full_adder FA_172(
    .a(w290),
    .b(w289),
    .cin(w343),
    .sum(w344),
    .carry(w345)
);

full_adder FA_173(
    .a(w292),
    .b(w291),
    .cin(w345),
    .sum(w346),
    .carry(w347)
);

full_adder FA_174(
    .a(w294),
    .b(w293),
    .cin(w347),
    .sum(w348),
    .carry(w349)
);

full_adder FA_175(
    .a(w296),
    .b(w295),
    .cin(w349),
    .sum(w350),
    .carry(w351)
);

full_adder FA_176(
    .a(w298),
    .b(w297),
    .cin(w351),
    .sum(w352),
    .carry(w353)
);

full_adder FA_177(
    .a(w300),
    .b(w299),
    .cin(w353),
    .sum(w354),
    .carry(w355)
);

full_adder FA_178(
    .a(w302),
    .b(w301),
    .cin(w355),
    .sum(w356),
    .carry(w357)
);

full_adder FA_179(
    .a(w304),
    .b(w303),
    .cin(w357),
    .sum(w358),
    .carry(w359)
);

full_adder FA_180(
    .a(w306),
    .b(w305),
    .cin(w359),
    .sum(w360),
    .carry(w361)
);

full_adder FA_181(
    .a(w308),
    .b(w307),
    .cin(w361),
    .sum(w362),
    .carry(w363)
);

full_adder FA_182(
    .a(w310),
    .b(w309),
    .cin(w363),
    .sum(w364),
    .carry(w365)
);

full_adder FA_183(
    .a(w312),
    .b(w311),
    .cin(w365),
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
`timescale 1ns/1ps
`default_nettype none

module baugh_wooley_dadda_16 (
   input wire signed [15:0] A,
   input wire signed [15:0] B,

   output wire signed [31:0] P
);

wire [511:0] ppg_matrix;
wire [31:0] bw_constant;

baugh_wooley_ppg #(
    .N(16)
) PPG (
    .A(A),
    .B(B),
    .ppg_matrix(ppg_matrix),
    .bw_constant(bw_constant)
);


assign rowA = {w911, w909, w907, w905, w903, w901, w899, w897, w895, w893, w891, w889, w887, w885, w883, w881, w879, w877, w875, w873, w871, w869, w867, w865, w863, w861, w859, w857, w855, w853, w790, w664};
assign rowB = {w912, w910, w908, w906, w904, w902, w900, w898, w896, w894, w892, w890, w888, w886, w884, w882, w880, w878, w876, w874, w872, w870, w868, w866, w864, w862, w860, w858, w856, w854, w852, w788};

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
wire w368;
wire w369;
wire w370;
wire w371;
wire w372;
wire w373;
wire w374;
wire w375;
wire w376;
wire w377;
wire w378;
wire w379;
wire w380;
wire w381;
wire w382;
wire w383;
wire w384;
wire w385;
wire w386;
wire w387;
wire w388;
wire w389;
wire w390;
wire w391;
wire w392;
wire w393;
wire w394;
wire w395;
wire w396;
wire w397;
wire w398;
wire w399;
wire w400;
wire w401;
wire w402;
wire w403;
wire w404;
wire w405;
wire w406;
wire w407;
wire w408;
wire w409;
wire w410;
wire w411;
wire w412;
wire w413;
wire w414;
wire w415;
wire w416;
wire w417;
wire w418;
wire w419;
wire w420;
wire w421;
wire w422;
wire w423;
wire w424;
wire w425;
wire w426;
wire w427;
wire w428;
wire w429;
wire w430;
wire w431;
wire w432;
wire w433;
wire w434;
wire w435;
wire w436;
wire w437;
wire w438;
wire w439;
wire w440;
wire w441;
wire w442;
wire w443;
wire w444;
wire w445;
wire w446;
wire w447;
wire w448;
wire w449;
wire w450;
wire w451;
wire w452;
wire w453;
wire w454;
wire w455;
wire w456;
wire w457;
wire w458;
wire w459;
wire w460;
wire w461;
wire w462;
wire w463;
wire w464;
wire w465;
wire w466;
wire w467;
wire w468;
wire w469;
wire w470;
wire w471;
wire w472;
wire w473;
wire w474;
wire w475;
wire w476;
wire w477;
wire w478;
wire w479;
wire w480;
wire w481;
wire w482;
wire w483;
wire w484;
wire w485;
wire w486;
wire w487;
wire w488;
wire w489;
wire w490;
wire w491;
wire w492;
wire w493;
wire w494;
wire w495;
wire w496;
wire w497;
wire w498;
wire w499;
wire w500;
wire w501;
wire w502;
wire w503;
wire w504;
wire w505;
wire w506;
wire w507;
wire w508;
wire w509;
wire w510;
wire w511;
wire w512;
wire w513;
wire w514;
wire w515;
wire w516;
wire w517;
wire w518;
wire w519;
wire w520;
wire w521;
wire w522;
wire w523;
wire w524;
wire w525;
wire w526;
wire w527;
wire w528;
wire w529;
wire w530;
wire w531;
wire w532;
wire w533;
wire w534;
wire w535;
wire w536;
wire w537;
wire w538;
wire w539;
wire w540;
wire w541;
wire w542;
wire w543;
wire w544;
wire w545;
wire w546;
wire w547;
wire w548;
wire w549;
wire w550;
wire w551;
wire w552;
wire w553;
wire w554;
wire w555;
wire w556;
wire w557;
wire w558;
wire w559;
wire w560;
wire w561;
wire w562;
wire w563;
wire w564;
wire w565;
wire w566;
wire w567;
wire w568;
wire w569;
wire w570;
wire w571;
wire w572;
wire w573;
wire w574;
wire w575;
wire w576;
wire w577;
wire w578;
wire w579;
wire w580;
wire w581;
wire w582;
wire w583;
wire w584;
wire w585;
wire w586;
wire w587;
wire w588;
wire w589;
wire w590;
wire w591;
wire w592;
wire w593;
wire w594;
wire w595;
wire w596;
wire w597;
wire w598;
wire w599;
wire w600;
wire w601;
wire w602;
wire w603;
wire w604;
wire w605;
wire w606;
wire w607;
wire w608;
wire w609;
wire w610;
wire w611;
wire w612;
wire w613;
wire w614;
wire w615;
wire w616;
wire w617;
wire w618;
wire w619;
wire w620;
wire w621;
wire w622;
wire w623;
wire w624;
wire w625;
wire w626;
wire w627;
wire w628;
wire w629;
wire w630;
wire w631;
wire w632;
wire w633;
wire w634;
wire w635;
wire w636;
wire w637;
wire w638;
wire w639;
wire w640;
wire w641;
wire w642;
wire w643;
wire w644;
wire w645;
wire w646;
wire w647;
wire w648;
wire w649;
wire w650;
wire w651;
wire w652;
wire w653;
wire w654;
wire w655;
wire w656;
wire w657;
wire w658;
wire w659;
wire w660;
wire w661;
wire w662;
wire w663;
wire w664;
wire w665;
wire w666;
wire w667;
wire w668;
wire w669;
wire w670;
wire w671;
wire w672;
wire w673;
wire w674;
wire w675;
wire w676;
wire w677;
wire w678;
wire w679;
wire w680;
wire w681;
wire w682;
wire w683;
wire w684;
wire w685;
wire w686;
wire w687;
wire w688;
wire w689;
wire w690;
wire w691;
wire w692;
wire w693;
wire w694;
wire w695;
wire w696;
wire w697;
wire w698;
wire w699;
wire w700;
wire w701;
wire w702;
wire w703;
wire w704;
wire w705;
wire w706;
wire w707;
wire w708;
wire w709;
wire w710;
wire w711;
wire w712;
wire w713;
wire w714;
wire w715;
wire w716;
wire w717;
wire w718;
wire w719;
wire w720;
wire w721;
wire w722;
wire w723;
wire w724;
wire w725;
wire w726;
wire w727;
wire w728;
wire w729;
wire w730;
wire w731;
wire w732;
wire w733;
wire w734;
wire w735;
wire w736;
wire w737;
wire w738;
wire w739;
wire w740;
wire w741;
wire w742;
wire w743;
wire w744;
wire w745;
wire w746;
wire w747;
wire w748;
wire w749;
wire w750;
wire w751;
wire w752;
wire w753;
wire w754;
wire w755;
wire w756;
wire w757;
wire w758;
wire w759;
wire w760;
wire w761;
wire w762;
wire w763;
wire w764;
wire w765;
wire w766;
wire w767;
wire w768;
wire w769;
wire w770;
wire w771;
wire w772;
wire w773;
wire w774;
wire w775;
wire w776;
wire w777;
wire w778;
wire w779;
wire w780;
wire w781;
wire w782;
wire w783;
wire w784;
wire w785;
wire w786;
wire w787;
wire w788;
wire w789;
wire w790;
wire w791;
wire w792;
wire w793;
wire w794;
wire w795;
wire w796;
wire w797;
wire w798;
wire w799;
wire w800;
wire w801;
wire w802;
wire w803;
wire w804;
wire w805;
wire w806;
wire w807;
wire w808;
wire w809;
wire w810;
wire w811;
wire w812;
wire w813;
wire w814;
wire w815;
wire w816;
wire w817;
wire w818;
wire w819;
wire w820;
wire w821;
wire w822;
wire w823;
wire w824;
wire w825;
wire w826;
wire w827;
wire w828;
wire w829;
wire w830;
wire w831;
wire w832;
wire w833;
wire w834;
wire w835;
wire w836;
wire w837;
wire w838;
wire w839;
wire w840;
wire w841;
wire w842;
wire w843;
wire w844;
wire w845;
wire w846;
wire w847;
wire w848;
wire w849;
wire w850;
wire w851;
wire w852;
wire w853;
wire w854;
wire w855;
wire w856;
wire w857;
wire w858;
wire w859;
wire w860;
wire w861;
wire w862;
wire w863;
wire w864;
wire w865;
wire w866;
wire w867;
wire w868;
wire w869;
wire w870;
wire w871;
wire w872;
wire w873;
wire w874;
wire w875;
wire w876;
wire w877;
wire w878;
wire w879;
wire w880;
wire w881;
wire w882;
wire w883;
wire w884;
wire w885;
wire w886;
wire w887;
wire w888;
wire w889;
wire w890;
wire w891;
wire w892;
wire w893;
wire w894;
wire w895;
wire w896;
wire w897;
wire w898;
wire w899;
wire w900;
wire w901;
wire w902;
wire w903;
wire w904;
wire w905;
wire w906;
wire w907;
wire w908;
wire w909;
wire w910;
wire w911;
wire w912;
wire w913;
wire [31:0] rowA;
wire [31:0] rowB;

full_adder FA_0(
    .a(ppg_matrix[0]),
    .b(ppg_matrix[32]),
    .cin(ppg_matrix[64]),
    .sum(w0),
    .carry(w1)
);

full_adder FA_1(
    .a(ppg_matrix[1]),
    .b(ppg_matrix[33]),
    .cin(ppg_matrix[65]),
    .sum(w2),
    .carry(w3)
);

half_adder HA_0(
    .a(ppg_matrix[97]),
    .b(ppg_matrix[129]),
    .sum(w4),
    .carry(w5)
);

full_adder FA_2(
    .a(ppg_matrix[2]),
    .b(ppg_matrix[34]),
    .cin(ppg_matrix[66]),
    .sum(w6),
    .carry(w7)
);

full_adder FA_3(
    .a(ppg_matrix[98]),
    .b(ppg_matrix[130]),
    .cin(ppg_matrix[162]),
    .sum(w8),
    .carry(w9)
);

full_adder FA_4(
    .a(ppg_matrix[3]),
    .b(ppg_matrix[35]),
    .cin(ppg_matrix[67]),
    .sum(w10),
    .carry(w11)
);

full_adder FA_5(
    .a(ppg_matrix[99]),
    .b(ppg_matrix[131]),
    .cin(ppg_matrix[163]),
    .sum(w12),
    .carry(w13)
);

full_adder FA_6(
    .a(ppg_matrix[4]),
    .b(ppg_matrix[36]),
    .cin(ppg_matrix[68]),
    .sum(w14),
    .carry(w15)
);

full_adder FA_7(
    .a(ppg_matrix[100]),
    .b(ppg_matrix[132]),
    .cin(ppg_matrix[164]),
    .sum(w16),
    .carry(w17)
);

full_adder FA_8(
    .a(ppg_matrix[5]),
    .b(ppg_matrix[37]),
    .cin(ppg_matrix[69]),
    .sum(w18),
    .carry(w19)
);

full_adder FA_9(
    .a(ppg_matrix[101]),
    .b(ppg_matrix[133]),
    .cin(ppg_matrix[165]),
    .sum(w20),
    .carry(w21)
);

full_adder FA_10(
    .a(ppg_matrix[6]),
    .b(ppg_matrix[38]),
    .cin(ppg_matrix[70]),
    .sum(w22),
    .carry(w23)
);

full_adder FA_11(
    .a(ppg_matrix[102]),
    .b(ppg_matrix[134]),
    .cin(ppg_matrix[166]),
    .sum(w24),
    .carry(w25)
);

full_adder FA_12(
    .a(ppg_matrix[7]),
    .b(ppg_matrix[39]),
    .cin(ppg_matrix[71]),
    .sum(w26),
    .carry(w27)
);

full_adder FA_13(
    .a(ppg_matrix[103]),
    .b(ppg_matrix[135]),
    .cin(ppg_matrix[167]),
    .sum(w28),
    .carry(w29)
);

full_adder FA_14(
    .a(ppg_matrix[8]),
    .b(ppg_matrix[40]),
    .cin(ppg_matrix[72]),
    .sum(w30),
    .carry(w31)
);

full_adder FA_15(
    .a(ppg_matrix[104]),
    .b(ppg_matrix[136]),
    .cin(ppg_matrix[168]),
    .sum(w32),
    .carry(w33)
);

full_adder FA_16(
    .a(ppg_matrix[9]),
    .b(ppg_matrix[41]),
    .cin(ppg_matrix[73]),
    .sum(w34),
    .carry(w35)
);

full_adder FA_17(
    .a(ppg_matrix[105]),
    .b(ppg_matrix[137]),
    .cin(ppg_matrix[169]),
    .sum(w36),
    .carry(w37)
);

full_adder FA_18(
    .a(ppg_matrix[10]),
    .b(ppg_matrix[42]),
    .cin(ppg_matrix[74]),
    .sum(w38),
    .carry(w39)
);

full_adder FA_19(
    .a(ppg_matrix[106]),
    .b(ppg_matrix[138]),
    .cin(ppg_matrix[170]),
    .sum(w40),
    .carry(w41)
);

full_adder FA_20(
    .a(ppg_matrix[11]),
    .b(ppg_matrix[43]),
    .cin(ppg_matrix[75]),
    .sum(w42),
    .carry(w43)
);

full_adder FA_21(
    .a(ppg_matrix[107]),
    .b(ppg_matrix[139]),
    .cin(ppg_matrix[171]),
    .sum(w44),
    .carry(w45)
);

full_adder FA_22(
    .a(ppg_matrix[12]),
    .b(ppg_matrix[44]),
    .cin(ppg_matrix[76]),
    .sum(w46),
    .carry(w47)
);

full_adder FA_23(
    .a(ppg_matrix[108]),
    .b(ppg_matrix[140]),
    .cin(ppg_matrix[172]),
    .sum(w48),
    .carry(w49)
);

full_adder FA_24(
    .a(ppg_matrix[13]),
    .b(ppg_matrix[45]),
    .cin(ppg_matrix[77]),
    .sum(w50),
    .carry(w51)
);

full_adder FA_25(
    .a(ppg_matrix[109]),
    .b(ppg_matrix[141]),
    .cin(ppg_matrix[173]),
    .sum(w52),
    .carry(w53)
);

full_adder FA_26(
    .a(ppg_matrix[14]),
    .b(ppg_matrix[46]),
    .cin(ppg_matrix[78]),
    .sum(w54),
    .carry(w55)
);

full_adder FA_27(
    .a(ppg_matrix[110]),
    .b(ppg_matrix[142]),
    .cin(ppg_matrix[174]),
    .sum(w56),
    .carry(w57)
);

full_adder FA_28(
    .a(ppg_matrix[15]),
    .b(ppg_matrix[47]),
    .cin(ppg_matrix[79]),
    .sum(w58),
    .carry(w59)
);

full_adder FA_29(
    .a(ppg_matrix[111]),
    .b(ppg_matrix[143]),
    .cin(ppg_matrix[175]),
    .sum(w60),
    .carry(w61)
);

full_adder FA_30(
    .a(ppg_matrix[16]),
    .b(ppg_matrix[48]),
    .cin(ppg_matrix[80]),
    .sum(w62),
    .carry(w63)
);

full_adder FA_31(
    .a(ppg_matrix[112]),
    .b(ppg_matrix[144]),
    .cin(ppg_matrix[176]),
    .sum(w64),
    .carry(w65)
);

full_adder FA_32(
    .a(ppg_matrix[17]),
    .b(ppg_matrix[49]),
    .cin(ppg_matrix[81]),
    .sum(w66),
    .carry(w67)
);

full_adder FA_33(
    .a(ppg_matrix[113]),
    .b(ppg_matrix[145]),
    .cin(ppg_matrix[177]),
    .sum(w68),
    .carry(w69)
);

full_adder FA_34(
    .a(ppg_matrix[18]),
    .b(ppg_matrix[50]),
    .cin(ppg_matrix[82]),
    .sum(w70),
    .carry(w71)
);

full_adder FA_35(
    .a(ppg_matrix[114]),
    .b(ppg_matrix[146]),
    .cin(ppg_matrix[178]),
    .sum(w72),
    .carry(w73)
);

full_adder FA_36(
    .a(ppg_matrix[19]),
    .b(ppg_matrix[51]),
    .cin(ppg_matrix[83]),
    .sum(w74),
    .carry(w75)
);

full_adder FA_37(
    .a(ppg_matrix[115]),
    .b(ppg_matrix[147]),
    .cin(ppg_matrix[179]),
    .sum(w76),
    .carry(w77)
);

full_adder FA_38(
    .a(ppg_matrix[20]),
    .b(ppg_matrix[52]),
    .cin(ppg_matrix[84]),
    .sum(w78),
    .carry(w79)
);

full_adder FA_39(
    .a(ppg_matrix[116]),
    .b(ppg_matrix[148]),
    .cin(ppg_matrix[180]),
    .sum(w80),
    .carry(w81)
);

full_adder FA_40(
    .a(ppg_matrix[21]),
    .b(ppg_matrix[53]),
    .cin(ppg_matrix[85]),
    .sum(w82),
    .carry(w83)
);

full_adder FA_41(
    .a(ppg_matrix[117]),
    .b(ppg_matrix[149]),
    .cin(ppg_matrix[181]),
    .sum(w84),
    .carry(w85)
);

full_adder FA_42(
    .a(ppg_matrix[22]),
    .b(ppg_matrix[54]),
    .cin(ppg_matrix[86]),
    .sum(w86),
    .carry(w87)
);

full_adder FA_43(
    .a(ppg_matrix[118]),
    .b(ppg_matrix[150]),
    .cin(ppg_matrix[182]),
    .sum(w88),
    .carry(w89)
);

full_adder FA_44(
    .a(ppg_matrix[23]),
    .b(ppg_matrix[55]),
    .cin(ppg_matrix[87]),
    .sum(w90),
    .carry(w91)
);

full_adder FA_45(
    .a(ppg_matrix[119]),
    .b(ppg_matrix[151]),
    .cin(ppg_matrix[183]),
    .sum(w92),
    .carry(w93)
);

full_adder FA_46(
    .a(ppg_matrix[24]),
    .b(ppg_matrix[56]),
    .cin(ppg_matrix[88]),
    .sum(w94),
    .carry(w95)
);

full_adder FA_47(
    .a(ppg_matrix[120]),
    .b(ppg_matrix[152]),
    .cin(ppg_matrix[184]),
    .sum(w96),
    .carry(w97)
);

full_adder FA_48(
    .a(ppg_matrix[25]),
    .b(ppg_matrix[57]),
    .cin(ppg_matrix[89]),
    .sum(w98),
    .carry(w99)
);

full_adder FA_49(
    .a(ppg_matrix[121]),
    .b(ppg_matrix[153]),
    .cin(ppg_matrix[185]),
    .sum(w100),
    .carry(w101)
);

full_adder FA_50(
    .a(ppg_matrix[26]),
    .b(ppg_matrix[58]),
    .cin(ppg_matrix[90]),
    .sum(w102),
    .carry(w103)
);

full_adder FA_51(
    .a(ppg_matrix[122]),
    .b(ppg_matrix[154]),
    .cin(ppg_matrix[186]),
    .sum(w104),
    .carry(w105)
);

full_adder FA_52(
    .a(ppg_matrix[27]),
    .b(ppg_matrix[59]),
    .cin(ppg_matrix[91]),
    .sum(w106),
    .carry(w107)
);

full_adder FA_53(
    .a(ppg_matrix[123]),
    .b(ppg_matrix[155]),
    .cin(ppg_matrix[187]),
    .sum(w108),
    .carry(w109)
);

full_adder FA_54(
    .a(ppg_matrix[28]),
    .b(ppg_matrix[60]),
    .cin(ppg_matrix[92]),
    .sum(w110),
    .carry(w111)
);

full_adder FA_55(
    .a(ppg_matrix[124]),
    .b(ppg_matrix[156]),
    .cin(ppg_matrix[188]),
    .sum(w112),
    .carry(w113)
);

full_adder FA_56(
    .a(ppg_matrix[29]),
    .b(ppg_matrix[61]),
    .cin(ppg_matrix[93]),
    .sum(w114),
    .carry(w115)
);

full_adder FA_57(
    .a(ppg_matrix[125]),
    .b(ppg_matrix[157]),
    .cin(ppg_matrix[189]),
    .sum(w116),
    .carry(w117)
);

full_adder FA_58(
    .a(ppg_matrix[30]),
    .b(ppg_matrix[62]),
    .cin(ppg_matrix[94]),
    .sum(w118),
    .carry(w119)
);

full_adder FA_59(
    .a(ppg_matrix[126]),
    .b(ppg_matrix[158]),
    .cin(ppg_matrix[190]),
    .sum(w120),
    .carry(w121)
);

full_adder FA_60(
    .a(ppg_matrix[31]),
    .b(ppg_matrix[63]),
    .cin(ppg_matrix[95]),
    .sum(w122),
    .carry(w123)
);

full_adder FA_61(
    .a(ppg_matrix[127]),
    .b(ppg_matrix[159]),
    .cin(ppg_matrix[191]),
    .sum(w124),
    .carry(w125)
);

full_adder FA_62(
    .a(ppg_matrix[96]),
    .b(ppg_matrix[128]),
    .cin(ppg_matrix[160]),
    .sum(w126),
    .carry(w127)
);

full_adder FA_63(
    .a(ppg_matrix[192]),
    .b(ppg_matrix[224]),
    .cin(ppg_matrix[256]),
    .sum(w128),
    .carry(w129)
);

full_adder FA_64(
    .a(ppg_matrix[161]),
    .b(ppg_matrix[193]),
    .cin(ppg_matrix[225]),
    .sum(w130),
    .carry(w131)
);

full_adder FA_65(
    .a(ppg_matrix[257]),
    .b(ppg_matrix[289]),
    .cin(ppg_matrix[321]),
    .sum(w132),
    .carry(w133)
);

half_adder HA_1(
    .a(ppg_matrix[353]),
    .b(ppg_matrix[385]),
    .sum(w134),
    .carry(w135)
);

full_adder FA_66(
    .a(ppg_matrix[194]),
    .b(ppg_matrix[226]),
    .cin(ppg_matrix[258]),
    .sum(w136),
    .carry(w137)
);

full_adder FA_67(
    .a(ppg_matrix[290]),
    .b(ppg_matrix[322]),
    .cin(ppg_matrix[354]),
    .sum(w138),
    .carry(w139)
);

full_adder FA_68(
    .a(ppg_matrix[386]),
    .b(ppg_matrix[418]),
    .cin(ppg_matrix[450]),
    .sum(w140),
    .carry(w141)
);

full_adder FA_69(
    .a(ppg_matrix[195]),
    .b(ppg_matrix[227]),
    .cin(ppg_matrix[259]),
    .sum(w142),
    .carry(w143)
);

full_adder FA_70(
    .a(ppg_matrix[291]),
    .b(ppg_matrix[323]),
    .cin(ppg_matrix[355]),
    .sum(w144),
    .carry(w145)
);

full_adder FA_71(
    .a(ppg_matrix[387]),
    .b(ppg_matrix[419]),
    .cin(ppg_matrix[451]),
    .sum(w146),
    .carry(w147)
);

full_adder FA_72(
    .a(ppg_matrix[196]),
    .b(ppg_matrix[228]),
    .cin(ppg_matrix[260]),
    .sum(w148),
    .carry(w149)
);

full_adder FA_73(
    .a(ppg_matrix[292]),
    .b(ppg_matrix[324]),
    .cin(ppg_matrix[356]),
    .sum(w150),
    .carry(w151)
);

full_adder FA_74(
    .a(ppg_matrix[388]),
    .b(ppg_matrix[420]),
    .cin(ppg_matrix[452]),
    .sum(w152),
    .carry(w153)
);

full_adder FA_75(
    .a(ppg_matrix[197]),
    .b(ppg_matrix[229]),
    .cin(ppg_matrix[261]),
    .sum(w154),
    .carry(w155)
);

full_adder FA_76(
    .a(ppg_matrix[293]),
    .b(ppg_matrix[325]),
    .cin(ppg_matrix[357]),
    .sum(w156),
    .carry(w157)
);

full_adder FA_77(
    .a(ppg_matrix[389]),
    .b(ppg_matrix[421]),
    .cin(ppg_matrix[453]),
    .sum(w158),
    .carry(w159)
);

full_adder FA_78(
    .a(ppg_matrix[198]),
    .b(ppg_matrix[230]),
    .cin(ppg_matrix[262]),
    .sum(w160),
    .carry(w161)
);

full_adder FA_79(
    .a(ppg_matrix[294]),
    .b(ppg_matrix[326]),
    .cin(ppg_matrix[358]),
    .sum(w162),
    .carry(w163)
);

full_adder FA_80(
    .a(ppg_matrix[390]),
    .b(ppg_matrix[422]),
    .cin(ppg_matrix[454]),
    .sum(w164),
    .carry(w165)
);

full_adder FA_81(
    .a(ppg_matrix[199]),
    .b(ppg_matrix[231]),
    .cin(ppg_matrix[263]),
    .sum(w166),
    .carry(w167)
);

full_adder FA_82(
    .a(ppg_matrix[295]),
    .b(ppg_matrix[327]),
    .cin(ppg_matrix[359]),
    .sum(w168),
    .carry(w169)
);

full_adder FA_83(
    .a(ppg_matrix[391]),
    .b(ppg_matrix[423]),
    .cin(ppg_matrix[455]),
    .sum(w170),
    .carry(w171)
);

full_adder FA_84(
    .a(ppg_matrix[200]),
    .b(ppg_matrix[232]),
    .cin(ppg_matrix[264]),
    .sum(w172),
    .carry(w173)
);

full_adder FA_85(
    .a(ppg_matrix[296]),
    .b(ppg_matrix[328]),
    .cin(ppg_matrix[360]),
    .sum(w174),
    .carry(w175)
);

full_adder FA_86(
    .a(ppg_matrix[392]),
    .b(ppg_matrix[424]),
    .cin(ppg_matrix[456]),
    .sum(w176),
    .carry(w177)
);

full_adder FA_87(
    .a(ppg_matrix[201]),
    .b(ppg_matrix[233]),
    .cin(ppg_matrix[265]),
    .sum(w178),
    .carry(w179)
);

full_adder FA_88(
    .a(ppg_matrix[297]),
    .b(ppg_matrix[329]),
    .cin(ppg_matrix[361]),
    .sum(w180),
    .carry(w181)
);

full_adder FA_89(
    .a(ppg_matrix[393]),
    .b(ppg_matrix[425]),
    .cin(ppg_matrix[457]),
    .sum(w182),
    .carry(w183)
);

full_adder FA_90(
    .a(ppg_matrix[202]),
    .b(ppg_matrix[234]),
    .cin(ppg_matrix[266]),
    .sum(w184),
    .carry(w185)
);

full_adder FA_91(
    .a(ppg_matrix[298]),
    .b(ppg_matrix[330]),
    .cin(ppg_matrix[362]),
    .sum(w186),
    .carry(w187)
);

full_adder FA_92(
    .a(ppg_matrix[394]),
    .b(ppg_matrix[426]),
    .cin(ppg_matrix[458]),
    .sum(w188),
    .carry(w189)
);

full_adder FA_93(
    .a(ppg_matrix[203]),
    .b(ppg_matrix[235]),
    .cin(ppg_matrix[267]),
    .sum(w190),
    .carry(w191)
);

full_adder FA_94(
    .a(ppg_matrix[299]),
    .b(ppg_matrix[331]),
    .cin(ppg_matrix[363]),
    .sum(w192),
    .carry(w193)
);

full_adder FA_95(
    .a(ppg_matrix[395]),
    .b(ppg_matrix[427]),
    .cin(ppg_matrix[459]),
    .sum(w194),
    .carry(w195)
);

full_adder FA_96(
    .a(ppg_matrix[204]),
    .b(ppg_matrix[236]),
    .cin(ppg_matrix[268]),
    .sum(w196),
    .carry(w197)
);

full_adder FA_97(
    .a(ppg_matrix[300]),
    .b(ppg_matrix[332]),
    .cin(ppg_matrix[364]),
    .sum(w198),
    .carry(w199)
);

full_adder FA_98(
    .a(ppg_matrix[396]),
    .b(ppg_matrix[428]),
    .cin(ppg_matrix[460]),
    .sum(w200),
    .carry(w201)
);

full_adder FA_99(
    .a(ppg_matrix[205]),
    .b(ppg_matrix[237]),
    .cin(ppg_matrix[269]),
    .sum(w202),
    .carry(w203)
);

full_adder FA_100(
    .a(ppg_matrix[301]),
    .b(ppg_matrix[333]),
    .cin(ppg_matrix[365]),
    .sum(w204),
    .carry(w205)
);

full_adder FA_101(
    .a(ppg_matrix[397]),
    .b(ppg_matrix[429]),
    .cin(ppg_matrix[461]),
    .sum(w206),
    .carry(w207)
);

full_adder FA_102(
    .a(ppg_matrix[206]),
    .b(ppg_matrix[238]),
    .cin(ppg_matrix[270]),
    .sum(w208),
    .carry(w209)
);

full_adder FA_103(
    .a(ppg_matrix[302]),
    .b(ppg_matrix[334]),
    .cin(ppg_matrix[366]),
    .sum(w210),
    .carry(w211)
);

full_adder FA_104(
    .a(ppg_matrix[398]),
    .b(ppg_matrix[430]),
    .cin(ppg_matrix[462]),
    .sum(w212),
    .carry(w213)
);

full_adder FA_105(
    .a(ppg_matrix[207]),
    .b(ppg_matrix[239]),
    .cin(ppg_matrix[271]),
    .sum(w214),
    .carry(w215)
);

full_adder FA_106(
    .a(ppg_matrix[303]),
    .b(ppg_matrix[335]),
    .cin(ppg_matrix[367]),
    .sum(w216),
    .carry(w217)
);

full_adder FA_107(
    .a(ppg_matrix[399]),
    .b(ppg_matrix[431]),
    .cin(ppg_matrix[463]),
    .sum(w218),
    .carry(w219)
);

full_adder FA_108(
    .a(ppg_matrix[208]),
    .b(ppg_matrix[240]),
    .cin(ppg_matrix[272]),
    .sum(w220),
    .carry(w221)
);

full_adder FA_109(
    .a(ppg_matrix[304]),
    .b(ppg_matrix[336]),
    .cin(ppg_matrix[368]),
    .sum(w222),
    .carry(w223)
);

full_adder FA_110(
    .a(ppg_matrix[400]),
    .b(ppg_matrix[432]),
    .cin(ppg_matrix[464]),
    .sum(w224),
    .carry(w225)
);

full_adder FA_111(
    .a(ppg_matrix[209]),
    .b(ppg_matrix[241]),
    .cin(ppg_matrix[273]),
    .sum(w226),
    .carry(w227)
);

full_adder FA_112(
    .a(ppg_matrix[305]),
    .b(ppg_matrix[337]),
    .cin(ppg_matrix[369]),
    .sum(w228),
    .carry(w229)
);

full_adder FA_113(
    .a(ppg_matrix[401]),
    .b(ppg_matrix[433]),
    .cin(ppg_matrix[465]),
    .sum(w230),
    .carry(w231)
);

full_adder FA_114(
    .a(ppg_matrix[210]),
    .b(ppg_matrix[242]),
    .cin(ppg_matrix[274]),
    .sum(w232),
    .carry(w233)
);

full_adder FA_115(
    .a(ppg_matrix[306]),
    .b(ppg_matrix[338]),
    .cin(ppg_matrix[370]),
    .sum(w234),
    .carry(w235)
);

full_adder FA_116(
    .a(ppg_matrix[402]),
    .b(ppg_matrix[434]),
    .cin(ppg_matrix[466]),
    .sum(w236),
    .carry(w237)
);

full_adder FA_117(
    .a(ppg_matrix[211]),
    .b(ppg_matrix[243]),
    .cin(ppg_matrix[275]),
    .sum(w238),
    .carry(w239)
);

full_adder FA_118(
    .a(ppg_matrix[307]),
    .b(ppg_matrix[339]),
    .cin(ppg_matrix[371]),
    .sum(w240),
    .carry(w241)
);

full_adder FA_119(
    .a(ppg_matrix[403]),
    .b(ppg_matrix[435]),
    .cin(ppg_matrix[467]),
    .sum(w242),
    .carry(w243)
);

full_adder FA_120(
    .a(ppg_matrix[212]),
    .b(ppg_matrix[244]),
    .cin(ppg_matrix[276]),
    .sum(w244),
    .carry(w245)
);

full_adder FA_121(
    .a(ppg_matrix[308]),
    .b(ppg_matrix[340]),
    .cin(ppg_matrix[372]),
    .sum(w246),
    .carry(w247)
);

full_adder FA_122(
    .a(ppg_matrix[404]),
    .b(ppg_matrix[436]),
    .cin(ppg_matrix[468]),
    .sum(w248),
    .carry(w249)
);

full_adder FA_123(
    .a(ppg_matrix[213]),
    .b(ppg_matrix[245]),
    .cin(ppg_matrix[277]),
    .sum(w250),
    .carry(w251)
);

full_adder FA_124(
    .a(ppg_matrix[309]),
    .b(ppg_matrix[341]),
    .cin(ppg_matrix[373]),
    .sum(w252),
    .carry(w253)
);

full_adder FA_125(
    .a(ppg_matrix[405]),
    .b(ppg_matrix[437]),
    .cin(ppg_matrix[469]),
    .sum(w254),
    .carry(w255)
);

full_adder FA_126(
    .a(ppg_matrix[214]),
    .b(ppg_matrix[246]),
    .cin(ppg_matrix[278]),
    .sum(w256),
    .carry(w257)
);

full_adder FA_127(
    .a(ppg_matrix[310]),
    .b(ppg_matrix[342]),
    .cin(ppg_matrix[374]),
    .sum(w258),
    .carry(w259)
);

full_adder FA_128(
    .a(ppg_matrix[406]),
    .b(ppg_matrix[438]),
    .cin(ppg_matrix[470]),
    .sum(w260),
    .carry(w261)
);

full_adder FA_129(
    .a(ppg_matrix[215]),
    .b(ppg_matrix[247]),
    .cin(ppg_matrix[279]),
    .sum(w262),
    .carry(w263)
);

full_adder FA_130(
    .a(ppg_matrix[311]),
    .b(ppg_matrix[343]),
    .cin(ppg_matrix[375]),
    .sum(w264),
    .carry(w265)
);

full_adder FA_131(
    .a(ppg_matrix[407]),
    .b(ppg_matrix[439]),
    .cin(ppg_matrix[471]),
    .sum(w266),
    .carry(w267)
);

full_adder FA_132(
    .a(ppg_matrix[216]),
    .b(ppg_matrix[248]),
    .cin(ppg_matrix[280]),
    .sum(w268),
    .carry(w269)
);

full_adder FA_133(
    .a(ppg_matrix[312]),
    .b(ppg_matrix[344]),
    .cin(ppg_matrix[376]),
    .sum(w270),
    .carry(w271)
);

full_adder FA_134(
    .a(ppg_matrix[408]),
    .b(ppg_matrix[440]),
    .cin(ppg_matrix[472]),
    .sum(w272),
    .carry(w273)
);

full_adder FA_135(
    .a(ppg_matrix[217]),
    .b(ppg_matrix[249]),
    .cin(ppg_matrix[281]),
    .sum(w274),
    .carry(w275)
);

full_adder FA_136(
    .a(ppg_matrix[313]),
    .b(ppg_matrix[345]),
    .cin(ppg_matrix[377]),
    .sum(w276),
    .carry(w277)
);

full_adder FA_137(
    .a(ppg_matrix[409]),
    .b(ppg_matrix[441]),
    .cin(ppg_matrix[473]),
    .sum(w278),
    .carry(w279)
);

full_adder FA_138(
    .a(ppg_matrix[218]),
    .b(ppg_matrix[250]),
    .cin(ppg_matrix[282]),
    .sum(w280),
    .carry(w281)
);

full_adder FA_139(
    .a(ppg_matrix[314]),
    .b(ppg_matrix[346]),
    .cin(ppg_matrix[378]),
    .sum(w282),
    .carry(w283)
);

full_adder FA_140(
    .a(ppg_matrix[410]),
    .b(ppg_matrix[442]),
    .cin(ppg_matrix[474]),
    .sum(w284),
    .carry(w285)
);

full_adder FA_141(
    .a(ppg_matrix[219]),
    .b(ppg_matrix[251]),
    .cin(ppg_matrix[283]),
    .sum(w286),
    .carry(w287)
);

full_adder FA_142(
    .a(ppg_matrix[315]),
    .b(ppg_matrix[347]),
    .cin(ppg_matrix[379]),
    .sum(w288),
    .carry(w289)
);

full_adder FA_143(
    .a(ppg_matrix[411]),
    .b(ppg_matrix[443]),
    .cin(ppg_matrix[475]),
    .sum(w290),
    .carry(w291)
);

full_adder FA_144(
    .a(ppg_matrix[220]),
    .b(ppg_matrix[252]),
    .cin(ppg_matrix[284]),
    .sum(w292),
    .carry(w293)
);

full_adder FA_145(
    .a(ppg_matrix[316]),
    .b(ppg_matrix[348]),
    .cin(ppg_matrix[380]),
    .sum(w294),
    .carry(w295)
);

full_adder FA_146(
    .a(ppg_matrix[412]),
    .b(ppg_matrix[444]),
    .cin(ppg_matrix[476]),
    .sum(w296),
    .carry(w297)
);

full_adder FA_147(
    .a(ppg_matrix[221]),
    .b(ppg_matrix[253]),
    .cin(ppg_matrix[285]),
    .sum(w298),
    .carry(w299)
);

full_adder FA_148(
    .a(ppg_matrix[317]),
    .b(ppg_matrix[349]),
    .cin(ppg_matrix[381]),
    .sum(w300),
    .carry(w301)
);

full_adder FA_149(
    .a(ppg_matrix[413]),
    .b(ppg_matrix[445]),
    .cin(ppg_matrix[477]),
    .sum(w302),
    .carry(w303)
);

full_adder FA_150(
    .a(ppg_matrix[222]),
    .b(ppg_matrix[254]),
    .cin(ppg_matrix[286]),
    .sum(w304),
    .carry(w305)
);

full_adder FA_151(
    .a(ppg_matrix[318]),
    .b(ppg_matrix[350]),
    .cin(ppg_matrix[382]),
    .sum(w306),
    .carry(w307)
);

full_adder FA_152(
    .a(ppg_matrix[414]),
    .b(ppg_matrix[446]),
    .cin(ppg_matrix[478]),
    .sum(w308),
    .carry(w309)
);

full_adder FA_153(
    .a(ppg_matrix[223]),
    .b(ppg_matrix[255]),
    .cin(ppg_matrix[287]),
    .sum(w310),
    .carry(w311)
);

full_adder FA_154(
    .a(ppg_matrix[319]),
    .b(ppg_matrix[351]),
    .cin(ppg_matrix[383]),
    .sum(w312),
    .carry(w313)
);

full_adder FA_155(
    .a(ppg_matrix[415]),
    .b(ppg_matrix[447]),
    .cin(ppg_matrix[479]),
    .sum(w314),
    .carry(w315)
);

full_adder FA_156(
    .a(ppg_matrix[288]),
    .b(ppg_matrix[320]),
    .cin(ppg_matrix[352]),
    .sum(w316),
    .carry(w317)
);

half_adder HA_2(
    .a(ppg_matrix[384]),
    .b(ppg_matrix[416]),
    .sum(w318),
    .carry(w319)
);

full_adder FA_157(
    .a(ppg_matrix[417]),
    .b(ppg_matrix[449]),
    .cin(ppg_matrix[481]),
    .sum(w320),
    .carry(w321)
);

full_adder FA_158(
    .a(w1),
    .b(w2),
    .cin(w4),
    .sum(w322),
    .carry(w323)
);

half_adder HA_3(
    .a(w127),
    .b(w129),
    .sum(w324),
    .carry(w325)
);

full_adder FA_159(
    .a(ppg_matrix[482]),
    .b(w3),
    .cin(w5),
    .sum(w326),
    .carry(w327)
);

full_adder FA_160(
    .a(w6),
    .b(w8),
    .cin(w131),
    .sum(w328),
    .carry(w329)
);

full_adder FA_161(
    .a(w133),
    .b(w135),
    .cin(w136),
    .sum(w330),
    .carry(w331)
);

full_adder FA_162(
    .a(ppg_matrix[483]),
    .b(w7),
    .cin(w9),
    .sum(w332),
    .carry(w333)
);

full_adder FA_163(
    .a(w10),
    .b(w12),
    .cin(w137),
    .sum(w334),
    .carry(w335)
);

full_adder FA_164(
    .a(w139),
    .b(w141),
    .cin(w142),
    .sum(w336),
    .carry(w337)
);

full_adder FA_165(
    .a(ppg_matrix[484]),
    .b(w11),
    .cin(w13),
    .sum(w338),
    .carry(w339)
);

full_adder FA_166(
    .a(w14),
    .b(w16),
    .cin(w143),
    .sum(w340),
    .carry(w341)
);

full_adder FA_167(
    .a(w145),
    .b(w147),
    .cin(w148),
    .sum(w342),
    .carry(w343)
);

full_adder FA_168(
    .a(ppg_matrix[485]),
    .b(w15),
    .cin(w17),
    .sum(w344),
    .carry(w345)
);

full_adder FA_169(
    .a(w18),
    .b(w20),
    .cin(w149),
    .sum(w346),
    .carry(w347)
);

full_adder FA_170(
    .a(w151),
    .b(w153),
    .cin(w154),
    .sum(w348),
    .carry(w349)
);

full_adder FA_171(
    .a(ppg_matrix[486]),
    .b(w19),
    .cin(w21),
    .sum(w350),
    .carry(w351)
);

full_adder FA_172(
    .a(w22),
    .b(w24),
    .cin(w155),
    .sum(w352),
    .carry(w353)
);

full_adder FA_173(
    .a(w157),
    .b(w159),
    .cin(w160),
    .sum(w354),
    .carry(w355)
);

full_adder FA_174(
    .a(ppg_matrix[487]),
    .b(w23),
    .cin(w25),
    .sum(w356),
    .carry(w357)
);

full_adder FA_175(
    .a(w26),
    .b(w28),
    .cin(w161),
    .sum(w358),
    .carry(w359)
);

full_adder FA_176(
    .a(w163),
    .b(w165),
    .cin(w166),
    .sum(w360),
    .carry(w361)
);

full_adder FA_177(
    .a(ppg_matrix[488]),
    .b(w27),
    .cin(w29),
    .sum(w362),
    .carry(w363)
);

full_adder FA_178(
    .a(w30),
    .b(w32),
    .cin(w167),
    .sum(w364),
    .carry(w365)
);

full_adder FA_179(
    .a(w169),
    .b(w171),
    .cin(w172),
    .sum(w366),
    .carry(w367)
);

full_adder FA_180(
    .a(ppg_matrix[489]),
    .b(w31),
    .cin(w33),
    .sum(w368),
    .carry(w369)
);

full_adder FA_181(
    .a(w34),
    .b(w36),
    .cin(w173),
    .sum(w370),
    .carry(w371)
);

full_adder FA_182(
    .a(w175),
    .b(w177),
    .cin(w178),
    .sum(w372),
    .carry(w373)
);

full_adder FA_183(
    .a(ppg_matrix[490]),
    .b(w35),
    .cin(w37),
    .sum(w374),
    .carry(w375)
);

full_adder FA_184(
    .a(w38),
    .b(w40),
    .cin(w179),
    .sum(w376),
    .carry(w377)
);

full_adder FA_185(
    .a(w181),
    .b(w183),
    .cin(w184),
    .sum(w378),
    .carry(w379)
);

full_adder FA_186(
    .a(ppg_matrix[491]),
    .b(w39),
    .cin(w41),
    .sum(w380),
    .carry(w381)
);

full_adder FA_187(
    .a(w42),
    .b(w44),
    .cin(w185),
    .sum(w382),
    .carry(w383)
);

full_adder FA_188(
    .a(w187),
    .b(w189),
    .cin(w190),
    .sum(w384),
    .carry(w385)
);

full_adder FA_189(
    .a(ppg_matrix[492]),
    .b(w43),
    .cin(w45),
    .sum(w386),
    .carry(w387)
);

full_adder FA_190(
    .a(w46),
    .b(w48),
    .cin(w191),
    .sum(w388),
    .carry(w389)
);

full_adder FA_191(
    .a(w193),
    .b(w195),
    .cin(w196),
    .sum(w390),
    .carry(w391)
);

full_adder FA_192(
    .a(ppg_matrix[493]),
    .b(w47),
    .cin(w49),
    .sum(w392),
    .carry(w393)
);

full_adder FA_193(
    .a(w50),
    .b(w52),
    .cin(w197),
    .sum(w394),
    .carry(w395)
);

full_adder FA_194(
    .a(w199),
    .b(w201),
    .cin(w202),
    .sum(w396),
    .carry(w397)
);

full_adder FA_195(
    .a(ppg_matrix[494]),
    .b(w51),
    .cin(w53),
    .sum(w398),
    .carry(w399)
);

full_adder FA_196(
    .a(w54),
    .b(w56),
    .cin(w203),
    .sum(w400),
    .carry(w401)
);

full_adder FA_197(
    .a(w205),
    .b(w207),
    .cin(w208),
    .sum(w402),
    .carry(w403)
);

full_adder FA_198(
    .a(ppg_matrix[495]),
    .b(w55),
    .cin(w57),
    .sum(w404),
    .carry(w405)
);

full_adder FA_199(
    .a(w58),
    .b(w60),
    .cin(w209),
    .sum(w406),
    .carry(w407)
);

full_adder FA_200(
    .a(w211),
    .b(w213),
    .cin(w214),
    .sum(w408),
    .carry(w409)
);

full_adder FA_201(
    .a(ppg_matrix[496]),
    .b(bw_constant[16]),
    .cin(w59),
    .sum(w410),
    .carry(w411)
);

full_adder FA_202(
    .a(w61),
    .b(w62),
    .cin(w64),
    .sum(w412),
    .carry(w413)
);

full_adder FA_203(
    .a(w215),
    .b(w217),
    .cin(w219),
    .sum(w414),
    .carry(w415)
);

full_adder FA_204(
    .a(ppg_matrix[497]),
    .b(w63),
    .cin(w65),
    .sum(w416),
    .carry(w417)
);

full_adder FA_205(
    .a(w66),
    .b(w68),
    .cin(w221),
    .sum(w418),
    .carry(w419)
);

full_adder FA_206(
    .a(w223),
    .b(w225),
    .cin(w226),
    .sum(w420),
    .carry(w421)
);

full_adder FA_207(
    .a(ppg_matrix[498]),
    .b(w67),
    .cin(w69),
    .sum(w422),
    .carry(w423)
);

full_adder FA_208(
    .a(w70),
    .b(w72),
    .cin(w227),
    .sum(w424),
    .carry(w425)
);

full_adder FA_209(
    .a(w229),
    .b(w231),
    .cin(w232),
    .sum(w426),
    .carry(w427)
);

full_adder FA_210(
    .a(ppg_matrix[499]),
    .b(w71),
    .cin(w73),
    .sum(w428),
    .carry(w429)
);

full_adder FA_211(
    .a(w74),
    .b(w76),
    .cin(w233),
    .sum(w430),
    .carry(w431)
);

full_adder FA_212(
    .a(w235),
    .b(w237),
    .cin(w238),
    .sum(w432),
    .carry(w433)
);

full_adder FA_213(
    .a(ppg_matrix[500]),
    .b(w75),
    .cin(w77),
    .sum(w434),
    .carry(w435)
);

full_adder FA_214(
    .a(w78),
    .b(w80),
    .cin(w239),
    .sum(w436),
    .carry(w437)
);

full_adder FA_215(
    .a(w241),
    .b(w243),
    .cin(w244),
    .sum(w438),
    .carry(w439)
);

full_adder FA_216(
    .a(ppg_matrix[501]),
    .b(w79),
    .cin(w81),
    .sum(w440),
    .carry(w441)
);

full_adder FA_217(
    .a(w82),
    .b(w84),
    .cin(w245),
    .sum(w442),
    .carry(w443)
);

full_adder FA_218(
    .a(w247),
    .b(w249),
    .cin(w250),
    .sum(w444),
    .carry(w445)
);

full_adder FA_219(
    .a(ppg_matrix[502]),
    .b(w83),
    .cin(w85),
    .sum(w446),
    .carry(w447)
);

full_adder FA_220(
    .a(w86),
    .b(w88),
    .cin(w251),
    .sum(w448),
    .carry(w449)
);

full_adder FA_221(
    .a(w253),
    .b(w255),
    .cin(w256),
    .sum(w450),
    .carry(w451)
);

full_adder FA_222(
    .a(ppg_matrix[503]),
    .b(w87),
    .cin(w89),
    .sum(w452),
    .carry(w453)
);

full_adder FA_223(
    .a(w90),
    .b(w92),
    .cin(w257),
    .sum(w454),
    .carry(w455)
);

full_adder FA_224(
    .a(w259),
    .b(w261),
    .cin(w262),
    .sum(w456),
    .carry(w457)
);

full_adder FA_225(
    .a(ppg_matrix[504]),
    .b(w91),
    .cin(w93),
    .sum(w458),
    .carry(w459)
);

full_adder FA_226(
    .a(w94),
    .b(w96),
    .cin(w263),
    .sum(w460),
    .carry(w461)
);

full_adder FA_227(
    .a(w265),
    .b(w267),
    .cin(w268),
    .sum(w462),
    .carry(w463)
);

full_adder FA_228(
    .a(ppg_matrix[505]),
    .b(w95),
    .cin(w97),
    .sum(w464),
    .carry(w465)
);

full_adder FA_229(
    .a(w98),
    .b(w100),
    .cin(w269),
    .sum(w466),
    .carry(w467)
);

full_adder FA_230(
    .a(w271),
    .b(w273),
    .cin(w274),
    .sum(w468),
    .carry(w469)
);

full_adder FA_231(
    .a(ppg_matrix[506]),
    .b(w99),
    .cin(w101),
    .sum(w470),
    .carry(w471)
);

full_adder FA_232(
    .a(w102),
    .b(w104),
    .cin(w275),
    .sum(w472),
    .carry(w473)
);

full_adder FA_233(
    .a(w277),
    .b(w279),
    .cin(w280),
    .sum(w474),
    .carry(w475)
);

full_adder FA_234(
    .a(ppg_matrix[507]),
    .b(w103),
    .cin(w105),
    .sum(w476),
    .carry(w477)
);

full_adder FA_235(
    .a(w106),
    .b(w108),
    .cin(w281),
    .sum(w478),
    .carry(w479)
);

full_adder FA_236(
    .a(w283),
    .b(w285),
    .cin(w286),
    .sum(w480),
    .carry(w481)
);

full_adder FA_237(
    .a(ppg_matrix[508]),
    .b(w107),
    .cin(w109),
    .sum(w482),
    .carry(w483)
);

full_adder FA_238(
    .a(w110),
    .b(w112),
    .cin(w287),
    .sum(w484),
    .carry(w485)
);

full_adder FA_239(
    .a(w289),
    .b(w291),
    .cin(w292),
    .sum(w486),
    .carry(w487)
);

full_adder FA_240(
    .a(ppg_matrix[509]),
    .b(w111),
    .cin(w113),
    .sum(w488),
    .carry(w489)
);

full_adder FA_241(
    .a(w114),
    .b(w116),
    .cin(w293),
    .sum(w490),
    .carry(w491)
);

full_adder FA_242(
    .a(w295),
    .b(w297),
    .cin(w298),
    .sum(w492),
    .carry(w493)
);

full_adder FA_243(
    .a(ppg_matrix[510]),
    .b(w115),
    .cin(w117),
    .sum(w494),
    .carry(w495)
);

full_adder FA_244(
    .a(w118),
    .b(w120),
    .cin(w299),
    .sum(w496),
    .carry(w497)
);

full_adder FA_245(
    .a(w301),
    .b(w303),
    .cin(w304),
    .sum(w498),
    .carry(w499)
);

full_adder FA_246(
    .a(ppg_matrix[511]),
    .b(bw_constant[31]),
    .cin(w119),
    .sum(w500),
    .carry(w501)
);

full_adder FA_247(
    .a(w121),
    .b(w122),
    .cin(w124),
    .sum(w502),
    .carry(w503)
);

full_adder FA_248(
    .a(w305),
    .b(w307),
    .cin(w309),
    .sum(w504),
    .carry(w505)
);

full_adder FA_249(
    .a(ppg_matrix[448]),
    .b(ppg_matrix[480]),
    .cin(w0),
    .sum(w506),
    .carry(w507)
);

full_adder FA_250(
    .a(w130),
    .b(w132),
    .cin(w134),
    .sum(w508),
    .carry(w509)
);

full_adder FA_251(
    .a(w317),
    .b(w319),
    .cin(w320),
    .sum(w510),
    .carry(w511)
);

full_adder FA_252(
    .a(w138),
    .b(w140),
    .cin(w321),
    .sum(w512),
    .carry(w513)
);

full_adder FA_253(
    .a(w323),
    .b(w325),
    .cin(w326),
    .sum(w514),
    .carry(w515)
);

full_adder FA_254(
    .a(w144),
    .b(w146),
    .cin(w327),
    .sum(w516),
    .carry(w517)
);

full_adder FA_255(
    .a(w329),
    .b(w331),
    .cin(w332),
    .sum(w518),
    .carry(w519)
);

full_adder FA_256(
    .a(w150),
    .b(w152),
    .cin(w333),
    .sum(w520),
    .carry(w521)
);

full_adder FA_257(
    .a(w335),
    .b(w337),
    .cin(w338),
    .sum(w522),
    .carry(w523)
);

full_adder FA_258(
    .a(w156),
    .b(w158),
    .cin(w339),
    .sum(w524),
    .carry(w525)
);

full_adder FA_259(
    .a(w341),
    .b(w343),
    .cin(w344),
    .sum(w526),
    .carry(w527)
);

full_adder FA_260(
    .a(w162),
    .b(w164),
    .cin(w345),
    .sum(w528),
    .carry(w529)
);

full_adder FA_261(
    .a(w347),
    .b(w349),
    .cin(w350),
    .sum(w530),
    .carry(w531)
);

full_adder FA_262(
    .a(w168),
    .b(w170),
    .cin(w351),
    .sum(w532),
    .carry(w533)
);

full_adder FA_263(
    .a(w353),
    .b(w355),
    .cin(w356),
    .sum(w534),
    .carry(w535)
);

full_adder FA_264(
    .a(w174),
    .b(w176),
    .cin(w357),
    .sum(w536),
    .carry(w537)
);

full_adder FA_265(
    .a(w359),
    .b(w361),
    .cin(w362),
    .sum(w538),
    .carry(w539)
);

full_adder FA_266(
    .a(w180),
    .b(w182),
    .cin(w363),
    .sum(w540),
    .carry(w541)
);

full_adder FA_267(
    .a(w365),
    .b(w367),
    .cin(w368),
    .sum(w542),
    .carry(w543)
);

full_adder FA_268(
    .a(w186),
    .b(w188),
    .cin(w369),
    .sum(w544),
    .carry(w545)
);

full_adder FA_269(
    .a(w371),
    .b(w373),
    .cin(w374),
    .sum(w546),
    .carry(w547)
);

full_adder FA_270(
    .a(w192),
    .b(w194),
    .cin(w375),
    .sum(w548),
    .carry(w549)
);

full_adder FA_271(
    .a(w377),
    .b(w379),
    .cin(w380),
    .sum(w550),
    .carry(w551)
);

full_adder FA_272(
    .a(w198),
    .b(w200),
    .cin(w381),
    .sum(w552),
    .carry(w553)
);

full_adder FA_273(
    .a(w383),
    .b(w385),
    .cin(w386),
    .sum(w554),
    .carry(w555)
);

full_adder FA_274(
    .a(w204),
    .b(w206),
    .cin(w387),
    .sum(w556),
    .carry(w557)
);

full_adder FA_275(
    .a(w389),
    .b(w391),
    .cin(w392),
    .sum(w558),
    .carry(w559)
);

full_adder FA_276(
    .a(w210),
    .b(w212),
    .cin(w393),
    .sum(w560),
    .carry(w561)
);

full_adder FA_277(
    .a(w395),
    .b(w397),
    .cin(w398),
    .sum(w562),
    .carry(w563)
);

full_adder FA_278(
    .a(w216),
    .b(w218),
    .cin(w399),
    .sum(w564),
    .carry(w565)
);

full_adder FA_279(
    .a(w401),
    .b(w403),
    .cin(w404),
    .sum(w566),
    .carry(w567)
);

full_adder FA_280(
    .a(w220),
    .b(w222),
    .cin(w224),
    .sum(w568),
    .carry(w569)
);

full_adder FA_281(
    .a(w405),
    .b(w407),
    .cin(w409),
    .sum(w570),
    .carry(w571)
);

half_adder HA_4(
    .a(w410),
    .b(w412),
    .sum(w572),
    .carry(w573)
);

full_adder FA_282(
    .a(w228),
    .b(w230),
    .cin(w411),
    .sum(w574),
    .carry(w575)
);

full_adder FA_283(
    .a(w413),
    .b(w415),
    .cin(w416),
    .sum(w576),
    .carry(w577)
);

half_adder HA_5(
    .a(w418),
    .b(w420),
    .sum(w578),
    .carry(w579)
);

full_adder FA_284(
    .a(w234),
    .b(w236),
    .cin(w417),
    .sum(w580),
    .carry(w581)
);

full_adder FA_285(
    .a(w419),
    .b(w421),
    .cin(w422),
    .sum(w582),
    .carry(w583)
);

half_adder HA_6(
    .a(w424),
    .b(w426),
    .sum(w584),
    .carry(w585)
);

full_adder FA_286(
    .a(w240),
    .b(w242),
    .cin(w423),
    .sum(w586),
    .carry(w587)
);

full_adder FA_287(
    .a(w425),
    .b(w427),
    .cin(w428),
    .sum(w588),
    .carry(w589)
);

half_adder HA_7(
    .a(w430),
    .b(w432),
    .sum(w590),
    .carry(w591)
);

full_adder FA_288(
    .a(w246),
    .b(w248),
    .cin(w429),
    .sum(w592),
    .carry(w593)
);

full_adder FA_289(
    .a(w431),
    .b(w433),
    .cin(w434),
    .sum(w594),
    .carry(w595)
);

half_adder HA_8(
    .a(w436),
    .b(w438),
    .sum(w596),
    .carry(w597)
);

full_adder FA_290(
    .a(w252),
    .b(w254),
    .cin(w435),
    .sum(w598),
    .carry(w599)
);

full_adder FA_291(
    .a(w437),
    .b(w439),
    .cin(w440),
    .sum(w600),
    .carry(w601)
);

half_adder HA_9(
    .a(w442),
    .b(w444),
    .sum(w602),
    .carry(w603)
);

full_adder FA_292(
    .a(w258),
    .b(w260),
    .cin(w441),
    .sum(w604),
    .carry(w605)
);

full_adder FA_293(
    .a(w443),
    .b(w445),
    .cin(w446),
    .sum(w606),
    .carry(w607)
);

half_adder HA_10(
    .a(w448),
    .b(w450),
    .sum(w608),
    .carry(w609)
);

full_adder FA_294(
    .a(w264),
    .b(w266),
    .cin(w447),
    .sum(w610),
    .carry(w611)
);

full_adder FA_295(
    .a(w449),
    .b(w451),
    .cin(w452),
    .sum(w612),
    .carry(w613)
);

half_adder HA_11(
    .a(w454),
    .b(w456),
    .sum(w614),
    .carry(w615)
);

full_adder FA_296(
    .a(w270),
    .b(w272),
    .cin(w453),
    .sum(w616),
    .carry(w617)
);

full_adder FA_297(
    .a(w455),
    .b(w457),
    .cin(w458),
    .sum(w618),
    .carry(w619)
);

half_adder HA_12(
    .a(w460),
    .b(w462),
    .sum(w620),
    .carry(w621)
);

full_adder FA_298(
    .a(w276),
    .b(w278),
    .cin(w459),
    .sum(w622),
    .carry(w623)
);

full_adder FA_299(
    .a(w461),
    .b(w463),
    .cin(w464),
    .sum(w624),
    .carry(w625)
);

half_adder HA_13(
    .a(w466),
    .b(w468),
    .sum(w626),
    .carry(w627)
);

full_adder FA_300(
    .a(w282),
    .b(w284),
    .cin(w465),
    .sum(w628),
    .carry(w629)
);

full_adder FA_301(
    .a(w467),
    .b(w469),
    .cin(w470),
    .sum(w630),
    .carry(w631)
);

half_adder HA_14(
    .a(w472),
    .b(w474),
    .sum(w632),
    .carry(w633)
);

full_adder FA_302(
    .a(w288),
    .b(w290),
    .cin(w471),
    .sum(w634),
    .carry(w635)
);

full_adder FA_303(
    .a(w473),
    .b(w475),
    .cin(w476),
    .sum(w636),
    .carry(w637)
);

half_adder HA_15(
    .a(w478),
    .b(w480),
    .sum(w638),
    .carry(w639)
);

full_adder FA_304(
    .a(w294),
    .b(w296),
    .cin(w477),
    .sum(w640),
    .carry(w641)
);

full_adder FA_305(
    .a(w479),
    .b(w481),
    .cin(w482),
    .sum(w642),
    .carry(w643)
);

half_adder HA_16(
    .a(w484),
    .b(w486),
    .sum(w644),
    .carry(w645)
);

full_adder FA_306(
    .a(w300),
    .b(w302),
    .cin(w483),
    .sum(w646),
    .carry(w647)
);

full_adder FA_307(
    .a(w485),
    .b(w487),
    .cin(w488),
    .sum(w648),
    .carry(w649)
);

half_adder HA_17(
    .a(w490),
    .b(w492),
    .sum(w650),
    .carry(w651)
);

full_adder FA_308(
    .a(w306),
    .b(w308),
    .cin(w489),
    .sum(w652),
    .carry(w653)
);

full_adder FA_309(
    .a(w491),
    .b(w493),
    .cin(w494),
    .sum(w654),
    .carry(w655)
);

half_adder HA_18(
    .a(w496),
    .b(w498),
    .sum(w656),
    .carry(w657)
);

full_adder FA_310(
    .a(w310),
    .b(w312),
    .cin(w314),
    .sum(w658),
    .carry(w659)
);

full_adder FA_311(
    .a(w495),
    .b(w497),
    .cin(w499),
    .sum(w660),
    .carry(w661)
);

full_adder FA_312(
    .a(w500),
    .b(w502),
    .cin(w504),
    .sum(w662),
    .carry(w663)
);

full_adder FA_313(
    .a(w126),
    .b(w128),
    .cin(w316),
    .sum(w664),
    .carry(w665)
);

full_adder FA_314(
    .a(w322),
    .b(w324),
    .cin(w507),
    .sum(w666),
    .carry(w667)
);

full_adder FA_315(
    .a(w328),
    .b(w330),
    .cin(w509),
    .sum(w668),
    .carry(w669)
);

half_adder HA_19(
    .a(w511),
    .b(w512),
    .sum(w670),
    .carry(w671)
);

full_adder FA_316(
    .a(w334),
    .b(w336),
    .cin(w513),
    .sum(w672),
    .carry(w673)
);

full_adder FA_317(
    .a(w515),
    .b(w516),
    .cin(w518),
    .sum(w674),
    .carry(w675)
);

full_adder FA_318(
    .a(w340),
    .b(w342),
    .cin(w517),
    .sum(w676),
    .carry(w677)
);

full_adder FA_319(
    .a(w519),
    .b(w520),
    .cin(w522),
    .sum(w678),
    .carry(w679)
);

full_adder FA_320(
    .a(w346),
    .b(w348),
    .cin(w521),
    .sum(w680),
    .carry(w681)
);

full_adder FA_321(
    .a(w523),
    .b(w524),
    .cin(w526),
    .sum(w682),
    .carry(w683)
);

full_adder FA_322(
    .a(w352),
    .b(w354),
    .cin(w525),
    .sum(w684),
    .carry(w685)
);

full_adder FA_323(
    .a(w527),
    .b(w528),
    .cin(w530),
    .sum(w686),
    .carry(w687)
);

full_adder FA_324(
    .a(w358),
    .b(w360),
    .cin(w529),
    .sum(w688),
    .carry(w689)
);

full_adder FA_325(
    .a(w531),
    .b(w532),
    .cin(w534),
    .sum(w690),
    .carry(w691)
);

full_adder FA_326(
    .a(w364),
    .b(w366),
    .cin(w533),
    .sum(w692),
    .carry(w693)
);

full_adder FA_327(
    .a(w535),
    .b(w536),
    .cin(w538),
    .sum(w694),
    .carry(w695)
);

full_adder FA_328(
    .a(w370),
    .b(w372),
    .cin(w537),
    .sum(w696),
    .carry(w697)
);

full_adder FA_329(
    .a(w539),
    .b(w540),
    .cin(w542),
    .sum(w698),
    .carry(w699)
);

full_adder FA_330(
    .a(w376),
    .b(w378),
    .cin(w541),
    .sum(w700),
    .carry(w701)
);

full_adder FA_331(
    .a(w543),
    .b(w544),
    .cin(w546),
    .sum(w702),
    .carry(w703)
);

full_adder FA_332(
    .a(w382),
    .b(w384),
    .cin(w545),
    .sum(w704),
    .carry(w705)
);

full_adder FA_333(
    .a(w547),
    .b(w548),
    .cin(w550),
    .sum(w706),
    .carry(w707)
);

full_adder FA_334(
    .a(w388),
    .b(w390),
    .cin(w549),
    .sum(w708),
    .carry(w709)
);

full_adder FA_335(
    .a(w551),
    .b(w552),
    .cin(w554),
    .sum(w710),
    .carry(w711)
);

full_adder FA_336(
    .a(w394),
    .b(w396),
    .cin(w553),
    .sum(w712),
    .carry(w713)
);

full_adder FA_337(
    .a(w555),
    .b(w556),
    .cin(w558),
    .sum(w714),
    .carry(w715)
);

full_adder FA_338(
    .a(w400),
    .b(w402),
    .cin(w557),
    .sum(w716),
    .carry(w717)
);

full_adder FA_339(
    .a(w559),
    .b(w560),
    .cin(w562),
    .sum(w718),
    .carry(w719)
);

full_adder FA_340(
    .a(w406),
    .b(w408),
    .cin(w561),
    .sum(w720),
    .carry(w721)
);

full_adder FA_341(
    .a(w563),
    .b(w564),
    .cin(w566),
    .sum(w722),
    .carry(w723)
);

full_adder FA_342(
    .a(w414),
    .b(w565),
    .cin(w567),
    .sum(w724),
    .carry(w725)
);

full_adder FA_343(
    .a(w568),
    .b(w570),
    .cin(w572),
    .sum(w726),
    .carry(w727)
);

full_adder FA_344(
    .a(w569),
    .b(w571),
    .cin(w573),
    .sum(w728),
    .carry(w729)
);

full_adder FA_345(
    .a(w574),
    .b(w576),
    .cin(w578),
    .sum(w730),
    .carry(w731)
);

full_adder FA_346(
    .a(w575),
    .b(w577),
    .cin(w579),
    .sum(w732),
    .carry(w733)
);

full_adder FA_347(
    .a(w580),
    .b(w582),
    .cin(w584),
    .sum(w734),
    .carry(w735)
);

full_adder FA_348(
    .a(w581),
    .b(w583),
    .cin(w585),
    .sum(w736),
    .carry(w737)
);

full_adder FA_349(
    .a(w586),
    .b(w588),
    .cin(w590),
    .sum(w738),
    .carry(w739)
);

full_adder FA_350(
    .a(w587),
    .b(w589),
    .cin(w591),
    .sum(w740),
    .carry(w741)
);

full_adder FA_351(
    .a(w592),
    .b(w594),
    .cin(w596),
    .sum(w742),
    .carry(w743)
);

full_adder FA_352(
    .a(w593),
    .b(w595),
    .cin(w597),
    .sum(w744),
    .carry(w745)
);

full_adder FA_353(
    .a(w598),
    .b(w600),
    .cin(w602),
    .sum(w746),
    .carry(w747)
);

full_adder FA_354(
    .a(w599),
    .b(w601),
    .cin(w603),
    .sum(w748),
    .carry(w749)
);

full_adder FA_355(
    .a(w604),
    .b(w606),
    .cin(w608),
    .sum(w750),
    .carry(w751)
);

full_adder FA_356(
    .a(w605),
    .b(w607),
    .cin(w609),
    .sum(w752),
    .carry(w753)
);

full_adder FA_357(
    .a(w610),
    .b(w612),
    .cin(w614),
    .sum(w754),
    .carry(w755)
);

full_adder FA_358(
    .a(w611),
    .b(w613),
    .cin(w615),
    .sum(w756),
    .carry(w757)
);

full_adder FA_359(
    .a(w616),
    .b(w618),
    .cin(w620),
    .sum(w758),
    .carry(w759)
);

full_adder FA_360(
    .a(w617),
    .b(w619),
    .cin(w621),
    .sum(w760),
    .carry(w761)
);

full_adder FA_361(
    .a(w622),
    .b(w624),
    .cin(w626),
    .sum(w762),
    .carry(w763)
);

full_adder FA_362(
    .a(w623),
    .b(w625),
    .cin(w627),
    .sum(w764),
    .carry(w765)
);

full_adder FA_363(
    .a(w628),
    .b(w630),
    .cin(w632),
    .sum(w766),
    .carry(w767)
);

full_adder FA_364(
    .a(w629),
    .b(w631),
    .cin(w633),
    .sum(w768),
    .carry(w769)
);

full_adder FA_365(
    .a(w634),
    .b(w636),
    .cin(w638),
    .sum(w770),
    .carry(w771)
);

full_adder FA_366(
    .a(w635),
    .b(w637),
    .cin(w639),
    .sum(w772),
    .carry(w773)
);

full_adder FA_367(
    .a(w640),
    .b(w642),
    .cin(w644),
    .sum(w774),
    .carry(w775)
);

full_adder FA_368(
    .a(w641),
    .b(w643),
    .cin(w645),
    .sum(w776),
    .carry(w777)
);

full_adder FA_369(
    .a(w646),
    .b(w648),
    .cin(w650),
    .sum(w778),
    .carry(w779)
);

full_adder FA_370(
    .a(w647),
    .b(w649),
    .cin(w651),
    .sum(w780),
    .carry(w781)
);

full_adder FA_371(
    .a(w652),
    .b(w654),
    .cin(w656),
    .sum(w782),
    .carry(w783)
);

full_adder FA_372(
    .a(w653),
    .b(w655),
    .cin(w657),
    .sum(w784),
    .carry(w785)
);

full_adder FA_373(
    .a(w658),
    .b(w660),
    .cin(w662),
    .sum(w786),
    .carry(w787)
);

half_adder HA_20(
    .a(w318),
    .b(w506),
    .sum(w788),
    .carry(w789)
);

full_adder FA_374(
    .a(w508),
    .b(w510),
    .cin(w665),
    .sum(w790),
    .carry(w791)
);

full_adder FA_375(
    .a(w514),
    .b(w667),
    .cin(w668),
    .sum(w792),
    .carry(w793)
);

full_adder FA_376(
    .a(w669),
    .b(w671),
    .cin(w672),
    .sum(w794),
    .carry(w795)
);

full_adder FA_377(
    .a(w673),
    .b(w675),
    .cin(w676),
    .sum(w796),
    .carry(w797)
);

full_adder FA_378(
    .a(w677),
    .b(w679),
    .cin(w680),
    .sum(w798),
    .carry(w799)
);

full_adder FA_379(
    .a(w681),
    .b(w683),
    .cin(w684),
    .sum(w800),
    .carry(w801)
);

full_adder FA_380(
    .a(w685),
    .b(w687),
    .cin(w688),
    .sum(w802),
    .carry(w803)
);

full_adder FA_381(
    .a(w689),
    .b(w691),
    .cin(w692),
    .sum(w804),
    .carry(w805)
);

full_adder FA_382(
    .a(w693),
    .b(w695),
    .cin(w696),
    .sum(w806),
    .carry(w807)
);

full_adder FA_383(
    .a(w697),
    .b(w699),
    .cin(w700),
    .sum(w808),
    .carry(w809)
);

full_adder FA_384(
    .a(w701),
    .b(w703),
    .cin(w704),
    .sum(w810),
    .carry(w811)
);

full_adder FA_385(
    .a(w705),
    .b(w707),
    .cin(w708),
    .sum(w812),
    .carry(w813)
);

full_adder FA_386(
    .a(w709),
    .b(w711),
    .cin(w712),
    .sum(w814),
    .carry(w815)
);

full_adder FA_387(
    .a(w713),
    .b(w715),
    .cin(w716),
    .sum(w816),
    .carry(w817)
);

full_adder FA_388(
    .a(w717),
    .b(w719),
    .cin(w720),
    .sum(w818),
    .carry(w819)
);

full_adder FA_389(
    .a(w721),
    .b(w723),
    .cin(w724),
    .sum(w820),
    .carry(w821)
);

full_adder FA_390(
    .a(w725),
    .b(w727),
    .cin(w728),
    .sum(w822),
    .carry(w823)
);

full_adder FA_391(
    .a(w729),
    .b(w731),
    .cin(w732),
    .sum(w824),
    .carry(w825)
);

full_adder FA_392(
    .a(w733),
    .b(w735),
    .cin(w736),
    .sum(w826),
    .carry(w827)
);

full_adder FA_393(
    .a(w737),
    .b(w739),
    .cin(w740),
    .sum(w828),
    .carry(w829)
);

full_adder FA_394(
    .a(w741),
    .b(w743),
    .cin(w744),
    .sum(w830),
    .carry(w831)
);

full_adder FA_395(
    .a(w745),
    .b(w747),
    .cin(w748),
    .sum(w832),
    .carry(w833)
);

full_adder FA_396(
    .a(w749),
    .b(w751),
    .cin(w752),
    .sum(w834),
    .carry(w835)
);

full_adder FA_397(
    .a(w753),
    .b(w755),
    .cin(w756),
    .sum(w836),
    .carry(w837)
);

full_adder FA_398(
    .a(w757),
    .b(w759),
    .cin(w760),
    .sum(w838),
    .carry(w839)
);

full_adder FA_399(
    .a(w761),
    .b(w763),
    .cin(w764),
    .sum(w840),
    .carry(w841)
);

full_adder FA_400(
    .a(w765),
    .b(w767),
    .cin(w768),
    .sum(w842),
    .carry(w843)
);

full_adder FA_401(
    .a(w769),
    .b(w771),
    .cin(w772),
    .sum(w844),
    .carry(w845)
);

full_adder FA_402(
    .a(w773),
    .b(w775),
    .cin(w776),
    .sum(w846),
    .carry(w847)
);

full_adder FA_403(
    .a(w777),
    .b(w779),
    .cin(w780),
    .sum(w848),
    .carry(w849)
);

full_adder FA_404(
    .a(w781),
    .b(w783),
    .cin(w784),
    .sum(w850),
    .carry(w851)
);

half_adder HA_21(
    .a(w666),
    .b(w789),
    .sum(w852),
    .carry(w853)
);

full_adder FA_405(
    .a(w670),
    .b(w791),
    .cin(w792),
    .sum(w854),
    .carry(w855)
);

full_adder FA_406(
    .a(w674),
    .b(w793),
    .cin(w794),
    .sum(w856),
    .carry(w857)
);

full_adder FA_407(
    .a(w678),
    .b(w795),
    .cin(w796),
    .sum(w858),
    .carry(w859)
);

full_adder FA_408(
    .a(w682),
    .b(w797),
    .cin(w798),
    .sum(w860),
    .carry(w861)
);

full_adder FA_409(
    .a(w686),
    .b(w799),
    .cin(w800),
    .sum(w862),
    .carry(w863)
);

full_adder FA_410(
    .a(w690),
    .b(w801),
    .cin(w802),
    .sum(w864),
    .carry(w865)
);

full_adder FA_411(
    .a(w694),
    .b(w803),
    .cin(w804),
    .sum(w866),
    .carry(w867)
);

full_adder FA_412(
    .a(w698),
    .b(w805),
    .cin(w806),
    .sum(w868),
    .carry(w869)
);

full_adder FA_413(
    .a(w702),
    .b(w807),
    .cin(w808),
    .sum(w870),
    .carry(w871)
);

full_adder FA_414(
    .a(w706),
    .b(w809),
    .cin(w810),
    .sum(w872),
    .carry(w873)
);

full_adder FA_415(
    .a(w710),
    .b(w811),
    .cin(w812),
    .sum(w874),
    .carry(w875)
);

full_adder FA_416(
    .a(w714),
    .b(w813),
    .cin(w814),
    .sum(w876),
    .carry(w877)
);

full_adder FA_417(
    .a(w718),
    .b(w815),
    .cin(w816),
    .sum(w878),
    .carry(w879)
);

full_adder FA_418(
    .a(w722),
    .b(w817),
    .cin(w818),
    .sum(w880),
    .carry(w881)
);

full_adder FA_419(
    .a(w726),
    .b(w819),
    .cin(w820),
    .sum(w882),
    .carry(w883)
);

full_adder FA_420(
    .a(w730),
    .b(w821),
    .cin(w822),
    .sum(w884),
    .carry(w885)
);

full_adder FA_421(
    .a(w734),
    .b(w823),
    .cin(w824),
    .sum(w886),
    .carry(w887)
);

full_adder FA_422(
    .a(w738),
    .b(w825),
    .cin(w826),
    .sum(w888),
    .carry(w889)
);

full_adder FA_423(
    .a(w742),
    .b(w827),
    .cin(w828),
    .sum(w890),
    .carry(w891)
);

full_adder FA_424(
    .a(w746),
    .b(w829),
    .cin(w830),
    .sum(w892),
    .carry(w893)
);

full_adder FA_425(
    .a(w750),
    .b(w831),
    .cin(w832),
    .sum(w894),
    .carry(w895)
);

full_adder FA_426(
    .a(w754),
    .b(w833),
    .cin(w834),
    .sum(w896),
    .carry(w897)
);

full_adder FA_427(
    .a(w758),
    .b(w835),
    .cin(w836),
    .sum(w898),
    .carry(w899)
);

full_adder FA_428(
    .a(w762),
    .b(w837),
    .cin(w838),
    .sum(w900),
    .carry(w901)
);

full_adder FA_429(
    .a(w766),
    .b(w839),
    .cin(w840),
    .sum(w902),
    .carry(w903)
);

full_adder FA_430(
    .a(w770),
    .b(w841),
    .cin(w842),
    .sum(w904),
    .carry(w905)
);

full_adder FA_431(
    .a(w774),
    .b(w843),
    .cin(w844),
    .sum(w906),
    .carry(w907)
);

full_adder FA_432(
    .a(w778),
    .b(w845),
    .cin(w846),
    .sum(w908),
    .carry(w909)
);

full_adder FA_433(
    .a(w782),
    .b(w847),
    .cin(w848),
    .sum(w910),
    .carry(w911)
);

full_adder FA_434(
    .a(w786),
    .b(w849),
    .cin(w850),
    .sum(w912),
    .carry(w913)
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
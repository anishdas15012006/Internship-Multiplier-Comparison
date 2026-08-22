// ========================================================
// Dynamically Generated Pipelined Hierarchical Vedic Multiplier
// Configuration: N = 16
// ========================================================

`timescale 1ns/1ps
`default_nettype none

module vedic_multiplier_16 (
    input wire clk,
    input wire rst,
    input wire en,
    input wire [15:0] A,
    input wire [15:0] B,
    output wire [31:0] Product
);

    // Definitive logical critical-path latency
    localparam PIPELINE_LATENCY = 3;

    wire w_0;
    wire w_1;
    wire w_2;
    wire w_3;
    wire w_4;
    wire w_5;
    wire w_6;
    wire w_7;
    wire w_8;
    wire w_9;
    wire w_10;
    wire w_11;
    wire w_12;
    wire w_13;
    wire w_14;
    wire w_15;
    wire w_16;
    wire w_17;
    wire w_18;
    wire w_19;
    wire w_20;
    wire w_21;
    wire w_22;
    wire w_23;
    wire w_24;
    wire w_25;
    wire w_26;
    wire w_27;
    wire w_28;
    wire w_29;
    wire w_30;
    wire w_31;
    wire w_32;
    wire w_33;
    wire w_34;
    wire w_35;
    wire w_36;
    wire w_37;
    wire w_38;
    wire w_39;
    wire w_40;
    wire w_41;
    wire w_42;
    wire w_43;
    wire w_44;
    wire w_45;
    wire w_46;
    wire w_47;
    wire w_48;
    wire w_49;
    wire w_50;
    wire w_51;
    wire w_52;
    wire w_53;
    wire w_54;
    wire w_55;
    wire w_56;
    wire w_57;
    wire w_58;
    wire w_59;
    wire w_60;
    wire w_61;
    wire w_62;
    wire w_63;
    wire w_64;
    wire w_65;
    wire w_66;
    wire w_67;
    wire w_68;
    wire w_69;
    wire w_70;
    wire w_71;
    wire w_72;
    wire w_73;
    wire w_74;
    wire w_75;
    wire w_76;
    wire w_77;
    wire w_78;
    wire w_79;
    wire w_80;
    wire w_81;
    wire w_82;
    wire w_83;
    wire w_84;
    wire w_85;
    wire w_86;
    wire w_87;
    wire w_88;
    wire w_89;
    wire w_90;
    wire w_91;
    wire w_92;
    wire w_93;
    wire w_94;
    wire w_95;
    wire w_96;
    wire w_97;
    wire w_98;
    wire w_99;
    wire w_100;
    wire w_101;
    wire w_102;
    wire w_103;
    wire w_104;
    wire w_105;
    wire w_106;
    wire w_107;
    wire w_108;
    wire w_109;
    wire w_110;
    wire w_111;
    wire w_112;
    wire w_113;
    wire w_114;
    wire w_115;
    wire w_116;
    wire w_117;
    wire w_118;
    wire w_119;
    wire w_120;
    wire w_121;
    wire w_122;
    wire w_123;
    wire w_124;
    wire w_125;
    wire w_126;
    wire w_127;
    wire w_128;
    wire w_129;
    wire w_130;
    wire w_131;
    wire w_132;
    wire w_133;
    wire w_134;
    wire w_135;
    wire w_136;
    wire w_137;
    wire w_138;
    wire w_139;
    wire w_140;
    wire w_141;
    wire w_142;
    wire w_143;
    wire w_144;
    wire w_145;
    wire w_146;
    wire w_147;
    wire w_148;
    wire w_149;
    wire w_150;
    wire w_151;
    wire w_152;
    wire w_153;
    wire w_154;
    wire w_155;
    wire w_156;
    wire w_157;
    wire w_158;
    wire w_159;
    wire w_160;
    wire w_161;
    wire w_162;
    wire w_163;
    wire w_164;
    wire w_165;
    wire w_166;
    wire w_167;
    wire w_168;
    wire w_169;
    wire w_170;
    wire w_171;
    wire w_172;
    wire w_173;
    wire w_174;
    wire w_175;
    wire w_176;
    wire w_177;
    wire w_178;
    wire w_179;
    wire w_180;
    wire w_181;
    wire w_182;
    wire w_183;
    wire w_184;
    wire w_185;
    wire w_186;
    wire w_187;
    wire w_188;
    wire w_189;
    wire w_190;
    wire w_191;
    wire w_192;
    wire w_193;
    wire w_194;
    wire w_195;
    wire w_196;
    wire w_197;
    wire w_198;
    wire w_199;
    wire w_200;
    wire w_201;
    wire w_202;
    wire w_203;
    wire w_204;
    wire w_205;
    wire w_206;
    wire w_207;
    wire w_208;
    wire w_209;
    wire w_210;
    wire w_211;
    wire w_212;
    wire w_213;
    wire w_214;
    wire w_215;
    wire w_216;
    wire w_217;
    wire w_218;
    wire w_219;
    wire w_220;
    wire w_221;
    wire w_222;
    wire w_223;
    wire w_224;
    wire w_225;
    wire w_226;
    wire w_227;
    wire w_228;
    wire w_229;
    wire w_230;
    wire w_231;
    wire w_232;
    wire w_233;
    wire w_234;
    wire w_235;
    wire w_236;
    wire w_237;
    wire w_238;
    wire w_239;
    wire w_240;
    wire w_241;
    wire w_242;
    wire w_243;
    wire w_244;
    wire w_245;
    wire w_246;
    wire w_247;
    wire w_248;
    wire w_249;
    wire w_250;
    wire w_251;
    wire w_252;
    wire w_253;
    wire w_254;
    wire w_255;
    wire w_256;
    wire w_257;
    wire w_258;
    wire w_259;
    wire w_260;
    wire w_261;
    wire w_262;
    wire w_263;
    wire w_264;
    wire w_265;
    wire w_266;
    wire w_267;
    wire w_268;
    wire w_269;
    wire w_270;
    wire w_271;
    wire w_272;
    wire w_273;
    wire w_274;
    wire w_275;
    wire w_276;
    wire w_277;
    wire w_278;
    wire w_279;
    wire w_280;
    wire w_281;
    wire w_282;
    wire w_283;
    wire w_284;
    wire w_285;
    wire w_286;
    wire w_287;
    wire w_288;
    wire w_289;
    wire w_290;
    wire w_291;
    wire w_292;
    wire w_293;
    wire w_294;
    wire w_295;
    wire w_296;
    wire w_297;
    wire w_298;
    wire w_299;
    wire w_300;
    wire w_301;
    wire w_302;
    wire w_303;
    wire w_304;
    wire w_305;
    wire w_306;
    wire w_307;
    wire w_308;
    wire w_309;
    wire w_310;
    wire w_311;
    wire w_312;
    wire w_313;
    wire w_314;
    wire w_315;
    wire w_316;
    wire w_317;
    wire w_318;
    wire w_319;
    wire w_320;
    wire w_321;
    wire w_322;
    wire w_323;
    wire w_324;
    wire w_325;
    wire w_326;
    wire w_327;
    wire w_328;
    wire w_329;
    wire w_330;
    wire w_331;
    wire w_332;
    wire w_333;
    wire w_334;
    wire w_335;
    wire w_336;
    wire w_337;
    wire w_338;
    wire w_339;
    wire w_340;
    wire w_341;
    wire w_342;
    wire w_343;
    wire w_344;
    wire w_345;
    wire w_346;
    wire w_347;
    wire w_348;
    wire w_349;
    wire w_350;
    wire w_351;
    wire w_352;
    wire w_353;
    wire w_354;
    wire w_355;
    wire w_356;
    wire w_357;
    wire w_358;
    wire w_359;
    wire w_360;
    wire w_361;
    wire w_362;
    wire w_363;
    wire w_364;
    wire w_365;
    wire w_366;
    wire w_367;
    wire w_368;
    wire w_369;
    wire w_370;
    wire w_371;
    wire w_372;
    wire w_373;
    wire w_374;
    wire w_375;
    wire w_376;
    wire w_377;
    wire w_378;
    wire w_379;
    wire w_380;
    wire w_381;
    wire w_382;
    wire w_383;
    wire w_384;
    wire w_385;
    wire w_386;
    wire w_387;
    wire w_388;
    wire w_389;
    wire w_390;
    wire w_391;
    wire w_392;
    wire w_393;
    wire w_394;
    wire w_395;
    wire w_396;
    wire w_397;
    wire w_398;
    wire w_399;
    wire w_400;
    wire w_401;
    wire w_402;
    wire w_403;
    wire w_404;
    wire w_405;
    wire w_406;
    wire w_407;
    wire w_408;
    wire w_409;
    wire w_410;
    wire w_411;
    wire w_412;
    wire w_413;
    wire w_414;
    wire w_415;
    wire w_416;
    wire w_417;
    wire w_418;
    wire w_419;
    wire w_420;
    wire w_421;
    wire w_422;
    wire w_423;
    wire w_424;
    wire w_425;
    wire w_426;
    wire w_427;
    wire w_428;
    wire w_429;
    wire w_430;
    wire w_431;
    wire w_432;
    wire w_433;
    wire w_434;
    wire w_435;
    wire w_436;
    wire w_437;
    wire w_438;
    wire w_439;
    wire w_440;
    wire w_441;
    wire w_442;
    wire w_443;
    wire w_444;
    wire w_445;
    wire w_446;
    wire w_447;
    wire w_448;
    wire w_449;
    wire w_450;
    wire w_451;
    wire w_452;
    wire w_453;
    wire w_454;
    wire w_455;
    wire w_456;
    wire w_457;
    wire w_458;
    wire w_459;
    wire w_460;
    wire w_461;
    wire w_462;
    wire w_463;
    wire w_464;
    wire w_465;
    wire w_466;
    wire w_467;
    wire w_468;
    wire w_469;
    wire w_470;
    wire w_471;
    wire w_472;
    wire w_473;
    wire w_474;
    wire w_475;
    wire w_476;
    wire w_477;
    wire w_478;
    wire w_479;
    wire w_480;
    wire w_481;
    wire w_482;
    wire w_483;
    wire w_484;
    wire w_485;
    wire w_486;
    wire w_487;
    wire w_488;
    wire w_489;
    wire w_490;
    wire w_491;
    wire w_492;
    wire w_493;
    wire w_494;
    wire w_495;
    wire w_496;
    wire w_497;
    wire w_498;
    wire w_499;
    wire w_500;
    wire w_501;
    wire w_502;
    wire w_503;
    wire w_504;
    wire w_505;
    wire w_506;
    wire w_507;
    wire w_508;
    wire w_509;
    wire w_510;
    wire w_511;
    wire w_512;
    wire w_513;
    wire w_514;
    wire w_515;
    wire w_516;
    wire w_517;
    wire w_518;
    wire w_519;
    wire w_520;
    wire w_521;
    wire w_522;
    wire w_523;
    wire w_524;
    wire w_525;
    wire w_526;
    wire w_527;
    wire w_528;
    wire w_529;
    wire w_530;
    wire w_531;
    wire w_532;
    wire w_533;
    wire w_534;
    wire w_535;
    wire w_536;
    wire w_537;
    wire w_538;
    wire w_539;
    wire w_540;
    wire w_541;
    wire w_542;
    wire w_543;
    wire w_544;
    wire w_545;
    wire w_546;
    wire w_547;
    wire w_548;
    wire w_549;
    wire w_550;
    wire w_551;
    wire w_552;
    wire w_553;
    wire w_554;
    wire w_555;
    wire w_556;
    wire w_557;
    wire w_558;
    wire w_559;
    wire w_560;
    wire w_561;
    wire w_562;
    wire w_563;
    wire w_564;
    wire w_565;
    wire w_566;
    wire w_567;
    wire w_568;
    wire w_569;
    wire w_570;
    wire w_571;
    wire w_572;
    wire w_573;
    wire w_574;
    wire w_575;
    wire w_576;
    wire w_577;
    wire w_578;
    wire w_579;
    wire w_580;
    wire w_581;
    wire w_582;
    wire w_583;
    wire w_584;
    wire w_585;
    wire w_586;
    wire w_587;
    wire w_588;
    wire w_589;
    wire w_590;
    wire w_591;
    wire w_592;
    wire w_593;
    wire w_594;
    wire w_595;
    wire w_596;
    wire w_597;
    wire w_598;
    wire w_599;
    wire w_600;
    wire w_601;
    wire w_602;
    wire w_603;
    wire w_604;
    wire w_605;
    wire w_606;
    wire w_607;
    wire w_608;
    wire w_609;
    wire w_610;
    wire w_611;
    wire w_612;
    wire w_613;
    wire w_614;
    wire w_615;
    wire w_616;
    wire w_617;
    wire w_618;
    wire w_619;
    wire w_620;
    wire w_621;
    wire w_622;
    wire w_623;
    wire w_624;
    wire w_625;
    wire w_626;
    wire w_627;
    wire w_628;
    wire w_629;
    wire w_630;
    wire w_631;
    wire w_632;
    wire w_633;
    wire w_634;
    wire w_635;
    wire w_636;
    wire w_637;
    wire w_638;
    wire w_639;
    wire w_640;
    wire w_641;
    wire w_642;
    wire w_643;
    wire w_644;
    wire w_645;
    wire w_646;
    wire w_647;
    wire w_648;
    wire w_649;
    wire w_650;
    wire w_651;
    wire w_652;
    wire w_653;
    wire w_654;
    wire w_655;
    wire w_656;
    wire w_657;
    wire w_658;
    wire w_659;
    wire w_660;
    wire w_661;
    wire w_662;
    wire w_663;
    wire w_664;
    wire w_665;
    wire w_666;
    wire w_667;
    wire w_668;
    wire w_669;
    wire w_670;
    wire w_671;
    wire w_672;
    wire w_673;
    wire w_674;
    wire w_675;

    // ========================================================
    // Boundary Pipeline Registers: Inputs (A and B)
    // ========================================================
    wire [15:0] reg_A;
    wire [15:0] reg_B;
    register_bank #(.WIDTH(16)) r_A (.clk(clk), .rst(rst), .en(en), .D(A), .Q(reg_A));
    register_bank #(.WIDTH(16)) r_B (.clk(clk), .rst(rst), .en(en), .D(B), .Q(reg_B));

    // ========================================================
    // Stage 2
    // ========================================================

    // Pipeline Register Bank: Layer lvl_2_blk_2
    wire [15:0] reg_lvl_2_blk_2_D;
    wire [15:0] reg_lvl_2_blk_2_Q;
    assign reg_lvl_2_blk_2_D = {w_154, w_153, w_152, w_151, w_150, w_149, w_148, w_147, w_140, w_139, w_138, w_137, w_22, w_21, w_1, w_0};
    register_bank #(.WIDTH(16)) inst_lvl_2_blk_2 (
        .clk(clk), .rst(rst), .en(en), .D(reg_lvl_2_blk_2_D), .Q(reg_lvl_2_blk_2_Q)
    );
    // ========================================================
    // Stage 3
    // ========================================================

    // Pipeline Register Bank: Layer lvl_2_blk_3
    wire [15:0] reg_lvl_2_blk_3_D;
    wire [15:0] reg_lvl_2_blk_3_Q;
    assign reg_lvl_2_blk_3_D = {w_310, w_309, w_308, w_307, w_306, w_305, w_304, w_303, w_296, w_295, w_294, w_293, w_178, w_177, w_157, w_156};
    register_bank #(.WIDTH(16)) inst_lvl_2_blk_3 (
        .clk(clk), .rst(rst), .en(en), .D(reg_lvl_2_blk_3_D), .Q(reg_lvl_2_blk_3_Q)
    );
    // ========================================================
    // Stage 4
    // ========================================================

    // Pipeline Register Bank: Layer lvl_2_blk_4
    wire [15:0] reg_lvl_2_blk_4_D;
    wire [15:0] reg_lvl_2_blk_4_Q;
    assign reg_lvl_2_blk_4_D = {w_466, w_465, w_464, w_463, w_462, w_461, w_460, w_459, w_452, w_451, w_450, w_449, w_334, w_333, w_313, w_312};
    register_bank #(.WIDTH(16)) inst_lvl_2_blk_4 (
        .clk(clk), .rst(rst), .en(en), .D(reg_lvl_2_blk_4_D), .Q(reg_lvl_2_blk_4_Q)
    );
    // ========================================================
    // Stage 5
    // ========================================================

    // Pipeline Register Bank: Layer lvl_2_blk_5
    wire [15:0] reg_lvl_2_blk_5_D;
    wire [15:0] reg_lvl_2_blk_5_Q;
    assign reg_lvl_2_blk_5_D = {w_622, w_621, w_620, w_619, w_618, w_617, w_616, w_615, w_608, w_607, w_606, w_605, w_490, w_489, w_469, w_468};
    register_bank #(.WIDTH(16)) inst_lvl_2_blk_5 (
        .clk(clk), .rst(rst), .en(en), .D(reg_lvl_2_blk_5_D), .Q(reg_lvl_2_blk_5_Q)
    );
    // ========================================================
    // Stage 1
    // ========================================================
    vedic_2x2 leaf_inst_0 (
        .A({reg_A[1], reg_A[0]}),
        .B({reg_B[1], reg_B[0]}),
        .P({w_3, w_2, w_1, w_0})
    );
    vedic_2x2 leaf_inst_1 (
        .A({reg_A[3], reg_A[2]}),
        .B({reg_B[1], reg_B[0]}),
        .P({w_7, w_6, w_5, w_4})
    );
    vedic_2x2 leaf_inst_2 (
        .A({reg_A[1], reg_A[0]}),
        .B({reg_B[3], reg_B[2]}),
        .P({w_11, w_10, w_9, w_8})
    );
    vedic_2x2 leaf_inst_3 (
        .A({reg_A[3], reg_A[2]}),
        .B({reg_B[3], reg_B[2]}),
        .P({w_15, w_14, w_13, w_12})
    );
    ripple_carry_adder #(.N(4)) rca_v_0 (
        .A({w_7, w_6, w_5, w_4}),
        .B({w_11, w_10, w_9, w_8}),
        .Cin(1'b0),
        .Sum({w_19, w_18, w_17, w_16}),
        .Cout(w_20)
    );
    ripple_carry_adder #(.N(5)) rca_v_1 (
        .A({w_20, w_19, w_18, w_17, w_16}),
        .B({1'b0, 1'b0, 1'b0, w_3, w_2}),
        .Cin(1'b0),
        .Sum({w_25, w_24, w_23, w_22, w_21}),
        .Cout(w_26)
    );
    ripple_carry_adder #(.N(4)) rca_v_2 (
        .A({w_26, w_25, w_24, w_23}),
        .B({w_15, w_14, w_13, w_12}),
        .Cin(1'b0),
        .Sum({w_30, w_29, w_28, w_27}),
        .Cout(w_31)
    );
    vedic_2x2 leaf_inst_4 (
        .A({reg_A[5], reg_A[4]}),
        .B({reg_B[1], reg_B[0]}),
        .P({w_35, w_34, w_33, w_32})
    );
    vedic_2x2 leaf_inst_5 (
        .A({reg_A[7], reg_A[6]}),
        .B({reg_B[1], reg_B[0]}),
        .P({w_39, w_38, w_37, w_36})
    );
    vedic_2x2 leaf_inst_6 (
        .A({reg_A[5], reg_A[4]}),
        .B({reg_B[3], reg_B[2]}),
        .P({w_43, w_42, w_41, w_40})
    );
    vedic_2x2 leaf_inst_7 (
        .A({reg_A[7], reg_A[6]}),
        .B({reg_B[3], reg_B[2]}),
        .P({w_47, w_46, w_45, w_44})
    );
    ripple_carry_adder #(.N(4)) rca_v_3 (
        .A({w_39, w_38, w_37, w_36}),
        .B({w_43, w_42, w_41, w_40}),
        .Cin(1'b0),
        .Sum({w_51, w_50, w_49, w_48}),
        .Cout(w_52)
    );
    ripple_carry_adder #(.N(5)) rca_v_4 (
        .A({w_52, w_51, w_50, w_49, w_48}),
        .B({1'b0, 1'b0, 1'b0, w_35, w_34}),
        .Cin(1'b0),
        .Sum({w_57, w_56, w_55, w_54, w_53}),
        .Cout(w_58)
    );
    ripple_carry_adder #(.N(4)) rca_v_5 (
        .A({w_58, w_57, w_56, w_55}),
        .B({w_47, w_46, w_45, w_44}),
        .Cin(1'b0),
        .Sum({w_62, w_61, w_60, w_59}),
        .Cout(w_63)
    );
    vedic_2x2 leaf_inst_8 (
        .A({reg_A[1], reg_A[0]}),
        .B({reg_B[5], reg_B[4]}),
        .P({w_67, w_66, w_65, w_64})
    );
    vedic_2x2 leaf_inst_9 (
        .A({reg_A[3], reg_A[2]}),
        .B({reg_B[5], reg_B[4]}),
        .P({w_71, w_70, w_69, w_68})
    );
    vedic_2x2 leaf_inst_10 (
        .A({reg_A[1], reg_A[0]}),
        .B({reg_B[7], reg_B[6]}),
        .P({w_75, w_74, w_73, w_72})
    );
    vedic_2x2 leaf_inst_11 (
        .A({reg_A[3], reg_A[2]}),
        .B({reg_B[7], reg_B[6]}),
        .P({w_79, w_78, w_77, w_76})
    );
    ripple_carry_adder #(.N(4)) rca_v_6 (
        .A({w_71, w_70, w_69, w_68}),
        .B({w_75, w_74, w_73, w_72}),
        .Cin(1'b0),
        .Sum({w_83, w_82, w_81, w_80}),
        .Cout(w_84)
    );
    ripple_carry_adder #(.N(5)) rca_v_7 (
        .A({w_84, w_83, w_82, w_81, w_80}),
        .B({1'b0, 1'b0, 1'b0, w_67, w_66}),
        .Cin(1'b0),
        .Sum({w_89, w_88, w_87, w_86, w_85}),
        .Cout(w_90)
    );
    ripple_carry_adder #(.N(4)) rca_v_8 (
        .A({w_90, w_89, w_88, w_87}),
        .B({w_79, w_78, w_77, w_76}),
        .Cin(1'b0),
        .Sum({w_94, w_93, w_92, w_91}),
        .Cout(w_95)
    );
    vedic_2x2 leaf_inst_12 (
        .A({reg_A[5], reg_A[4]}),
        .B({reg_B[5], reg_B[4]}),
        .P({w_99, w_98, w_97, w_96})
    );
    vedic_2x2 leaf_inst_13 (
        .A({reg_A[7], reg_A[6]}),
        .B({reg_B[5], reg_B[4]}),
        .P({w_103, w_102, w_101, w_100})
    );
    vedic_2x2 leaf_inst_14 (
        .A({reg_A[5], reg_A[4]}),
        .B({reg_B[7], reg_B[6]}),
        .P({w_107, w_106, w_105, w_104})
    );
    vedic_2x2 leaf_inst_15 (
        .A({reg_A[7], reg_A[6]}),
        .B({reg_B[7], reg_B[6]}),
        .P({w_111, w_110, w_109, w_108})
    );
    ripple_carry_adder #(.N(4)) rca_v_9 (
        .A({w_103, w_102, w_101, w_100}),
        .B({w_107, w_106, w_105, w_104}),
        .Cin(1'b0),
        .Sum({w_115, w_114, w_113, w_112}),
        .Cout(w_116)
    );
    ripple_carry_adder #(.N(5)) rca_v_10 (
        .A({w_116, w_115, w_114, w_113, w_112}),
        .B({1'b0, 1'b0, 1'b0, w_99, w_98}),
        .Cin(1'b0),
        .Sum({w_121, w_120, w_119, w_118, w_117}),
        .Cout(w_122)
    );
    ripple_carry_adder #(.N(4)) rca_v_11 (
        .A({w_122, w_121, w_120, w_119}),
        .B({w_111, w_110, w_109, w_108}),
        .Cin(1'b0),
        .Sum({w_126, w_125, w_124, w_123}),
        .Cout(w_127)
    );
    ripple_carry_adder #(.N(8)) rca_v_12 (
        .A({w_62, w_61, w_60, w_59, w_54, w_53, w_33, w_32}),
        .B({w_94, w_93, w_92, w_91, w_86, w_85, w_65, w_64}),
        .Cin(1'b0),
        .Sum({w_135, w_134, w_133, w_132, w_131, w_130, w_129, w_128}),
        .Cout(w_136)
    );
    ripple_carry_adder #(.N(9)) rca_v_13 (
        .A({w_136, w_135, w_134, w_133, w_132, w_131, w_130, w_129, w_128}),
        .B({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, w_30, w_29, w_28, w_27}),
        .Cin(1'b0),
        .Sum({w_145, w_144, w_143, w_142, w_141, w_140, w_139, w_138, w_137}),
        .Cout(w_146)
    );
    ripple_carry_adder #(.N(8)) rca_v_14 (
        .A({1'b0, 1'b0, w_146, w_145, w_144, w_143, w_142, w_141}),
        .B({w_126, w_125, w_124, w_123, w_118, w_117, w_97, w_96}),
        .Cin(1'b0),
        .Sum({w_154, w_153, w_152, w_151, w_150, w_149, w_148, w_147}),
        .Cout(w_155)
    );
    vedic_2x2 leaf_inst_16 (
        .A({reg_A[9], reg_A[8]}),
        .B({reg_B[1], reg_B[0]}),
        .P({w_159, w_158, w_157, w_156})
    );
    vedic_2x2 leaf_inst_17 (
        .A({reg_A[11], reg_A[10]}),
        .B({reg_B[1], reg_B[0]}),
        .P({w_163, w_162, w_161, w_160})
    );
    vedic_2x2 leaf_inst_18 (
        .A({reg_A[9], reg_A[8]}),
        .B({reg_B[3], reg_B[2]}),
        .P({w_167, w_166, w_165, w_164})
    );
    vedic_2x2 leaf_inst_19 (
        .A({reg_A[11], reg_A[10]}),
        .B({reg_B[3], reg_B[2]}),
        .P({w_171, w_170, w_169, w_168})
    );
    ripple_carry_adder #(.N(4)) rca_v_15 (
        .A({w_163, w_162, w_161, w_160}),
        .B({w_167, w_166, w_165, w_164}),
        .Cin(1'b0),
        .Sum({w_175, w_174, w_173, w_172}),
        .Cout(w_176)
    );
    ripple_carry_adder #(.N(5)) rca_v_16 (
        .A({w_176, w_175, w_174, w_173, w_172}),
        .B({1'b0, 1'b0, 1'b0, w_159, w_158}),
        .Cin(1'b0),
        .Sum({w_181, w_180, w_179, w_178, w_177}),
        .Cout(w_182)
    );
    ripple_carry_adder #(.N(4)) rca_v_17 (
        .A({w_182, w_181, w_180, w_179}),
        .B({w_171, w_170, w_169, w_168}),
        .Cin(1'b0),
        .Sum({w_186, w_185, w_184, w_183}),
        .Cout(w_187)
    );
    vedic_2x2 leaf_inst_20 (
        .A({reg_A[13], reg_A[12]}),
        .B({reg_B[1], reg_B[0]}),
        .P({w_191, w_190, w_189, w_188})
    );
    vedic_2x2 leaf_inst_21 (
        .A({reg_A[15], reg_A[14]}),
        .B({reg_B[1], reg_B[0]}),
        .P({w_195, w_194, w_193, w_192})
    );
    vedic_2x2 leaf_inst_22 (
        .A({reg_A[13], reg_A[12]}),
        .B({reg_B[3], reg_B[2]}),
        .P({w_199, w_198, w_197, w_196})
    );
    vedic_2x2 leaf_inst_23 (
        .A({reg_A[15], reg_A[14]}),
        .B({reg_B[3], reg_B[2]}),
        .P({w_203, w_202, w_201, w_200})
    );
    ripple_carry_adder #(.N(4)) rca_v_18 (
        .A({w_195, w_194, w_193, w_192}),
        .B({w_199, w_198, w_197, w_196}),
        .Cin(1'b0),
        .Sum({w_207, w_206, w_205, w_204}),
        .Cout(w_208)
    );
    ripple_carry_adder #(.N(5)) rca_v_19 (
        .A({w_208, w_207, w_206, w_205, w_204}),
        .B({1'b0, 1'b0, 1'b0, w_191, w_190}),
        .Cin(1'b0),
        .Sum({w_213, w_212, w_211, w_210, w_209}),
        .Cout(w_214)
    );
    ripple_carry_adder #(.N(4)) rca_v_20 (
        .A({w_214, w_213, w_212, w_211}),
        .B({w_203, w_202, w_201, w_200}),
        .Cin(1'b0),
        .Sum({w_218, w_217, w_216, w_215}),
        .Cout(w_219)
    );
    vedic_2x2 leaf_inst_24 (
        .A({reg_A[9], reg_A[8]}),
        .B({reg_B[5], reg_B[4]}),
        .P({w_223, w_222, w_221, w_220})
    );
    vedic_2x2 leaf_inst_25 (
        .A({reg_A[11], reg_A[10]}),
        .B({reg_B[5], reg_B[4]}),
        .P({w_227, w_226, w_225, w_224})
    );
    vedic_2x2 leaf_inst_26 (
        .A({reg_A[9], reg_A[8]}),
        .B({reg_B[7], reg_B[6]}),
        .P({w_231, w_230, w_229, w_228})
    );
    vedic_2x2 leaf_inst_27 (
        .A({reg_A[11], reg_A[10]}),
        .B({reg_B[7], reg_B[6]}),
        .P({w_235, w_234, w_233, w_232})
    );
    ripple_carry_adder #(.N(4)) rca_v_21 (
        .A({w_227, w_226, w_225, w_224}),
        .B({w_231, w_230, w_229, w_228}),
        .Cin(1'b0),
        .Sum({w_239, w_238, w_237, w_236}),
        .Cout(w_240)
    );
    ripple_carry_adder #(.N(5)) rca_v_22 (
        .A({w_240, w_239, w_238, w_237, w_236}),
        .B({1'b0, 1'b0, 1'b0, w_223, w_222}),
        .Cin(1'b0),
        .Sum({w_245, w_244, w_243, w_242, w_241}),
        .Cout(w_246)
    );
    ripple_carry_adder #(.N(4)) rca_v_23 (
        .A({w_246, w_245, w_244, w_243}),
        .B({w_235, w_234, w_233, w_232}),
        .Cin(1'b0),
        .Sum({w_250, w_249, w_248, w_247}),
        .Cout(w_251)
    );
    vedic_2x2 leaf_inst_28 (
        .A({reg_A[13], reg_A[12]}),
        .B({reg_B[5], reg_B[4]}),
        .P({w_255, w_254, w_253, w_252})
    );
    vedic_2x2 leaf_inst_29 (
        .A({reg_A[15], reg_A[14]}),
        .B({reg_B[5], reg_B[4]}),
        .P({w_259, w_258, w_257, w_256})
    );
    vedic_2x2 leaf_inst_30 (
        .A({reg_A[13], reg_A[12]}),
        .B({reg_B[7], reg_B[6]}),
        .P({w_263, w_262, w_261, w_260})
    );
    vedic_2x2 leaf_inst_31 (
        .A({reg_A[15], reg_A[14]}),
        .B({reg_B[7], reg_B[6]}),
        .P({w_267, w_266, w_265, w_264})
    );
    ripple_carry_adder #(.N(4)) rca_v_24 (
        .A({w_259, w_258, w_257, w_256}),
        .B({w_263, w_262, w_261, w_260}),
        .Cin(1'b0),
        .Sum({w_271, w_270, w_269, w_268}),
        .Cout(w_272)
    );
    ripple_carry_adder #(.N(5)) rca_v_25 (
        .A({w_272, w_271, w_270, w_269, w_268}),
        .B({1'b0, 1'b0, 1'b0, w_255, w_254}),
        .Cin(1'b0),
        .Sum({w_277, w_276, w_275, w_274, w_273}),
        .Cout(w_278)
    );
    ripple_carry_adder #(.N(4)) rca_v_26 (
        .A({w_278, w_277, w_276, w_275}),
        .B({w_267, w_266, w_265, w_264}),
        .Cin(1'b0),
        .Sum({w_282, w_281, w_280, w_279}),
        .Cout(w_283)
    );
    ripple_carry_adder #(.N(8)) rca_v_27 (
        .A({w_218, w_217, w_216, w_215, w_210, w_209, w_189, w_188}),
        .B({w_250, w_249, w_248, w_247, w_242, w_241, w_221, w_220}),
        .Cin(1'b0),
        .Sum({w_291, w_290, w_289, w_288, w_287, w_286, w_285, w_284}),
        .Cout(w_292)
    );
    ripple_carry_adder #(.N(9)) rca_v_28 (
        .A({w_292, w_291, w_290, w_289, w_288, w_287, w_286, w_285, w_284}),
        .B({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, w_186, w_185, w_184, w_183}),
        .Cin(1'b0),
        .Sum({w_301, w_300, w_299, w_298, w_297, w_296, w_295, w_294, w_293}),
        .Cout(w_302)
    );
    ripple_carry_adder #(.N(8)) rca_v_29 (
        .A({1'b0, 1'b0, w_302, w_301, w_300, w_299, w_298, w_297}),
        .B({w_282, w_281, w_280, w_279, w_274, w_273, w_253, w_252}),
        .Cin(1'b0),
        .Sum({w_310, w_309, w_308, w_307, w_306, w_305, w_304, w_303}),
        .Cout(w_311)
    );
    vedic_2x2 leaf_inst_32 (
        .A({reg_A[1], reg_A[0]}),
        .B({reg_B[9], reg_B[8]}),
        .P({w_315, w_314, w_313, w_312})
    );
    vedic_2x2 leaf_inst_33 (
        .A({reg_A[3], reg_A[2]}),
        .B({reg_B[9], reg_B[8]}),
        .P({w_319, w_318, w_317, w_316})
    );
    vedic_2x2 leaf_inst_34 (
        .A({reg_A[1], reg_A[0]}),
        .B({reg_B[11], reg_B[10]}),
        .P({w_323, w_322, w_321, w_320})
    );
    vedic_2x2 leaf_inst_35 (
        .A({reg_A[3], reg_A[2]}),
        .B({reg_B[11], reg_B[10]}),
        .P({w_327, w_326, w_325, w_324})
    );
    ripple_carry_adder #(.N(4)) rca_v_30 (
        .A({w_319, w_318, w_317, w_316}),
        .B({w_323, w_322, w_321, w_320}),
        .Cin(1'b0),
        .Sum({w_331, w_330, w_329, w_328}),
        .Cout(w_332)
    );
    ripple_carry_adder #(.N(5)) rca_v_31 (
        .A({w_332, w_331, w_330, w_329, w_328}),
        .B({1'b0, 1'b0, 1'b0, w_315, w_314}),
        .Cin(1'b0),
        .Sum({w_337, w_336, w_335, w_334, w_333}),
        .Cout(w_338)
    );
    ripple_carry_adder #(.N(4)) rca_v_32 (
        .A({w_338, w_337, w_336, w_335}),
        .B({w_327, w_326, w_325, w_324}),
        .Cin(1'b0),
        .Sum({w_342, w_341, w_340, w_339}),
        .Cout(w_343)
    );
    vedic_2x2 leaf_inst_36 (
        .A({reg_A[5], reg_A[4]}),
        .B({reg_B[9], reg_B[8]}),
        .P({w_347, w_346, w_345, w_344})
    );
    vedic_2x2 leaf_inst_37 (
        .A({reg_A[7], reg_A[6]}),
        .B({reg_B[9], reg_B[8]}),
        .P({w_351, w_350, w_349, w_348})
    );
    vedic_2x2 leaf_inst_38 (
        .A({reg_A[5], reg_A[4]}),
        .B({reg_B[11], reg_B[10]}),
        .P({w_355, w_354, w_353, w_352})
    );
    vedic_2x2 leaf_inst_39 (
        .A({reg_A[7], reg_A[6]}),
        .B({reg_B[11], reg_B[10]}),
        .P({w_359, w_358, w_357, w_356})
    );
    ripple_carry_adder #(.N(4)) rca_v_33 (
        .A({w_351, w_350, w_349, w_348}),
        .B({w_355, w_354, w_353, w_352}),
        .Cin(1'b0),
        .Sum({w_363, w_362, w_361, w_360}),
        .Cout(w_364)
    );
    ripple_carry_adder #(.N(5)) rca_v_34 (
        .A({w_364, w_363, w_362, w_361, w_360}),
        .B({1'b0, 1'b0, 1'b0, w_347, w_346}),
        .Cin(1'b0),
        .Sum({w_369, w_368, w_367, w_366, w_365}),
        .Cout(w_370)
    );
    ripple_carry_adder #(.N(4)) rca_v_35 (
        .A({w_370, w_369, w_368, w_367}),
        .B({w_359, w_358, w_357, w_356}),
        .Cin(1'b0),
        .Sum({w_374, w_373, w_372, w_371}),
        .Cout(w_375)
    );
    vedic_2x2 leaf_inst_40 (
        .A({reg_A[1], reg_A[0]}),
        .B({reg_B[13], reg_B[12]}),
        .P({w_379, w_378, w_377, w_376})
    );
    vedic_2x2 leaf_inst_41 (
        .A({reg_A[3], reg_A[2]}),
        .B({reg_B[13], reg_B[12]}),
        .P({w_383, w_382, w_381, w_380})
    );
    vedic_2x2 leaf_inst_42 (
        .A({reg_A[1], reg_A[0]}),
        .B({reg_B[15], reg_B[14]}),
        .P({w_387, w_386, w_385, w_384})
    );
    vedic_2x2 leaf_inst_43 (
        .A({reg_A[3], reg_A[2]}),
        .B({reg_B[15], reg_B[14]}),
        .P({w_391, w_390, w_389, w_388})
    );
    ripple_carry_adder #(.N(4)) rca_v_36 (
        .A({w_383, w_382, w_381, w_380}),
        .B({w_387, w_386, w_385, w_384}),
        .Cin(1'b0),
        .Sum({w_395, w_394, w_393, w_392}),
        .Cout(w_396)
    );
    ripple_carry_adder #(.N(5)) rca_v_37 (
        .A({w_396, w_395, w_394, w_393, w_392}),
        .B({1'b0, 1'b0, 1'b0, w_379, w_378}),
        .Cin(1'b0),
        .Sum({w_401, w_400, w_399, w_398, w_397}),
        .Cout(w_402)
    );
    ripple_carry_adder #(.N(4)) rca_v_38 (
        .A({w_402, w_401, w_400, w_399}),
        .B({w_391, w_390, w_389, w_388}),
        .Cin(1'b0),
        .Sum({w_406, w_405, w_404, w_403}),
        .Cout(w_407)
    );
    vedic_2x2 leaf_inst_44 (
        .A({reg_A[5], reg_A[4]}),
        .B({reg_B[13], reg_B[12]}),
        .P({w_411, w_410, w_409, w_408})
    );
    vedic_2x2 leaf_inst_45 (
        .A({reg_A[7], reg_A[6]}),
        .B({reg_B[13], reg_B[12]}),
        .P({w_415, w_414, w_413, w_412})
    );
    vedic_2x2 leaf_inst_46 (
        .A({reg_A[5], reg_A[4]}),
        .B({reg_B[15], reg_B[14]}),
        .P({w_419, w_418, w_417, w_416})
    );
    vedic_2x2 leaf_inst_47 (
        .A({reg_A[7], reg_A[6]}),
        .B({reg_B[15], reg_B[14]}),
        .P({w_423, w_422, w_421, w_420})
    );
    ripple_carry_adder #(.N(4)) rca_v_39 (
        .A({w_415, w_414, w_413, w_412}),
        .B({w_419, w_418, w_417, w_416}),
        .Cin(1'b0),
        .Sum({w_427, w_426, w_425, w_424}),
        .Cout(w_428)
    );
    ripple_carry_adder #(.N(5)) rca_v_40 (
        .A({w_428, w_427, w_426, w_425, w_424}),
        .B({1'b0, 1'b0, 1'b0, w_411, w_410}),
        .Cin(1'b0),
        .Sum({w_433, w_432, w_431, w_430, w_429}),
        .Cout(w_434)
    );
    ripple_carry_adder #(.N(4)) rca_v_41 (
        .A({w_434, w_433, w_432, w_431}),
        .B({w_423, w_422, w_421, w_420}),
        .Cin(1'b0),
        .Sum({w_438, w_437, w_436, w_435}),
        .Cout(w_439)
    );
    ripple_carry_adder #(.N(8)) rca_v_42 (
        .A({w_374, w_373, w_372, w_371, w_366, w_365, w_345, w_344}),
        .B({w_406, w_405, w_404, w_403, w_398, w_397, w_377, w_376}),
        .Cin(1'b0),
        .Sum({w_447, w_446, w_445, w_444, w_443, w_442, w_441, w_440}),
        .Cout(w_448)
    );
    ripple_carry_adder #(.N(9)) rca_v_43 (
        .A({w_448, w_447, w_446, w_445, w_444, w_443, w_442, w_441, w_440}),
        .B({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, w_342, w_341, w_340, w_339}),
        .Cin(1'b0),
        .Sum({w_457, w_456, w_455, w_454, w_453, w_452, w_451, w_450, w_449}),
        .Cout(w_458)
    );
    ripple_carry_adder #(.N(8)) rca_v_44 (
        .A({1'b0, 1'b0, w_458, w_457, w_456, w_455, w_454, w_453}),
        .B({w_438, w_437, w_436, w_435, w_430, w_429, w_409, w_408}),
        .Cin(1'b0),
        .Sum({w_466, w_465, w_464, w_463, w_462, w_461, w_460, w_459}),
        .Cout(w_467)
    );
    vedic_2x2 leaf_inst_48 (
        .A({reg_A[9], reg_A[8]}),
        .B({reg_B[9], reg_B[8]}),
        .P({w_471, w_470, w_469, w_468})
    );
    vedic_2x2 leaf_inst_49 (
        .A({reg_A[11], reg_A[10]}),
        .B({reg_B[9], reg_B[8]}),
        .P({w_475, w_474, w_473, w_472})
    );
    vedic_2x2 leaf_inst_50 (
        .A({reg_A[9], reg_A[8]}),
        .B({reg_B[11], reg_B[10]}),
        .P({w_479, w_478, w_477, w_476})
    );
    vedic_2x2 leaf_inst_51 (
        .A({reg_A[11], reg_A[10]}),
        .B({reg_B[11], reg_B[10]}),
        .P({w_483, w_482, w_481, w_480})
    );
    ripple_carry_adder #(.N(4)) rca_v_45 (
        .A({w_475, w_474, w_473, w_472}),
        .B({w_479, w_478, w_477, w_476}),
        .Cin(1'b0),
        .Sum({w_487, w_486, w_485, w_484}),
        .Cout(w_488)
    );
    ripple_carry_adder #(.N(5)) rca_v_46 (
        .A({w_488, w_487, w_486, w_485, w_484}),
        .B({1'b0, 1'b0, 1'b0, w_471, w_470}),
        .Cin(1'b0),
        .Sum({w_493, w_492, w_491, w_490, w_489}),
        .Cout(w_494)
    );
    ripple_carry_adder #(.N(4)) rca_v_47 (
        .A({w_494, w_493, w_492, w_491}),
        .B({w_483, w_482, w_481, w_480}),
        .Cin(1'b0),
        .Sum({w_498, w_497, w_496, w_495}),
        .Cout(w_499)
    );
    vedic_2x2 leaf_inst_52 (
        .A({reg_A[13], reg_A[12]}),
        .B({reg_B[9], reg_B[8]}),
        .P({w_503, w_502, w_501, w_500})
    );
    vedic_2x2 leaf_inst_53 (
        .A({reg_A[15], reg_A[14]}),
        .B({reg_B[9], reg_B[8]}),
        .P({w_507, w_506, w_505, w_504})
    );
    vedic_2x2 leaf_inst_54 (
        .A({reg_A[13], reg_A[12]}),
        .B({reg_B[11], reg_B[10]}),
        .P({w_511, w_510, w_509, w_508})
    );
    vedic_2x2 leaf_inst_55 (
        .A({reg_A[15], reg_A[14]}),
        .B({reg_B[11], reg_B[10]}),
        .P({w_515, w_514, w_513, w_512})
    );
    ripple_carry_adder #(.N(4)) rca_v_48 (
        .A({w_507, w_506, w_505, w_504}),
        .B({w_511, w_510, w_509, w_508}),
        .Cin(1'b0),
        .Sum({w_519, w_518, w_517, w_516}),
        .Cout(w_520)
    );
    ripple_carry_adder #(.N(5)) rca_v_49 (
        .A({w_520, w_519, w_518, w_517, w_516}),
        .B({1'b0, 1'b0, 1'b0, w_503, w_502}),
        .Cin(1'b0),
        .Sum({w_525, w_524, w_523, w_522, w_521}),
        .Cout(w_526)
    );
    ripple_carry_adder #(.N(4)) rca_v_50 (
        .A({w_526, w_525, w_524, w_523}),
        .B({w_515, w_514, w_513, w_512}),
        .Cin(1'b0),
        .Sum({w_530, w_529, w_528, w_527}),
        .Cout(w_531)
    );
    vedic_2x2 leaf_inst_56 (
        .A({reg_A[9], reg_A[8]}),
        .B({reg_B[13], reg_B[12]}),
        .P({w_535, w_534, w_533, w_532})
    );
    vedic_2x2 leaf_inst_57 (
        .A({reg_A[11], reg_A[10]}),
        .B({reg_B[13], reg_B[12]}),
        .P({w_539, w_538, w_537, w_536})
    );
    vedic_2x2 leaf_inst_58 (
        .A({reg_A[9], reg_A[8]}),
        .B({reg_B[15], reg_B[14]}),
        .P({w_543, w_542, w_541, w_540})
    );
    vedic_2x2 leaf_inst_59 (
        .A({reg_A[11], reg_A[10]}),
        .B({reg_B[15], reg_B[14]}),
        .P({w_547, w_546, w_545, w_544})
    );
    ripple_carry_adder #(.N(4)) rca_v_51 (
        .A({w_539, w_538, w_537, w_536}),
        .B({w_543, w_542, w_541, w_540}),
        .Cin(1'b0),
        .Sum({w_551, w_550, w_549, w_548}),
        .Cout(w_552)
    );
    ripple_carry_adder #(.N(5)) rca_v_52 (
        .A({w_552, w_551, w_550, w_549, w_548}),
        .B({1'b0, 1'b0, 1'b0, w_535, w_534}),
        .Cin(1'b0),
        .Sum({w_557, w_556, w_555, w_554, w_553}),
        .Cout(w_558)
    );
    ripple_carry_adder #(.N(4)) rca_v_53 (
        .A({w_558, w_557, w_556, w_555}),
        .B({w_547, w_546, w_545, w_544}),
        .Cin(1'b0),
        .Sum({w_562, w_561, w_560, w_559}),
        .Cout(w_563)
    );
    vedic_2x2 leaf_inst_60 (
        .A({reg_A[13], reg_A[12]}),
        .B({reg_B[13], reg_B[12]}),
        .P({w_567, w_566, w_565, w_564})
    );
    vedic_2x2 leaf_inst_61 (
        .A({reg_A[15], reg_A[14]}),
        .B({reg_B[13], reg_B[12]}),
        .P({w_571, w_570, w_569, w_568})
    );
    vedic_2x2 leaf_inst_62 (
        .A({reg_A[13], reg_A[12]}),
        .B({reg_B[15], reg_B[14]}),
        .P({w_575, w_574, w_573, w_572})
    );
    vedic_2x2 leaf_inst_63 (
        .A({reg_A[15], reg_A[14]}),
        .B({reg_B[15], reg_B[14]}),
        .P({w_579, w_578, w_577, w_576})
    );
    ripple_carry_adder #(.N(4)) rca_v_54 (
        .A({w_571, w_570, w_569, w_568}),
        .B({w_575, w_574, w_573, w_572}),
        .Cin(1'b0),
        .Sum({w_583, w_582, w_581, w_580}),
        .Cout(w_584)
    );
    ripple_carry_adder #(.N(5)) rca_v_55 (
        .A({w_584, w_583, w_582, w_581, w_580}),
        .B({1'b0, 1'b0, 1'b0, w_567, w_566}),
        .Cin(1'b0),
        .Sum({w_589, w_588, w_587, w_586, w_585}),
        .Cout(w_590)
    );
    ripple_carry_adder #(.N(4)) rca_v_56 (
        .A({w_590, w_589, w_588, w_587}),
        .B({w_579, w_578, w_577, w_576}),
        .Cin(1'b0),
        .Sum({w_594, w_593, w_592, w_591}),
        .Cout(w_595)
    );
    ripple_carry_adder #(.N(8)) rca_v_57 (
        .A({w_530, w_529, w_528, w_527, w_522, w_521, w_501, w_500}),
        .B({w_562, w_561, w_560, w_559, w_554, w_553, w_533, w_532}),
        .Cin(1'b0),
        .Sum({w_603, w_602, w_601, w_600, w_599, w_598, w_597, w_596}),
        .Cout(w_604)
    );
    ripple_carry_adder #(.N(9)) rca_v_58 (
        .A({w_604, w_603, w_602, w_601, w_600, w_599, w_598, w_597, w_596}),
        .B({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, w_498, w_497, w_496, w_495}),
        .Cin(1'b0),
        .Sum({w_613, w_612, w_611, w_610, w_609, w_608, w_607, w_606, w_605}),
        .Cout(w_614)
    );
    ripple_carry_adder #(.N(8)) rca_v_59 (
        .A({1'b0, 1'b0, w_614, w_613, w_612, w_611, w_610, w_609}),
        .B({w_594, w_593, w_592, w_591, w_586, w_585, w_565, w_564}),
        .Cin(1'b0),
        .Sum({w_622, w_621, w_620, w_619, w_618, w_617, w_616, w_615}),
        .Cout(w_623)
    );
    ripple_carry_adder #(.N(16)) rca_v_60 (
        .A({reg_lvl_2_blk_3_Q[15], reg_lvl_2_blk_3_Q[14], reg_lvl_2_blk_3_Q[13], reg_lvl_2_blk_3_Q[12], reg_lvl_2_blk_3_Q[11], reg_lvl_2_blk_3_Q[10], reg_lvl_2_blk_3_Q[9], reg_lvl_2_blk_3_Q[8], reg_lvl_2_blk_3_Q[7], reg_lvl_2_blk_3_Q[6], reg_lvl_2_blk_3_Q[5], reg_lvl_2_blk_3_Q[4], reg_lvl_2_blk_3_Q[3], reg_lvl_2_blk_3_Q[2], reg_lvl_2_blk_3_Q[1], reg_lvl_2_blk_3_Q[0]}),
        .B({reg_lvl_2_blk_4_Q[15], reg_lvl_2_blk_4_Q[14], reg_lvl_2_blk_4_Q[13], reg_lvl_2_blk_4_Q[12], reg_lvl_2_blk_4_Q[11], reg_lvl_2_blk_4_Q[10], reg_lvl_2_blk_4_Q[9], reg_lvl_2_blk_4_Q[8], reg_lvl_2_blk_4_Q[7], reg_lvl_2_blk_4_Q[6], reg_lvl_2_blk_4_Q[5], reg_lvl_2_blk_4_Q[4], reg_lvl_2_blk_4_Q[3], reg_lvl_2_blk_4_Q[2], reg_lvl_2_blk_4_Q[1], reg_lvl_2_blk_4_Q[0]}),
        .Cin(1'b0),
        .Sum({w_639, w_638, w_637, w_636, w_635, w_634, w_633, w_632, w_631, w_630, w_629, w_628, w_627, w_626, w_625, w_624}),
        .Cout(w_640)
    );
    ripple_carry_adder #(.N(17)) rca_v_61 (
        .A({w_640, w_639, w_638, w_637, w_636, w_635, w_634, w_633, w_632, w_631, w_630, w_629, w_628, w_627, w_626, w_625, w_624}),
        .B({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, reg_lvl_2_blk_2_Q[15], reg_lvl_2_blk_2_Q[14], reg_lvl_2_blk_2_Q[13], reg_lvl_2_blk_2_Q[12], reg_lvl_2_blk_2_Q[11], reg_lvl_2_blk_2_Q[10], reg_lvl_2_blk_2_Q[9], reg_lvl_2_blk_2_Q[8]}),
        .Cin(1'b0),
        .Sum({w_657, w_656, w_655, w_654, w_653, w_652, w_651, w_650, w_649, w_648, w_647, w_646, w_645, w_644, w_643, w_642, w_641}),
        .Cout(w_658)
    );
    ripple_carry_adder #(.N(16)) rca_v_62 (
        .A({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, w_658, w_657, w_656, w_655, w_654, w_653, w_652, w_651, w_650, w_649}),
        .B({reg_lvl_2_blk_5_Q[15], reg_lvl_2_blk_5_Q[14], reg_lvl_2_blk_5_Q[13], reg_lvl_2_blk_5_Q[12], reg_lvl_2_blk_5_Q[11], reg_lvl_2_blk_5_Q[10], reg_lvl_2_blk_5_Q[9], reg_lvl_2_blk_5_Q[8], reg_lvl_2_blk_5_Q[7], reg_lvl_2_blk_5_Q[6], reg_lvl_2_blk_5_Q[5], reg_lvl_2_blk_5_Q[4], reg_lvl_2_blk_5_Q[3], reg_lvl_2_blk_5_Q[2], reg_lvl_2_blk_5_Q[1], reg_lvl_2_blk_5_Q[0]}),
        .Cin(1'b0),
        .Sum({w_674, w_673, w_672, w_671, w_670, w_669, w_668, w_667, w_666, w_665, w_664, w_663, w_662, w_661, w_660, w_659}),
        .Cout(w_675)
    );

    // ========================================================
    // Boundary Pipeline Registers: Final Output
    // ========================================================
    register_bank #(.WIDTH(32)) reg_out (
        .clk(clk), .rst(rst), .en(en), .D({w_674, w_673, w_672, w_671, w_670, w_669, w_668, w_667, w_666, w_665, w_664, w_663, w_662, w_661, w_660, w_659, w_648, w_647, w_646, w_645, w_644, w_643, w_642, w_641, reg_lvl_2_blk_2_Q[7], reg_lvl_2_blk_2_Q[6], reg_lvl_2_blk_2_Q[5], reg_lvl_2_blk_2_Q[4], reg_lvl_2_blk_2_Q[3], reg_lvl_2_blk_2_Q[2], reg_lvl_2_blk_2_Q[1], reg_lvl_2_blk_2_Q[0]}), .Q(Product)
    );

endmodule

`default_nettype wire
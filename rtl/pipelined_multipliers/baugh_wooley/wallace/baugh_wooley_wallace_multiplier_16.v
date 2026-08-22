// =====================================================================
// Dynamically Generated Pipelined Baugh-Wooley Wallace Multiplier
// Configuration: N = 16
// =====================================================================

module baugh_wooley_wallace_multiplier_16 #(
    parameter SIGNED_A = 1,
    parameter SIGNED_B = 1
) (
    input wire clk,
    input wire rst,
    input wire en,
    input wire [15:0] A,
    input wire [15:0] B,
    output wire [31:0] Product
);

    // Definitive logical critical-path latency
    localparam PIPELINE_LATENCY = 5;

    // ========================================================
    // Boundary Pipeline Registers: Inputs (A and B)
    // ========================================================
    wire [15:0] reg_A_w;
    wire [15:0] reg_B_w;
    register_bank #(.WIDTH(16)) reg_input_A (.clk(clk), .rst(rst), .en(en), .D(A), .Q(reg_A_w));
    register_bank #(.WIDTH(16)) reg_input_B (.clk(clk), .rst(rst), .en(en), .D(B), .Q(reg_B_w));

    // ========================================================
    // PPG: Baugh-Wooley Signed Partial Product Generation
    // ========================================================
    wire [255:0] raw_pp;
    wire [31:0] raw_pp_corr;
    baugh_wooley_ppg #(.N(16), .SIGNED_A(SIGNED_A), .SIGNED_B(SIGNED_B)) ppg_inst (
        .A(reg_A_w), .B(reg_B_w), .pp(raw_pp), .pp_corr(raw_pp_corr)
    );

    // ========================================================
    // Stage 1
    // ========================================================
    wire w_1, w_2;
    half_adder HA0 (.a(raw_pp[1]), .b(raw_pp[16]), .sum(w_1), .carry(w_2));
    wire w_3, w_4;
    full_adder FA0 (.a(raw_pp[2]), .b(raw_pp[17]), .cin(raw_pp[32]), .sum(w_3), .carry(w_4));
    wire w_5, w_6;
    full_adder FA1 (.a(raw_pp[3]), .b(raw_pp[18]), .cin(raw_pp[33]), .sum(w_5), .carry(w_6));
    wire w_7, w_8;
    full_adder FA2 (.a(raw_pp[4]), .b(raw_pp[19]), .cin(raw_pp[34]), .sum(w_7), .carry(w_8));
    wire w_9, w_10;
    half_adder HA1 (.a(raw_pp[49]), .b(raw_pp[64]), .sum(w_9), .carry(w_10));
    wire w_11, w_12;
    full_adder FA3 (.a(raw_pp[5]), .b(raw_pp[20]), .cin(raw_pp[35]), .sum(w_11), .carry(w_12));
    wire w_13, w_14;
    full_adder FA4 (.a(raw_pp[50]), .b(raw_pp[65]), .cin(raw_pp[80]), .sum(w_13), .carry(w_14));
    wire w_15, w_16;
    full_adder FA5 (.a(raw_pp[6]), .b(raw_pp[21]), .cin(raw_pp[36]), .sum(w_15), .carry(w_16));
    wire w_17, w_18;
    full_adder FA6 (.a(raw_pp[51]), .b(raw_pp[66]), .cin(raw_pp[81]), .sum(w_17), .carry(w_18));
    wire w_19, w_20;
    full_adder FA7 (.a(raw_pp[7]), .b(raw_pp[22]), .cin(raw_pp[37]), .sum(w_19), .carry(w_20));
    wire w_21, w_22;
    full_adder FA8 (.a(raw_pp[52]), .b(raw_pp[67]), .cin(raw_pp[82]), .sum(w_21), .carry(w_22));
    wire w_23, w_24;
    half_adder HA2 (.a(raw_pp[97]), .b(raw_pp[112]), .sum(w_23), .carry(w_24));
    wire w_25, w_26;
    full_adder FA9 (.a(raw_pp[8]), .b(raw_pp[23]), .cin(raw_pp[38]), .sum(w_25), .carry(w_26));
    wire w_27, w_28;
    full_adder FA10 (.a(raw_pp[53]), .b(raw_pp[68]), .cin(raw_pp[83]), .sum(w_27), .carry(w_28));
    wire w_29, w_30;
    full_adder FA11 (.a(raw_pp[98]), .b(raw_pp[113]), .cin(raw_pp[128]), .sum(w_29), .carry(w_30));
    wire w_31, w_32;
    full_adder FA12 (.a(raw_pp[9]), .b(raw_pp[24]), .cin(raw_pp[39]), .sum(w_31), .carry(w_32));
    wire w_33, w_34;
    full_adder FA13 (.a(raw_pp[54]), .b(raw_pp[69]), .cin(raw_pp[84]), .sum(w_33), .carry(w_34));
    wire w_35, w_36;
    full_adder FA14 (.a(raw_pp[99]), .b(raw_pp[114]), .cin(raw_pp[129]), .sum(w_35), .carry(w_36));
    wire w_37, w_38;
    full_adder FA15 (.a(raw_pp[10]), .b(raw_pp[25]), .cin(raw_pp[40]), .sum(w_37), .carry(w_38));
    wire w_39, w_40;
    full_adder FA16 (.a(raw_pp[55]), .b(raw_pp[70]), .cin(raw_pp[85]), .sum(w_39), .carry(w_40));
    wire w_41, w_42;
    full_adder FA17 (.a(raw_pp[100]), .b(raw_pp[115]), .cin(raw_pp[130]), .sum(w_41), .carry(w_42));
    wire w_43, w_44;
    half_adder HA3 (.a(raw_pp[145]), .b(raw_pp[160]), .sum(w_43), .carry(w_44));
    wire w_45, w_46;
    full_adder FA18 (.a(raw_pp[11]), .b(raw_pp[26]), .cin(raw_pp[41]), .sum(w_45), .carry(w_46));
    wire w_47, w_48;
    full_adder FA19 (.a(raw_pp[56]), .b(raw_pp[71]), .cin(raw_pp[86]), .sum(w_47), .carry(w_48));
    wire w_49, w_50;
    full_adder FA20 (.a(raw_pp[101]), .b(raw_pp[116]), .cin(raw_pp[131]), .sum(w_49), .carry(w_50));
    wire w_51, w_52;
    full_adder FA21 (.a(raw_pp[146]), .b(raw_pp[161]), .cin(raw_pp[176]), .sum(w_51), .carry(w_52));
    wire w_53, w_54;
    full_adder FA22 (.a(raw_pp[12]), .b(raw_pp[27]), .cin(raw_pp[42]), .sum(w_53), .carry(w_54));
    wire w_55, w_56;
    full_adder FA23 (.a(raw_pp[57]), .b(raw_pp[72]), .cin(raw_pp[87]), .sum(w_55), .carry(w_56));
    wire w_57, w_58;
    full_adder FA24 (.a(raw_pp[102]), .b(raw_pp[117]), .cin(raw_pp[132]), .sum(w_57), .carry(w_58));
    wire w_59, w_60;
    full_adder FA25 (.a(raw_pp[147]), .b(raw_pp[162]), .cin(raw_pp[177]), .sum(w_59), .carry(w_60));
    wire w_61, w_62;
    full_adder FA26 (.a(raw_pp[13]), .b(raw_pp[28]), .cin(raw_pp[43]), .sum(w_61), .carry(w_62));
    wire w_63, w_64;
    full_adder FA27 (.a(raw_pp[58]), .b(raw_pp[73]), .cin(raw_pp[88]), .sum(w_63), .carry(w_64));
    wire w_65, w_66;
    full_adder FA28 (.a(raw_pp[103]), .b(raw_pp[118]), .cin(raw_pp[133]), .sum(w_65), .carry(w_66));
    wire w_67, w_68;
    full_adder FA29 (.a(raw_pp[148]), .b(raw_pp[163]), .cin(raw_pp[178]), .sum(w_67), .carry(w_68));
    wire w_69, w_70;
    half_adder HA4 (.a(raw_pp[193]), .b(raw_pp[208]), .sum(w_69), .carry(w_70));
    wire w_71, w_72;
    full_adder FA30 (.a(raw_pp[14]), .b(raw_pp[29]), .cin(raw_pp[44]), .sum(w_71), .carry(w_72));
    wire w_73, w_74;
    full_adder FA31 (.a(raw_pp[59]), .b(raw_pp[74]), .cin(raw_pp[89]), .sum(w_73), .carry(w_74));
    wire w_75, w_76;
    full_adder FA32 (.a(raw_pp[104]), .b(raw_pp[119]), .cin(raw_pp[134]), .sum(w_75), .carry(w_76));
    wire w_77, w_78;
    full_adder FA33 (.a(raw_pp[149]), .b(raw_pp[164]), .cin(raw_pp[179]), .sum(w_77), .carry(w_78));
    wire w_79, w_80;
    full_adder FA34 (.a(raw_pp[194]), .b(raw_pp[209]), .cin(raw_pp[224]), .sum(w_79), .carry(w_80));
    wire w_81, w_82;
    full_adder FA35 (.a(raw_pp[15]), .b(raw_pp[30]), .cin(raw_pp[45]), .sum(w_81), .carry(w_82));
    wire w_83, w_84;
    full_adder FA36 (.a(raw_pp[60]), .b(raw_pp[75]), .cin(raw_pp[90]), .sum(w_83), .carry(w_84));
    wire w_85, w_86;
    full_adder FA37 (.a(raw_pp[105]), .b(raw_pp[120]), .cin(raw_pp[135]), .sum(w_85), .carry(w_86));
    wire w_87, w_88;
    full_adder FA38 (.a(raw_pp[150]), .b(raw_pp[165]), .cin(raw_pp[180]), .sum(w_87), .carry(w_88));
    wire w_89, w_90;
    full_adder FA39 (.a(raw_pp[195]), .b(raw_pp[210]), .cin(raw_pp[225]), .sum(w_89), .carry(w_90));
    wire w_91, w_92;
    full_adder FA40 (.a(raw_pp[31]), .b(raw_pp[46]), .cin(raw_pp[61]), .sum(w_91), .carry(w_92));
    wire w_93, w_94;
    full_adder FA41 (.a(raw_pp[76]), .b(raw_pp[91]), .cin(raw_pp[106]), .sum(w_93), .carry(w_94));
    wire w_95, w_96;
    full_adder FA42 (.a(raw_pp[121]), .b(raw_pp[136]), .cin(raw_pp[151]), .sum(w_95), .carry(w_96));
    wire w_97, w_98;
    full_adder FA43 (.a(raw_pp[166]), .b(raw_pp[181]), .cin(raw_pp[196]), .sum(w_97), .carry(w_98));
    wire w_99, w_100;
    full_adder FA44 (.a(raw_pp[211]), .b(raw_pp[226]), .cin(raw_pp[241]), .sum(w_99), .carry(w_100));
    wire w_101, w_102;
    full_adder FA45 (.a(raw_pp[47]), .b(raw_pp[62]), .cin(raw_pp[77]), .sum(w_101), .carry(w_102));
    wire w_103, w_104;
    full_adder FA46 (.a(raw_pp[92]), .b(raw_pp[107]), .cin(raw_pp[122]), .sum(w_103), .carry(w_104));
    wire w_105, w_106;
    full_adder FA47 (.a(raw_pp[137]), .b(raw_pp[152]), .cin(raw_pp[167]), .sum(w_105), .carry(w_106));
    wire w_107, w_108;
    full_adder FA48 (.a(raw_pp[182]), .b(raw_pp[197]), .cin(raw_pp[212]), .sum(w_107), .carry(w_108));
    wire w_109, w_110;
    half_adder HA5 (.a(raw_pp[227]), .b(raw_pp[242]), .sum(w_109), .carry(w_110));
    wire w_111, w_112;
    full_adder FA49 (.a(raw_pp[63]), .b(raw_pp[78]), .cin(raw_pp[93]), .sum(w_111), .carry(w_112));
    wire w_113, w_114;
    full_adder FA50 (.a(raw_pp[108]), .b(raw_pp[123]), .cin(raw_pp[138]), .sum(w_113), .carry(w_114));
    wire w_115, w_116;
    full_adder FA51 (.a(raw_pp[153]), .b(raw_pp[168]), .cin(raw_pp[183]), .sum(w_115), .carry(w_116));
    wire w_117, w_118;
    full_adder FA52 (.a(raw_pp[198]), .b(raw_pp[213]), .cin(raw_pp[228]), .sum(w_117), .carry(w_118));
    wire w_119, w_120;
    full_adder FA53 (.a(raw_pp[79]), .b(raw_pp[94]), .cin(raw_pp[109]), .sum(w_119), .carry(w_120));
    wire w_121, w_122;
    full_adder FA54 (.a(raw_pp[124]), .b(raw_pp[139]), .cin(raw_pp[154]), .sum(w_121), .carry(w_122));
    wire w_123, w_124;
    full_adder FA55 (.a(raw_pp[169]), .b(raw_pp[184]), .cin(raw_pp[199]), .sum(w_123), .carry(w_124));
    wire w_125, w_126;
    full_adder FA56 (.a(raw_pp[214]), .b(raw_pp[229]), .cin(raw_pp[244]), .sum(w_125), .carry(w_126));
    wire w_127, w_128;
    full_adder FA57 (.a(raw_pp[95]), .b(raw_pp[110]), .cin(raw_pp[125]), .sum(w_127), .carry(w_128));
    wire w_129, w_130;
    full_adder FA58 (.a(raw_pp[140]), .b(raw_pp[155]), .cin(raw_pp[170]), .sum(w_129), .carry(w_130));
    wire w_131, w_132;
    full_adder FA59 (.a(raw_pp[185]), .b(raw_pp[200]), .cin(raw_pp[215]), .sum(w_131), .carry(w_132));
    wire w_133, w_134;
    half_adder HA6 (.a(raw_pp[230]), .b(raw_pp[245]), .sum(w_133), .carry(w_134));
    wire w_135, w_136;
    full_adder FA60 (.a(raw_pp[111]), .b(raw_pp[126]), .cin(raw_pp[141]), .sum(w_135), .carry(w_136));
    wire w_137, w_138;
    full_adder FA61 (.a(raw_pp[156]), .b(raw_pp[171]), .cin(raw_pp[186]), .sum(w_137), .carry(w_138));
    wire w_139, w_140;
    full_adder FA62 (.a(raw_pp[201]), .b(raw_pp[216]), .cin(raw_pp[231]), .sum(w_139), .carry(w_140));
    wire w_141, w_142;
    full_adder FA63 (.a(raw_pp[127]), .b(raw_pp[142]), .cin(raw_pp[157]), .sum(w_141), .carry(w_142));
    wire w_143, w_144;
    full_adder FA64 (.a(raw_pp[172]), .b(raw_pp[187]), .cin(raw_pp[202]), .sum(w_143), .carry(w_144));
    wire w_145, w_146;
    full_adder FA65 (.a(raw_pp[217]), .b(raw_pp[232]), .cin(raw_pp[247]), .sum(w_145), .carry(w_146));
    wire w_147, w_148;
    full_adder FA66 (.a(raw_pp[143]), .b(raw_pp[158]), .cin(raw_pp[173]), .sum(w_147), .carry(w_148));
    wire w_149, w_150;
    full_adder FA67 (.a(raw_pp[188]), .b(raw_pp[203]), .cin(raw_pp[218]), .sum(w_149), .carry(w_150));
    wire w_151, w_152;
    half_adder HA7 (.a(raw_pp[233]), .b(raw_pp[248]), .sum(w_151), .carry(w_152));
    wire w_153, w_154;
    full_adder FA68 (.a(raw_pp[159]), .b(raw_pp[174]), .cin(raw_pp[189]), .sum(w_153), .carry(w_154));
    wire w_155, w_156;
    full_adder FA69 (.a(raw_pp[204]), .b(raw_pp[219]), .cin(raw_pp[234]), .sum(w_155), .carry(w_156));
    wire w_157, w_158;
    full_adder FA70 (.a(raw_pp[175]), .b(raw_pp[190]), .cin(raw_pp[205]), .sum(w_157), .carry(w_158));
    wire w_159, w_160;
    full_adder FA71 (.a(raw_pp[220]), .b(raw_pp[235]), .cin(raw_pp[250]), .sum(w_159), .carry(w_160));
    wire w_161, w_162;
    full_adder FA72 (.a(raw_pp[191]), .b(raw_pp[206]), .cin(raw_pp[221]), .sum(w_161), .carry(w_162));
    wire w_163, w_164;
    half_adder HA8 (.a(raw_pp[236]), .b(raw_pp[251]), .sum(w_163), .carry(w_164));
    wire w_165, w_166;
    full_adder FA73 (.a(raw_pp[207]), .b(raw_pp[222]), .cin(raw_pp[237]), .sum(w_165), .carry(w_166));
    wire w_167, w_168;
    full_adder FA74 (.a(raw_pp[223]), .b(raw_pp[238]), .cin(raw_pp[253]), .sum(w_167), .carry(w_168));
    wire w_169, w_170;
    half_adder HA9 (.a(raw_pp[239]), .b(raw_pp[254]), .sum(w_169), .carry(w_170));

    // ========================================================
    // Stage 2
    // ========================================================
    wire w_171, w_172;
    half_adder HA10 (.a(w_2), .b(w_3), .sum(w_171), .carry(w_172));
    wire w_173, w_174;
    full_adder FA75 (.a(w_4), .b(w_5), .cin(raw_pp[48]), .sum(w_173), .carry(w_174));
    wire w_175, w_176;
    full_adder FA76 (.a(w_6), .b(w_7), .cin(w_9), .sum(w_175), .carry(w_176));
    wire w_177, w_178;
    full_adder FA77 (.a(w_8), .b(w_10), .cin(w_11), .sum(w_177), .carry(w_178));
    wire w_179, w_180;
    full_adder FA78 (.a(w_12), .b(w_14), .cin(w_15), .sum(w_179), .carry(w_180));
    wire w_181, w_182;
    half_adder HA11 (.a(w_17), .b(raw_pp[96]), .sum(w_181), .carry(w_182));
    wire w_183, w_184;
    full_adder FA79 (.a(w_16), .b(w_18), .cin(w_19), .sum(w_183), .carry(w_184));
    wire w_185, w_186;
    half_adder HA12 (.a(w_21), .b(w_23), .sum(w_185), .carry(w_186));
    wire w_187, w_188;
    full_adder FA80 (.a(w_20), .b(w_22), .cin(w_24), .sum(w_187), .carry(w_188));
    wire w_189, w_190;
    full_adder FA81 (.a(w_25), .b(w_27), .cin(w_29), .sum(w_189), .carry(w_190));
    wire w_191, w_192;
    full_adder FA82 (.a(w_26), .b(w_28), .cin(w_30), .sum(w_191), .carry(w_192));
    wire w_193, w_194;
    full_adder FA83 (.a(w_31), .b(w_33), .cin(w_35), .sum(w_193), .carry(w_194));
    wire w_195, w_196;
    full_adder FA84 (.a(w_32), .b(w_34), .cin(w_36), .sum(w_195), .carry(w_196));
    wire w_197, w_198;
    full_adder FA85 (.a(w_37), .b(w_39), .cin(w_41), .sum(w_197), .carry(w_198));
    wire w_199, w_200;
    full_adder FA86 (.a(w_38), .b(w_40), .cin(w_42), .sum(w_199), .carry(w_200));
    wire w_201, w_202;
    full_adder FA87 (.a(w_44), .b(w_45), .cin(w_47), .sum(w_201), .carry(w_202));
    wire w_203, w_204;
    half_adder HA13 (.a(w_49), .b(w_51), .sum(w_203), .carry(w_204));
    wire w_205, w_206;
    full_adder FA88 (.a(w_46), .b(w_48), .cin(w_50), .sum(w_205), .carry(w_206));
    wire w_207, w_208;
    full_adder FA89 (.a(w_52), .b(w_53), .cin(w_55), .sum(w_207), .carry(w_208));
    wire w_209, w_210;
    full_adder FA90 (.a(w_57), .b(w_59), .cin(raw_pp[192]), .sum(w_209), .carry(w_210));
    wire w_211, w_212;
    full_adder FA91 (.a(w_54), .b(w_56), .cin(w_58), .sum(w_211), .carry(w_212));
    wire w_213, w_214;
    full_adder FA92 (.a(w_60), .b(w_61), .cin(w_63), .sum(w_213), .carry(w_214));
    wire w_215, w_216;
    full_adder FA93 (.a(w_65), .b(w_67), .cin(w_69), .sum(w_215), .carry(w_216));
    wire w_217, w_218;
    full_adder FA94 (.a(w_62), .b(w_64), .cin(w_66), .sum(w_217), .carry(w_218));
    wire w_219, w_220;
    full_adder FA95 (.a(w_68), .b(w_70), .cin(w_71), .sum(w_219), .carry(w_220));
    wire w_221, w_222;
    full_adder FA96 (.a(w_73), .b(w_75), .cin(w_77), .sum(w_221), .carry(w_222));
    wire w_223, w_224;
    full_adder FA97 (.a(w_72), .b(w_74), .cin(w_76), .sum(w_223), .carry(w_224));
    wire w_225, w_226;
    full_adder FA98 (.a(w_78), .b(w_80), .cin(w_81), .sum(w_225), .carry(w_226));
    wire w_227, w_228;
    full_adder FA99 (.a(w_83), .b(w_85), .cin(w_87), .sum(w_227), .carry(w_228));
    wire w_229, w_230;
    half_adder HA14 (.a(w_89), .b(raw_pp[240]), .sum(w_229), .carry(w_230));
    wire w_231, w_232;
    full_adder FA100 (.a(w_82), .b(w_84), .cin(w_86), .sum(w_231), .carry(w_232));
    wire w_233, w_234;
    full_adder FA101 (.a(w_88), .b(w_90), .cin(w_91), .sum(w_233), .carry(w_234));
    wire w_235, w_236;
    full_adder FA102 (.a(w_93), .b(w_95), .cin(w_97), .sum(w_235), .carry(w_236));
    wire w_237, w_238;
    half_adder HA15 (.a(w_99), .b(raw_pp_corr[16]), .sum(w_237), .carry(w_238));
    wire w_239, w_240;
    full_adder FA103 (.a(w_92), .b(w_94), .cin(w_96), .sum(w_239), .carry(w_240));
    wire w_241, w_242;
    full_adder FA104 (.a(w_98), .b(w_100), .cin(w_101), .sum(w_241), .carry(w_242));
    wire w_243, w_244;
    full_adder FA105 (.a(w_103), .b(w_105), .cin(w_107), .sum(w_243), .carry(w_244));
    wire w_245, w_246;
    full_adder FA106 (.a(w_102), .b(w_104), .cin(w_106), .sum(w_245), .carry(w_246));
    wire w_247, w_248;
    full_adder FA107 (.a(w_108), .b(w_110), .cin(w_111), .sum(w_247), .carry(w_248));
    wire w_249, w_250;
    full_adder FA108 (.a(w_113), .b(w_115), .cin(w_117), .sum(w_249), .carry(w_250));
    wire w_251, w_252;
    full_adder FA109 (.a(w_112), .b(w_114), .cin(w_116), .sum(w_251), .carry(w_252));
    wire w_253, w_254;
    full_adder FA110 (.a(w_118), .b(w_119), .cin(w_121), .sum(w_253), .carry(w_254));
    wire w_255, w_256;
    half_adder HA16 (.a(w_123), .b(w_125), .sum(w_255), .carry(w_256));
    wire w_257, w_258;
    full_adder FA111 (.a(w_120), .b(w_122), .cin(w_124), .sum(w_257), .carry(w_258));
    wire w_259, w_260;
    full_adder FA112 (.a(w_126), .b(w_127), .cin(w_129), .sum(w_259), .carry(w_260));
    wire w_261, w_262;
    half_adder HA17 (.a(w_131), .b(w_133), .sum(w_261), .carry(w_262));
    wire w_263, w_264;
    full_adder FA113 (.a(w_128), .b(w_130), .cin(w_132), .sum(w_263), .carry(w_264));
    wire w_265, w_266;
    full_adder FA114 (.a(w_134), .b(w_135), .cin(w_137), .sum(w_265), .carry(w_266));
    wire w_267, w_268;
    half_adder HA18 (.a(w_139), .b(raw_pp[246]), .sum(w_267), .carry(w_268));
    wire w_269, w_270;
    full_adder FA115 (.a(w_136), .b(w_138), .cin(w_140), .sum(w_269), .carry(w_270));
    wire w_271, w_272;
    full_adder FA116 (.a(w_141), .b(w_143), .cin(w_145), .sum(w_271), .carry(w_272));
    wire w_273, w_274;
    full_adder FA117 (.a(w_142), .b(w_144), .cin(w_146), .sum(w_273), .carry(w_274));
    wire w_275, w_276;
    full_adder FA118 (.a(w_147), .b(w_149), .cin(w_151), .sum(w_275), .carry(w_276));
    wire w_277, w_278;
    full_adder FA119 (.a(w_148), .b(w_150), .cin(w_152), .sum(w_277), .carry(w_278));
    wire w_279, w_280;
    full_adder FA120 (.a(w_153), .b(w_155), .cin(raw_pp[249]), .sum(w_279), .carry(w_280));
    wire w_281, w_282;
    full_adder FA121 (.a(w_154), .b(w_156), .cin(w_157), .sum(w_281), .carry(w_282));
    wire w_283, w_284;
    full_adder FA122 (.a(w_158), .b(w_160), .cin(w_161), .sum(w_283), .carry(w_284));
    wire w_285, w_286;
    full_adder FA123 (.a(w_162), .b(w_164), .cin(w_165), .sum(w_285), .carry(w_286));
    wire w_287, w_288;
    half_adder HA19 (.a(w_166), .b(w_167), .sum(w_287), .carry(w_288));
    wire w_289, w_290;
    half_adder HA20 (.a(w_168), .b(w_169), .sum(w_289), .carry(w_290));
    wire w_291, w_292;
    half_adder HA21 (.a(w_170), .b(raw_pp[255]), .sum(w_291), .carry(w_292));

    // Pipeline Register Bank: Post-Stage 2 Layer
    wire [133:0] stage2_D;
    wire [133:0] stage2_Q;
    assign stage2_D = {raw_pp_corr[31], w_292, w_291, w_290, w_289, w_288, w_287, w_286, raw_pp[252], w_285, w_284, w_163, w_283, w_282, w_159, w_281, w_280, w_278, w_279, w_277, w_276, w_274, w_275, w_273, w_272, w_270, w_271, w_269, w_268, w_266, w_264, w_267, w_265, w_263, w_262, w_260, w_258, w_261, w_259, w_257, w_256, w_254, w_252, w_255, w_253, w_251, w_250, w_248, w_246, raw_pp[243], w_249, w_247, w_245, w_244, w_242, w_240, w_109, w_243, w_241, w_239, w_238, w_236, w_234, w_232, w_237, w_235, w_233, w_231, w_230, w_228, w_226, w_224, w_229, w_227, w_225, w_223, w_222, w_220, w_218, w_79, w_221, w_219, w_217, w_216, w_214, w_212, w_215, w_213, w_211, w_210, w_208, w_206, w_209, w_207, w_205, w_204, w_202, w_200, w_203, w_201, w_199, w_198, w_196, w_43, w_197, w_195, w_194, w_192, raw_pp[144], w_193, w_191, w_190, w_188, w_189, w_187, w_186, w_184, w_185, w_183, w_182, w_180, w_181, w_179, w_178, w_13, w_177, w_176, w_175, w_174, w_173, w_172, w_171, w_1, raw_pp[0]};
    register_bank #(.WIDTH(134)) reg_stage_2 (
        .clk(clk), .rst(rst), .en(en), .D(stage2_D), .Q(stage2_Q)
    );

    // ========================================================
    // Stage 3
    // ========================================================
    wire w_293, w_294;
    half_adder HA22 (.a(stage2_Q[3]), .b(stage2_Q[4]), .sum(w_293), .carry(w_294));
    wire w_295, w_296;
    half_adder HA23 (.a(stage2_Q[5]), .b(stage2_Q[6]), .sum(w_295), .carry(w_296));
    wire w_297, w_298;
    full_adder FA124 (.a(stage2_Q[7]), .b(stage2_Q[8]), .cin(stage2_Q[9]), .sum(w_297), .carry(w_298));
    wire w_299, w_300;
    full_adder FA125 (.a(stage2_Q[10]), .b(stage2_Q[11]), .cin(stage2_Q[12]), .sum(w_299), .carry(w_300));
    wire w_301, w_302;
    full_adder FA126 (.a(stage2_Q[13]), .b(stage2_Q[14]), .cin(stage2_Q[15]), .sum(w_301), .carry(w_302));
    wire w_303, w_304;
    full_adder FA127 (.a(stage2_Q[17]), .b(stage2_Q[18]), .cin(stage2_Q[19]), .sum(w_303), .carry(w_304));
    wire w_305, w_306;
    full_adder FA128 (.a(stage2_Q[21]), .b(stage2_Q[22]), .cin(stage2_Q[23]), .sum(w_305), .carry(w_306));
    wire w_307, w_308;
    half_adder HA24 (.a(stage2_Q[24]), .b(stage2_Q[25]), .sum(w_307), .carry(w_308));
    wire w_309, w_310;
    full_adder FA129 (.a(stage2_Q[26]), .b(stage2_Q[27]), .cin(stage2_Q[28]), .sum(w_309), .carry(w_310));
    wire w_311, w_312;
    half_adder HA25 (.a(stage2_Q[29]), .b(stage2_Q[30]), .sum(w_311), .carry(w_312));
    wire w_313, w_314;
    full_adder FA130 (.a(stage2_Q[31]), .b(stage2_Q[32]), .cin(stage2_Q[33]), .sum(w_313), .carry(w_314));
    wire w_315, w_316;
    half_adder HA26 (.a(stage2_Q[34]), .b(stage2_Q[35]), .sum(w_315), .carry(w_316));
    wire w_317, w_318;
    full_adder FA131 (.a(stage2_Q[36]), .b(stage2_Q[37]), .cin(stage2_Q[38]), .sum(w_317), .carry(w_318));
    wire w_319, w_320;
    full_adder FA132 (.a(stage2_Q[39]), .b(stage2_Q[40]), .cin(stage2_Q[41]), .sum(w_319), .carry(w_320));
    wire w_321, w_322;
    full_adder FA133 (.a(stage2_Q[42]), .b(stage2_Q[43]), .cin(stage2_Q[44]), .sum(w_321), .carry(w_322));
    wire w_323, w_324;
    full_adder FA134 (.a(stage2_Q[45]), .b(stage2_Q[46]), .cin(stage2_Q[47]), .sum(w_323), .carry(w_324));
    wire w_325, w_326;
    full_adder FA135 (.a(stage2_Q[48]), .b(stage2_Q[49]), .cin(stage2_Q[50]), .sum(w_325), .carry(w_326));
    wire w_327, w_328;
    full_adder FA136 (.a(stage2_Q[51]), .b(stage2_Q[52]), .cin(stage2_Q[53]), .sum(w_327), .carry(w_328));
    wire w_329, w_330;
    full_adder FA137 (.a(stage2_Q[55]), .b(stage2_Q[56]), .cin(stage2_Q[57]), .sum(w_329), .carry(w_330));
    wire w_331, w_332;
    full_adder FA138 (.a(stage2_Q[58]), .b(stage2_Q[59]), .cin(stage2_Q[60]), .sum(w_331), .carry(w_332));
    wire w_333, w_334;
    full_adder FA139 (.a(stage2_Q[62]), .b(stage2_Q[63]), .cin(stage2_Q[64]), .sum(w_333), .carry(w_334));
    wire w_335, w_336;
    full_adder FA140 (.a(stage2_Q[65]), .b(stage2_Q[66]), .cin(stage2_Q[67]), .sum(w_335), .carry(w_336));
    wire w_337, w_338;
    half_adder HA27 (.a(stage2_Q[68]), .b(stage2_Q[69]), .sum(w_337), .carry(w_338));
    wire w_339, w_340;
    full_adder FA141 (.a(stage2_Q[70]), .b(stage2_Q[71]), .cin(stage2_Q[72]), .sum(w_339), .carry(w_340));
    wire w_341, w_342;
    full_adder FA142 (.a(stage2_Q[73]), .b(stage2_Q[74]), .cin(stage2_Q[75]), .sum(w_341), .carry(w_342));
    wire w_343, w_344;
    half_adder HA28 (.a(stage2_Q[76]), .b(stage2_Q[77]), .sum(w_343), .carry(w_344));
    wire w_345, w_346;
    full_adder FA143 (.a(stage2_Q[78]), .b(stage2_Q[79]), .cin(stage2_Q[80]), .sum(w_345), .carry(w_346));
    wire w_347, w_348;
    full_adder FA144 (.a(stage2_Q[81]), .b(stage2_Q[82]), .cin(stage2_Q[83]), .sum(w_347), .carry(w_348));
    wire w_349, w_350;
    full_adder FA145 (.a(stage2_Q[85]), .b(stage2_Q[86]), .cin(stage2_Q[87]), .sum(w_349), .carry(w_350));
    wire w_351, w_352;
    full_adder FA146 (.a(stage2_Q[88]), .b(stage2_Q[89]), .cin(stage2_Q[90]), .sum(w_351), .carry(w_352));
    wire w_353, w_354;
    full_adder FA147 (.a(stage2_Q[91]), .b(stage2_Q[92]), .cin(stage2_Q[93]), .sum(w_353), .carry(w_354));
    wire w_355, w_356;
    full_adder FA148 (.a(stage2_Q[94]), .b(stage2_Q[95]), .cin(stage2_Q[96]), .sum(w_355), .carry(w_356));
    wire w_357, w_358;
    full_adder FA149 (.a(stage2_Q[97]), .b(stage2_Q[98]), .cin(stage2_Q[99]), .sum(w_357), .carry(w_358));
    wire w_359, w_360;
    full_adder FA150 (.a(stage2_Q[100]), .b(stage2_Q[101]), .cin(stage2_Q[102]), .sum(w_359), .carry(w_360));
    wire w_361, w_362;
    full_adder FA151 (.a(stage2_Q[103]), .b(stage2_Q[104]), .cin(stage2_Q[105]), .sum(w_361), .carry(w_362));
    wire w_363, w_364;
    half_adder HA29 (.a(stage2_Q[106]), .b(stage2_Q[107]), .sum(w_363), .carry(w_364));
    wire w_365, w_366;
    full_adder FA152 (.a(stage2_Q[108]), .b(stage2_Q[109]), .cin(stage2_Q[110]), .sum(w_365), .carry(w_366));
    wire w_367, w_368;
    full_adder FA153 (.a(stage2_Q[112]), .b(stage2_Q[113]), .cin(stage2_Q[114]), .sum(w_367), .carry(w_368));
    wire w_369, w_370;
    full_adder FA154 (.a(stage2_Q[116]), .b(stage2_Q[117]), .cin(stage2_Q[118]), .sum(w_369), .carry(w_370));
    wire w_371, w_372;
    full_adder FA155 (.a(stage2_Q[120]), .b(stage2_Q[121]), .cin(stage2_Q[122]), .sum(w_371), .carry(w_372));
    wire w_373, w_374;
    full_adder FA156 (.a(stage2_Q[123]), .b(stage2_Q[124]), .cin(stage2_Q[125]), .sum(w_373), .carry(w_374));
    wire w_375, w_376;
    half_adder HA30 (.a(stage2_Q[126]), .b(stage2_Q[127]), .sum(w_375), .carry(w_376));
    wire w_377, w_378;
    half_adder HA31 (.a(stage2_Q[128]), .b(stage2_Q[129]), .sum(w_377), .carry(w_378));
    wire w_379, w_380;
    half_adder HA32 (.a(stage2_Q[130]), .b(stage2_Q[131]), .sum(w_379), .carry(w_380));
    wire w_381, w_382;
    half_adder HA33 (.a(stage2_Q[132]), .b(stage2_Q[133]), .sum(w_381), .carry(w_382));

    // ========================================================
    // Stage 4
    // ========================================================
    wire w_383, w_384;
    half_adder HA34 (.a(w_294), .b(w_295), .sum(w_383), .carry(w_384));
    wire w_385, w_386;
    half_adder HA35 (.a(w_296), .b(w_297), .sum(w_385), .carry(w_386));
    wire w_387, w_388;
    half_adder HA36 (.a(w_298), .b(w_299), .sum(w_387), .carry(w_388));
    wire w_389, w_390;
    full_adder FA157 (.a(w_300), .b(w_301), .cin(stage2_Q[16]), .sum(w_389), .carry(w_390));
    wire w_391, w_392;
    full_adder FA158 (.a(w_302), .b(w_303), .cin(stage2_Q[20]), .sum(w_391), .carry(w_392));
    wire w_393, w_394;
    full_adder FA159 (.a(w_304), .b(w_305), .cin(w_307), .sum(w_393), .carry(w_394));
    wire w_395, w_396;
    full_adder FA160 (.a(w_306), .b(w_308), .cin(w_309), .sum(w_395), .carry(w_396));
    wire w_397, w_398;
    full_adder FA161 (.a(w_310), .b(w_312), .cin(w_313), .sum(w_397), .carry(w_398));
    wire w_399, w_400;
    full_adder FA162 (.a(w_314), .b(w_316), .cin(w_317), .sum(w_399), .carry(w_400));
    wire w_401, w_402;
    full_adder FA163 (.a(w_318), .b(w_320), .cin(w_321), .sum(w_401), .carry(w_402));
    wire w_403, w_404;
    full_adder FA164 (.a(w_322), .b(w_324), .cin(w_325), .sum(w_403), .carry(w_404));
    wire w_405, w_406;
    half_adder HA37 (.a(w_327), .b(stage2_Q[54]), .sum(w_405), .carry(w_406));
    wire w_407, w_408;
    full_adder FA165 (.a(w_326), .b(w_328), .cin(w_329), .sum(w_407), .carry(w_408));
    wire w_409, w_410;
    half_adder HA38 (.a(w_331), .b(stage2_Q[61]), .sum(w_409), .carry(w_410));
    wire w_411, w_412;
    full_adder FA166 (.a(w_330), .b(w_332), .cin(w_333), .sum(w_411), .carry(w_412));
    wire w_413, w_414;
    half_adder HA39 (.a(w_335), .b(w_337), .sum(w_413), .carry(w_414));
    wire w_415, w_416;
    full_adder FA167 (.a(w_334), .b(w_336), .cin(w_338), .sum(w_415), .carry(w_416));
    wire w_417, w_418;
    full_adder FA168 (.a(w_339), .b(w_341), .cin(w_343), .sum(w_417), .carry(w_418));
    wire w_419, w_420;
    full_adder FA169 (.a(w_340), .b(w_342), .cin(w_344), .sum(w_419), .carry(w_420));
    wire w_421, w_422;
    full_adder FA170 (.a(w_345), .b(w_347), .cin(stage2_Q[84]), .sum(w_421), .carry(w_422));
    wire w_423, w_424;
    full_adder FA171 (.a(w_346), .b(w_348), .cin(w_349), .sum(w_423), .carry(w_424));
    wire w_425, w_426;
    full_adder FA172 (.a(w_350), .b(w_352), .cin(w_353), .sum(w_425), .carry(w_426));
    wire w_427, w_428;
    full_adder FA173 (.a(w_354), .b(w_356), .cin(w_357), .sum(w_427), .carry(w_428));
    wire w_429, w_430;
    full_adder FA174 (.a(w_358), .b(w_360), .cin(w_361), .sum(w_429), .carry(w_430));
    wire w_431, w_432;
    full_adder FA175 (.a(w_362), .b(w_364), .cin(w_365), .sum(w_431), .carry(w_432));
    wire w_433, w_434;
    full_adder FA176 (.a(w_366), .b(w_367), .cin(stage2_Q[115]), .sum(w_433), .carry(w_434));
    wire w_435, w_436;
    full_adder FA177 (.a(w_368), .b(w_369), .cin(stage2_Q[119]), .sum(w_435), .carry(w_436));
    wire w_437, w_438;
    half_adder HA40 (.a(w_370), .b(w_371), .sum(w_437), .carry(w_438));
    wire w_439, w_440;
    half_adder HA41 (.a(w_372), .b(w_373), .sum(w_439), .carry(w_440));
    wire w_441, w_442;
    half_adder HA42 (.a(w_374), .b(w_375), .sum(w_441), .carry(w_442));
    wire w_443, w_444;
    half_adder HA43 (.a(w_376), .b(w_377), .sum(w_443), .carry(w_444));
    wire w_445, w_446;
    half_adder HA44 (.a(w_378), .b(w_379), .sum(w_445), .carry(w_446));
    wire w_447, w_448;
    half_adder HA45 (.a(w_380), .b(w_381), .sum(w_447), .carry(w_448));

    // Pipeline Register Bank: Post-Stage 4 Layer
    wire [77:0] stage4_D;
    wire [77:0] stage4_Q;
    assign stage4_D = {w_447, w_446, w_445, w_444, w_443, w_442, w_441, w_440, w_439, w_438, w_437, w_436, w_435, w_434, w_433, w_432, stage2_Q[111], w_431, w_430, w_363, w_429, w_428, w_359, w_427, w_426, w_355, w_425, w_424, w_351, w_423, w_422, w_420, w_421, w_419, w_418, w_416, w_417, w_415, w_414, w_412, w_413, w_411, w_410, w_408, w_409, w_407, w_406, w_404, w_405, w_403, w_402, w_323, w_401, w_400, w_319, w_399, w_398, w_315, w_397, w_396, w_311, w_395, w_394, w_393, w_392, w_391, w_390, w_389, w_388, w_387, w_386, w_385, w_384, w_383, w_293, stage2_Q[2], stage2_Q[1], stage2_Q[0]};
    register_bank #(.WIDTH(78)) reg_stage_4 (
        .clk(clk), .rst(rst), .en(en), .D(stage4_D), .Q(stage4_Q)
    );

    // ========================================================
    // Stage 5
    // ========================================================
    wire w_449, w_450;
    half_adder HA46 (.a(stage4_Q[5]), .b(stage4_Q[6]), .sum(w_449), .carry(w_450));
    wire w_451, w_452;
    half_adder HA47 (.a(stage4_Q[7]), .b(stage4_Q[8]), .sum(w_451), .carry(w_452));
    wire w_453, w_454;
    half_adder HA48 (.a(stage4_Q[9]), .b(stage4_Q[10]), .sum(w_453), .carry(w_454));
    wire w_455, w_456;
    half_adder HA49 (.a(stage4_Q[11]), .b(stage4_Q[12]), .sum(w_455), .carry(w_456));
    wire w_457, w_458;
    half_adder HA50 (.a(stage4_Q[13]), .b(stage4_Q[14]), .sum(w_457), .carry(w_458));
    wire w_459, w_460;
    full_adder FA178 (.a(stage4_Q[15]), .b(stage4_Q[16]), .cin(stage4_Q[17]), .sum(w_459), .carry(w_460));
    wire w_461, w_462;
    full_adder FA179 (.a(stage4_Q[18]), .b(stage4_Q[19]), .cin(stage4_Q[20]), .sum(w_461), .carry(w_462));
    wire w_463, w_464;
    full_adder FA180 (.a(stage4_Q[21]), .b(stage4_Q[22]), .cin(stage4_Q[23]), .sum(w_463), .carry(w_464));
    wire w_465, w_466;
    full_adder FA181 (.a(stage4_Q[24]), .b(stage4_Q[25]), .cin(stage4_Q[26]), .sum(w_465), .carry(w_466));
    wire w_467, w_468;
    full_adder FA182 (.a(stage4_Q[27]), .b(stage4_Q[28]), .cin(stage4_Q[29]), .sum(w_467), .carry(w_468));
    wire w_469, w_470;
    full_adder FA183 (.a(stage4_Q[30]), .b(stage4_Q[31]), .cin(stage4_Q[32]), .sum(w_469), .carry(w_470));
    wire w_471, w_472;
    full_adder FA184 (.a(stage4_Q[34]), .b(stage4_Q[35]), .cin(stage4_Q[36]), .sum(w_471), .carry(w_472));
    wire w_473, w_474;
    full_adder FA185 (.a(stage4_Q[38]), .b(stage4_Q[39]), .cin(stage4_Q[40]), .sum(w_473), .carry(w_474));
    wire w_475, w_476;
    full_adder FA186 (.a(stage4_Q[42]), .b(stage4_Q[43]), .cin(stage4_Q[44]), .sum(w_475), .carry(w_476));
    wire w_477, w_478;
    full_adder FA187 (.a(stage4_Q[46]), .b(stage4_Q[47]), .cin(stage4_Q[48]), .sum(w_477), .carry(w_478));
    wire w_479, w_480;
    full_adder FA188 (.a(stage4_Q[50]), .b(stage4_Q[51]), .cin(stage4_Q[52]), .sum(w_479), .carry(w_480));
    wire w_481, w_482;
    full_adder FA189 (.a(stage4_Q[53]), .b(stage4_Q[54]), .cin(stage4_Q[55]), .sum(w_481), .carry(w_482));
    wire w_483, w_484;
    full_adder FA190 (.a(stage4_Q[56]), .b(stage4_Q[57]), .cin(stage4_Q[58]), .sum(w_483), .carry(w_484));
    wire w_485, w_486;
    full_adder FA191 (.a(stage4_Q[59]), .b(stage4_Q[60]), .cin(stage4_Q[61]), .sum(w_485), .carry(w_486));
    wire w_487, w_488;
    half_adder HA51 (.a(stage4_Q[62]), .b(stage4_Q[63]), .sum(w_487), .carry(w_488));
    wire w_489, w_490;
    half_adder HA52 (.a(stage4_Q[64]), .b(stage4_Q[65]), .sum(w_489), .carry(w_490));
    wire w_491, w_492;
    half_adder HA53 (.a(stage4_Q[66]), .b(stage4_Q[67]), .sum(w_491), .carry(w_492));
    wire w_493, w_494;
    half_adder HA54 (.a(stage4_Q[68]), .b(stage4_Q[69]), .sum(w_493), .carry(w_494));
    wire w_495, w_496;
    half_adder HA55 (.a(stage4_Q[70]), .b(stage4_Q[71]), .sum(w_495), .carry(w_496));
    wire w_497, w_498;
    half_adder HA56 (.a(stage4_Q[72]), .b(stage4_Q[73]), .sum(w_497), .carry(w_498));
    wire w_499, w_500;
    half_adder HA57 (.a(stage4_Q[74]), .b(stage4_Q[75]), .sum(w_499), .carry(w_500));
    wire w_501, w_502;
    half_adder HA58 (.a(stage4_Q[76]), .b(stage4_Q[77]), .sum(w_501), .carry(w_502));

    // ========================================================
    // Stage 6
    // ========================================================
    wire w_503, w_504;
    half_adder HA59 (.a(w_450), .b(w_451), .sum(w_503), .carry(w_504));
    wire w_505, w_506;
    half_adder HA60 (.a(w_452), .b(w_453), .sum(w_505), .carry(w_506));
    wire w_507, w_508;
    half_adder HA61 (.a(w_454), .b(w_455), .sum(w_507), .carry(w_508));
    wire w_509, w_510;
    half_adder HA62 (.a(w_456), .b(w_457), .sum(w_509), .carry(w_510));
    wire w_511, w_512;
    half_adder HA63 (.a(w_458), .b(w_459), .sum(w_511), .carry(w_512));
    wire w_513, w_514;
    half_adder HA64 (.a(w_460), .b(w_461), .sum(w_513), .carry(w_514));
    wire w_515, w_516;
    half_adder HA65 (.a(w_462), .b(w_463), .sum(w_515), .carry(w_516));
    wire w_517, w_518;
    half_adder HA66 (.a(w_464), .b(w_465), .sum(w_517), .carry(w_518));
    wire w_519, w_520;
    half_adder HA67 (.a(w_466), .b(w_467), .sum(w_519), .carry(w_520));
    wire w_521, w_522;
    full_adder FA192 (.a(w_468), .b(w_469), .cin(stage4_Q[33]), .sum(w_521), .carry(w_522));
    wire w_523, w_524;
    full_adder FA193 (.a(w_470), .b(w_471), .cin(stage4_Q[37]), .sum(w_523), .carry(w_524));
    wire w_525, w_526;
    full_adder FA194 (.a(w_472), .b(w_473), .cin(stage4_Q[41]), .sum(w_525), .carry(w_526));
    wire w_527, w_528;
    full_adder FA195 (.a(w_474), .b(w_475), .cin(stage4_Q[45]), .sum(w_527), .carry(w_528));
    wire w_529, w_530;
    full_adder FA196 (.a(w_476), .b(w_477), .cin(stage4_Q[49]), .sum(w_529), .carry(w_530));
    wire w_531, w_532;
    half_adder HA68 (.a(w_478), .b(w_479), .sum(w_531), .carry(w_532));
    wire w_533, w_534;
    half_adder HA69 (.a(w_480), .b(w_481), .sum(w_533), .carry(w_534));
    wire w_535, w_536;
    half_adder HA70 (.a(w_482), .b(w_483), .sum(w_535), .carry(w_536));
    wire w_537, w_538;
    half_adder HA71 (.a(w_484), .b(w_485), .sum(w_537), .carry(w_538));
    wire w_539, w_540;
    half_adder HA72 (.a(w_486), .b(w_487), .sum(w_539), .carry(w_540));
    wire w_541, w_542;
    half_adder HA73 (.a(w_488), .b(w_489), .sum(w_541), .carry(w_542));
    wire w_543, w_544;
    half_adder HA74 (.a(w_490), .b(w_491), .sum(w_543), .carry(w_544));
    wire w_545, w_546;
    half_adder HA75 (.a(w_492), .b(w_493), .sum(w_545), .carry(w_546));
    wire w_547, w_548;
    half_adder HA76 (.a(w_494), .b(w_495), .sum(w_547), .carry(w_548));
    wire w_549, w_550;
    half_adder HA77 (.a(w_496), .b(w_497), .sum(w_549), .carry(w_550));
    wire w_551, w_552;
    half_adder HA78 (.a(w_498), .b(w_499), .sum(w_551), .carry(w_552));
    wire w_553, w_554;
    half_adder HA79 (.a(w_500), .b(w_501), .sum(w_553), .carry(w_554));

    // Pipeline Register Bank: Post-Stage 6 Layer
    wire [56:0] stage6_D;
    wire [56:0] stage6_Q;
    assign stage6_D = {w_553, w_552, w_551, w_550, w_549, w_548, w_547, w_546, w_545, w_544, w_543, w_542, w_541, w_540, w_539, w_538, w_537, w_536, w_535, w_534, w_533, w_532, w_531, w_530, w_529, w_528, w_527, w_526, w_525, w_524, w_523, w_522, w_521, w_520, w_519, w_518, w_517, w_516, w_515, w_514, w_513, w_512, w_511, w_510, w_509, w_508, w_507, w_506, w_505, w_504, w_503, w_449, stage4_Q[4], stage4_Q[3], stage4_Q[2], stage4_Q[1], stage4_Q[0]};
    register_bank #(.WIDTH(57)) reg_stage_6 (
        .clk(clk), .rst(rst), .en(en), .D(stage6_D), .Q(stage6_Q)
    );

    // ========================================================
    // Vector Preparation for Final Addition
    // ========================================================
    wire [31:0] adder_vec_A_raw = {stage6_Q[55], stage6_Q[53], stage6_Q[51], stage6_Q[49], stage6_Q[47], stage6_Q[45], stage6_Q[43], stage6_Q[41], stage6_Q[39], stage6_Q[37], stage6_Q[35], stage6_Q[33], stage6_Q[31], stage6_Q[29], stage6_Q[27], stage6_Q[25], stage6_Q[23], stage6_Q[21], stage6_Q[19], stage6_Q[17], stage6_Q[15], stage6_Q[13], stage6_Q[11], stage6_Q[9], stage6_Q[7], stage6_Q[6], stage6_Q[5], stage6_Q[4], stage6_Q[3], stage6_Q[2], stage6_Q[1], stage6_Q[0]};
    wire [31:0] adder_vec_B_raw = {stage6_Q[56], stage6_Q[54], stage6_Q[52], stage6_Q[50], stage6_Q[48], stage6_Q[46], stage6_Q[44], stage6_Q[42], stage6_Q[40], stage6_Q[38], stage6_Q[36], stage6_Q[34], stage6_Q[32], stage6_Q[30], stage6_Q[28], stage6_Q[26], stage6_Q[24], stage6_Q[22], stage6_Q[20], stage6_Q[18], stage6_Q[16], stage6_Q[14], stage6_Q[12], stage6_Q[10], stage6_Q[8], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};

    // ========================================================
    // RCA: Final Adder Block
    // ========================================================
    wire [31:0] raw_final_product;
    wire adder_cout;
    ripple_carry_adder #(.N(32)) rca_inst (
        .A(adder_vec_A_raw), .B(adder_vec_B_raw), .Cin(1'b0), .Sum(raw_final_product), .Cout(adder_cout)
    );

    // ========================================================
    // Boundary Pipeline Registers: Final Output (Product)
    // ========================================================
    register_bank #(.WIDTH(32)) reg_output_product (
        .clk(clk), .rst(rst), .en(en), .D(raw_final_product), .Q(Product)
    );

endmodule
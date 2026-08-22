// =========================================================================
// Dynamically Generated Pipelined Booth Wallace (Radix - 8) Multiplier
// Configuration: N = 16
// =========================================================================

module booth_wallace_radix8_multiplier_16 #(
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
    localparam PIPELINE_LATENCY = 4;

    // ========================================================
    // Boundary Pipeline Registers: Inputs (A and B)
    // ========================================================
    wire [15:0] reg_A_w;
    wire [15:0] reg_B_w;
    register_bank #(.WIDTH(16)) reg_input_A (.clk(clk), .rst(rst), .en(en), .D(A), .Q(reg_A_w));
    register_bank #(.WIDTH(16)) reg_input_B (.clk(clk), .rst(rst), .en(en), .D(B), .Q(reg_B_w));

    // ========================================================
    // PPG: Custom Radix-8 Booth Partial Product Generation
    // ========================================================
    wire [107:0] raw_pp;
    wire [5:0] raw_pp_cin;
    wire [18:0] raw_pp_corr;

    booth_radix8_ppg #(.N(16), .SIGNED_A(SIGNED_A), .SIGNED_B(SIGNED_B)) ppg_inst (
        .A(reg_A_w), .B(reg_B_w),
        .pp(raw_pp), .pp_cin(raw_pp_cin), .pp_corr(raw_pp_corr)
    );

    // ========================================================
    // Stage 1
    // ========================================================
    wire w_1, w_2;
    half_adder HA0 (.a(raw_pp[0]), .b(raw_pp_cin[0]), .sum(w_1), .carry(w_2));
    wire w_3, w_4;
    full_adder FA0 (.a(raw_pp[3]), .b(raw_pp[18]), .cin(raw_pp_cin[1]), .sum(w_3), .carry(w_4));
    wire w_5, w_6;
    half_adder HA1 (.a(raw_pp[4]), .b(raw_pp[19]), .sum(w_5), .carry(w_6));
    wire w_7, w_8;
    half_adder HA2 (.a(raw_pp[5]), .b(raw_pp[20]), .sum(w_7), .carry(w_8));
    wire w_9, w_10;
    full_adder FA1 (.a(raw_pp[6]), .b(raw_pp[21]), .cin(raw_pp[36]), .sum(w_9), .carry(w_10));
    wire w_11, w_12;
    full_adder FA2 (.a(raw_pp[7]), .b(raw_pp[22]), .cin(raw_pp[37]), .sum(w_11), .carry(w_12));
    wire w_13, w_14;
    full_adder FA3 (.a(raw_pp[8]), .b(raw_pp[23]), .cin(raw_pp[38]), .sum(w_13), .carry(w_14));
    wire w_15, w_16;
    full_adder FA4 (.a(raw_pp[9]), .b(raw_pp[24]), .cin(raw_pp[39]), .sum(w_15), .carry(w_16));
    wire w_17, w_18;
    half_adder HA3 (.a(raw_pp[54]), .b(raw_pp_cin[3]), .sum(w_17), .carry(w_18));
    wire w_19, w_20;
    full_adder FA5 (.a(raw_pp[10]), .b(raw_pp[25]), .cin(raw_pp[40]), .sum(w_19), .carry(w_20));
    wire w_21, w_22;
    full_adder FA6 (.a(raw_pp[11]), .b(raw_pp[26]), .cin(raw_pp[41]), .sum(w_21), .carry(w_22));
    wire w_23, w_24;
    full_adder FA7 (.a(raw_pp[12]), .b(raw_pp[27]), .cin(raw_pp[42]), .sum(w_23), .carry(w_24));
    wire w_25, w_26;
    full_adder FA8 (.a(raw_pp[57]), .b(raw_pp[72]), .cin(raw_pp_cin[4]), .sum(w_25), .carry(w_26));
    wire w_27, w_28;
    full_adder FA9 (.a(raw_pp[13]), .b(raw_pp[28]), .cin(raw_pp[43]), .sum(w_27), .carry(w_28));
    wire w_29, w_30;
    half_adder HA4 (.a(raw_pp[58]), .b(raw_pp[73]), .sum(w_29), .carry(w_30));
    wire w_31, w_32;
    full_adder FA10 (.a(raw_pp[14]), .b(raw_pp[29]), .cin(raw_pp[44]), .sum(w_31), .carry(w_32));
    wire w_33, w_34;
    half_adder HA5 (.a(raw_pp[59]), .b(raw_pp[74]), .sum(w_33), .carry(w_34));
    wire w_35, w_36;
    full_adder FA11 (.a(raw_pp[15]), .b(raw_pp[30]), .cin(raw_pp[45]), .sum(w_35), .carry(w_36));
    wire w_37, w_38;
    full_adder FA12 (.a(raw_pp[60]), .b(raw_pp[75]), .cin(raw_pp[90]), .sum(w_37), .carry(w_38));
    wire w_39, w_40;
    full_adder FA13 (.a(raw_pp[16]), .b(raw_pp[31]), .cin(raw_pp[46]), .sum(w_39), .carry(w_40));
    wire w_41, w_42;
    full_adder FA14 (.a(raw_pp[61]), .b(raw_pp[76]), .cin(raw_pp[91]), .sum(w_41), .carry(w_42));
    wire w_43, w_44;
    full_adder FA15 (.a(raw_pp[17]), .b(raw_pp[32]), .cin(raw_pp[47]), .sum(w_43), .carry(w_44));
    wire w_45, w_46;
    full_adder FA16 (.a(raw_pp[62]), .b(raw_pp[77]), .cin(raw_pp[92]), .sum(w_45), .carry(w_46));
    wire w_47, w_48;
    full_adder FA17 (.a(raw_pp_corr[0]), .b(raw_pp[33]), .cin(raw_pp[48]), .sum(w_47), .carry(w_48));
    wire w_49, w_50;
    full_adder FA18 (.a(raw_pp[63]), .b(raw_pp[78]), .cin(raw_pp[93]), .sum(w_49), .carry(w_50));
    wire w_51, w_52;
    full_adder FA19 (.a(raw_pp_corr[1]), .b(raw_pp[34]), .cin(raw_pp[49]), .sum(w_51), .carry(w_52));
    wire w_53, w_54;
    full_adder FA20 (.a(raw_pp[64]), .b(raw_pp[79]), .cin(raw_pp[94]), .sum(w_53), .carry(w_54));
    wire w_55, w_56;
    full_adder FA21 (.a(raw_pp_corr[2]), .b(raw_pp[35]), .cin(raw_pp[50]), .sum(w_55), .carry(w_56));
    wire w_57, w_58;
    full_adder FA22 (.a(raw_pp[65]), .b(raw_pp[80]), .cin(raw_pp[95]), .sum(w_57), .carry(w_58));
    wire w_59, w_60;
    full_adder FA23 (.a(raw_pp_corr[3]), .b(raw_pp_corr[4]), .cin(raw_pp[51]), .sum(w_59), .carry(w_60));
    wire w_61, w_62;
    full_adder FA24 (.a(raw_pp[66]), .b(raw_pp[81]), .cin(raw_pp[96]), .sum(w_61), .carry(w_62));
    wire w_63, w_64;
    full_adder FA25 (.a(raw_pp_corr[5]), .b(raw_pp[52]), .cin(raw_pp[67]), .sum(w_63), .carry(w_64));
    wire w_65, w_66;
    half_adder HA6 (.a(raw_pp[82]), .b(raw_pp[97]), .sum(w_65), .carry(w_66));
    wire w_67, w_68;
    full_adder FA26 (.a(raw_pp_corr[6]), .b(raw_pp[53]), .cin(raw_pp[68]), .sum(w_67), .carry(w_68));
    wire w_69, w_70;
    half_adder HA7 (.a(raw_pp[83]), .b(raw_pp[98]), .sum(w_69), .carry(w_70));
    wire w_71, w_72;
    full_adder FA27 (.a(raw_pp_corr[7]), .b(raw_pp[69]), .cin(raw_pp[84]), .sum(w_71), .carry(w_72));
    wire w_73, w_74;
    full_adder FA28 (.a(raw_pp_corr[8]), .b(raw_pp[70]), .cin(raw_pp[85]), .sum(w_73), .carry(w_74));
    wire w_75, w_76;
    full_adder FA29 (.a(raw_pp_corr[9]), .b(raw_pp[71]), .cin(raw_pp[86]), .sum(w_75), .carry(w_76));
    wire w_77, w_78;
    full_adder FA30 (.a(raw_pp_corr[10]), .b(raw_pp[87]), .cin(raw_pp[102]), .sum(w_77), .carry(w_78));
    wire w_79, w_80;
    full_adder FA31 (.a(raw_pp_corr[11]), .b(raw_pp[88]), .cin(raw_pp[103]), .sum(w_79), .carry(w_80));
    wire w_81, w_82;
    full_adder FA32 (.a(raw_pp_corr[12]), .b(raw_pp[89]), .cin(raw_pp[104]), .sum(w_81), .carry(w_82));
    wire w_83, w_84;
    half_adder HA8 (.a(raw_pp_corr[13]), .b(raw_pp[105]), .sum(w_83), .carry(w_84));
    wire w_85, w_86;
    half_adder HA9 (.a(raw_pp_corr[14]), .b(raw_pp[106]), .sum(w_85), .carry(w_86));

    // ========================================================
    // Stage 2
    // ========================================================
    wire w_87, w_88;
    half_adder HA10 (.a(w_2), .b(raw_pp[1]), .sum(w_87), .carry(w_88));
    wire w_89, w_90;
    half_adder HA11 (.a(w_4), .b(w_5), .sum(w_89), .carry(w_90));
    wire w_91, w_92;
    half_adder HA12 (.a(w_6), .b(w_7), .sum(w_91), .carry(w_92));
    wire w_93, w_94;
    full_adder FA33 (.a(w_8), .b(w_9), .cin(raw_pp_cin[2]), .sum(w_93), .carry(w_94));
    wire w_95, w_96;
    half_adder HA13 (.a(w_10), .b(w_11), .sum(w_95), .carry(w_96));
    wire w_97, w_98;
    half_adder HA14 (.a(w_12), .b(w_13), .sum(w_97), .carry(w_98));
    wire w_99, w_100;
    full_adder FA34 (.a(w_14), .b(w_15), .cin(w_17), .sum(w_99), .carry(w_100));
    wire w_101, w_102;
    full_adder FA35 (.a(w_16), .b(w_18), .cin(w_19), .sum(w_101), .carry(w_102));
    wire w_103, w_104;
    full_adder FA36 (.a(w_20), .b(w_21), .cin(raw_pp[56]), .sum(w_103), .carry(w_104));
    wire w_105, w_106;
    full_adder FA37 (.a(w_22), .b(w_23), .cin(w_25), .sum(w_105), .carry(w_106));
    wire w_107, w_108;
    full_adder FA38 (.a(w_24), .b(w_26), .cin(w_27), .sum(w_107), .carry(w_108));
    wire w_109, w_110;
    full_adder FA39 (.a(w_28), .b(w_30), .cin(w_31), .sum(w_109), .carry(w_110));
    wire w_111, w_112;
    full_adder FA40 (.a(w_32), .b(w_34), .cin(w_35), .sum(w_111), .carry(w_112));
    wire w_113, w_114;
    half_adder HA15 (.a(w_37), .b(raw_pp_cin[5]), .sum(w_113), .carry(w_114));
    wire w_115, w_116;
    full_adder FA41 (.a(w_36), .b(w_38), .cin(w_39), .sum(w_115), .carry(w_116));
    wire w_117, w_118;
    full_adder FA42 (.a(w_40), .b(w_42), .cin(w_43), .sum(w_117), .carry(w_118));
    wire w_119, w_120;
    full_adder FA43 (.a(w_44), .b(w_46), .cin(w_47), .sum(w_119), .carry(w_120));
    wire w_121, w_122;
    full_adder FA44 (.a(w_48), .b(w_50), .cin(w_51), .sum(w_121), .carry(w_122));
    wire w_123, w_124;
    full_adder FA45 (.a(w_52), .b(w_54), .cin(w_55), .sum(w_123), .carry(w_124));
    wire w_125, w_126;
    full_adder FA46 (.a(w_56), .b(w_58), .cin(w_59), .sum(w_125), .carry(w_126));
    wire w_127, w_128;
    full_adder FA47 (.a(w_60), .b(w_62), .cin(w_63), .sum(w_127), .carry(w_128));
    wire w_129, w_130;
    full_adder FA48 (.a(w_64), .b(w_66), .cin(w_67), .sum(w_129), .carry(w_130));
    wire w_131, w_132;
    full_adder FA49 (.a(w_68), .b(w_70), .cin(w_71), .sum(w_131), .carry(w_132));
    wire w_133, w_134;
    full_adder FA50 (.a(w_72), .b(w_73), .cin(raw_pp[100]), .sum(w_133), .carry(w_134));
    wire w_135, w_136;
    full_adder FA51 (.a(w_74), .b(w_75), .cin(raw_pp[101]), .sum(w_135), .carry(w_136));
    wire w_137, w_138;
    half_adder HA16 (.a(w_76), .b(w_77), .sum(w_137), .carry(w_138));
    wire w_139, w_140;
    half_adder HA17 (.a(w_78), .b(w_79), .sum(w_139), .carry(w_140));
    wire w_141, w_142;
    half_adder HA18 (.a(w_80), .b(w_81), .sum(w_141), .carry(w_142));
    wire w_143, w_144;
    half_adder HA19 (.a(w_82), .b(w_83), .sum(w_143), .carry(w_144));
    wire w_145, w_146;
    half_adder HA20 (.a(w_84), .b(w_85), .sum(w_145), .carry(w_146));

    // Pipeline Register Bank: Post-Stage 2 Layer
    wire [73:0] stage2_D;
    wire [73:0] stage2_Q;
    assign stage2_D = {w_145, w_144, w_143, w_142, w_141, w_140, w_139, w_138, w_137, w_136, w_135, w_134, w_133, w_132, raw_pp[99], w_131, w_130, w_69, w_129, w_128, w_65, w_127, w_126, w_61, w_125, w_124, w_57, w_123, w_122, w_53, w_121, w_120, w_49, w_119, w_118, w_45, w_117, w_116, w_41, w_115, w_114, w_112, w_113, w_111, w_110, w_33, w_109, w_108, w_29, w_107, w_106, w_105, w_104, w_103, w_102, raw_pp[55], w_101, w_100, w_99, w_98, w_97, w_96, w_95, w_94, w_93, w_92, w_91, w_90, w_89, w_3, raw_pp[2], w_88, w_87, w_1};
    register_bank #(.WIDTH(74)) reg_stage_2 (
        .clk(clk), .rst(rst), .en(en), .D(stage2_D), .Q(stage2_Q)
    );

    // ========================================================
    // Stage 3
    // ========================================================
    wire w_147, w_148;
    half_adder HA21 (.a(stage2_Q[2]), .b(stage2_Q[3]), .sum(w_147), .carry(w_148));
    wire w_149, w_150;
    half_adder HA22 (.a(stage2_Q[6]), .b(stage2_Q[7]), .sum(w_149), .carry(w_150));
    wire w_151, w_152;
    half_adder HA23 (.a(stage2_Q[8]), .b(stage2_Q[9]), .sum(w_151), .carry(w_152));
    wire w_153, w_154;
    half_adder HA24 (.a(stage2_Q[10]), .b(stage2_Q[11]), .sum(w_153), .carry(w_154));
    wire w_155, w_156;
    half_adder HA25 (.a(stage2_Q[12]), .b(stage2_Q[13]), .sum(w_155), .carry(w_156));
    wire w_157, w_158;
    half_adder HA26 (.a(stage2_Q[14]), .b(stage2_Q[15]), .sum(w_157), .carry(w_158));
    wire w_159, w_160;
    full_adder FA52 (.a(stage2_Q[16]), .b(stage2_Q[17]), .cin(stage2_Q[18]), .sum(w_159), .carry(w_160));
    wire w_161, w_162;
    half_adder HA27 (.a(stage2_Q[19]), .b(stage2_Q[20]), .sum(w_161), .carry(w_162));
    wire w_163, w_164;
    half_adder HA28 (.a(stage2_Q[21]), .b(stage2_Q[22]), .sum(w_163), .carry(w_164));
    wire w_165, w_166;
    full_adder FA53 (.a(stage2_Q[23]), .b(stage2_Q[24]), .cin(stage2_Q[25]), .sum(w_165), .carry(w_166));
    wire w_167, w_168;
    full_adder FA54 (.a(stage2_Q[26]), .b(stage2_Q[27]), .cin(stage2_Q[28]), .sum(w_167), .carry(w_168));
    wire w_169, w_170;
    full_adder FA55 (.a(stage2_Q[29]), .b(stage2_Q[30]), .cin(stage2_Q[31]), .sum(w_169), .carry(w_170));
    wire w_171, w_172;
    full_adder FA56 (.a(stage2_Q[32]), .b(stage2_Q[33]), .cin(stage2_Q[34]), .sum(w_171), .carry(w_172));
    wire w_173, w_174;
    full_adder FA57 (.a(stage2_Q[36]), .b(stage2_Q[37]), .cin(stage2_Q[38]), .sum(w_173), .carry(w_174));
    wire w_175, w_176;
    full_adder FA58 (.a(stage2_Q[39]), .b(stage2_Q[40]), .cin(stage2_Q[41]), .sum(w_175), .carry(w_176));
    wire w_177, w_178;
    full_adder FA59 (.a(stage2_Q[42]), .b(stage2_Q[43]), .cin(stage2_Q[44]), .sum(w_177), .carry(w_178));
    wire w_179, w_180;
    full_adder FA60 (.a(stage2_Q[45]), .b(stage2_Q[46]), .cin(stage2_Q[47]), .sum(w_179), .carry(w_180));
    wire w_181, w_182;
    full_adder FA61 (.a(stage2_Q[48]), .b(stage2_Q[49]), .cin(stage2_Q[50]), .sum(w_181), .carry(w_182));
    wire w_183, w_184;
    full_adder FA62 (.a(stage2_Q[51]), .b(stage2_Q[52]), .cin(stage2_Q[53]), .sum(w_183), .carry(w_184));
    wire w_185, w_186;
    full_adder FA63 (.a(stage2_Q[54]), .b(stage2_Q[55]), .cin(stage2_Q[56]), .sum(w_185), .carry(w_186));
    wire w_187, w_188;
    full_adder FA64 (.a(stage2_Q[57]), .b(stage2_Q[58]), .cin(stage2_Q[59]), .sum(w_187), .carry(w_188));
    wire w_189, w_190;
    half_adder HA29 (.a(stage2_Q[60]), .b(stage2_Q[61]), .sum(w_189), .carry(w_190));
    wire w_191, w_192;
    half_adder HA30 (.a(stage2_Q[62]), .b(stage2_Q[63]), .sum(w_191), .carry(w_192));
    wire w_193, w_194;
    half_adder HA31 (.a(stage2_Q[64]), .b(stage2_Q[65]), .sum(w_193), .carry(w_194));
    wire w_195, w_196;
    half_adder HA32 (.a(stage2_Q[66]), .b(stage2_Q[67]), .sum(w_195), .carry(w_196));
    wire w_197, w_198;
    half_adder HA33 (.a(stage2_Q[68]), .b(stage2_Q[69]), .sum(w_197), .carry(w_198));
    wire w_199, w_200;
    half_adder HA34 (.a(stage2_Q[70]), .b(stage2_Q[71]), .sum(w_199), .carry(w_200));
    wire w_201, w_202;
    half_adder HA35 (.a(stage2_Q[72]), .b(stage2_Q[73]), .sum(w_201), .carry(w_202));

    // ========================================================
    // Stage 4
    // ========================================================
    wire w_203, w_204;
    half_adder HA36 (.a(w_148), .b(stage2_Q[4]), .sum(w_203), .carry(w_204));
    wire w_205, w_206;
    half_adder HA37 (.a(w_150), .b(w_151), .sum(w_205), .carry(w_206));
    wire w_207, w_208;
    half_adder HA38 (.a(w_152), .b(w_153), .sum(w_207), .carry(w_208));
    wire w_209, w_210;
    half_adder HA39 (.a(w_154), .b(w_155), .sum(w_209), .carry(w_210));
    wire w_211, w_212;
    half_adder HA40 (.a(w_156), .b(w_157), .sum(w_211), .carry(w_212));
    wire w_213, w_214;
    half_adder HA41 (.a(w_158), .b(w_159), .sum(w_213), .carry(w_214));
    wire w_215, w_216;
    half_adder HA42 (.a(w_160), .b(w_161), .sum(w_215), .carry(w_216));
    wire w_217, w_218;
    half_adder HA43 (.a(w_162), .b(w_163), .sum(w_217), .carry(w_218));
    wire w_219, w_220;
    half_adder HA44 (.a(w_164), .b(w_165), .sum(w_219), .carry(w_220));
    wire w_221, w_222;
    half_adder HA45 (.a(w_166), .b(w_167), .sum(w_221), .carry(w_222));
    wire w_223, w_224;
    half_adder HA46 (.a(w_168), .b(w_169), .sum(w_223), .carry(w_224));
    wire w_225, w_226;
    full_adder FA65 (.a(w_170), .b(w_171), .cin(stage2_Q[35]), .sum(w_225), .carry(w_226));
    wire w_227, w_228;
    half_adder HA47 (.a(w_172), .b(w_173), .sum(w_227), .carry(w_228));
    wire w_229, w_230;
    half_adder HA48 (.a(w_174), .b(w_175), .sum(w_229), .carry(w_230));
    wire w_231, w_232;
    half_adder HA49 (.a(w_176), .b(w_177), .sum(w_231), .carry(w_232));
    wire w_233, w_234;
    half_adder HA50 (.a(w_178), .b(w_179), .sum(w_233), .carry(w_234));
    wire w_235, w_236;
    half_adder HA51 (.a(w_180), .b(w_181), .sum(w_235), .carry(w_236));
    wire w_237, w_238;
    half_adder HA52 (.a(w_182), .b(w_183), .sum(w_237), .carry(w_238));
    wire w_239, w_240;
    half_adder HA53 (.a(w_184), .b(w_185), .sum(w_239), .carry(w_240));
    wire w_241, w_242;
    half_adder HA54 (.a(w_186), .b(w_187), .sum(w_241), .carry(w_242));
    wire w_243, w_244;
    half_adder HA55 (.a(w_188), .b(w_189), .sum(w_243), .carry(w_244));
    wire w_245, w_246;
    half_adder HA56 (.a(w_190), .b(w_191), .sum(w_245), .carry(w_246));
    wire w_247, w_248;
    half_adder HA57 (.a(w_192), .b(w_193), .sum(w_247), .carry(w_248));
    wire w_249, w_250;
    half_adder HA58 (.a(w_194), .b(w_195), .sum(w_249), .carry(w_250));
    wire w_251, w_252;
    half_adder HA59 (.a(w_196), .b(w_197), .sum(w_251), .carry(w_252));
    wire w_253, w_254;
    half_adder HA60 (.a(w_198), .b(w_199), .sum(w_253), .carry(w_254));
    wire w_255, w_256;
    half_adder HA61 (.a(w_200), .b(w_201), .sum(w_255), .carry(w_256));

    // Pipeline Register Bank: Post-Stage 4 Layer
    wire [57:0] stage4_D;
    wire [57:0] stage4_Q;
    assign stage4_D = {w_255, w_254, w_253, w_252, w_251, w_250, w_249, w_248, w_247, w_246, w_245, w_244, w_243, w_242, w_241, w_240, w_239, w_238, w_237, w_236, w_235, w_234, w_233, w_232, w_231, w_230, w_229, w_228, w_227, w_226, w_225, w_224, w_223, w_222, w_221, w_220, w_219, w_218, w_217, w_216, w_215, w_214, w_213, w_212, w_211, w_210, w_209, w_208, w_207, w_206, w_205, w_149, stage2_Q[5], w_204, w_203, w_147, stage2_Q[1], stage2_Q[0]};
    register_bank #(.WIDTH(58)) reg_stage_4 (
        .clk(clk), .rst(rst), .en(en), .D(stage4_D), .Q(stage4_Q)
    );

    // ========================================================
    // Vector Preparation for Final Addition
    // ========================================================
    wire [31:0] adder_vec_A_raw = {stage4_Q[56], stage4_Q[54], stage4_Q[52], stage4_Q[50], stage4_Q[48], stage4_Q[46], stage4_Q[44], stage4_Q[42], stage4_Q[40], stage4_Q[38], stage4_Q[36], stage4_Q[34], stage4_Q[32], stage4_Q[30], stage4_Q[28], stage4_Q[26], stage4_Q[24], stage4_Q[22], stage4_Q[20], stage4_Q[18], stage4_Q[16], stage4_Q[14], stage4_Q[12], stage4_Q[10], stage4_Q[8], stage4_Q[7], stage4_Q[6], stage4_Q[4], stage4_Q[3], stage4_Q[2], stage4_Q[1], stage4_Q[0]};
    wire [31:0] adder_vec_B_raw = {stage4_Q[57], stage4_Q[55], stage4_Q[53], stage4_Q[51], stage4_Q[49], stage4_Q[47], stage4_Q[45], stage4_Q[43], stage4_Q[41], stage4_Q[39], stage4_Q[37], stage4_Q[35], stage4_Q[33], stage4_Q[31], stage4_Q[29], stage4_Q[27], stage4_Q[25], stage4_Q[23], stage4_Q[21], stage4_Q[19], stage4_Q[17], stage4_Q[15], stage4_Q[13], stage4_Q[11], stage4_Q[9], 1'b0, 1'b0, stage4_Q[5], 1'b0, 1'b0, 1'b0, 1'b0};

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
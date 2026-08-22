// =======================================================================
// Dynamically Generated Pipelined Booth Dadda (Radix - 4) Multiplier
// Configuration: N = 16
// =======================================================================

module booth_dadda_radix4_multiplier_16 #(
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
    // PPG: Custom Radix-4 Booth Partial Product Generation
    // ========================================================
    wire [135:0] raw_pp;
    wire [7:0] raw_pp_cin;
    wire [15:0] raw_pp_corr;

    booth_radix4_ppg #(.N(16), .SIGNED_A(SIGNED_A), .SIGNED_B(SIGNED_B)) ppg_inst (
        .A(reg_A_w), .B(reg_B_w),
        .pp(raw_pp), .pp_cin(raw_pp_cin), .pp_corr(raw_pp_corr)
    );

    // ========================================================
    // Stage 1
    // ========================================================
    wire w_1, w_2;
    half_adder HA0 (.a(raw_pp[10]), .b(raw_pp[25]), .sum(w_1), .carry(w_2));
    wire w_3, w_4;
    half_adder HA1 (.a(raw_pp[11]), .b(raw_pp[26]), .sum(w_3), .carry(w_4));
    wire w_5, w_6;
    full_adder FA0 (.a(raw_pp[12]), .b(raw_pp[27]), .cin(raw_pp[42]), .sum(w_5), .carry(w_6));
    wire w_7, w_8;
    half_adder HA2 (.a(raw_pp[57]), .b(raw_pp[72]), .sum(w_7), .carry(w_8));
    wire w_9, w_10;
    full_adder FA1 (.a(raw_pp[13]), .b(raw_pp[28]), .cin(raw_pp[43]), .sum(w_9), .carry(w_10));
    wire w_11, w_12;
    half_adder HA3 (.a(raw_pp[58]), .b(raw_pp[73]), .sum(w_11), .carry(w_12));
    wire w_13, w_14;
    full_adder FA2 (.a(raw_pp[14]), .b(raw_pp[29]), .cin(raw_pp[44]), .sum(w_13), .carry(w_14));
    wire w_15, w_16;
    full_adder FA3 (.a(raw_pp[59]), .b(raw_pp[74]), .cin(raw_pp[89]), .sum(w_15), .carry(w_16));
    wire w_17, w_18;
    half_adder HA4 (.a(raw_pp[104]), .b(raw_pp[119]), .sum(w_17), .carry(w_18));
    wire w_19, w_20;
    full_adder FA4 (.a(raw_pp[15]), .b(raw_pp[30]), .cin(raw_pp[45]), .sum(w_19), .carry(w_20));
    wire w_21, w_22;
    full_adder FA5 (.a(raw_pp[60]), .b(raw_pp[75]), .cin(raw_pp[90]), .sum(w_21), .carry(w_22));
    wire w_23, w_24;
    half_adder HA5 (.a(raw_pp[105]), .b(raw_pp[120]), .sum(w_23), .carry(w_24));
    wire w_25, w_26;
    full_adder FA6 (.a(raw_pp[16]), .b(raw_pp[31]), .cin(raw_pp[46]), .sum(w_25), .carry(w_26));
    wire w_27, w_28;
    full_adder FA7 (.a(raw_pp[61]), .b(raw_pp[76]), .cin(raw_pp[91]), .sum(w_27), .carry(w_28));
    wire w_29, w_30;
    half_adder HA6 (.a(raw_pp[106]), .b(raw_pp[121]), .sum(w_29), .carry(w_30));
    wire w_31, w_32;
    full_adder FA8 (.a(raw_pp_corr[0]), .b(raw_pp[32]), .cin(raw_pp[47]), .sum(w_31), .carry(w_32));
    wire w_33, w_34;
    full_adder FA9 (.a(raw_pp[62]), .b(raw_pp[77]), .cin(raw_pp[92]), .sum(w_33), .carry(w_34));
    wire w_35, w_36;
    half_adder HA7 (.a(raw_pp[107]), .b(raw_pp[122]), .sum(w_35), .carry(w_36));
    wire w_37, w_38;
    full_adder FA10 (.a(raw_pp_corr[1]), .b(raw_pp[33]), .cin(raw_pp[48]), .sum(w_37), .carry(w_38));
    wire w_39, w_40;
    full_adder FA11 (.a(raw_pp[63]), .b(raw_pp[78]), .cin(raw_pp[93]), .sum(w_39), .carry(w_40));
    wire w_41, w_42;
    half_adder HA8 (.a(raw_pp[108]), .b(raw_pp[123]), .sum(w_41), .carry(w_42));
    wire w_43, w_44;
    full_adder FA12 (.a(raw_pp_corr[2]), .b(raw_pp_corr[3]), .cin(raw_pp[49]), .sum(w_43), .carry(w_44));
    wire w_45, w_46;
    full_adder FA13 (.a(raw_pp[64]), .b(raw_pp[79]), .cin(raw_pp[94]), .sum(w_45), .carry(w_46));
    wire w_47, w_48;
    half_adder HA9 (.a(raw_pp[109]), .b(raw_pp[124]), .sum(w_47), .carry(w_48));
    wire w_49, w_50;
    full_adder FA14 (.a(raw_pp_corr[4]), .b(raw_pp[50]), .cin(raw_pp[65]), .sum(w_49), .carry(w_50));
    wire w_51, w_52;
    full_adder FA15 (.a(raw_pp[80]), .b(raw_pp[95]), .cin(raw_pp[110]), .sum(w_51), .carry(w_52));
    wire w_53, w_54;
    full_adder FA16 (.a(raw_pp_corr[5]), .b(raw_pp[66]), .cin(raw_pp[81]), .sum(w_53), .carry(w_54));
    wire w_55, w_56;
    half_adder HA10 (.a(raw_pp_corr[6]), .b(raw_pp[67]), .sum(w_55), .carry(w_56));

    // ========================================================
    // Stage 2
    // ========================================================
    wire w_57, w_58;
    half_adder HA11 (.a(raw_pp[6]), .b(raw_pp[21]), .sum(w_57), .carry(w_58));
    wire w_59, w_60;
    half_adder HA12 (.a(raw_pp[7]), .b(raw_pp[22]), .sum(w_59), .carry(w_60));
    wire w_61, w_62;
    full_adder FA17 (.a(raw_pp[8]), .b(raw_pp[23]), .cin(raw_pp[38]), .sum(w_61), .carry(w_62));
    wire w_63, w_64;
    half_adder HA13 (.a(raw_pp[53]), .b(raw_pp[68]), .sum(w_63), .carry(w_64));
    wire w_65, w_66;
    full_adder FA18 (.a(raw_pp[9]), .b(raw_pp[24]), .cin(raw_pp[39]), .sum(w_65), .carry(w_66));
    wire w_67, w_68;
    half_adder HA14 (.a(raw_pp[54]), .b(raw_pp[69]), .sum(w_67), .carry(w_68));
    wire w_69, w_70;
    full_adder FA19 (.a(w_1), .b(raw_pp[40]), .cin(raw_pp[55]), .sum(w_69), .carry(w_70));
    wire w_71, w_72;
    full_adder FA20 (.a(raw_pp[70]), .b(raw_pp[85]), .cin(raw_pp_cin[5]), .sum(w_71), .carry(w_72));
    wire w_73, w_74;
    full_adder FA21 (.a(w_2), .b(w_3), .cin(raw_pp[41]), .sum(w_73), .carry(w_74));
    wire w_75, w_76;
    full_adder FA22 (.a(raw_pp[56]), .b(raw_pp[71]), .cin(raw_pp[86]), .sum(w_75), .carry(w_76));
    wire w_77, w_78;
    full_adder FA23 (.a(w_4), .b(w_5), .cin(w_7), .sum(w_77), .carry(w_78));
    wire w_79, w_80;
    full_adder FA24 (.a(raw_pp[87]), .b(raw_pp[102]), .cin(raw_pp_cin[6]), .sum(w_79), .carry(w_80));
    wire w_81, w_82;
    full_adder FA25 (.a(w_6), .b(w_8), .cin(w_9), .sum(w_81), .carry(w_82));
    wire w_83, w_84;
    full_adder FA26 (.a(w_11), .b(raw_pp[88]), .cin(raw_pp[103]), .sum(w_83), .carry(w_84));
    wire w_85, w_86;
    full_adder FA27 (.a(w_10), .b(w_12), .cin(w_13), .sum(w_85), .carry(w_86));
    wire w_87, w_88;
    full_adder FA28 (.a(w_15), .b(w_17), .cin(raw_pp_cin[7]), .sum(w_87), .carry(w_88));
    wire w_89, w_90;
    full_adder FA29 (.a(w_14), .b(w_16), .cin(w_18), .sum(w_89), .carry(w_90));
    wire w_91, w_92;
    full_adder FA30 (.a(w_19), .b(w_21), .cin(w_23), .sum(w_91), .carry(w_92));
    wire w_93, w_94;
    full_adder FA31 (.a(w_20), .b(w_22), .cin(w_24), .sum(w_93), .carry(w_94));
    wire w_95, w_96;
    full_adder FA32 (.a(w_25), .b(w_27), .cin(w_29), .sum(w_95), .carry(w_96));
    wire w_97, w_98;
    full_adder FA33 (.a(w_26), .b(w_28), .cin(w_30), .sum(w_97), .carry(w_98));
    wire w_99, w_100;
    full_adder FA34 (.a(w_31), .b(w_33), .cin(w_35), .sum(w_99), .carry(w_100));
    wire w_101, w_102;
    full_adder FA35 (.a(w_32), .b(w_34), .cin(w_36), .sum(w_101), .carry(w_102));
    wire w_103, w_104;
    full_adder FA36 (.a(w_37), .b(w_39), .cin(w_41), .sum(w_103), .carry(w_104));
    wire w_105, w_106;
    full_adder FA37 (.a(w_38), .b(w_40), .cin(w_42), .sum(w_105), .carry(w_106));
    wire w_107, w_108;
    full_adder FA38 (.a(w_43), .b(w_45), .cin(w_47), .sum(w_107), .carry(w_108));
    wire w_109, w_110;
    full_adder FA39 (.a(w_44), .b(w_46), .cin(w_48), .sum(w_109), .carry(w_110));
    wire w_111, w_112;
    full_adder FA40 (.a(w_49), .b(w_51), .cin(raw_pp[125]), .sum(w_111), .carry(w_112));
    wire w_113, w_114;
    full_adder FA41 (.a(w_50), .b(w_52), .cin(w_53), .sum(w_113), .carry(w_114));
    wire w_115, w_116;
    full_adder FA42 (.a(raw_pp[96]), .b(raw_pp[111]), .cin(raw_pp[126]), .sum(w_115), .carry(w_116));
    wire w_117, w_118;
    full_adder FA43 (.a(w_54), .b(w_55), .cin(raw_pp[82]), .sum(w_117), .carry(w_118));
    wire w_119, w_120;
    full_adder FA44 (.a(raw_pp[97]), .b(raw_pp[112]), .cin(raw_pp[127]), .sum(w_119), .carry(w_120));
    wire w_121, w_122;
    full_adder FA45 (.a(w_56), .b(raw_pp_corr[7]), .cin(raw_pp[83]), .sum(w_121), .carry(w_122));
    wire w_123, w_124;
    full_adder FA46 (.a(raw_pp[98]), .b(raw_pp[113]), .cin(raw_pp[128]), .sum(w_123), .carry(w_124));
    wire w_125, w_126;
    full_adder FA47 (.a(raw_pp_corr[8]), .b(raw_pp[84]), .cin(raw_pp[99]), .sum(w_125), .carry(w_126));
    wire w_127, w_128;
    half_adder HA15 (.a(raw_pp[114]), .b(raw_pp[129]), .sum(w_127), .carry(w_128));
    wire w_129, w_130;
    full_adder FA48 (.a(raw_pp_corr[9]), .b(raw_pp[100]), .cin(raw_pp[115]), .sum(w_129), .carry(w_130));
    wire w_131, w_132;
    half_adder HA16 (.a(raw_pp_corr[10]), .b(raw_pp[101]), .sum(w_131), .carry(w_132));

    // Pipeline Register Bank: Post-Stage 2 Layer
    wire [110:0] stage2_D;
    wire [110:0] stage2_Q;
    assign stage2_D = {raw_pp_corr[15], raw_pp[135], raw_pp_corr[14], raw_pp[134], raw_pp_corr[13], raw_pp[133], raw_pp[118], raw_pp_corr[12], raw_pp[132], raw_pp[117], raw_pp_corr[11], w_132, raw_pp[131], raw_pp[116], w_131, w_130, raw_pp[130], w_129, w_128, w_126, w_127, w_125, w_124, w_122, w_123, w_121, w_120, w_118, w_119, w_117, w_116, w_114, w_115, w_113, w_112, w_110, w_111, w_109, w_108, w_106, w_107, w_105, w_104, w_102, w_103, w_101, w_100, w_98, w_99, w_97, w_96, w_94, w_95, w_93, w_92, w_90, w_91, w_89, w_88, w_86, w_87, w_85, w_84, w_82, w_83, w_81, w_80, w_78, w_79, w_77, w_76, w_74, w_75, w_73, w_72, w_70, w_71, w_69, w_68, w_66, w_67, w_65, w_64, w_62, raw_pp_cin[4], w_63, w_61, w_60, raw_pp[52], raw_pp[37], w_59, w_58, raw_pp_cin[3], raw_pp[51], raw_pp[36], w_57, raw_pp[35], raw_pp[20], raw_pp[5], raw_pp_cin[2], raw_pp[34], raw_pp[19], raw_pp[4], raw_pp[18], raw_pp[3], raw_pp_cin[1], raw_pp[17], raw_pp[2], raw_pp[1], raw_pp_cin[0], raw_pp[0]};
    register_bank #(.WIDTH(111)) reg_stage_2 (
        .clk(clk), .rst(rst), .en(en), .D(stage2_D), .Q(stage2_Q)
    );

    // ========================================================
    // Stage 3
    // ========================================================
    wire w_133, w_134;
    half_adder HA17 (.a(stage2_Q[8]), .b(stage2_Q[9]), .sum(w_133), .carry(w_134));
    wire w_135, w_136;
    half_adder HA18 (.a(stage2_Q[12]), .b(stage2_Q[13]), .sum(w_135), .carry(w_136));
    wire w_137, w_138;
    full_adder FA49 (.a(stage2_Q[15]), .b(stage2_Q[16]), .cin(stage2_Q[17]), .sum(w_137), .carry(w_138));
    wire w_139, w_140;
    full_adder FA50 (.a(stage2_Q[19]), .b(stage2_Q[20]), .cin(stage2_Q[21]), .sum(w_139), .carry(w_140));
    wire w_141, w_142;
    full_adder FA51 (.a(stage2_Q[23]), .b(stage2_Q[24]), .cin(stage2_Q[25]), .sum(w_141), .carry(w_142));
    wire w_143, w_144;
    full_adder FA52 (.a(stage2_Q[27]), .b(stage2_Q[28]), .cin(stage2_Q[29]), .sum(w_143), .carry(w_144));
    wire w_145, w_146;
    full_adder FA53 (.a(stage2_Q[31]), .b(stage2_Q[32]), .cin(stage2_Q[33]), .sum(w_145), .carry(w_146));
    wire w_147, w_148;
    full_adder FA54 (.a(stage2_Q[35]), .b(stage2_Q[36]), .cin(stage2_Q[37]), .sum(w_147), .carry(w_148));
    wire w_149, w_150;
    full_adder FA55 (.a(stage2_Q[39]), .b(stage2_Q[40]), .cin(stage2_Q[41]), .sum(w_149), .carry(w_150));
    wire w_151, w_152;
    full_adder FA56 (.a(stage2_Q[43]), .b(stage2_Q[44]), .cin(stage2_Q[45]), .sum(w_151), .carry(w_152));
    wire w_153, w_154;
    full_adder FA57 (.a(stage2_Q[47]), .b(stage2_Q[48]), .cin(stage2_Q[49]), .sum(w_153), .carry(w_154));
    wire w_155, w_156;
    full_adder FA58 (.a(stage2_Q[51]), .b(stage2_Q[52]), .cin(stage2_Q[53]), .sum(w_155), .carry(w_156));
    wire w_157, w_158;
    full_adder FA59 (.a(stage2_Q[55]), .b(stage2_Q[56]), .cin(stage2_Q[57]), .sum(w_157), .carry(w_158));
    wire w_159, w_160;
    full_adder FA60 (.a(stage2_Q[59]), .b(stage2_Q[60]), .cin(stage2_Q[61]), .sum(w_159), .carry(w_160));
    wire w_161, w_162;
    full_adder FA61 (.a(stage2_Q[63]), .b(stage2_Q[64]), .cin(stage2_Q[65]), .sum(w_161), .carry(w_162));
    wire w_163, w_164;
    full_adder FA62 (.a(stage2_Q[67]), .b(stage2_Q[68]), .cin(stage2_Q[69]), .sum(w_163), .carry(w_164));
    wire w_165, w_166;
    full_adder FA63 (.a(stage2_Q[71]), .b(stage2_Q[72]), .cin(stage2_Q[73]), .sum(w_165), .carry(w_166));
    wire w_167, w_168;
    full_adder FA64 (.a(stage2_Q[75]), .b(stage2_Q[76]), .cin(stage2_Q[77]), .sum(w_167), .carry(w_168));
    wire w_169, w_170;
    full_adder FA65 (.a(stage2_Q[79]), .b(stage2_Q[80]), .cin(stage2_Q[81]), .sum(w_169), .carry(w_170));
    wire w_171, w_172;
    full_adder FA66 (.a(stage2_Q[83]), .b(stage2_Q[84]), .cin(stage2_Q[85]), .sum(w_171), .carry(w_172));
    wire w_173, w_174;
    full_adder FA67 (.a(stage2_Q[87]), .b(stage2_Q[88]), .cin(stage2_Q[89]), .sum(w_173), .carry(w_174));
    wire w_175, w_176;
    full_adder FA68 (.a(stage2_Q[91]), .b(stage2_Q[92]), .cin(stage2_Q[93]), .sum(w_175), .carry(w_176));
    wire w_177, w_178;
    full_adder FA69 (.a(stage2_Q[95]), .b(stage2_Q[96]), .cin(stage2_Q[97]), .sum(w_177), .carry(w_178));
    wire w_179, w_180;
    full_adder FA70 (.a(stage2_Q[99]), .b(stage2_Q[100]), .cin(stage2_Q[101]), .sum(w_179), .carry(w_180));
    wire w_181, w_182;
    half_adder HA19 (.a(stage2_Q[103]), .b(stage2_Q[104]), .sum(w_181), .carry(w_182));

    // ========================================================
    // Stage 4
    // ========================================================
    wire w_183, w_184;
    half_adder HA20 (.a(stage2_Q[3]), .b(stage2_Q[4]), .sum(w_183), .carry(w_184));
    wire w_185, w_186;
    half_adder HA21 (.a(stage2_Q[6]), .b(stage2_Q[7]), .sum(w_185), .carry(w_186));
    wire w_187, w_188;
    full_adder FA71 (.a(w_133), .b(stage2_Q[10]), .cin(stage2_Q[11]), .sum(w_187), .carry(w_188));
    wire w_189, w_190;
    full_adder FA72 (.a(w_134), .b(w_135), .cin(stage2_Q[14]), .sum(w_189), .carry(w_190));
    wire w_191, w_192;
    full_adder FA73 (.a(w_136), .b(w_137), .cin(stage2_Q[18]), .sum(w_191), .carry(w_192));
    wire w_193, w_194;
    full_adder FA74 (.a(w_138), .b(w_139), .cin(stage2_Q[22]), .sum(w_193), .carry(w_194));
    wire w_195, w_196;
    full_adder FA75 (.a(w_140), .b(w_141), .cin(stage2_Q[26]), .sum(w_195), .carry(w_196));
    wire w_197, w_198;
    full_adder FA76 (.a(w_142), .b(w_143), .cin(stage2_Q[30]), .sum(w_197), .carry(w_198));
    wire w_199, w_200;
    full_adder FA77 (.a(w_144), .b(w_145), .cin(stage2_Q[34]), .sum(w_199), .carry(w_200));
    wire w_201, w_202;
    full_adder FA78 (.a(w_146), .b(w_147), .cin(stage2_Q[38]), .sum(w_201), .carry(w_202));
    wire w_203, w_204;
    full_adder FA79 (.a(w_148), .b(w_149), .cin(stage2_Q[42]), .sum(w_203), .carry(w_204));
    wire w_205, w_206;
    full_adder FA80 (.a(w_150), .b(w_151), .cin(stage2_Q[46]), .sum(w_205), .carry(w_206));
    wire w_207, w_208;
    full_adder FA81 (.a(w_152), .b(w_153), .cin(stage2_Q[50]), .sum(w_207), .carry(w_208));
    wire w_209, w_210;
    full_adder FA82 (.a(w_154), .b(w_155), .cin(stage2_Q[54]), .sum(w_209), .carry(w_210));
    wire w_211, w_212;
    full_adder FA83 (.a(w_156), .b(w_157), .cin(stage2_Q[58]), .sum(w_211), .carry(w_212));
    wire w_213, w_214;
    full_adder FA84 (.a(w_158), .b(w_159), .cin(stage2_Q[62]), .sum(w_213), .carry(w_214));
    wire w_215, w_216;
    full_adder FA85 (.a(w_160), .b(w_161), .cin(stage2_Q[66]), .sum(w_215), .carry(w_216));
    wire w_217, w_218;
    full_adder FA86 (.a(w_162), .b(w_163), .cin(stage2_Q[70]), .sum(w_217), .carry(w_218));
    wire w_219, w_220;
    full_adder FA87 (.a(w_164), .b(w_165), .cin(stage2_Q[74]), .sum(w_219), .carry(w_220));
    wire w_221, w_222;
    full_adder FA88 (.a(w_166), .b(w_167), .cin(stage2_Q[78]), .sum(w_221), .carry(w_222));
    wire w_223, w_224;
    full_adder FA89 (.a(w_168), .b(w_169), .cin(stage2_Q[82]), .sum(w_223), .carry(w_224));
    wire w_225, w_226;
    full_adder FA90 (.a(w_170), .b(w_171), .cin(stage2_Q[86]), .sum(w_225), .carry(w_226));
    wire w_227, w_228;
    full_adder FA91 (.a(w_172), .b(w_173), .cin(stage2_Q[90]), .sum(w_227), .carry(w_228));
    wire w_229, w_230;
    full_adder FA92 (.a(w_174), .b(w_175), .cin(stage2_Q[94]), .sum(w_229), .carry(w_230));
    wire w_231, w_232;
    full_adder FA93 (.a(w_176), .b(w_177), .cin(stage2_Q[98]), .sum(w_231), .carry(w_232));
    wire w_233, w_234;
    full_adder FA94 (.a(w_178), .b(w_179), .cin(stage2_Q[102]), .sum(w_233), .carry(w_234));
    wire w_235, w_236;
    full_adder FA95 (.a(w_180), .b(w_181), .cin(stage2_Q[105]), .sum(w_235), .carry(w_236));
    wire w_237, w_238;
    full_adder FA96 (.a(w_182), .b(stage2_Q[106]), .cin(stage2_Q[107]), .sum(w_237), .carry(w_238));
    wire w_239, w_240;
    half_adder HA22 (.a(stage2_Q[108]), .b(stage2_Q[109]), .sum(w_239), .carry(w_240));

    // Pipeline Register Bank: Post-Stage 4 Layer
    wire [62:0] stage4_D;
    wire [62:0] stage4_Q;
    assign stage4_D = {stage2_Q[110], w_240, w_239, w_238, w_237, w_236, w_235, w_234, w_233, w_232, w_231, w_230, w_229, w_228, w_227, w_226, w_225, w_224, w_223, w_222, w_221, w_220, w_219, w_218, w_217, w_216, w_215, w_214, w_213, w_212, w_211, w_210, w_209, w_208, w_207, w_206, w_205, w_204, w_203, w_202, w_201, w_200, w_199, w_198, w_197, w_196, w_195, w_194, w_193, w_192, w_191, w_190, w_189, w_188, w_187, w_186, w_185, w_184, stage2_Q[5], w_183, stage2_Q[2], stage2_Q[1], stage2_Q[0]};
    register_bank #(.WIDTH(63)) reg_stage_4 (
        .clk(clk), .rst(rst), .en(en), .D(stage4_D), .Q(stage4_Q)
    );

    // ========================================================
    // Vector Preparation for Final Addition
    // ========================================================
    wire [31:0] adder_vec_A_raw = {stage4_Q[61], stage4_Q[59], stage4_Q[57], stage4_Q[55], stage4_Q[53], stage4_Q[51], stage4_Q[49], stage4_Q[47], stage4_Q[45], stage4_Q[43], stage4_Q[41], stage4_Q[39], stage4_Q[37], stage4_Q[35], stage4_Q[33], stage4_Q[31], stage4_Q[29], stage4_Q[27], stage4_Q[25], stage4_Q[23], stage4_Q[21], stage4_Q[19], stage4_Q[17], stage4_Q[15], stage4_Q[13], stage4_Q[11], stage4_Q[9], stage4_Q[7], stage4_Q[5], stage4_Q[3], stage4_Q[2], stage4_Q[0]};
    wire [31:0] adder_vec_B_raw = {stage4_Q[62], stage4_Q[60], stage4_Q[58], stage4_Q[56], stage4_Q[54], stage4_Q[52], stage4_Q[50], stage4_Q[48], stage4_Q[46], stage4_Q[44], stage4_Q[42], stage4_Q[40], stage4_Q[38], stage4_Q[36], stage4_Q[34], stage4_Q[32], stage4_Q[30], stage4_Q[28], stage4_Q[26], stage4_Q[24], stage4_Q[22], stage4_Q[20], stage4_Q[18], stage4_Q[16], stage4_Q[14], stage4_Q[12], stage4_Q[10], stage4_Q[8], stage4_Q[6], stage4_Q[4], 1'b0, stage4_Q[1]};

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
// ==========================================================================
// Dynamically Generated Pipelined Booth Wallace (Radix - 4) Multiplier
// Configuration: N = 16
// ==========================================================================

module booth_wallace_radix4_multiplier_16 #(
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
    half_adder HA0 (.a(raw_pp[0]), .b(raw_pp_cin[0]), .sum(w_1), .carry(w_2));
    wire w_3, w_4;
    full_adder FA0 (.a(raw_pp[2]), .b(raw_pp[17]), .cin(raw_pp_cin[1]), .sum(w_3), .carry(w_4));
    wire w_5, w_6;
    half_adder HA1 (.a(raw_pp[3]), .b(raw_pp[18]), .sum(w_5), .carry(w_6));
    wire w_7, w_8;
    full_adder FA1 (.a(raw_pp[4]), .b(raw_pp[19]), .cin(raw_pp[34]), .sum(w_7), .carry(w_8));
    wire w_9, w_10;
    full_adder FA2 (.a(raw_pp[5]), .b(raw_pp[20]), .cin(raw_pp[35]), .sum(w_9), .carry(w_10));
    wire w_11, w_12;
    full_adder FA3 (.a(raw_pp[6]), .b(raw_pp[21]), .cin(raw_pp[36]), .sum(w_11), .carry(w_12));
    wire w_13, w_14;
    half_adder HA2 (.a(raw_pp[51]), .b(raw_pp_cin[3]), .sum(w_13), .carry(w_14));
    wire w_15, w_16;
    full_adder FA4 (.a(raw_pp[7]), .b(raw_pp[22]), .cin(raw_pp[37]), .sum(w_15), .carry(w_16));
    wire w_17, w_18;
    full_adder FA5 (.a(raw_pp[8]), .b(raw_pp[23]), .cin(raw_pp[38]), .sum(w_17), .carry(w_18));
    wire w_19, w_20;
    full_adder FA6 (.a(raw_pp[53]), .b(raw_pp[68]), .cin(raw_pp_cin[4]), .sum(w_19), .carry(w_20));
    wire w_21, w_22;
    full_adder FA7 (.a(raw_pp[9]), .b(raw_pp[24]), .cin(raw_pp[39]), .sum(w_21), .carry(w_22));
    wire w_23, w_24;
    half_adder HA3 (.a(raw_pp[54]), .b(raw_pp[69]), .sum(w_23), .carry(w_24));
    wire w_25, w_26;
    full_adder FA8 (.a(raw_pp[10]), .b(raw_pp[25]), .cin(raw_pp[40]), .sum(w_25), .carry(w_26));
    wire w_27, w_28;
    full_adder FA9 (.a(raw_pp[55]), .b(raw_pp[70]), .cin(raw_pp[85]), .sum(w_27), .carry(w_28));
    wire w_29, w_30;
    full_adder FA10 (.a(raw_pp[11]), .b(raw_pp[26]), .cin(raw_pp[41]), .sum(w_29), .carry(w_30));
    wire w_31, w_32;
    full_adder FA11 (.a(raw_pp[56]), .b(raw_pp[71]), .cin(raw_pp[86]), .sum(w_31), .carry(w_32));
    wire w_33, w_34;
    full_adder FA12 (.a(raw_pp[12]), .b(raw_pp[27]), .cin(raw_pp[42]), .sum(w_33), .carry(w_34));
    wire w_35, w_36;
    full_adder FA13 (.a(raw_pp[57]), .b(raw_pp[72]), .cin(raw_pp[87]), .sum(w_35), .carry(w_36));
    wire w_37, w_38;
    half_adder HA4 (.a(raw_pp[102]), .b(raw_pp_cin[6]), .sum(w_37), .carry(w_38));
    wire w_39, w_40;
    full_adder FA14 (.a(raw_pp[13]), .b(raw_pp[28]), .cin(raw_pp[43]), .sum(w_39), .carry(w_40));
    wire w_41, w_42;
    full_adder FA15 (.a(raw_pp[58]), .b(raw_pp[73]), .cin(raw_pp[88]), .sum(w_41), .carry(w_42));
    wire w_43, w_44;
    full_adder FA16 (.a(raw_pp[14]), .b(raw_pp[29]), .cin(raw_pp[44]), .sum(w_43), .carry(w_44));
    wire w_45, w_46;
    full_adder FA17 (.a(raw_pp[59]), .b(raw_pp[74]), .cin(raw_pp[89]), .sum(w_45), .carry(w_46));
    wire w_47, w_48;
    full_adder FA18 (.a(raw_pp[104]), .b(raw_pp[119]), .cin(raw_pp_cin[7]), .sum(w_47), .carry(w_48));
    wire w_49, w_50;
    full_adder FA19 (.a(raw_pp[15]), .b(raw_pp[30]), .cin(raw_pp[45]), .sum(w_49), .carry(w_50));
    wire w_51, w_52;
    full_adder FA20 (.a(raw_pp[60]), .b(raw_pp[75]), .cin(raw_pp[90]), .sum(w_51), .carry(w_52));
    wire w_53, w_54;
    half_adder HA5 (.a(raw_pp[105]), .b(raw_pp[120]), .sum(w_53), .carry(w_54));
    wire w_55, w_56;
    full_adder FA21 (.a(raw_pp[16]), .b(raw_pp[31]), .cin(raw_pp[46]), .sum(w_55), .carry(w_56));
    wire w_57, w_58;
    full_adder FA22 (.a(raw_pp[61]), .b(raw_pp[76]), .cin(raw_pp[91]), .sum(w_57), .carry(w_58));
    wire w_59, w_60;
    half_adder HA6 (.a(raw_pp[106]), .b(raw_pp[121]), .sum(w_59), .carry(w_60));
    wire w_61, w_62;
    full_adder FA23 (.a(raw_pp_corr[0]), .b(raw_pp[32]), .cin(raw_pp[47]), .sum(w_61), .carry(w_62));
    wire w_63, w_64;
    full_adder FA24 (.a(raw_pp[62]), .b(raw_pp[77]), .cin(raw_pp[92]), .sum(w_63), .carry(w_64));
    wire w_65, w_66;
    half_adder HA7 (.a(raw_pp[107]), .b(raw_pp[122]), .sum(w_65), .carry(w_66));
    wire w_67, w_68;
    full_adder FA25 (.a(raw_pp_corr[1]), .b(raw_pp[33]), .cin(raw_pp[48]), .sum(w_67), .carry(w_68));
    wire w_69, w_70;
    full_adder FA26 (.a(raw_pp[63]), .b(raw_pp[78]), .cin(raw_pp[93]), .sum(w_69), .carry(w_70));
    wire w_71, w_72;
    half_adder HA8 (.a(raw_pp[108]), .b(raw_pp[123]), .sum(w_71), .carry(w_72));
    wire w_73, w_74;
    full_adder FA27 (.a(raw_pp_corr[2]), .b(raw_pp_corr[3]), .cin(raw_pp[49]), .sum(w_73), .carry(w_74));
    wire w_75, w_76;
    full_adder FA28 (.a(raw_pp[64]), .b(raw_pp[79]), .cin(raw_pp[94]), .sum(w_75), .carry(w_76));
    wire w_77, w_78;
    half_adder HA9 (.a(raw_pp[109]), .b(raw_pp[124]), .sum(w_77), .carry(w_78));
    wire w_79, w_80;
    full_adder FA29 (.a(raw_pp_corr[4]), .b(raw_pp[50]), .cin(raw_pp[65]), .sum(w_79), .carry(w_80));
    wire w_81, w_82;
    full_adder FA30 (.a(raw_pp[80]), .b(raw_pp[95]), .cin(raw_pp[110]), .sum(w_81), .carry(w_82));
    wire w_83, w_84;
    full_adder FA31 (.a(raw_pp_corr[5]), .b(raw_pp[66]), .cin(raw_pp[81]), .sum(w_83), .carry(w_84));
    wire w_85, w_86;
    full_adder FA32 (.a(raw_pp[96]), .b(raw_pp[111]), .cin(raw_pp[126]), .sum(w_85), .carry(w_86));
    wire w_87, w_88;
    full_adder FA33 (.a(raw_pp_corr[6]), .b(raw_pp[67]), .cin(raw_pp[82]), .sum(w_87), .carry(w_88));
    wire w_89, w_90;
    full_adder FA34 (.a(raw_pp[97]), .b(raw_pp[112]), .cin(raw_pp[127]), .sum(w_89), .carry(w_90));
    wire w_91, w_92;
    full_adder FA35 (.a(raw_pp_corr[7]), .b(raw_pp[83]), .cin(raw_pp[98]), .sum(w_91), .carry(w_92));
    wire w_93, w_94;
    half_adder HA10 (.a(raw_pp[113]), .b(raw_pp[128]), .sum(w_93), .carry(w_94));
    wire w_95, w_96;
    full_adder FA36 (.a(raw_pp_corr[8]), .b(raw_pp[84]), .cin(raw_pp[99]), .sum(w_95), .carry(w_96));
    wire w_97, w_98;
    half_adder HA11 (.a(raw_pp[114]), .b(raw_pp[129]), .sum(w_97), .carry(w_98));
    wire w_99, w_100;
    full_adder FA37 (.a(raw_pp_corr[9]), .b(raw_pp[100]), .cin(raw_pp[115]), .sum(w_99), .carry(w_100));
    wire w_101, w_102;
    full_adder FA38 (.a(raw_pp_corr[10]), .b(raw_pp[101]), .cin(raw_pp[116]), .sum(w_101), .carry(w_102));
    wire w_103, w_104;
    full_adder FA39 (.a(raw_pp_corr[11]), .b(raw_pp[117]), .cin(raw_pp[132]), .sum(w_103), .carry(w_104));
    wire w_105, w_106;
    full_adder FA40 (.a(raw_pp_corr[12]), .b(raw_pp[118]), .cin(raw_pp[133]), .sum(w_105), .carry(w_106));
    wire w_107, w_108;
    half_adder HA12 (.a(raw_pp_corr[13]), .b(raw_pp[134]), .sum(w_107), .carry(w_108));
    wire w_109, w_110;
    half_adder HA13 (.a(raw_pp_corr[14]), .b(raw_pp[135]), .sum(w_109), .carry(w_110));

    // ========================================================
    // Stage 2
    // ========================================================
    wire w_111, w_112;
    half_adder HA14 (.a(w_2), .b(raw_pp[1]), .sum(w_111), .carry(w_112));
    wire w_113, w_114;
    half_adder HA15 (.a(w_4), .b(w_5), .sum(w_113), .carry(w_114));
    wire w_115, w_116;
    full_adder FA41 (.a(w_6), .b(w_7), .cin(raw_pp_cin[2]), .sum(w_115), .carry(w_116));
    wire w_117, w_118;
    half_adder HA16 (.a(w_8), .b(w_9), .sum(w_117), .carry(w_118));
    wire w_119, w_120;
    full_adder FA42 (.a(w_10), .b(w_11), .cin(w_13), .sum(w_119), .carry(w_120));
    wire w_121, w_122;
    full_adder FA43 (.a(w_12), .b(w_14), .cin(w_15), .sum(w_121), .carry(w_122));
    wire w_123, w_124;
    full_adder FA44 (.a(w_16), .b(w_17), .cin(w_19), .sum(w_123), .carry(w_124));
    wire w_125, w_126;
    full_adder FA45 (.a(w_18), .b(w_20), .cin(w_21), .sum(w_125), .carry(w_126));
    wire w_127, w_128;
    full_adder FA46 (.a(w_22), .b(w_24), .cin(w_25), .sum(w_127), .carry(w_128));
    wire w_129, w_130;
    half_adder HA17 (.a(w_27), .b(raw_pp_cin[5]), .sum(w_129), .carry(w_130));
    wire w_131, w_132;
    full_adder FA47 (.a(w_26), .b(w_28), .cin(w_29), .sum(w_131), .carry(w_132));
    wire w_133, w_134;
    full_adder FA48 (.a(w_30), .b(w_32), .cin(w_33), .sum(w_133), .carry(w_134));
    wire w_135, w_136;
    half_adder HA18 (.a(w_35), .b(w_37), .sum(w_135), .carry(w_136));
    wire w_137, w_138;
    full_adder FA49 (.a(w_34), .b(w_36), .cin(w_38), .sum(w_137), .carry(w_138));
    wire w_139, w_140;
    full_adder FA50 (.a(w_39), .b(w_41), .cin(raw_pp[103]), .sum(w_139), .carry(w_140));
    wire w_141, w_142;
    full_adder FA51 (.a(w_40), .b(w_42), .cin(w_43), .sum(w_141), .carry(w_142));
    wire w_143, w_144;
    half_adder HA19 (.a(w_45), .b(w_47), .sum(w_143), .carry(w_144));
    wire w_145, w_146;
    full_adder FA52 (.a(w_44), .b(w_46), .cin(w_48), .sum(w_145), .carry(w_146));
    wire w_147, w_148;
    full_adder FA53 (.a(w_49), .b(w_51), .cin(w_53), .sum(w_147), .carry(w_148));
    wire w_149, w_150;
    full_adder FA54 (.a(w_50), .b(w_52), .cin(w_54), .sum(w_149), .carry(w_150));
    wire w_151, w_152;
    full_adder FA55 (.a(w_55), .b(w_57), .cin(w_59), .sum(w_151), .carry(w_152));
    wire w_153, w_154;
    full_adder FA56 (.a(w_56), .b(w_58), .cin(w_60), .sum(w_153), .carry(w_154));
    wire w_155, w_156;
    full_adder FA57 (.a(w_61), .b(w_63), .cin(w_65), .sum(w_155), .carry(w_156));
    wire w_157, w_158;
    full_adder FA58 (.a(w_62), .b(w_64), .cin(w_66), .sum(w_157), .carry(w_158));
    wire w_159, w_160;
    full_adder FA59 (.a(w_67), .b(w_69), .cin(w_71), .sum(w_159), .carry(w_160));
    wire w_161, w_162;
    full_adder FA60 (.a(w_68), .b(w_70), .cin(w_72), .sum(w_161), .carry(w_162));
    wire w_163, w_164;
    full_adder FA61 (.a(w_73), .b(w_75), .cin(w_77), .sum(w_163), .carry(w_164));
    wire w_165, w_166;
    full_adder FA62 (.a(w_74), .b(w_76), .cin(w_78), .sum(w_165), .carry(w_166));
    wire w_167, w_168;
    full_adder FA63 (.a(w_79), .b(w_81), .cin(raw_pp[125]), .sum(w_167), .carry(w_168));
    wire w_169, w_170;
    full_adder FA64 (.a(w_80), .b(w_82), .cin(w_83), .sum(w_169), .carry(w_170));
    wire w_171, w_172;
    full_adder FA65 (.a(w_84), .b(w_86), .cin(w_87), .sum(w_171), .carry(w_172));
    wire w_173, w_174;
    full_adder FA66 (.a(w_88), .b(w_90), .cin(w_91), .sum(w_173), .carry(w_174));
    wire w_175, w_176;
    full_adder FA67 (.a(w_92), .b(w_94), .cin(w_95), .sum(w_175), .carry(w_176));
    wire w_177, w_178;
    full_adder FA68 (.a(w_96), .b(w_98), .cin(w_99), .sum(w_177), .carry(w_178));
    wire w_179, w_180;
    full_adder FA69 (.a(w_100), .b(w_101), .cin(raw_pp[131]), .sum(w_179), .carry(w_180));
    wire w_181, w_182;
    half_adder HA20 (.a(w_102), .b(w_103), .sum(w_181), .carry(w_182));
    wire w_183, w_184;
    half_adder HA21 (.a(w_104), .b(w_105), .sum(w_183), .carry(w_184));
    wire w_185, w_186;
    half_adder HA22 (.a(w_106), .b(w_107), .sum(w_185), .carry(w_186));
    wire w_187, w_188;
    half_adder HA23 (.a(w_108), .b(w_109), .sum(w_187), .carry(w_188));
    wire w_189, w_190;
    half_adder HA24 (.a(w_110), .b(raw_pp_corr[15]), .sum(w_189), .carry(w_190));

    // Pipeline Register Bank: Post-Stage 2 Layer
    wire [88:0] stage2_D;
    wire [88:0] stage2_Q;
    assign stage2_D = {w_189, w_188, w_187, w_186, w_185, w_184, w_183, w_182, w_181, w_180, w_179, w_178, raw_pp[130], w_177, w_176, w_97, w_175, w_174, w_93, w_173, w_172, w_89, w_171, w_170, w_85, w_169, w_168, w_166, w_167, w_165, w_164, w_162, w_163, w_161, w_160, w_158, w_159, w_157, w_156, w_154, w_155, w_153, w_152, w_150, w_151, w_149, w_148, w_146, w_147, w_145, w_144, w_142, w_143, w_141, w_140, w_138, w_139, w_137, w_136, w_134, w_135, w_133, w_132, w_31, w_131, w_130, w_128, w_129, w_127, w_126, w_23, w_125, w_124, w_123, w_122, raw_pp[52], w_121, w_120, w_119, w_118, w_117, w_116, w_115, w_114, w_113, w_3, w_112, w_111, w_1};
    register_bank #(.WIDTH(89)) reg_stage_2 (
        .clk(clk), .rst(rst), .en(en), .D(stage2_D), .Q(stage2_Q)
    );

    // ========================================================
    // Stage 3
    // ========================================================
    wire w_191, w_192;
    half_adder HA25 (.a(stage2_Q[2]), .b(stage2_Q[3]), .sum(w_191), .carry(w_192));
    wire w_193, w_194;
    half_adder HA26 (.a(stage2_Q[5]), .b(stage2_Q[6]), .sum(w_193), .carry(w_194));
    wire w_195, w_196;
    half_adder HA27 (.a(stage2_Q[7]), .b(stage2_Q[8]), .sum(w_195), .carry(w_196));
    wire w_197, w_198;
    half_adder HA28 (.a(stage2_Q[9]), .b(stage2_Q[10]), .sum(w_197), .carry(w_198));
    wire w_199, w_200;
    full_adder FA70 (.a(stage2_Q[11]), .b(stage2_Q[12]), .cin(stage2_Q[13]), .sum(w_199), .carry(w_200));
    wire w_201, w_202;
    half_adder HA29 (.a(stage2_Q[14]), .b(stage2_Q[15]), .sum(w_201), .carry(w_202));
    wire w_203, w_204;
    full_adder FA71 (.a(stage2_Q[16]), .b(stage2_Q[17]), .cin(stage2_Q[18]), .sum(w_203), .carry(w_204));
    wire w_205, w_206;
    full_adder FA72 (.a(stage2_Q[19]), .b(stage2_Q[20]), .cin(stage2_Q[21]), .sum(w_205), .carry(w_206));
    wire w_207, w_208;
    full_adder FA73 (.a(stage2_Q[22]), .b(stage2_Q[23]), .cin(stage2_Q[24]), .sum(w_207), .carry(w_208));
    wire w_209, w_210;
    full_adder FA74 (.a(stage2_Q[26]), .b(stage2_Q[27]), .cin(stage2_Q[28]), .sum(w_209), .carry(w_210));
    wire w_211, w_212;
    full_adder FA75 (.a(stage2_Q[29]), .b(stage2_Q[30]), .cin(stage2_Q[31]), .sum(w_211), .carry(w_212));
    wire w_213, w_214;
    full_adder FA76 (.a(stage2_Q[33]), .b(stage2_Q[34]), .cin(stage2_Q[35]), .sum(w_213), .carry(w_214));
    wire w_215, w_216;
    full_adder FA77 (.a(stage2_Q[37]), .b(stage2_Q[38]), .cin(stage2_Q[39]), .sum(w_215), .carry(w_216));
    wire w_217, w_218;
    full_adder FA78 (.a(stage2_Q[41]), .b(stage2_Q[42]), .cin(stage2_Q[43]), .sum(w_217), .carry(w_218));
    wire w_219, w_220;
    full_adder FA79 (.a(stage2_Q[45]), .b(stage2_Q[46]), .cin(stage2_Q[47]), .sum(w_219), .carry(w_220));
    wire w_221, w_222;
    full_adder FA80 (.a(stage2_Q[49]), .b(stage2_Q[50]), .cin(stage2_Q[51]), .sum(w_221), .carry(w_222));
    wire w_223, w_224;
    full_adder FA81 (.a(stage2_Q[53]), .b(stage2_Q[54]), .cin(stage2_Q[55]), .sum(w_223), .carry(w_224));
    wire w_225, w_226;
    full_adder FA82 (.a(stage2_Q[57]), .b(stage2_Q[58]), .cin(stage2_Q[59]), .sum(w_225), .carry(w_226));
    wire w_227, w_228;
    full_adder FA83 (.a(stage2_Q[61]), .b(stage2_Q[62]), .cin(stage2_Q[63]), .sum(w_227), .carry(w_228));
    wire w_229, w_230;
    full_adder FA84 (.a(stage2_Q[65]), .b(stage2_Q[66]), .cin(stage2_Q[67]), .sum(w_229), .carry(w_230));
    wire w_231, w_232;
    full_adder FA85 (.a(stage2_Q[68]), .b(stage2_Q[69]), .cin(stage2_Q[70]), .sum(w_231), .carry(w_232));
    wire w_233, w_234;
    full_adder FA86 (.a(stage2_Q[71]), .b(stage2_Q[72]), .cin(stage2_Q[73]), .sum(w_233), .carry(w_234));
    wire w_235, w_236;
    full_adder FA87 (.a(stage2_Q[74]), .b(stage2_Q[75]), .cin(stage2_Q[76]), .sum(w_235), .carry(w_236));
    wire w_237, w_238;
    half_adder HA30 (.a(stage2_Q[77]), .b(stage2_Q[78]), .sum(w_237), .carry(w_238));
    wire w_239, w_240;
    half_adder HA31 (.a(stage2_Q[79]), .b(stage2_Q[80]), .sum(w_239), .carry(w_240));
    wire w_241, w_242;
    half_adder HA32 (.a(stage2_Q[81]), .b(stage2_Q[82]), .sum(w_241), .carry(w_242));
    wire w_243, w_244;
    half_adder HA33 (.a(stage2_Q[83]), .b(stage2_Q[84]), .sum(w_243), .carry(w_244));
    wire w_245, w_246;
    half_adder HA34 (.a(stage2_Q[85]), .b(stage2_Q[86]), .sum(w_245), .carry(w_246));
    wire w_247, w_248;
    half_adder HA35 (.a(stage2_Q[87]), .b(stage2_Q[88]), .sum(w_247), .carry(w_248));

    // ========================================================
    // Stage 4
    // ========================================================
    wire w_249, w_250;
    half_adder HA36 (.a(w_192), .b(stage2_Q[4]), .sum(w_249), .carry(w_250));
    wire w_251, w_252;
    half_adder HA37 (.a(w_194), .b(w_195), .sum(w_251), .carry(w_252));
    wire w_253, w_254;
    half_adder HA38 (.a(w_196), .b(w_197), .sum(w_253), .carry(w_254));
    wire w_255, w_256;
    half_adder HA39 (.a(w_198), .b(w_199), .sum(w_255), .carry(w_256));
    wire w_257, w_258;
    half_adder HA40 (.a(w_200), .b(w_201), .sum(w_257), .carry(w_258));
    wire w_259, w_260;
    half_adder HA41 (.a(w_202), .b(w_203), .sum(w_259), .carry(w_260));
    wire w_261, w_262;
    half_adder HA42 (.a(w_204), .b(w_205), .sum(w_261), .carry(w_262));
    wire w_263, w_264;
    full_adder FA88 (.a(w_206), .b(w_207), .cin(stage2_Q[25]), .sum(w_263), .carry(w_264));
    wire w_265, w_266;
    half_adder HA43 (.a(w_208), .b(w_209), .sum(w_265), .carry(w_266));
    wire w_267, w_268;
    full_adder FA89 (.a(w_210), .b(w_211), .cin(stage2_Q[32]), .sum(w_267), .carry(w_268));
    wire w_269, w_270;
    full_adder FA90 (.a(w_212), .b(w_213), .cin(stage2_Q[36]), .sum(w_269), .carry(w_270));
    wire w_271, w_272;
    full_adder FA91 (.a(w_214), .b(w_215), .cin(stage2_Q[40]), .sum(w_271), .carry(w_272));
    wire w_273, w_274;
    full_adder FA92 (.a(w_216), .b(w_217), .cin(stage2_Q[44]), .sum(w_273), .carry(w_274));
    wire w_275, w_276;
    full_adder FA93 (.a(w_218), .b(w_219), .cin(stage2_Q[48]), .sum(w_275), .carry(w_276));
    wire w_277, w_278;
    full_adder FA94 (.a(w_220), .b(w_221), .cin(stage2_Q[52]), .sum(w_277), .carry(w_278));
    wire w_279, w_280;
    full_adder FA95 (.a(w_222), .b(w_223), .cin(stage2_Q[56]), .sum(w_279), .carry(w_280));
    wire w_281, w_282;
    full_adder FA96 (.a(w_224), .b(w_225), .cin(stage2_Q[60]), .sum(w_281), .carry(w_282));
    wire w_283, w_284;
    full_adder FA97 (.a(w_226), .b(w_227), .cin(stage2_Q[64]), .sum(w_283), .carry(w_284));
    wire w_285, w_286;
    half_adder HA44 (.a(w_228), .b(w_229), .sum(w_285), .carry(w_286));
    wire w_287, w_288;
    half_adder HA45 (.a(w_230), .b(w_231), .sum(w_287), .carry(w_288));
    wire w_289, w_290;
    half_adder HA46 (.a(w_232), .b(w_233), .sum(w_289), .carry(w_290));
    wire w_291, w_292;
    half_adder HA47 (.a(w_234), .b(w_235), .sum(w_291), .carry(w_292));
    wire w_293, w_294;
    half_adder HA48 (.a(w_236), .b(w_237), .sum(w_293), .carry(w_294));
    wire w_295, w_296;
    half_adder HA49 (.a(w_238), .b(w_239), .sum(w_295), .carry(w_296));
    wire w_297, w_298;
    half_adder HA50 (.a(w_240), .b(w_241), .sum(w_297), .carry(w_298));
    wire w_299, w_300;
    half_adder HA51 (.a(w_242), .b(w_243), .sum(w_299), .carry(w_300));
    wire w_301, w_302;
    half_adder HA52 (.a(w_244), .b(w_245), .sum(w_301), .carry(w_302));
    wire w_303, w_304;
    half_adder HA53 (.a(w_246), .b(w_247), .sum(w_303), .carry(w_304));

    // Pipeline Register Bank: Post-Stage 4 Layer
    wire [58:0] stage4_D;
    wire [58:0] stage4_Q;
    assign stage4_D = {w_303, w_302, w_301, w_300, w_299, w_298, w_297, w_296, w_295, w_294, w_293, w_292, w_291, w_290, w_289, w_288, w_287, w_286, w_285, w_284, w_283, w_282, w_281, w_280, w_279, w_278, w_277, w_276, w_275, w_274, w_273, w_272, w_271, w_270, w_269, w_268, w_267, w_266, w_265, w_264, w_263, w_262, w_261, w_260, w_259, w_258, w_257, w_256, w_255, w_254, w_253, w_252, w_251, w_193, w_250, w_249, w_191, stage2_Q[1], stage2_Q[0]};
    register_bank #(.WIDTH(59)) reg_stage_4 (
        .clk(clk), .rst(rst), .en(en), .D(stage4_D), .Q(stage4_Q)
    );

    // ========================================================
    // Vector Preparation for Final Addition
    // ========================================================
    wire [31:0] adder_vec_A_raw = {stage4_Q[57], stage4_Q[55], stage4_Q[53], stage4_Q[51], stage4_Q[49], stage4_Q[47], stage4_Q[45], stage4_Q[43], stage4_Q[41], stage4_Q[39], stage4_Q[37], stage4_Q[35], stage4_Q[33], stage4_Q[31], stage4_Q[29], stage4_Q[27], stage4_Q[25], stage4_Q[23], stage4_Q[21], stage4_Q[19], stage4_Q[17], stage4_Q[15], stage4_Q[13], stage4_Q[11], stage4_Q[9], stage4_Q[7], stage4_Q[6], stage4_Q[4], stage4_Q[3], stage4_Q[2], stage4_Q[1], stage4_Q[0]};
    wire [31:0] adder_vec_B_raw = {stage4_Q[58], stage4_Q[56], stage4_Q[54], stage4_Q[52], stage4_Q[50], stage4_Q[48], stage4_Q[46], stage4_Q[44], stage4_Q[42], stage4_Q[40], stage4_Q[38], stage4_Q[36], stage4_Q[34], stage4_Q[32], stage4_Q[30], stage4_Q[28], stage4_Q[26], stage4_Q[24], stage4_Q[22], stage4_Q[20], stage4_Q[18], stage4_Q[16], stage4_Q[14], stage4_Q[12], stage4_Q[10], stage4_Q[8], 1'b0, stage4_Q[5], 1'b0, 1'b0, 1'b0, 1'b0};

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
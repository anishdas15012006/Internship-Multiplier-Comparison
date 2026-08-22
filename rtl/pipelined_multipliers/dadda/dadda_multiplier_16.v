// ========================================================
// Dynamically Generated Pipelined Dadda Multiplier
// Configuration: N = 16
// ========================================================

module dadda_multiplier_16 (
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
    // PPG: Partial Product Generation
    // ========================================================
    wire [255:0] raw_pp;
    partial_product_generator #(.N(16)) ppg_inst (.A(reg_A_w), .B(reg_B_w), .pp(raw_pp));

    // ========================================================
    // Stage 1
    // ========================================================
    wire w_1, w_2;
    half_adder HA0 (.a(raw_pp[13]), .b(raw_pp[28]), .sum(w_1), .carry(w_2));
    wire w_3, w_4;
    full_adder FA0 (.a(raw_pp[14]), .b(raw_pp[29]), .cin(raw_pp[44]), .sum(w_3), .carry(w_4));
    wire w_5, w_6;
    half_adder HA1 (.a(raw_pp[59]), .b(raw_pp[74]), .sum(w_5), .carry(w_6));
    wire w_7, w_8;
    full_adder FA1 (.a(raw_pp[15]), .b(raw_pp[30]), .cin(raw_pp[45]), .sum(w_7), .carry(w_8));
    wire w_9, w_10;
    full_adder FA2 (.a(raw_pp[60]), .b(raw_pp[75]), .cin(raw_pp[90]), .sum(w_9), .carry(w_10));
    wire w_11, w_12;
    half_adder HA2 (.a(raw_pp[105]), .b(raw_pp[120]), .sum(w_11), .carry(w_12));
    wire w_13, w_14;
    full_adder FA3 (.a(raw_pp[31]), .b(raw_pp[46]), .cin(raw_pp[61]), .sum(w_13), .carry(w_14));
    wire w_15, w_16;
    full_adder FA4 (.a(raw_pp[76]), .b(raw_pp[91]), .cin(raw_pp[106]), .sum(w_15), .carry(w_16));
    wire w_17, w_18;
    half_adder HA3 (.a(raw_pp[121]), .b(raw_pp[136]), .sum(w_17), .carry(w_18));
    wire w_19, w_20;
    full_adder FA5 (.a(raw_pp[47]), .b(raw_pp[62]), .cin(raw_pp[77]), .sum(w_19), .carry(w_20));
    wire w_21, w_22;
    full_adder FA6 (.a(raw_pp[92]), .b(raw_pp[107]), .cin(raw_pp[122]), .sum(w_21), .carry(w_22));
    wire w_23, w_24;
    full_adder FA7 (.a(raw_pp[63]), .b(raw_pp[78]), .cin(raw_pp[93]), .sum(w_23), .carry(w_24));

    // ========================================================
    // Stage 2
    // ========================================================
    wire w_25, w_26;
    half_adder HA4 (.a(raw_pp[9]), .b(raw_pp[24]), .sum(w_25), .carry(w_26));
    wire w_27, w_28;
    full_adder FA8 (.a(raw_pp[10]), .b(raw_pp[25]), .cin(raw_pp[40]), .sum(w_27), .carry(w_28));
    wire w_29, w_30;
    half_adder HA5 (.a(raw_pp[55]), .b(raw_pp[70]), .sum(w_29), .carry(w_30));
    wire w_31, w_32;
    full_adder FA9 (.a(raw_pp[11]), .b(raw_pp[26]), .cin(raw_pp[41]), .sum(w_31), .carry(w_32));
    wire w_33, w_34;
    full_adder FA10 (.a(raw_pp[56]), .b(raw_pp[71]), .cin(raw_pp[86]), .sum(w_33), .carry(w_34));
    wire w_35, w_36;
    half_adder HA6 (.a(raw_pp[101]), .b(raw_pp[116]), .sum(w_35), .carry(w_36));
    wire w_37, w_38;
    full_adder FA11 (.a(raw_pp[12]), .b(raw_pp[27]), .cin(raw_pp[42]), .sum(w_37), .carry(w_38));
    wire w_39, w_40;
    full_adder FA12 (.a(raw_pp[57]), .b(raw_pp[72]), .cin(raw_pp[87]), .sum(w_39), .carry(w_40));
    wire w_41, w_42;
    full_adder FA13 (.a(raw_pp[102]), .b(raw_pp[117]), .cin(raw_pp[132]), .sum(w_41), .carry(w_42));
    wire w_43, w_44;
    half_adder HA7 (.a(raw_pp[147]), .b(raw_pp[162]), .sum(w_43), .carry(w_44));
    wire w_45, w_46;
    full_adder FA14 (.a(w_1), .b(raw_pp[43]), .cin(raw_pp[58]), .sum(w_45), .carry(w_46));
    wire w_47, w_48;
    full_adder FA15 (.a(raw_pp[73]), .b(raw_pp[88]), .cin(raw_pp[103]), .sum(w_47), .carry(w_48));
    wire w_49, w_50;
    full_adder FA16 (.a(raw_pp[118]), .b(raw_pp[133]), .cin(raw_pp[148]), .sum(w_49), .carry(w_50));
    wire w_51, w_52;
    full_adder FA17 (.a(raw_pp[163]), .b(raw_pp[178]), .cin(raw_pp[193]), .sum(w_51), .carry(w_52));
    wire w_53, w_54;
    full_adder FA18 (.a(w_2), .b(w_3), .cin(w_5), .sum(w_53), .carry(w_54));
    wire w_55, w_56;
    full_adder FA19 (.a(raw_pp[89]), .b(raw_pp[104]), .cin(raw_pp[119]), .sum(w_55), .carry(w_56));
    wire w_57, w_58;
    full_adder FA20 (.a(raw_pp[134]), .b(raw_pp[149]), .cin(raw_pp[164]), .sum(w_57), .carry(w_58));
    wire w_59, w_60;
    full_adder FA21 (.a(raw_pp[179]), .b(raw_pp[194]), .cin(raw_pp[209]), .sum(w_59), .carry(w_60));
    wire w_61, w_62;
    full_adder FA22 (.a(w_4), .b(w_6), .cin(w_7), .sum(w_61), .carry(w_62));
    wire w_63, w_64;
    full_adder FA23 (.a(w_9), .b(w_11), .cin(raw_pp[135]), .sum(w_63), .carry(w_64));
    wire w_65, w_66;
    full_adder FA24 (.a(raw_pp[150]), .b(raw_pp[165]), .cin(raw_pp[180]), .sum(w_65), .carry(w_66));
    wire w_67, w_68;
    full_adder FA25 (.a(raw_pp[195]), .b(raw_pp[210]), .cin(raw_pp[225]), .sum(w_67), .carry(w_68));
    wire w_69, w_70;
    full_adder FA26 (.a(w_8), .b(w_10), .cin(w_12), .sum(w_69), .carry(w_70));
    wire w_71, w_72;
    full_adder FA27 (.a(w_13), .b(w_15), .cin(w_17), .sum(w_71), .carry(w_72));
    wire w_73, w_74;
    full_adder FA28 (.a(raw_pp[151]), .b(raw_pp[166]), .cin(raw_pp[181]), .sum(w_73), .carry(w_74));
    wire w_75, w_76;
    full_adder FA29 (.a(raw_pp[196]), .b(raw_pp[211]), .cin(raw_pp[226]), .sum(w_75), .carry(w_76));
    wire w_77, w_78;
    full_adder FA30 (.a(w_14), .b(w_16), .cin(w_18), .sum(w_77), .carry(w_78));
    wire w_79, w_80;
    full_adder FA31 (.a(w_19), .b(w_21), .cin(raw_pp[137]), .sum(w_79), .carry(w_80));
    wire w_81, w_82;
    full_adder FA32 (.a(raw_pp[152]), .b(raw_pp[167]), .cin(raw_pp[182]), .sum(w_81), .carry(w_82));
    wire w_83, w_84;
    full_adder FA33 (.a(raw_pp[197]), .b(raw_pp[212]), .cin(raw_pp[227]), .sum(w_83), .carry(w_84));
    wire w_85, w_86;
    full_adder FA34 (.a(w_20), .b(w_22), .cin(w_23), .sum(w_85), .carry(w_86));
    wire w_87, w_88;
    full_adder FA35 (.a(raw_pp[108]), .b(raw_pp[123]), .cin(raw_pp[138]), .sum(w_87), .carry(w_88));
    wire w_89, w_90;
    full_adder FA36 (.a(raw_pp[153]), .b(raw_pp[168]), .cin(raw_pp[183]), .sum(w_89), .carry(w_90));
    wire w_91, w_92;
    full_adder FA37 (.a(raw_pp[198]), .b(raw_pp[213]), .cin(raw_pp[228]), .sum(w_91), .carry(w_92));
    wire w_93, w_94;
    full_adder FA38 (.a(w_24), .b(raw_pp[79]), .cin(raw_pp[94]), .sum(w_93), .carry(w_94));
    wire w_95, w_96;
    full_adder FA39 (.a(raw_pp[109]), .b(raw_pp[124]), .cin(raw_pp[139]), .sum(w_95), .carry(w_96));
    wire w_97, w_98;
    full_adder FA40 (.a(raw_pp[154]), .b(raw_pp[169]), .cin(raw_pp[184]), .sum(w_97), .carry(w_98));
    wire w_99, w_100;
    full_adder FA41 (.a(raw_pp[199]), .b(raw_pp[214]), .cin(raw_pp[229]), .sum(w_99), .carry(w_100));
    wire w_101, w_102;
    full_adder FA42 (.a(raw_pp[95]), .b(raw_pp[110]), .cin(raw_pp[125]), .sum(w_101), .carry(w_102));
    wire w_103, w_104;
    full_adder FA43 (.a(raw_pp[140]), .b(raw_pp[155]), .cin(raw_pp[170]), .sum(w_103), .carry(w_104));
    wire w_105, w_106;
    full_adder FA44 (.a(raw_pp[185]), .b(raw_pp[200]), .cin(raw_pp[215]), .sum(w_105), .carry(w_106));
    wire w_107, w_108;
    full_adder FA45 (.a(raw_pp[111]), .b(raw_pp[126]), .cin(raw_pp[141]), .sum(w_107), .carry(w_108));
    wire w_109, w_110;
    full_adder FA46 (.a(raw_pp[156]), .b(raw_pp[171]), .cin(raw_pp[186]), .sum(w_109), .carry(w_110));
    wire w_111, w_112;
    full_adder FA47 (.a(raw_pp[127]), .b(raw_pp[142]), .cin(raw_pp[157]), .sum(w_111), .carry(w_112));

    // Pipeline Register Bank: Post-Stage 2 Layer
    wire [207:0] stage2_D;
    wire [207:0] stage2_Q;
    assign stage2_D = {raw_pp[255], raw_pp[254], raw_pp[239], raw_pp[253], raw_pp[238], raw_pp[223], raw_pp[252], raw_pp[237], raw_pp[222], raw_pp[207], raw_pp[251], raw_pp[236], raw_pp[221], raw_pp[206], raw_pp[191], raw_pp[250], raw_pp[235], raw_pp[220], raw_pp[205], raw_pp[190], raw_pp[175], raw_pp[249], raw_pp[234], raw_pp[219], raw_pp[204], raw_pp[189], raw_pp[174], raw_pp[159], raw_pp[248], raw_pp[233], raw_pp[218], raw_pp[203], raw_pp[188], raw_pp[173], raw_pp[158], raw_pp[143], w_112, raw_pp[247], raw_pp[232], raw_pp[217], raw_pp[202], raw_pp[187], raw_pp[172], w_111, w_110, w_108, raw_pp[246], raw_pp[231], raw_pp[216], raw_pp[201], w_109, w_107, w_106, w_104, w_102, raw_pp[245], raw_pp[230], w_105, w_103, w_101, w_100, w_98, w_96, w_94, raw_pp[244], w_99, w_97, w_95, w_93, w_92, w_90, w_88, w_86, raw_pp[243], w_91, w_89, w_87, w_85, w_84, w_82, w_80, w_78, raw_pp[242], w_83, w_81, w_79, w_77, w_76, w_74, w_72, w_70, raw_pp[241], w_75, w_73, w_71, w_69, w_68, w_66, w_64, w_62, raw_pp[240], w_67, w_65, w_63, w_61, w_60, w_58, w_56, w_54, raw_pp[224], w_59, w_57, w_55, w_53, w_52, w_50, w_48, w_46, raw_pp[208], w_51, w_49, w_47, w_45, w_44, w_42, w_40, w_38, raw_pp[192], raw_pp[177], w_43, w_41, w_39, w_37, w_36, w_34, w_32, raw_pp[176], raw_pp[161], raw_pp[146], raw_pp[131], w_35, w_33, w_31, w_30, w_28, raw_pp[160], raw_pp[145], raw_pp[130], raw_pp[115], raw_pp[100], raw_pp[85], w_29, w_27, w_26, raw_pp[144], raw_pp[129], raw_pp[114], raw_pp[99], raw_pp[84], raw_pp[69], raw_pp[54], raw_pp[39], w_25, raw_pp[128], raw_pp[113], raw_pp[98], raw_pp[83], raw_pp[68], raw_pp[53], raw_pp[38], raw_pp[23], raw_pp[8], raw_pp[112], raw_pp[97], raw_pp[82], raw_pp[67], raw_pp[52], raw_pp[37], raw_pp[22], raw_pp[7], raw_pp[96], raw_pp[81], raw_pp[66], raw_pp[51], raw_pp[36], raw_pp[21], raw_pp[6], raw_pp[80], raw_pp[65], raw_pp[50], raw_pp[35], raw_pp[20], raw_pp[5], raw_pp[64], raw_pp[49], raw_pp[34], raw_pp[19], raw_pp[4], raw_pp[48], raw_pp[33], raw_pp[18], raw_pp[3], raw_pp[32], raw_pp[17], raw_pp[2], raw_pp[16], raw_pp[1], raw_pp[0]};
    register_bank #(.WIDTH(208)) reg_stage_2 (
        .clk(clk), .rst(rst), .en(en), .D(stage2_D), .Q(stage2_Q)
    );

    // ========================================================
    // Stage 3
    // ========================================================
    wire w_113, w_114;
    half_adder HA8 (.a(stage2_Q[21]), .b(stage2_Q[22]), .sum(w_113), .carry(w_114));
    wire w_115, w_116;
    full_adder FA48 (.a(stage2_Q[28]), .b(stage2_Q[29]), .cin(stage2_Q[30]), .sum(w_115), .carry(w_116));
    wire w_117, w_118;
    half_adder HA9 (.a(stage2_Q[31]), .b(stage2_Q[32]), .sum(w_117), .carry(w_118));
    wire w_119, w_120;
    full_adder FA49 (.a(stage2_Q[36]), .b(stage2_Q[37]), .cin(stage2_Q[38]), .sum(w_119), .carry(w_120));
    wire w_121, w_122;
    full_adder FA50 (.a(stage2_Q[39]), .b(stage2_Q[40]), .cin(stage2_Q[41]), .sum(w_121), .carry(w_122));
    wire w_123, w_124;
    half_adder HA10 (.a(stage2_Q[42]), .b(stage2_Q[43]), .sum(w_123), .carry(w_124));
    wire w_125, w_126;
    full_adder FA51 (.a(stage2_Q[45]), .b(stage2_Q[46]), .cin(stage2_Q[47]), .sum(w_125), .carry(w_126));
    wire w_127, w_128;
    full_adder FA52 (.a(stage2_Q[48]), .b(stage2_Q[49]), .cin(stage2_Q[50]), .sum(w_127), .carry(w_128));
    wire w_129, w_130;
    full_adder FA53 (.a(stage2_Q[51]), .b(stage2_Q[52]), .cin(stage2_Q[53]), .sum(w_129), .carry(w_130));
    wire w_131, w_132;
    full_adder FA54 (.a(stage2_Q[54]), .b(stage2_Q[55]), .cin(stage2_Q[56]), .sum(w_131), .carry(w_132));
    wire w_133, w_134;
    full_adder FA55 (.a(stage2_Q[57]), .b(stage2_Q[58]), .cin(stage2_Q[59]), .sum(w_133), .carry(w_134));
    wire w_135, w_136;
    full_adder FA56 (.a(stage2_Q[60]), .b(stage2_Q[61]), .cin(stage2_Q[62]), .sum(w_135), .carry(w_136));
    wire w_137, w_138;
    full_adder FA57 (.a(stage2_Q[63]), .b(stage2_Q[64]), .cin(stage2_Q[65]), .sum(w_137), .carry(w_138));
    wire w_139, w_140;
    full_adder FA58 (.a(stage2_Q[66]), .b(stage2_Q[67]), .cin(stage2_Q[68]), .sum(w_139), .carry(w_140));
    wire w_141, w_142;
    full_adder FA59 (.a(stage2_Q[69]), .b(stage2_Q[70]), .cin(stage2_Q[71]), .sum(w_141), .carry(w_142));
    wire w_143, w_144;
    full_adder FA60 (.a(stage2_Q[72]), .b(stage2_Q[73]), .cin(stage2_Q[74]), .sum(w_143), .carry(w_144));
    wire w_145, w_146;
    full_adder FA61 (.a(stage2_Q[75]), .b(stage2_Q[76]), .cin(stage2_Q[77]), .sum(w_145), .carry(w_146));
    wire w_147, w_148;
    full_adder FA62 (.a(stage2_Q[78]), .b(stage2_Q[79]), .cin(stage2_Q[80]), .sum(w_147), .carry(w_148));
    wire w_149, w_150;
    full_adder FA63 (.a(stage2_Q[81]), .b(stage2_Q[82]), .cin(stage2_Q[83]), .sum(w_149), .carry(w_150));
    wire w_151, w_152;
    full_adder FA64 (.a(stage2_Q[84]), .b(stage2_Q[85]), .cin(stage2_Q[86]), .sum(w_151), .carry(w_152));
    wire w_153, w_154;
    full_adder FA65 (.a(stage2_Q[87]), .b(stage2_Q[88]), .cin(stage2_Q[89]), .sum(w_153), .carry(w_154));
    wire w_155, w_156;
    full_adder FA66 (.a(stage2_Q[90]), .b(stage2_Q[91]), .cin(stage2_Q[92]), .sum(w_155), .carry(w_156));
    wire w_157, w_158;
    full_adder FA67 (.a(stage2_Q[93]), .b(stage2_Q[94]), .cin(stage2_Q[95]), .sum(w_157), .carry(w_158));
    wire w_159, w_160;
    full_adder FA68 (.a(stage2_Q[96]), .b(stage2_Q[97]), .cin(stage2_Q[98]), .sum(w_159), .carry(w_160));
    wire w_161, w_162;
    full_adder FA69 (.a(stage2_Q[99]), .b(stage2_Q[100]), .cin(stage2_Q[101]), .sum(w_161), .carry(w_162));
    wire w_163, w_164;
    full_adder FA70 (.a(stage2_Q[102]), .b(stage2_Q[103]), .cin(stage2_Q[104]), .sum(w_163), .carry(w_164));
    wire w_165, w_166;
    full_adder FA71 (.a(stage2_Q[105]), .b(stage2_Q[106]), .cin(stage2_Q[107]), .sum(w_165), .carry(w_166));
    wire w_167, w_168;
    full_adder FA72 (.a(stage2_Q[108]), .b(stage2_Q[109]), .cin(stage2_Q[110]), .sum(w_167), .carry(w_168));
    wire w_169, w_170;
    full_adder FA73 (.a(stage2_Q[111]), .b(stage2_Q[112]), .cin(stage2_Q[113]), .sum(w_169), .carry(w_170));
    wire w_171, w_172;
    full_adder FA74 (.a(stage2_Q[114]), .b(stage2_Q[115]), .cin(stage2_Q[116]), .sum(w_171), .carry(w_172));
    wire w_173, w_174;
    full_adder FA75 (.a(stage2_Q[117]), .b(stage2_Q[118]), .cin(stage2_Q[119]), .sum(w_173), .carry(w_174));
    wire w_175, w_176;
    full_adder FA76 (.a(stage2_Q[120]), .b(stage2_Q[121]), .cin(stage2_Q[122]), .sum(w_175), .carry(w_176));
    wire w_177, w_178;
    full_adder FA77 (.a(stage2_Q[123]), .b(stage2_Q[124]), .cin(stage2_Q[125]), .sum(w_177), .carry(w_178));
    wire w_179, w_180;
    full_adder FA78 (.a(stage2_Q[126]), .b(stage2_Q[127]), .cin(stage2_Q[128]), .sum(w_179), .carry(w_180));
    wire w_181, w_182;
    full_adder FA79 (.a(stage2_Q[129]), .b(stage2_Q[130]), .cin(stage2_Q[131]), .sum(w_181), .carry(w_182));
    wire w_183, w_184;
    full_adder FA80 (.a(stage2_Q[132]), .b(stage2_Q[133]), .cin(stage2_Q[134]), .sum(w_183), .carry(w_184));
    wire w_185, w_186;
    full_adder FA81 (.a(stage2_Q[135]), .b(stage2_Q[136]), .cin(stage2_Q[137]), .sum(w_185), .carry(w_186));
    wire w_187, w_188;
    full_adder FA82 (.a(stage2_Q[138]), .b(stage2_Q[139]), .cin(stage2_Q[140]), .sum(w_187), .carry(w_188));
    wire w_189, w_190;
    full_adder FA83 (.a(stage2_Q[141]), .b(stage2_Q[142]), .cin(stage2_Q[143]), .sum(w_189), .carry(w_190));
    wire w_191, w_192;
    full_adder FA84 (.a(stage2_Q[144]), .b(stage2_Q[145]), .cin(stage2_Q[146]), .sum(w_191), .carry(w_192));
    wire w_193, w_194;
    full_adder FA85 (.a(stage2_Q[147]), .b(stage2_Q[148]), .cin(stage2_Q[149]), .sum(w_193), .carry(w_194));
    wire w_195, w_196;
    full_adder FA86 (.a(stage2_Q[150]), .b(stage2_Q[151]), .cin(stage2_Q[152]), .sum(w_195), .carry(w_196));
    wire w_197, w_198;
    full_adder FA87 (.a(stage2_Q[153]), .b(stage2_Q[154]), .cin(stage2_Q[155]), .sum(w_197), .carry(w_198));
    wire w_199, w_200;
    full_adder FA88 (.a(stage2_Q[156]), .b(stage2_Q[157]), .cin(stage2_Q[158]), .sum(w_199), .carry(w_200));
    wire w_201, w_202;
    full_adder FA89 (.a(stage2_Q[159]), .b(stage2_Q[160]), .cin(stage2_Q[161]), .sum(w_201), .carry(w_202));
    wire w_203, w_204;
    full_adder FA90 (.a(stage2_Q[162]), .b(stage2_Q[163]), .cin(stage2_Q[164]), .sum(w_203), .carry(w_204));
    wire w_205, w_206;
    full_adder FA91 (.a(stage2_Q[165]), .b(stage2_Q[166]), .cin(stage2_Q[167]), .sum(w_205), .carry(w_206));
    wire w_207, w_208;
    full_adder FA92 (.a(stage2_Q[168]), .b(stage2_Q[169]), .cin(stage2_Q[170]), .sum(w_207), .carry(w_208));
    wire w_209, w_210;
    full_adder FA93 (.a(stage2_Q[171]), .b(stage2_Q[172]), .cin(stage2_Q[173]), .sum(w_209), .carry(w_210));
    wire w_211, w_212;
    full_adder FA94 (.a(stage2_Q[174]), .b(stage2_Q[175]), .cin(stage2_Q[176]), .sum(w_211), .carry(w_212));
    wire w_213, w_214;
    full_adder FA95 (.a(stage2_Q[177]), .b(stage2_Q[178]), .cin(stage2_Q[179]), .sum(w_213), .carry(w_214));
    wire w_215, w_216;
    full_adder FA96 (.a(stage2_Q[180]), .b(stage2_Q[181]), .cin(stage2_Q[182]), .sum(w_215), .carry(w_216));
    wire w_217, w_218;
    full_adder FA97 (.a(stage2_Q[183]), .b(stage2_Q[184]), .cin(stage2_Q[185]), .sum(w_217), .carry(w_218));
    wire w_219, w_220;
    full_adder FA98 (.a(stage2_Q[187]), .b(stage2_Q[188]), .cin(stage2_Q[189]), .sum(w_219), .carry(w_220));

    // ========================================================
    // Stage 4
    // ========================================================
    wire w_221, w_222;
    half_adder HA11 (.a(stage2_Q[10]), .b(stage2_Q[11]), .sum(w_221), .carry(w_222));
    wire w_223, w_224;
    full_adder FA99 (.a(stage2_Q[15]), .b(stage2_Q[16]), .cin(stage2_Q[17]), .sum(w_223), .carry(w_224));
    wire w_225, w_226;
    half_adder HA12 (.a(stage2_Q[18]), .b(stage2_Q[19]), .sum(w_225), .carry(w_226));
    wire w_227, w_228;
    full_adder FA100 (.a(w_113), .b(stage2_Q[23]), .cin(stage2_Q[24]), .sum(w_227), .carry(w_228));
    wire w_229, w_230;
    full_adder FA101 (.a(stage2_Q[25]), .b(stage2_Q[26]), .cin(stage2_Q[27]), .sum(w_229), .carry(w_230));
    wire w_231, w_232;
    full_adder FA102 (.a(w_114), .b(w_115), .cin(w_117), .sum(w_231), .carry(w_232));
    wire w_233, w_234;
    full_adder FA103 (.a(stage2_Q[33]), .b(stage2_Q[34]), .cin(stage2_Q[35]), .sum(w_233), .carry(w_234));
    wire w_235, w_236;
    full_adder FA104 (.a(w_116), .b(w_118), .cin(w_119), .sum(w_235), .carry(w_236));
    wire w_237, w_238;
    full_adder FA105 (.a(w_121), .b(w_123), .cin(stage2_Q[44]), .sum(w_237), .carry(w_238));
    wire w_239, w_240;
    full_adder FA106 (.a(w_120), .b(w_122), .cin(w_124), .sum(w_239), .carry(w_240));
    wire w_241, w_242;
    full_adder FA107 (.a(w_125), .b(w_127), .cin(w_129), .sum(w_241), .carry(w_242));
    wire w_243, w_244;
    full_adder FA108 (.a(w_126), .b(w_128), .cin(w_130), .sum(w_243), .carry(w_244));
    wire w_245, w_246;
    full_adder FA109 (.a(w_131), .b(w_133), .cin(w_135), .sum(w_245), .carry(w_246));
    wire w_247, w_248;
    full_adder FA110 (.a(w_132), .b(w_134), .cin(w_136), .sum(w_247), .carry(w_248));
    wire w_249, w_250;
    full_adder FA111 (.a(w_137), .b(w_139), .cin(w_141), .sum(w_249), .carry(w_250));
    wire w_251, w_252;
    full_adder FA112 (.a(w_138), .b(w_140), .cin(w_142), .sum(w_251), .carry(w_252));
    wire w_253, w_254;
    full_adder FA113 (.a(w_143), .b(w_145), .cin(w_147), .sum(w_253), .carry(w_254));
    wire w_255, w_256;
    full_adder FA114 (.a(w_144), .b(w_146), .cin(w_148), .sum(w_255), .carry(w_256));
    wire w_257, w_258;
    full_adder FA115 (.a(w_149), .b(w_151), .cin(w_153), .sum(w_257), .carry(w_258));
    wire w_259, w_260;
    full_adder FA116 (.a(w_150), .b(w_152), .cin(w_154), .sum(w_259), .carry(w_260));
    wire w_261, w_262;
    full_adder FA117 (.a(w_155), .b(w_157), .cin(w_159), .sum(w_261), .carry(w_262));
    wire w_263, w_264;
    full_adder FA118 (.a(w_156), .b(w_158), .cin(w_160), .sum(w_263), .carry(w_264));
    wire w_265, w_266;
    full_adder FA119 (.a(w_161), .b(w_163), .cin(w_165), .sum(w_265), .carry(w_266));
    wire w_267, w_268;
    full_adder FA120 (.a(w_162), .b(w_164), .cin(w_166), .sum(w_267), .carry(w_268));
    wire w_269, w_270;
    full_adder FA121 (.a(w_167), .b(w_169), .cin(w_171), .sum(w_269), .carry(w_270));
    wire w_271, w_272;
    full_adder FA122 (.a(w_168), .b(w_170), .cin(w_172), .sum(w_271), .carry(w_272));
    wire w_273, w_274;
    full_adder FA123 (.a(w_173), .b(w_175), .cin(w_177), .sum(w_273), .carry(w_274));
    wire w_275, w_276;
    full_adder FA124 (.a(w_174), .b(w_176), .cin(w_178), .sum(w_275), .carry(w_276));
    wire w_277, w_278;
    full_adder FA125 (.a(w_179), .b(w_181), .cin(w_183), .sum(w_277), .carry(w_278));
    wire w_279, w_280;
    full_adder FA126 (.a(w_180), .b(w_182), .cin(w_184), .sum(w_279), .carry(w_280));
    wire w_281, w_282;
    full_adder FA127 (.a(w_185), .b(w_187), .cin(w_189), .sum(w_281), .carry(w_282));
    wire w_283, w_284;
    full_adder FA128 (.a(w_186), .b(w_188), .cin(w_190), .sum(w_283), .carry(w_284));
    wire w_285, w_286;
    full_adder FA129 (.a(w_191), .b(w_193), .cin(w_195), .sum(w_285), .carry(w_286));
    wire w_287, w_288;
    full_adder FA130 (.a(w_192), .b(w_194), .cin(w_196), .sum(w_287), .carry(w_288));
    wire w_289, w_290;
    full_adder FA131 (.a(w_197), .b(w_199), .cin(w_201), .sum(w_289), .carry(w_290));
    wire w_291, w_292;
    full_adder FA132 (.a(w_198), .b(w_200), .cin(w_202), .sum(w_291), .carry(w_292));
    wire w_293, w_294;
    full_adder FA133 (.a(w_203), .b(w_205), .cin(w_207), .sum(w_293), .carry(w_294));
    wire w_295, w_296;
    full_adder FA134 (.a(w_204), .b(w_206), .cin(w_208), .sum(w_295), .carry(w_296));
    wire w_297, w_298;
    full_adder FA135 (.a(w_209), .b(w_211), .cin(w_213), .sum(w_297), .carry(w_298));
    wire w_299, w_300;
    full_adder FA136 (.a(w_210), .b(w_212), .cin(w_214), .sum(w_299), .carry(w_300));
    wire w_301, w_302;
    full_adder FA137 (.a(w_215), .b(w_217), .cin(stage2_Q[186]), .sum(w_301), .carry(w_302));
    wire w_303, w_304;
    full_adder FA138 (.a(w_216), .b(w_218), .cin(w_219), .sum(w_303), .carry(w_304));
    wire w_305, w_306;
    full_adder FA139 (.a(stage2_Q[190]), .b(stage2_Q[191]), .cin(stage2_Q[192]), .sum(w_305), .carry(w_306));
    wire w_307, w_308;
    full_adder FA140 (.a(w_220), .b(stage2_Q[193]), .cin(stage2_Q[194]), .sum(w_307), .carry(w_308));
    wire w_309, w_310;
    full_adder FA141 (.a(stage2_Q[195]), .b(stage2_Q[196]), .cin(stage2_Q[197]), .sum(w_309), .carry(w_310));
    wire w_311, w_312;
    full_adder FA142 (.a(stage2_Q[198]), .b(stage2_Q[199]), .cin(stage2_Q[200]), .sum(w_311), .carry(w_312));

    // Pipeline Register Bank: Post-Stage 4 Layer
    wire [112:0] stage4_D;
    wire [112:0] stage4_Q;
    assign stage4_D = {stage2_Q[207], stage2_Q[206], stage2_Q[205], stage2_Q[204], stage2_Q[203], stage2_Q[202], w_312, stage2_Q[201], w_311, w_310, w_308, w_309, w_307, w_306, w_304, w_305, w_303, w_302, w_300, w_301, w_299, w_298, w_296, w_297, w_295, w_294, w_292, w_293, w_291, w_290, w_288, w_289, w_287, w_286, w_284, w_285, w_283, w_282, w_280, w_281, w_279, w_278, w_276, w_277, w_275, w_274, w_272, w_273, w_271, w_270, w_268, w_269, w_267, w_266, w_264, w_265, w_263, w_262, w_260, w_261, w_259, w_258, w_256, w_257, w_255, w_254, w_252, w_253, w_251, w_250, w_248, w_249, w_247, w_246, w_244, w_245, w_243, w_242, w_240, w_241, w_239, w_238, w_236, w_237, w_235, w_234, w_232, w_233, w_231, w_230, w_228, w_229, w_227, w_226, w_224, stage2_Q[20], w_225, w_223, w_222, stage2_Q[14], stage2_Q[13], stage2_Q[12], w_221, stage2_Q[9], stage2_Q[8], stage2_Q[7], stage2_Q[6], stage2_Q[5], stage2_Q[4], stage2_Q[3], stage2_Q[2], stage2_Q[1], stage2_Q[0]};
    register_bank #(.WIDTH(113)) reg_stage_4 (
        .clk(clk), .rst(rst), .en(en), .D(stage4_D), .Q(stage4_Q)
    );

    // ========================================================
    // Stage 5
    // ========================================================
    wire w_313, w_314;
    half_adder HA13 (.a(stage4_Q[6]), .b(stage4_Q[7]), .sum(w_313), .carry(w_314));
    wire w_315, w_316;
    full_adder FA143 (.a(stage4_Q[10]), .b(stage4_Q[11]), .cin(stage4_Q[12]), .sum(w_315), .carry(w_316));
    wire w_317, w_318;
    full_adder FA144 (.a(stage4_Q[14]), .b(stage4_Q[15]), .cin(stage4_Q[16]), .sum(w_317), .carry(w_318));
    wire w_319, w_320;
    full_adder FA145 (.a(stage4_Q[18]), .b(stage4_Q[19]), .cin(stage4_Q[20]), .sum(w_319), .carry(w_320));
    wire w_321, w_322;
    full_adder FA146 (.a(stage4_Q[22]), .b(stage4_Q[23]), .cin(stage4_Q[24]), .sum(w_321), .carry(w_322));
    wire w_323, w_324;
    full_adder FA147 (.a(stage4_Q[26]), .b(stage4_Q[27]), .cin(stage4_Q[28]), .sum(w_323), .carry(w_324));
    wire w_325, w_326;
    full_adder FA148 (.a(stage4_Q[30]), .b(stage4_Q[31]), .cin(stage4_Q[32]), .sum(w_325), .carry(w_326));
    wire w_327, w_328;
    full_adder FA149 (.a(stage4_Q[34]), .b(stage4_Q[35]), .cin(stage4_Q[36]), .sum(w_327), .carry(w_328));
    wire w_329, w_330;
    full_adder FA150 (.a(stage4_Q[38]), .b(stage4_Q[39]), .cin(stage4_Q[40]), .sum(w_329), .carry(w_330));
    wire w_331, w_332;
    full_adder FA151 (.a(stage4_Q[42]), .b(stage4_Q[43]), .cin(stage4_Q[44]), .sum(w_331), .carry(w_332));
    wire w_333, w_334;
    full_adder FA152 (.a(stage4_Q[46]), .b(stage4_Q[47]), .cin(stage4_Q[48]), .sum(w_333), .carry(w_334));
    wire w_335, w_336;
    full_adder FA153 (.a(stage4_Q[50]), .b(stage4_Q[51]), .cin(stage4_Q[52]), .sum(w_335), .carry(w_336));
    wire w_337, w_338;
    full_adder FA154 (.a(stage4_Q[54]), .b(stage4_Q[55]), .cin(stage4_Q[56]), .sum(w_337), .carry(w_338));
    wire w_339, w_340;
    full_adder FA155 (.a(stage4_Q[58]), .b(stage4_Q[59]), .cin(stage4_Q[60]), .sum(w_339), .carry(w_340));
    wire w_341, w_342;
    full_adder FA156 (.a(stage4_Q[62]), .b(stage4_Q[63]), .cin(stage4_Q[64]), .sum(w_341), .carry(w_342));
    wire w_343, w_344;
    full_adder FA157 (.a(stage4_Q[66]), .b(stage4_Q[67]), .cin(stage4_Q[68]), .sum(w_343), .carry(w_344));
    wire w_345, w_346;
    full_adder FA158 (.a(stage4_Q[70]), .b(stage4_Q[71]), .cin(stage4_Q[72]), .sum(w_345), .carry(w_346));
    wire w_347, w_348;
    full_adder FA159 (.a(stage4_Q[74]), .b(stage4_Q[75]), .cin(stage4_Q[76]), .sum(w_347), .carry(w_348));
    wire w_349, w_350;
    full_adder FA160 (.a(stage4_Q[78]), .b(stage4_Q[79]), .cin(stage4_Q[80]), .sum(w_349), .carry(w_350));
    wire w_351, w_352;
    full_adder FA161 (.a(stage4_Q[82]), .b(stage4_Q[83]), .cin(stage4_Q[84]), .sum(w_351), .carry(w_352));
    wire w_353, w_354;
    full_adder FA162 (.a(stage4_Q[86]), .b(stage4_Q[87]), .cin(stage4_Q[88]), .sum(w_353), .carry(w_354));
    wire w_355, w_356;
    full_adder FA163 (.a(stage4_Q[90]), .b(stage4_Q[91]), .cin(stage4_Q[92]), .sum(w_355), .carry(w_356));
    wire w_357, w_358;
    full_adder FA164 (.a(stage4_Q[94]), .b(stage4_Q[95]), .cin(stage4_Q[96]), .sum(w_357), .carry(w_358));
    wire w_359, w_360;
    full_adder FA165 (.a(stage4_Q[98]), .b(stage4_Q[99]), .cin(stage4_Q[100]), .sum(w_359), .carry(w_360));
    wire w_361, w_362;
    full_adder FA166 (.a(stage4_Q[102]), .b(stage4_Q[103]), .cin(stage4_Q[104]), .sum(w_361), .carry(w_362));
    wire w_363, w_364;
    full_adder FA167 (.a(stage4_Q[106]), .b(stage4_Q[107]), .cin(stage4_Q[108]), .sum(w_363), .carry(w_364));

    // ========================================================
    // Stage 6
    // ========================================================
    wire w_365, w_366;
    half_adder HA14 (.a(stage4_Q[3]), .b(stage4_Q[4]), .sum(w_365), .carry(w_366));
    wire w_367, w_368;
    full_adder FA168 (.a(w_313), .b(stage4_Q[8]), .cin(stage4_Q[9]), .sum(w_367), .carry(w_368));
    wire w_369, w_370;
    full_adder FA169 (.a(w_314), .b(w_315), .cin(stage4_Q[13]), .sum(w_369), .carry(w_370));
    wire w_371, w_372;
    full_adder FA170 (.a(w_316), .b(w_317), .cin(stage4_Q[17]), .sum(w_371), .carry(w_372));
    wire w_373, w_374;
    full_adder FA171 (.a(w_318), .b(w_319), .cin(stage4_Q[21]), .sum(w_373), .carry(w_374));
    wire w_375, w_376;
    full_adder FA172 (.a(w_320), .b(w_321), .cin(stage4_Q[25]), .sum(w_375), .carry(w_376));
    wire w_377, w_378;
    full_adder FA173 (.a(w_322), .b(w_323), .cin(stage4_Q[29]), .sum(w_377), .carry(w_378));
    wire w_379, w_380;
    full_adder FA174 (.a(w_324), .b(w_325), .cin(stage4_Q[33]), .sum(w_379), .carry(w_380));
    wire w_381, w_382;
    full_adder FA175 (.a(w_326), .b(w_327), .cin(stage4_Q[37]), .sum(w_381), .carry(w_382));
    wire w_383, w_384;
    full_adder FA176 (.a(w_328), .b(w_329), .cin(stage4_Q[41]), .sum(w_383), .carry(w_384));
    wire w_385, w_386;
    full_adder FA177 (.a(w_330), .b(w_331), .cin(stage4_Q[45]), .sum(w_385), .carry(w_386));
    wire w_387, w_388;
    full_adder FA178 (.a(w_332), .b(w_333), .cin(stage4_Q[49]), .sum(w_387), .carry(w_388));
    wire w_389, w_390;
    full_adder FA179 (.a(w_334), .b(w_335), .cin(stage4_Q[53]), .sum(w_389), .carry(w_390));
    wire w_391, w_392;
    full_adder FA180 (.a(w_336), .b(w_337), .cin(stage4_Q[57]), .sum(w_391), .carry(w_392));
    wire w_393, w_394;
    full_adder FA181 (.a(w_338), .b(w_339), .cin(stage4_Q[61]), .sum(w_393), .carry(w_394));
    wire w_395, w_396;
    full_adder FA182 (.a(w_340), .b(w_341), .cin(stage4_Q[65]), .sum(w_395), .carry(w_396));
    wire w_397, w_398;
    full_adder FA183 (.a(w_342), .b(w_343), .cin(stage4_Q[69]), .sum(w_397), .carry(w_398));
    wire w_399, w_400;
    full_adder FA184 (.a(w_344), .b(w_345), .cin(stage4_Q[73]), .sum(w_399), .carry(w_400));
    wire w_401, w_402;
    full_adder FA185 (.a(w_346), .b(w_347), .cin(stage4_Q[77]), .sum(w_401), .carry(w_402));
    wire w_403, w_404;
    full_adder FA186 (.a(w_348), .b(w_349), .cin(stage4_Q[81]), .sum(w_403), .carry(w_404));
    wire w_405, w_406;
    full_adder FA187 (.a(w_350), .b(w_351), .cin(stage4_Q[85]), .sum(w_405), .carry(w_406));
    wire w_407, w_408;
    full_adder FA188 (.a(w_352), .b(w_353), .cin(stage4_Q[89]), .sum(w_407), .carry(w_408));
    wire w_409, w_410;
    full_adder FA189 (.a(w_354), .b(w_355), .cin(stage4_Q[93]), .sum(w_409), .carry(w_410));
    wire w_411, w_412;
    full_adder FA190 (.a(w_356), .b(w_357), .cin(stage4_Q[97]), .sum(w_411), .carry(w_412));
    wire w_413, w_414;
    full_adder FA191 (.a(w_358), .b(w_359), .cin(stage4_Q[101]), .sum(w_413), .carry(w_414));
    wire w_415, w_416;
    full_adder FA192 (.a(w_360), .b(w_361), .cin(stage4_Q[105]), .sum(w_415), .carry(w_416));
    wire w_417, w_418;
    full_adder FA193 (.a(w_362), .b(w_363), .cin(stage4_Q[109]), .sum(w_417), .carry(w_418));
    wire w_419, w_420;
    full_adder FA194 (.a(w_364), .b(stage4_Q[110]), .cin(stage4_Q[111]), .sum(w_419), .carry(w_420));

    // Pipeline Register Bank: Post-Stage 6 Layer
    wire [60:0] stage6_D;
    wire [60:0] stage6_Q;
    assign stage6_D = {stage4_Q[112], w_420, w_419, w_418, w_417, w_416, w_415, w_414, w_413, w_412, w_411, w_410, w_409, w_408, w_407, w_406, w_405, w_404, w_403, w_402, w_401, w_400, w_399, w_398, w_397, w_396, w_395, w_394, w_393, w_392, w_391, w_390, w_389, w_388, w_387, w_386, w_385, w_384, w_383, w_382, w_381, w_380, w_379, w_378, w_377, w_376, w_375, w_374, w_373, w_372, w_371, w_370, w_369, w_368, w_367, w_366, stage4_Q[5], w_365, stage4_Q[2], stage4_Q[1], stage4_Q[0]};
    register_bank #(.WIDTH(61)) reg_stage_6 (
        .clk(clk), .rst(rst), .en(en), .D(stage6_D), .Q(stage6_Q)
    );

    // ========================================================
    // Vector Preparation for Final Addition
    // ========================================================
    wire [31:0] adder_vec_A_raw = {1'b0, stage6_Q[59], stage6_Q[57], stage6_Q[55], stage6_Q[53], stage6_Q[51], stage6_Q[49], stage6_Q[47], stage6_Q[45], stage6_Q[43], stage6_Q[41], stage6_Q[39], stage6_Q[37], stage6_Q[35], stage6_Q[33], stage6_Q[31], stage6_Q[29], stage6_Q[27], stage6_Q[25], stage6_Q[23], stage6_Q[21], stage6_Q[19], stage6_Q[17], stage6_Q[15], stage6_Q[13], stage6_Q[11], stage6_Q[9], stage6_Q[7], stage6_Q[5], stage6_Q[3], stage6_Q[1], stage6_Q[0]};
    wire [31:0] adder_vec_B_raw = {1'b0, stage6_Q[60], stage6_Q[58], stage6_Q[56], stage6_Q[54], stage6_Q[52], stage6_Q[50], stage6_Q[48], stage6_Q[46], stage6_Q[44], stage6_Q[42], stage6_Q[40], stage6_Q[38], stage6_Q[36], stage6_Q[34], stage6_Q[32], stage6_Q[30], stage6_Q[28], stage6_Q[26], stage6_Q[24], stage6_Q[22], stage6_Q[20], stage6_Q[18], stage6_Q[16], stage6_Q[14], stage6_Q[12], stage6_Q[10], stage6_Q[8], stage6_Q[6], stage6_Q[4], stage6_Q[2], 1'b0};

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
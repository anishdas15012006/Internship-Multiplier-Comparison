// =======================================================================
// Dynamically Generated Pipelined Booth Dadda (Radix - 2) Multiplier
// Configuration: N = 16
// =======================================================================

module booth_dadda_radix2_multiplier_16 #(
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
    // PPG: Radix-2 Booth Partial Product Generation
    // ========================================================
    wire [255:0] raw_pp;
    wire [16:0] raw_pp_cin;
    wire [15:0] raw_sign_inv_bits;

    booth_radix2_ppg #(.N(16), .SIGNED_A(SIGNED_A), .SIGNED_B(SIGNED_B)) ppg_inst (
        .A(reg_A_w),
        .B(reg_B_w),
        .pp(raw_pp),
        .pp_cin(raw_pp_cin),
        .sign_inv_bits(raw_sign_inv_bits)
    );

    // ========================================================
    // Stage 1
    // ========================================================
    wire w_1, w_2;
    half_adder HA0 (.a(raw_pp[12]), .b(raw_pp[27]), .sum(w_1), .carry(w_2));
    wire w_3, w_4;
    full_adder FA0 (.a(raw_pp[13]), .b(raw_pp[28]), .cin(raw_pp[43]), .sum(w_3), .carry(w_4));
    wire w_5, w_6;
    half_adder HA1 (.a(raw_pp[58]), .b(raw_pp[73]), .sum(w_5), .carry(w_6));
    wire w_7, w_8;
    full_adder FA1 (.a(raw_pp[14]), .b(raw_pp[29]), .cin(raw_pp[44]), .sum(w_7), .carry(w_8));
    wire w_9, w_10;
    full_adder FA2 (.a(raw_pp[59]), .b(raw_pp[74]), .cin(raw_pp[89]), .sum(w_9), .carry(w_10));
    wire w_11, w_12;
    half_adder HA2 (.a(raw_pp[104]), .b(raw_pp[119]), .sum(w_11), .carry(w_12));
    wire w_13, w_14;
    full_adder FA3 (.a(raw_pp[15]), .b(raw_pp[30]), .cin(raw_pp[45]), .sum(w_13), .carry(w_14));
    wire w_15, w_16;
    full_adder FA4 (.a(raw_pp[60]), .b(raw_pp[75]), .cin(raw_pp[90]), .sum(w_15), .carry(w_16));
    wire w_17, w_18;
    full_adder FA5 (.a(raw_pp[105]), .b(raw_pp[120]), .cin(raw_pp[135]), .sum(w_17), .carry(w_18));
    wire w_19, w_20;
    half_adder HA3 (.a(raw_pp[150]), .b(raw_pp[165]), .sum(w_19), .carry(w_20));
    wire w_21, w_22;
    full_adder FA6 (.a(raw_pp[31]), .b(raw_pp[46]), .cin(raw_pp[61]), .sum(w_21), .carry(w_22));
    wire w_23, w_24;
    full_adder FA7 (.a(raw_pp[76]), .b(raw_pp[91]), .cin(raw_pp[106]), .sum(w_23), .carry(w_24));
    wire w_25, w_26;
    full_adder FA8 (.a(raw_pp[121]), .b(raw_pp[136]), .cin(raw_pp[151]), .sum(w_25), .carry(w_26));
    wire w_27, w_28;
    full_adder FA9 (.a(raw_pp[166]), .b(raw_pp[181]), .cin(raw_pp[196]), .sum(w_27), .carry(w_28));
    wire w_29, w_30;
    full_adder FA10 (.a(raw_pp[47]), .b(raw_pp[62]), .cin(raw_pp[77]), .sum(w_29), .carry(w_30));
    wire w_31, w_32;
    full_adder FA11 (.a(raw_pp[92]), .b(raw_pp[107]), .cin(raw_pp[122]), .sum(w_31), .carry(w_32));
    wire w_33, w_34;
    full_adder FA12 (.a(raw_pp[137]), .b(raw_pp[152]), .cin(raw_pp[167]), .sum(w_33), .carry(w_34));
    wire w_35, w_36;
    full_adder FA13 (.a(raw_pp[63]), .b(raw_pp[78]), .cin(raw_pp[93]), .sum(w_35), .carry(w_36));
    wire w_37, w_38;
    full_adder FA14 (.a(raw_pp[108]), .b(raw_pp[123]), .cin(raw_pp[138]), .sum(w_37), .carry(w_38));
    wire w_39, w_40;
    full_adder FA15 (.a(raw_pp[79]), .b(raw_pp[94]), .cin(raw_pp[109]), .sum(w_39), .carry(w_40));

    // ========================================================
    // Stage 2
    // ========================================================
    wire w_41, w_42;
    half_adder HA4 (.a(raw_pp[8]), .b(raw_pp[23]), .sum(w_41), .carry(w_42));
    wire w_43, w_44;
    full_adder FA16 (.a(raw_pp[9]), .b(raw_pp[24]), .cin(raw_pp[39]), .sum(w_43), .carry(w_44));
    wire w_45, w_46;
    half_adder HA5 (.a(raw_pp[54]), .b(raw_pp[69]), .sum(w_45), .carry(w_46));
    wire w_47, w_48;
    full_adder FA17 (.a(raw_pp[10]), .b(raw_pp[25]), .cin(raw_pp[40]), .sum(w_47), .carry(w_48));
    wire w_49, w_50;
    full_adder FA18 (.a(raw_pp[55]), .b(raw_pp[70]), .cin(raw_pp[85]), .sum(w_49), .carry(w_50));
    wire w_51, w_52;
    half_adder HA6 (.a(raw_pp[100]), .b(raw_pp[115]), .sum(w_51), .carry(w_52));
    wire w_53, w_54;
    full_adder FA19 (.a(raw_pp[11]), .b(raw_pp[26]), .cin(raw_pp[41]), .sum(w_53), .carry(w_54));
    wire w_55, w_56;
    full_adder FA20 (.a(raw_pp[56]), .b(raw_pp[71]), .cin(raw_pp[86]), .sum(w_55), .carry(w_56));
    wire w_57, w_58;
    full_adder FA21 (.a(raw_pp[101]), .b(raw_pp[116]), .cin(raw_pp[131]), .sum(w_57), .carry(w_58));
    wire w_59, w_60;
    half_adder HA7 (.a(raw_pp[146]), .b(raw_pp[161]), .sum(w_59), .carry(w_60));
    wire w_61, w_62;
    full_adder FA22 (.a(w_1), .b(raw_pp[42]), .cin(raw_pp[57]), .sum(w_61), .carry(w_62));
    wire w_63, w_64;
    full_adder FA23 (.a(raw_pp[72]), .b(raw_pp[87]), .cin(raw_pp[102]), .sum(w_63), .carry(w_64));
    wire w_65, w_66;
    full_adder FA24 (.a(raw_pp[117]), .b(raw_pp[132]), .cin(raw_pp[147]), .sum(w_65), .carry(w_66));
    wire w_67, w_68;
    full_adder FA25 (.a(raw_pp[162]), .b(raw_pp[177]), .cin(raw_pp[192]), .sum(w_67), .carry(w_68));
    wire w_69, w_70;
    full_adder FA26 (.a(w_2), .b(w_3), .cin(w_5), .sum(w_69), .carry(w_70));
    wire w_71, w_72;
    full_adder FA27 (.a(raw_pp[88]), .b(raw_pp[103]), .cin(raw_pp[118]), .sum(w_71), .carry(w_72));
    wire w_73, w_74;
    full_adder FA28 (.a(raw_pp[133]), .b(raw_pp[148]), .cin(raw_pp[163]), .sum(w_73), .carry(w_74));
    wire w_75, w_76;
    full_adder FA29 (.a(raw_pp[178]), .b(raw_pp[193]), .cin(raw_pp[208]), .sum(w_75), .carry(w_76));
    wire w_77, w_78;
    full_adder FA30 (.a(w_4), .b(w_6), .cin(w_7), .sum(w_77), .carry(w_78));
    wire w_79, w_80;
    full_adder FA31 (.a(w_9), .b(w_11), .cin(raw_pp[134]), .sum(w_79), .carry(w_80));
    wire w_81, w_82;
    full_adder FA32 (.a(raw_pp[149]), .b(raw_pp[164]), .cin(raw_pp[179]), .sum(w_81), .carry(w_82));
    wire w_83, w_84;
    full_adder FA33 (.a(raw_pp[194]), .b(raw_pp[209]), .cin(raw_pp[224]), .sum(w_83), .carry(w_84));
    wire w_85, w_86;
    full_adder FA34 (.a(w_8), .b(w_10), .cin(w_12), .sum(w_85), .carry(w_86));
    wire w_87, w_88;
    full_adder FA35 (.a(w_13), .b(w_15), .cin(w_17), .sum(w_87), .carry(w_88));
    wire w_89, w_90;
    full_adder FA36 (.a(w_19), .b(raw_pp[180]), .cin(raw_pp[195]), .sum(w_89), .carry(w_90));
    wire w_91, w_92;
    full_adder FA37 (.a(raw_pp[210]), .b(raw_pp[225]), .cin(raw_pp[240]), .sum(w_91), .carry(w_92));
    wire w_93, w_94;
    full_adder FA38 (.a(w_14), .b(w_16), .cin(w_18), .sum(w_93), .carry(w_94));
    wire w_95, w_96;
    full_adder FA39 (.a(w_20), .b(w_21), .cin(w_23), .sum(w_95), .carry(w_96));
    wire w_97, w_98;
    full_adder FA40 (.a(w_25), .b(w_27), .cin(raw_pp[211]), .sum(w_97), .carry(w_98));
    wire w_99, w_100;
    full_adder FA41 (.a(raw_pp[226]), .b(raw_pp[241]), .cin(raw_pp_cin[16]), .sum(w_99), .carry(w_100));
    wire w_101, w_102;
    full_adder FA42 (.a(w_22), .b(w_24), .cin(w_26), .sum(w_101), .carry(w_102));
    wire w_103, w_104;
    full_adder FA43 (.a(w_28), .b(w_29), .cin(w_31), .sum(w_103), .carry(w_104));
    wire w_105, w_106;
    full_adder FA44 (.a(w_33), .b(raw_pp[182]), .cin(raw_pp[197]), .sum(w_105), .carry(w_106));
    wire w_107, w_108;
    full_adder FA45 (.a(raw_pp[212]), .b(raw_pp[227]), .cin(raw_pp[242]), .sum(w_107), .carry(w_108));
    wire w_109, w_110;
    full_adder FA46 (.a(w_30), .b(w_32), .cin(w_34), .sum(w_109), .carry(w_110));
    wire w_111, w_112;
    full_adder FA47 (.a(w_35), .b(w_37), .cin(raw_pp[153]), .sum(w_111), .carry(w_112));
    wire w_113, w_114;
    full_adder FA48 (.a(raw_pp[168]), .b(raw_pp[183]), .cin(raw_pp[198]), .sum(w_113), .carry(w_114));
    wire w_115, w_116;
    full_adder FA49 (.a(raw_pp[213]), .b(raw_pp[228]), .cin(raw_pp[243]), .sum(w_115), .carry(w_116));
    wire w_117, w_118;
    full_adder FA50 (.a(w_36), .b(w_38), .cin(w_39), .sum(w_117), .carry(w_118));
    wire w_119, w_120;
    full_adder FA51 (.a(raw_pp[124]), .b(raw_pp[139]), .cin(raw_pp[154]), .sum(w_119), .carry(w_120));
    wire w_121, w_122;
    full_adder FA52 (.a(raw_pp[169]), .b(raw_pp[184]), .cin(raw_pp[199]), .sum(w_121), .carry(w_122));
    wire w_123, w_124;
    full_adder FA53 (.a(raw_pp[214]), .b(raw_pp[229]), .cin(raw_pp[244]), .sum(w_123), .carry(w_124));
    wire w_125, w_126;
    full_adder FA54 (.a(w_40), .b(raw_pp[95]), .cin(raw_pp[110]), .sum(w_125), .carry(w_126));
    wire w_127, w_128;
    full_adder FA55 (.a(raw_pp[125]), .b(raw_pp[140]), .cin(raw_pp[155]), .sum(w_127), .carry(w_128));
    wire w_129, w_130;
    full_adder FA56 (.a(raw_pp[170]), .b(raw_pp[185]), .cin(raw_pp[200]), .sum(w_129), .carry(w_130));
    wire w_131, w_132;
    full_adder FA57 (.a(raw_pp[215]), .b(raw_pp[230]), .cin(raw_pp[245]), .sum(w_131), .carry(w_132));
    wire w_133, w_134;
    full_adder FA58 (.a(raw_pp[111]), .b(raw_pp[126]), .cin(raw_pp[141]), .sum(w_133), .carry(w_134));
    wire w_135, w_136;
    full_adder FA59 (.a(raw_pp[156]), .b(raw_pp[171]), .cin(raw_pp[186]), .sum(w_135), .carry(w_136));
    wire w_137, w_138;
    full_adder FA60 (.a(raw_pp[201]), .b(raw_pp[216]), .cin(raw_pp[231]), .sum(w_137), .carry(w_138));
    wire w_139, w_140;
    full_adder FA61 (.a(raw_pp[127]), .b(raw_pp[142]), .cin(raw_pp[157]), .sum(w_139), .carry(w_140));
    wire w_141, w_142;
    full_adder FA62 (.a(raw_pp[172]), .b(raw_pp[187]), .cin(raw_pp[202]), .sum(w_141), .carry(w_142));
    wire w_143, w_144;
    full_adder FA63 (.a(raw_pp[143]), .b(raw_pp[158]), .cin(raw_pp[173]), .sum(w_143), .carry(w_144));

    // Pipeline Register Bank: Post-Stage 2 Layer
    wire [224:0] stage2_D;
    wire [224:0] stage2_Q;
    assign stage2_D = {raw_sign_inv_bits[15], raw_sign_inv_bits[14], raw_pp[255], raw_sign_inv_bits[13], raw_pp[254], raw_pp[239], raw_sign_inv_bits[12], raw_pp[253], raw_pp[238], raw_pp[223], raw_sign_inv_bits[11], raw_pp[252], raw_pp[237], raw_pp[222], raw_pp[207], raw_sign_inv_bits[10], raw_pp[251], raw_pp[236], raw_pp[221], raw_pp[206], raw_pp[191], raw_sign_inv_bits[9], raw_pp[250], raw_pp[235], raw_pp[220], raw_pp[205], raw_pp[190], raw_pp[175], raw_sign_inv_bits[8], raw_pp[249], raw_pp[234], raw_pp[219], raw_pp[204], raw_pp[189], raw_pp[174], raw_pp[159], w_144, raw_sign_inv_bits[7], raw_pp[248], raw_pp[233], raw_pp[218], raw_pp[203], raw_pp[188], w_143, w_142, w_140, raw_sign_inv_bits[6], raw_pp[247], raw_pp[232], raw_pp[217], w_141, w_139, w_138, w_136, w_134, raw_sign_inv_bits[5], raw_pp[246], w_137, w_135, w_133, w_132, w_130, w_128, w_126, raw_sign_inv_bits[4], w_131, w_129, w_127, w_125, w_124, w_122, w_120, w_118, raw_sign_inv_bits[3], w_123, w_121, w_119, w_117, w_116, w_114, w_112, w_110, raw_sign_inv_bits[2], w_115, w_113, w_111, w_109, w_108, w_106, w_104, w_102, raw_sign_inv_bits[1], w_107, w_105, w_103, w_101, w_100, w_98, w_96, w_94, raw_sign_inv_bits[0], w_99, w_97, w_95, w_93, w_92, w_90, w_88, w_86, raw_pp_cin[15], w_91, w_89, w_87, w_85, w_84, w_82, w_80, w_78, raw_pp_cin[14], w_83, w_81, w_79, w_77, w_76, w_74, w_72, w_70, raw_pp_cin[13], w_75, w_73, w_71, w_69, w_68, w_66, w_64, w_62, raw_pp_cin[12], w_67, w_65, w_63, w_61, w_60, w_58, w_56, w_54, raw_pp_cin[11], raw_pp[176], w_59, w_57, w_55, w_53, w_52, w_50, w_48, raw_pp_cin[10], raw_pp[160], raw_pp[145], raw_pp[130], w_51, w_49, w_47, w_46, w_44, raw_pp_cin[9], raw_pp[144], raw_pp[129], raw_pp[114], raw_pp[99], raw_pp[84], w_45, w_43, w_42, raw_pp_cin[8], raw_pp[128], raw_pp[113], raw_pp[98], raw_pp[83], raw_pp[68], raw_pp[53], raw_pp[38], w_41, raw_pp_cin[7], raw_pp[112], raw_pp[97], raw_pp[82], raw_pp[67], raw_pp[52], raw_pp[37], raw_pp[22], raw_pp[7], raw_pp_cin[6], raw_pp[96], raw_pp[81], raw_pp[66], raw_pp[51], raw_pp[36], raw_pp[21], raw_pp[6], raw_pp_cin[5], raw_pp[80], raw_pp[65], raw_pp[50], raw_pp[35], raw_pp[20], raw_pp[5], raw_pp_cin[4], raw_pp[64], raw_pp[49], raw_pp[34], raw_pp[19], raw_pp[4], raw_pp_cin[3], raw_pp[48], raw_pp[33], raw_pp[18], raw_pp[3], raw_pp_cin[2], raw_pp[32], raw_pp[17], raw_pp[2], raw_pp_cin[1], raw_pp[16], raw_pp[1], raw_pp_cin[0], raw_pp[0]};
    register_bank #(.WIDTH(225)) reg_stage_2 (
        .clk(clk), .rst(rst), .en(en), .D(stage2_D), .Q(stage2_Q)
    );

    // ========================================================
    // Stage 3
    // ========================================================
    wire w_145, w_146;
    half_adder HA8 (.a(stage2_Q[20]), .b(stage2_Q[21]), .sum(w_145), .carry(w_146));
    wire w_147, w_148;
    full_adder FA64 (.a(stage2_Q[27]), .b(stage2_Q[28]), .cin(stage2_Q[29]), .sum(w_147), .carry(w_148));
    wire w_149, w_150;
    half_adder HA9 (.a(stage2_Q[30]), .b(stage2_Q[31]), .sum(w_149), .carry(w_150));
    wire w_151, w_152;
    full_adder FA65 (.a(stage2_Q[35]), .b(stage2_Q[36]), .cin(stage2_Q[37]), .sum(w_151), .carry(w_152));
    wire w_153, w_154;
    full_adder FA66 (.a(stage2_Q[38]), .b(stage2_Q[39]), .cin(stage2_Q[40]), .sum(w_153), .carry(w_154));
    wire w_155, w_156;
    half_adder HA10 (.a(stage2_Q[41]), .b(stage2_Q[42]), .sum(w_155), .carry(w_156));
    wire w_157, w_158;
    full_adder FA67 (.a(stage2_Q[44]), .b(stage2_Q[45]), .cin(stage2_Q[46]), .sum(w_157), .carry(w_158));
    wire w_159, w_160;
    full_adder FA68 (.a(stage2_Q[47]), .b(stage2_Q[48]), .cin(stage2_Q[49]), .sum(w_159), .carry(w_160));
    wire w_161, w_162;
    full_adder FA69 (.a(stage2_Q[50]), .b(stage2_Q[51]), .cin(stage2_Q[52]), .sum(w_161), .carry(w_162));
    wire w_163, w_164;
    full_adder FA70 (.a(stage2_Q[53]), .b(stage2_Q[54]), .cin(stage2_Q[55]), .sum(w_163), .carry(w_164));
    wire w_165, w_166;
    full_adder FA71 (.a(stage2_Q[56]), .b(stage2_Q[57]), .cin(stage2_Q[58]), .sum(w_165), .carry(w_166));
    wire w_167, w_168;
    full_adder FA72 (.a(stage2_Q[59]), .b(stage2_Q[60]), .cin(stage2_Q[61]), .sum(w_167), .carry(w_168));
    wire w_169, w_170;
    full_adder FA73 (.a(stage2_Q[62]), .b(stage2_Q[63]), .cin(stage2_Q[64]), .sum(w_169), .carry(w_170));
    wire w_171, w_172;
    full_adder FA74 (.a(stage2_Q[65]), .b(stage2_Q[66]), .cin(stage2_Q[67]), .sum(w_171), .carry(w_172));
    wire w_173, w_174;
    full_adder FA75 (.a(stage2_Q[68]), .b(stage2_Q[69]), .cin(stage2_Q[70]), .sum(w_173), .carry(w_174));
    wire w_175, w_176;
    full_adder FA76 (.a(stage2_Q[71]), .b(stage2_Q[72]), .cin(stage2_Q[73]), .sum(w_175), .carry(w_176));
    wire w_177, w_178;
    full_adder FA77 (.a(stage2_Q[74]), .b(stage2_Q[75]), .cin(stage2_Q[76]), .sum(w_177), .carry(w_178));
    wire w_179, w_180;
    full_adder FA78 (.a(stage2_Q[77]), .b(stage2_Q[78]), .cin(stage2_Q[79]), .sum(w_179), .carry(w_180));
    wire w_181, w_182;
    full_adder FA79 (.a(stage2_Q[80]), .b(stage2_Q[81]), .cin(stage2_Q[82]), .sum(w_181), .carry(w_182));
    wire w_183, w_184;
    full_adder FA80 (.a(stage2_Q[83]), .b(stage2_Q[84]), .cin(stage2_Q[85]), .sum(w_183), .carry(w_184));
    wire w_185, w_186;
    full_adder FA81 (.a(stage2_Q[86]), .b(stage2_Q[87]), .cin(stage2_Q[88]), .sum(w_185), .carry(w_186));
    wire w_187, w_188;
    full_adder FA82 (.a(stage2_Q[89]), .b(stage2_Q[90]), .cin(stage2_Q[91]), .sum(w_187), .carry(w_188));
    wire w_189, w_190;
    full_adder FA83 (.a(stage2_Q[92]), .b(stage2_Q[93]), .cin(stage2_Q[94]), .sum(w_189), .carry(w_190));
    wire w_191, w_192;
    full_adder FA84 (.a(stage2_Q[95]), .b(stage2_Q[96]), .cin(stage2_Q[97]), .sum(w_191), .carry(w_192));
    wire w_193, w_194;
    full_adder FA85 (.a(stage2_Q[98]), .b(stage2_Q[99]), .cin(stage2_Q[100]), .sum(w_193), .carry(w_194));
    wire w_195, w_196;
    full_adder FA86 (.a(stage2_Q[101]), .b(stage2_Q[102]), .cin(stage2_Q[103]), .sum(w_195), .carry(w_196));
    wire w_197, w_198;
    full_adder FA87 (.a(stage2_Q[104]), .b(stage2_Q[105]), .cin(stage2_Q[106]), .sum(w_197), .carry(w_198));
    wire w_199, w_200;
    full_adder FA88 (.a(stage2_Q[107]), .b(stage2_Q[108]), .cin(stage2_Q[109]), .sum(w_199), .carry(w_200));
    wire w_201, w_202;
    full_adder FA89 (.a(stage2_Q[110]), .b(stage2_Q[111]), .cin(stage2_Q[112]), .sum(w_201), .carry(w_202));
    wire w_203, w_204;
    full_adder FA90 (.a(stage2_Q[113]), .b(stage2_Q[114]), .cin(stage2_Q[115]), .sum(w_203), .carry(w_204));
    wire w_205, w_206;
    full_adder FA91 (.a(stage2_Q[116]), .b(stage2_Q[117]), .cin(stage2_Q[118]), .sum(w_205), .carry(w_206));
    wire w_207, w_208;
    full_adder FA92 (.a(stage2_Q[119]), .b(stage2_Q[120]), .cin(stage2_Q[121]), .sum(w_207), .carry(w_208));
    wire w_209, w_210;
    full_adder FA93 (.a(stage2_Q[122]), .b(stage2_Q[123]), .cin(stage2_Q[124]), .sum(w_209), .carry(w_210));
    wire w_211, w_212;
    full_adder FA94 (.a(stage2_Q[125]), .b(stage2_Q[126]), .cin(stage2_Q[127]), .sum(w_211), .carry(w_212));
    wire w_213, w_214;
    full_adder FA95 (.a(stage2_Q[128]), .b(stage2_Q[129]), .cin(stage2_Q[130]), .sum(w_213), .carry(w_214));
    wire w_215, w_216;
    full_adder FA96 (.a(stage2_Q[131]), .b(stage2_Q[132]), .cin(stage2_Q[133]), .sum(w_215), .carry(w_216));
    wire w_217, w_218;
    full_adder FA97 (.a(stage2_Q[134]), .b(stage2_Q[135]), .cin(stage2_Q[136]), .sum(w_217), .carry(w_218));
    wire w_219, w_220;
    full_adder FA98 (.a(stage2_Q[137]), .b(stage2_Q[138]), .cin(stage2_Q[139]), .sum(w_219), .carry(w_220));
    wire w_221, w_222;
    full_adder FA99 (.a(stage2_Q[140]), .b(stage2_Q[141]), .cin(stage2_Q[142]), .sum(w_221), .carry(w_222));
    wire w_223, w_224;
    full_adder FA100 (.a(stage2_Q[143]), .b(stage2_Q[144]), .cin(stage2_Q[145]), .sum(w_223), .carry(w_224));
    wire w_225, w_226;
    full_adder FA101 (.a(stage2_Q[146]), .b(stage2_Q[147]), .cin(stage2_Q[148]), .sum(w_225), .carry(w_226));
    wire w_227, w_228;
    full_adder FA102 (.a(stage2_Q[149]), .b(stage2_Q[150]), .cin(stage2_Q[151]), .sum(w_227), .carry(w_228));
    wire w_229, w_230;
    full_adder FA103 (.a(stage2_Q[152]), .b(stage2_Q[153]), .cin(stage2_Q[154]), .sum(w_229), .carry(w_230));
    wire w_231, w_232;
    full_adder FA104 (.a(stage2_Q[155]), .b(stage2_Q[156]), .cin(stage2_Q[157]), .sum(w_231), .carry(w_232));
    wire w_233, w_234;
    full_adder FA105 (.a(stage2_Q[158]), .b(stage2_Q[159]), .cin(stage2_Q[160]), .sum(w_233), .carry(w_234));
    wire w_235, w_236;
    full_adder FA106 (.a(stage2_Q[161]), .b(stage2_Q[162]), .cin(stage2_Q[163]), .sum(w_235), .carry(w_236));
    wire w_237, w_238;
    full_adder FA107 (.a(stage2_Q[164]), .b(stage2_Q[165]), .cin(stage2_Q[166]), .sum(w_237), .carry(w_238));
    wire w_239, w_240;
    full_adder FA108 (.a(stage2_Q[167]), .b(stage2_Q[168]), .cin(stage2_Q[169]), .sum(w_239), .carry(w_240));
    wire w_241, w_242;
    full_adder FA109 (.a(stage2_Q[170]), .b(stage2_Q[171]), .cin(stage2_Q[172]), .sum(w_241), .carry(w_242));
    wire w_243, w_244;
    full_adder FA110 (.a(stage2_Q[173]), .b(stage2_Q[174]), .cin(stage2_Q[175]), .sum(w_243), .carry(w_244));
    wire w_245, w_246;
    full_adder FA111 (.a(stage2_Q[176]), .b(stage2_Q[177]), .cin(stage2_Q[178]), .sum(w_245), .carry(w_246));
    wire w_247, w_248;
    full_adder FA112 (.a(stage2_Q[179]), .b(stage2_Q[180]), .cin(stage2_Q[181]), .sum(w_247), .carry(w_248));
    wire w_249, w_250;
    full_adder FA113 (.a(stage2_Q[182]), .b(stage2_Q[183]), .cin(stage2_Q[184]), .sum(w_249), .carry(w_250));
    wire w_251, w_252;
    full_adder FA114 (.a(stage2_Q[185]), .b(stage2_Q[186]), .cin(stage2_Q[187]), .sum(w_251), .carry(w_252));
    wire w_253, w_254;
    full_adder FA115 (.a(stage2_Q[188]), .b(stage2_Q[189]), .cin(stage2_Q[190]), .sum(w_253), .carry(w_254));
    wire w_255, w_256;
    full_adder FA116 (.a(stage2_Q[191]), .b(stage2_Q[192]), .cin(stage2_Q[193]), .sum(w_255), .carry(w_256));
    wire w_257, w_258;
    full_adder FA117 (.a(stage2_Q[194]), .b(stage2_Q[195]), .cin(stage2_Q[196]), .sum(w_257), .carry(w_258));
    wire w_259, w_260;
    full_adder FA118 (.a(stage2_Q[197]), .b(stage2_Q[198]), .cin(stage2_Q[199]), .sum(w_259), .carry(w_260));
    wire w_261, w_262;
    full_adder FA119 (.a(stage2_Q[200]), .b(stage2_Q[201]), .cin(stage2_Q[202]), .sum(w_261), .carry(w_262));
    wire w_263, w_264;
    full_adder FA120 (.a(stage2_Q[204]), .b(stage2_Q[205]), .cin(stage2_Q[206]), .sum(w_263), .carry(w_264));

    // ========================================================
    // Stage 4
    // ========================================================
    wire w_265, w_266;
    half_adder HA11 (.a(stage2_Q[9]), .b(stage2_Q[10]), .sum(w_265), .carry(w_266));
    wire w_267, w_268;
    full_adder FA121 (.a(stage2_Q[14]), .b(stage2_Q[15]), .cin(stage2_Q[16]), .sum(w_267), .carry(w_268));
    wire w_269, w_270;
    half_adder HA12 (.a(stage2_Q[17]), .b(stage2_Q[18]), .sum(w_269), .carry(w_270));
    wire w_271, w_272;
    full_adder FA122 (.a(w_145), .b(stage2_Q[22]), .cin(stage2_Q[23]), .sum(w_271), .carry(w_272));
    wire w_273, w_274;
    full_adder FA123 (.a(stage2_Q[24]), .b(stage2_Q[25]), .cin(stage2_Q[26]), .sum(w_273), .carry(w_274));
    wire w_275, w_276;
    full_adder FA124 (.a(w_146), .b(w_147), .cin(w_149), .sum(w_275), .carry(w_276));
    wire w_277, w_278;
    full_adder FA125 (.a(stage2_Q[32]), .b(stage2_Q[33]), .cin(stage2_Q[34]), .sum(w_277), .carry(w_278));
    wire w_279, w_280;
    full_adder FA126 (.a(w_148), .b(w_150), .cin(w_151), .sum(w_279), .carry(w_280));
    wire w_281, w_282;
    full_adder FA127 (.a(w_153), .b(w_155), .cin(stage2_Q[43]), .sum(w_281), .carry(w_282));
    wire w_283, w_284;
    full_adder FA128 (.a(w_152), .b(w_154), .cin(w_156), .sum(w_283), .carry(w_284));
    wire w_285, w_286;
    full_adder FA129 (.a(w_157), .b(w_159), .cin(w_161), .sum(w_285), .carry(w_286));
    wire w_287, w_288;
    full_adder FA130 (.a(w_158), .b(w_160), .cin(w_162), .sum(w_287), .carry(w_288));
    wire w_289, w_290;
    full_adder FA131 (.a(w_163), .b(w_165), .cin(w_167), .sum(w_289), .carry(w_290));
    wire w_291, w_292;
    full_adder FA132 (.a(w_164), .b(w_166), .cin(w_168), .sum(w_291), .carry(w_292));
    wire w_293, w_294;
    full_adder FA133 (.a(w_169), .b(w_171), .cin(w_173), .sum(w_293), .carry(w_294));
    wire w_295, w_296;
    full_adder FA134 (.a(w_170), .b(w_172), .cin(w_174), .sum(w_295), .carry(w_296));
    wire w_297, w_298;
    full_adder FA135 (.a(w_175), .b(w_177), .cin(w_179), .sum(w_297), .carry(w_298));
    wire w_299, w_300;
    full_adder FA136 (.a(w_176), .b(w_178), .cin(w_180), .sum(w_299), .carry(w_300));
    wire w_301, w_302;
    full_adder FA137 (.a(w_181), .b(w_183), .cin(w_185), .sum(w_301), .carry(w_302));
    wire w_303, w_304;
    full_adder FA138 (.a(w_182), .b(w_184), .cin(w_186), .sum(w_303), .carry(w_304));
    wire w_305, w_306;
    full_adder FA139 (.a(w_187), .b(w_189), .cin(w_191), .sum(w_305), .carry(w_306));
    wire w_307, w_308;
    full_adder FA140 (.a(w_188), .b(w_190), .cin(w_192), .sum(w_307), .carry(w_308));
    wire w_309, w_310;
    full_adder FA141 (.a(w_193), .b(w_195), .cin(w_197), .sum(w_309), .carry(w_310));
    wire w_311, w_312;
    full_adder FA142 (.a(w_194), .b(w_196), .cin(w_198), .sum(w_311), .carry(w_312));
    wire w_313, w_314;
    full_adder FA143 (.a(w_199), .b(w_201), .cin(w_203), .sum(w_313), .carry(w_314));
    wire w_315, w_316;
    full_adder FA144 (.a(w_200), .b(w_202), .cin(w_204), .sum(w_315), .carry(w_316));
    wire w_317, w_318;
    full_adder FA145 (.a(w_205), .b(w_207), .cin(w_209), .sum(w_317), .carry(w_318));
    wire w_319, w_320;
    full_adder FA146 (.a(w_206), .b(w_208), .cin(w_210), .sum(w_319), .carry(w_320));
    wire w_321, w_322;
    full_adder FA147 (.a(w_211), .b(w_213), .cin(w_215), .sum(w_321), .carry(w_322));
    wire w_323, w_324;
    full_adder FA148 (.a(w_212), .b(w_214), .cin(w_216), .sum(w_323), .carry(w_324));
    wire w_325, w_326;
    full_adder FA149 (.a(w_217), .b(w_219), .cin(w_221), .sum(w_325), .carry(w_326));
    wire w_327, w_328;
    full_adder FA150 (.a(w_218), .b(w_220), .cin(w_222), .sum(w_327), .carry(w_328));
    wire w_329, w_330;
    full_adder FA151 (.a(w_223), .b(w_225), .cin(w_227), .sum(w_329), .carry(w_330));
    wire w_331, w_332;
    full_adder FA152 (.a(w_224), .b(w_226), .cin(w_228), .sum(w_331), .carry(w_332));
    wire w_333, w_334;
    full_adder FA153 (.a(w_229), .b(w_231), .cin(w_233), .sum(w_333), .carry(w_334));
    wire w_335, w_336;
    full_adder FA154 (.a(w_230), .b(w_232), .cin(w_234), .sum(w_335), .carry(w_336));
    wire w_337, w_338;
    full_adder FA155 (.a(w_235), .b(w_237), .cin(w_239), .sum(w_337), .carry(w_338));
    wire w_339, w_340;
    full_adder FA156 (.a(w_236), .b(w_238), .cin(w_240), .sum(w_339), .carry(w_340));
    wire w_341, w_342;
    full_adder FA157 (.a(w_241), .b(w_243), .cin(w_245), .sum(w_341), .carry(w_342));
    wire w_343, w_344;
    full_adder FA158 (.a(w_242), .b(w_244), .cin(w_246), .sum(w_343), .carry(w_344));
    wire w_345, w_346;
    full_adder FA159 (.a(w_247), .b(w_249), .cin(w_251), .sum(w_345), .carry(w_346));
    wire w_347, w_348;
    full_adder FA160 (.a(w_248), .b(w_250), .cin(w_252), .sum(w_347), .carry(w_348));
    wire w_349, w_350;
    full_adder FA161 (.a(w_253), .b(w_255), .cin(w_257), .sum(w_349), .carry(w_350));
    wire w_351, w_352;
    full_adder FA162 (.a(w_254), .b(w_256), .cin(w_258), .sum(w_351), .carry(w_352));
    wire w_353, w_354;
    full_adder FA163 (.a(w_259), .b(w_261), .cin(stage2_Q[203]), .sum(w_353), .carry(w_354));
    wire w_355, w_356;
    full_adder FA164 (.a(w_260), .b(w_262), .cin(w_263), .sum(w_355), .carry(w_356));
    wire w_357, w_358;
    full_adder FA165 (.a(stage2_Q[207]), .b(stage2_Q[208]), .cin(stage2_Q[209]), .sum(w_357), .carry(w_358));
    wire w_359, w_360;
    full_adder FA166 (.a(w_264), .b(stage2_Q[210]), .cin(stage2_Q[211]), .sum(w_359), .carry(w_360));
    wire w_361, w_362;
    full_adder FA167 (.a(stage2_Q[212]), .b(stage2_Q[213]), .cin(stage2_Q[214]), .sum(w_361), .carry(w_362));
    wire w_363, w_364;
    full_adder FA168 (.a(stage2_Q[215]), .b(stage2_Q[216]), .cin(stage2_Q[217]), .sum(w_363), .carry(w_364));

    // Pipeline Register Bank: Post-Stage 4 Layer
    wire [119:0] stage4_D;
    wire [119:0] stage4_Q;
    assign stage4_D = {stage2_Q[224], stage2_Q[223], stage2_Q[222], stage2_Q[221], stage2_Q[220], stage2_Q[219], w_364, stage2_Q[218], w_363, w_362, w_360, w_361, w_359, w_358, w_356, w_357, w_355, w_354, w_352, w_353, w_351, w_350, w_348, w_349, w_347, w_346, w_344, w_345, w_343, w_342, w_340, w_341, w_339, w_338, w_336, w_337, w_335, w_334, w_332, w_333, w_331, w_330, w_328, w_329, w_327, w_326, w_324, w_325, w_323, w_322, w_320, w_321, w_319, w_318, w_316, w_317, w_315, w_314, w_312, w_313, w_311, w_310, w_308, w_309, w_307, w_306, w_304, w_305, w_303, w_302, w_300, w_301, w_299, w_298, w_296, w_297, w_295, w_294, w_292, w_293, w_291, w_290, w_288, w_289, w_287, w_286, w_284, w_285, w_283, w_282, w_280, w_281, w_279, w_278, w_276, w_277, w_275, w_274, w_272, w_273, w_271, w_270, w_268, stage2_Q[19], w_269, w_267, w_266, stage2_Q[13], stage2_Q[12], stage2_Q[11], w_265, stage2_Q[8], stage2_Q[7], stage2_Q[6], stage2_Q[5], stage2_Q[4], stage2_Q[3], stage2_Q[2], stage2_Q[1], stage2_Q[0]};
    register_bank #(.WIDTH(120)) reg_stage_4 (
        .clk(clk), .rst(rst), .en(en), .D(stage4_D), .Q(stage4_Q)
    );

    // ========================================================
    // Stage 5
    // ========================================================
    wire w_365, w_366;
    half_adder HA13 (.a(stage4_Q[5]), .b(stage4_Q[6]), .sum(w_365), .carry(w_366));
    wire w_367, w_368;
    full_adder FA169 (.a(stage4_Q[9]), .b(stage4_Q[10]), .cin(stage4_Q[11]), .sum(w_367), .carry(w_368));
    wire w_369, w_370;
    full_adder FA170 (.a(stage4_Q[13]), .b(stage4_Q[14]), .cin(stage4_Q[15]), .sum(w_369), .carry(w_370));
    wire w_371, w_372;
    full_adder FA171 (.a(stage4_Q[17]), .b(stage4_Q[18]), .cin(stage4_Q[19]), .sum(w_371), .carry(w_372));
    wire w_373, w_374;
    full_adder FA172 (.a(stage4_Q[21]), .b(stage4_Q[22]), .cin(stage4_Q[23]), .sum(w_373), .carry(w_374));
    wire w_375, w_376;
    full_adder FA173 (.a(stage4_Q[25]), .b(stage4_Q[26]), .cin(stage4_Q[27]), .sum(w_375), .carry(w_376));
    wire w_377, w_378;
    full_adder FA174 (.a(stage4_Q[29]), .b(stage4_Q[30]), .cin(stage4_Q[31]), .sum(w_377), .carry(w_378));
    wire w_379, w_380;
    full_adder FA175 (.a(stage4_Q[33]), .b(stage4_Q[34]), .cin(stage4_Q[35]), .sum(w_379), .carry(w_380));
    wire w_381, w_382;
    full_adder FA176 (.a(stage4_Q[37]), .b(stage4_Q[38]), .cin(stage4_Q[39]), .sum(w_381), .carry(w_382));
    wire w_383, w_384;
    full_adder FA177 (.a(stage4_Q[41]), .b(stage4_Q[42]), .cin(stage4_Q[43]), .sum(w_383), .carry(w_384));
    wire w_385, w_386;
    full_adder FA178 (.a(stage4_Q[45]), .b(stage4_Q[46]), .cin(stage4_Q[47]), .sum(w_385), .carry(w_386));
    wire w_387, w_388;
    full_adder FA179 (.a(stage4_Q[49]), .b(stage4_Q[50]), .cin(stage4_Q[51]), .sum(w_387), .carry(w_388));
    wire w_389, w_390;
    full_adder FA180 (.a(stage4_Q[53]), .b(stage4_Q[54]), .cin(stage4_Q[55]), .sum(w_389), .carry(w_390));
    wire w_391, w_392;
    full_adder FA181 (.a(stage4_Q[57]), .b(stage4_Q[58]), .cin(stage4_Q[59]), .sum(w_391), .carry(w_392));
    wire w_393, w_394;
    full_adder FA182 (.a(stage4_Q[61]), .b(stage4_Q[62]), .cin(stage4_Q[63]), .sum(w_393), .carry(w_394));
    wire w_395, w_396;
    full_adder FA183 (.a(stage4_Q[65]), .b(stage4_Q[66]), .cin(stage4_Q[67]), .sum(w_395), .carry(w_396));
    wire w_397, w_398;
    full_adder FA184 (.a(stage4_Q[69]), .b(stage4_Q[70]), .cin(stage4_Q[71]), .sum(w_397), .carry(w_398));
    wire w_399, w_400;
    full_adder FA185 (.a(stage4_Q[73]), .b(stage4_Q[74]), .cin(stage4_Q[75]), .sum(w_399), .carry(w_400));
    wire w_401, w_402;
    full_adder FA186 (.a(stage4_Q[77]), .b(stage4_Q[78]), .cin(stage4_Q[79]), .sum(w_401), .carry(w_402));
    wire w_403, w_404;
    full_adder FA187 (.a(stage4_Q[81]), .b(stage4_Q[82]), .cin(stage4_Q[83]), .sum(w_403), .carry(w_404));
    wire w_405, w_406;
    full_adder FA188 (.a(stage4_Q[85]), .b(stage4_Q[86]), .cin(stage4_Q[87]), .sum(w_405), .carry(w_406));
    wire w_407, w_408;
    full_adder FA189 (.a(stage4_Q[89]), .b(stage4_Q[90]), .cin(stage4_Q[91]), .sum(w_407), .carry(w_408));
    wire w_409, w_410;
    full_adder FA190 (.a(stage4_Q[93]), .b(stage4_Q[94]), .cin(stage4_Q[95]), .sum(w_409), .carry(w_410));
    wire w_411, w_412;
    full_adder FA191 (.a(stage4_Q[97]), .b(stage4_Q[98]), .cin(stage4_Q[99]), .sum(w_411), .carry(w_412));
    wire w_413, w_414;
    full_adder FA192 (.a(stage4_Q[101]), .b(stage4_Q[102]), .cin(stage4_Q[103]), .sum(w_413), .carry(w_414));
    wire w_415, w_416;
    full_adder FA193 (.a(stage4_Q[105]), .b(stage4_Q[106]), .cin(stage4_Q[107]), .sum(w_415), .carry(w_416));
    wire w_417, w_418;
    full_adder FA194 (.a(stage4_Q[109]), .b(stage4_Q[110]), .cin(stage4_Q[111]), .sum(w_417), .carry(w_418));
    wire w_419, w_420;
    full_adder FA195 (.a(stage4_Q[113]), .b(stage4_Q[114]), .cin(stage4_Q[115]), .sum(w_419), .carry(w_420));

    // ========================================================
    // Stage 6
    // ========================================================
    wire w_421, w_422;
    half_adder HA14 (.a(stage4_Q[2]), .b(stage4_Q[3]), .sum(w_421), .carry(w_422));
    wire w_423, w_424;
    full_adder FA196 (.a(w_365), .b(stage4_Q[7]), .cin(stage4_Q[8]), .sum(w_423), .carry(w_424));
    wire w_425, w_426;
    full_adder FA197 (.a(w_366), .b(w_367), .cin(stage4_Q[12]), .sum(w_425), .carry(w_426));
    wire w_427, w_428;
    full_adder FA198 (.a(w_368), .b(w_369), .cin(stage4_Q[16]), .sum(w_427), .carry(w_428));
    wire w_429, w_430;
    full_adder FA199 (.a(w_370), .b(w_371), .cin(stage4_Q[20]), .sum(w_429), .carry(w_430));
    wire w_431, w_432;
    full_adder FA200 (.a(w_372), .b(w_373), .cin(stage4_Q[24]), .sum(w_431), .carry(w_432));
    wire w_433, w_434;
    full_adder FA201 (.a(w_374), .b(w_375), .cin(stage4_Q[28]), .sum(w_433), .carry(w_434));
    wire w_435, w_436;
    full_adder FA202 (.a(w_376), .b(w_377), .cin(stage4_Q[32]), .sum(w_435), .carry(w_436));
    wire w_437, w_438;
    full_adder FA203 (.a(w_378), .b(w_379), .cin(stage4_Q[36]), .sum(w_437), .carry(w_438));
    wire w_439, w_440;
    full_adder FA204 (.a(w_380), .b(w_381), .cin(stage4_Q[40]), .sum(w_439), .carry(w_440));
    wire w_441, w_442;
    full_adder FA205 (.a(w_382), .b(w_383), .cin(stage4_Q[44]), .sum(w_441), .carry(w_442));
    wire w_443, w_444;
    full_adder FA206 (.a(w_384), .b(w_385), .cin(stage4_Q[48]), .sum(w_443), .carry(w_444));
    wire w_445, w_446;
    full_adder FA207 (.a(w_386), .b(w_387), .cin(stage4_Q[52]), .sum(w_445), .carry(w_446));
    wire w_447, w_448;
    full_adder FA208 (.a(w_388), .b(w_389), .cin(stage4_Q[56]), .sum(w_447), .carry(w_448));
    wire w_449, w_450;
    full_adder FA209 (.a(w_390), .b(w_391), .cin(stage4_Q[60]), .sum(w_449), .carry(w_450));
    wire w_451, w_452;
    full_adder FA210 (.a(w_392), .b(w_393), .cin(stage4_Q[64]), .sum(w_451), .carry(w_452));
    wire w_453, w_454;
    full_adder FA211 (.a(w_394), .b(w_395), .cin(stage4_Q[68]), .sum(w_453), .carry(w_454));
    wire w_455, w_456;
    full_adder FA212 (.a(w_396), .b(w_397), .cin(stage4_Q[72]), .sum(w_455), .carry(w_456));
    wire w_457, w_458;
    full_adder FA213 (.a(w_398), .b(w_399), .cin(stage4_Q[76]), .sum(w_457), .carry(w_458));
    wire w_459, w_460;
    full_adder FA214 (.a(w_400), .b(w_401), .cin(stage4_Q[80]), .sum(w_459), .carry(w_460));
    wire w_461, w_462;
    full_adder FA215 (.a(w_402), .b(w_403), .cin(stage4_Q[84]), .sum(w_461), .carry(w_462));
    wire w_463, w_464;
    full_adder FA216 (.a(w_404), .b(w_405), .cin(stage4_Q[88]), .sum(w_463), .carry(w_464));
    wire w_465, w_466;
    full_adder FA217 (.a(w_406), .b(w_407), .cin(stage4_Q[92]), .sum(w_465), .carry(w_466));
    wire w_467, w_468;
    full_adder FA218 (.a(w_408), .b(w_409), .cin(stage4_Q[96]), .sum(w_467), .carry(w_468));
    wire w_469, w_470;
    full_adder FA219 (.a(w_410), .b(w_411), .cin(stage4_Q[100]), .sum(w_469), .carry(w_470));
    wire w_471, w_472;
    full_adder FA220 (.a(w_412), .b(w_413), .cin(stage4_Q[104]), .sum(w_471), .carry(w_472));
    wire w_473, w_474;
    full_adder FA221 (.a(w_414), .b(w_415), .cin(stage4_Q[108]), .sum(w_473), .carry(w_474));
    wire w_475, w_476;
    full_adder FA222 (.a(w_416), .b(w_417), .cin(stage4_Q[112]), .sum(w_475), .carry(w_476));
    wire w_477, w_478;
    full_adder FA223 (.a(w_418), .b(w_419), .cin(stage4_Q[116]), .sum(w_477), .carry(w_478));
    wire w_479, w_480;
    full_adder FA224 (.a(w_420), .b(stage4_Q[117]), .cin(stage4_Q[118]), .sum(w_479), .carry(w_480));

    // Pipeline Register Bank: Post-Stage 6 Layer
    wire [63:0] stage6_D;
    wire [63:0] stage6_Q;
    assign stage6_D = {stage4_Q[119], w_480, w_479, w_478, w_477, w_476, w_475, w_474, w_473, w_472, w_471, w_470, w_469, w_468, w_467, w_466, w_465, w_464, w_463, w_462, w_461, w_460, w_459, w_458, w_457, w_456, w_455, w_454, w_453, w_452, w_451, w_450, w_449, w_448, w_447, w_446, w_445, w_444, w_443, w_442, w_441, w_440, w_439, w_438, w_437, w_436, w_435, w_434, w_433, w_432, w_431, w_430, w_429, w_428, w_427, w_426, w_425, w_424, w_423, w_422, stage4_Q[4], w_421, stage4_Q[1], stage4_Q[0]};
    register_bank #(.WIDTH(64)) reg_stage_6 (
        .clk(clk), .rst(rst), .en(en), .D(stage6_D), .Q(stage6_Q)
    );

    // ========================================================
    // Vector Preparation for Final Addition
    // ========================================================
    wire [31:0] adder_vec_A_raw = {stage6_Q[62], stage6_Q[60], stage6_Q[58], stage6_Q[56], stage6_Q[54], stage6_Q[52], stage6_Q[50], stage6_Q[48], stage6_Q[46], stage6_Q[44], stage6_Q[42], stage6_Q[40], stage6_Q[38], stage6_Q[36], stage6_Q[34], stage6_Q[32], stage6_Q[30], stage6_Q[28], stage6_Q[26], stage6_Q[24], stage6_Q[22], stage6_Q[20], stage6_Q[18], stage6_Q[16], stage6_Q[14], stage6_Q[12], stage6_Q[10], stage6_Q[8], stage6_Q[6], stage6_Q[4], stage6_Q[2], stage6_Q[0]};
    wire [31:0] adder_vec_B_raw = {stage6_Q[63], stage6_Q[61], stage6_Q[59], stage6_Q[57], stage6_Q[55], stage6_Q[53], stage6_Q[51], stage6_Q[49], stage6_Q[47], stage6_Q[45], stage6_Q[43], stage6_Q[41], stage6_Q[39], stage6_Q[37], stage6_Q[35], stage6_Q[33], stage6_Q[31], stage6_Q[29], stage6_Q[27], stage6_Q[25], stage6_Q[23], stage6_Q[21], stage6_Q[19], stage6_Q[17], stage6_Q[15], stage6_Q[13], stage6_Q[11], stage6_Q[9], stage6_Q[7], stage6_Q[5], stage6_Q[3], stage6_Q[1]};

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
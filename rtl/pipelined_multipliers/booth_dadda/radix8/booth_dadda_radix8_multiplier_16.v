// =======================================================================
// Dynamically Generated Pipelined Booth Dadda (Radix - 4) Multiplier
// Configuration: N = 16
// =======================================================================

module booth_dadda_radix8_multiplier_16 #(
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
    half_adder HA0 (.a(raw_pp[15]), .b(raw_pp[30]), .sum(w_1), .carry(w_2));
    wire w_3, w_4;
    half_adder HA1 (.a(raw_pp[16]), .b(raw_pp[31]), .sum(w_3), .carry(w_4));
    wire w_5, w_6;
    half_adder HA2 (.a(raw_pp[17]), .b(raw_pp[32]), .sum(w_5), .carry(w_6));
    wire w_7, w_8;
    half_adder HA3 (.a(raw_pp_corr[0]), .b(raw_pp[33]), .sum(w_7), .carry(w_8));
    wire w_9, w_10;
    half_adder HA4 (.a(raw_pp_corr[1]), .b(raw_pp[34]), .sum(w_9), .carry(w_10));
    wire w_11, w_12;
    half_adder HA5 (.a(raw_pp_corr[2]), .b(raw_pp[35]), .sum(w_11), .carry(w_12));
    wire w_13, w_14;
    half_adder HA6 (.a(raw_pp_corr[3]), .b(raw_pp_corr[4]), .sum(w_13), .carry(w_14));

    // ========================================================
    // Stage 2
    // ========================================================
    wire w_15, w_16;
    half_adder HA7 (.a(raw_pp[9]), .b(raw_pp[24]), .sum(w_15), .carry(w_16));
    wire w_17, w_18;
    half_adder HA8 (.a(raw_pp[10]), .b(raw_pp[25]), .sum(w_17), .carry(w_18));
    wire w_19, w_20;
    half_adder HA9 (.a(raw_pp[11]), .b(raw_pp[26]), .sum(w_19), .carry(w_20));
    wire w_21, w_22;
    full_adder FA0 (.a(raw_pp[12]), .b(raw_pp[27]), .cin(raw_pp[42]), .sum(w_21), .carry(w_22));
    wire w_23, w_24;
    half_adder HA10 (.a(raw_pp[57]), .b(raw_pp[72]), .sum(w_23), .carry(w_24));
    wire w_25, w_26;
    full_adder FA1 (.a(raw_pp[13]), .b(raw_pp[28]), .cin(raw_pp[43]), .sum(w_25), .carry(w_26));
    wire w_27, w_28;
    half_adder HA11 (.a(raw_pp[58]), .b(raw_pp[73]), .sum(w_27), .carry(w_28));
    wire w_29, w_30;
    full_adder FA2 (.a(raw_pp[14]), .b(raw_pp[29]), .cin(raw_pp[44]), .sum(w_29), .carry(w_30));
    wire w_31, w_32;
    half_adder HA12 (.a(raw_pp[59]), .b(raw_pp[74]), .sum(w_31), .carry(w_32));
    wire w_33, w_34;
    full_adder FA3 (.a(w_1), .b(raw_pp[45]), .cin(raw_pp[60]), .sum(w_33), .carry(w_34));
    wire w_35, w_36;
    full_adder FA4 (.a(raw_pp[75]), .b(raw_pp[90]), .cin(raw_pp_cin[5]), .sum(w_35), .carry(w_36));
    wire w_37, w_38;
    full_adder FA5 (.a(w_2), .b(w_3), .cin(raw_pp[46]), .sum(w_37), .carry(w_38));
    wire w_39, w_40;
    full_adder FA6 (.a(raw_pp[61]), .b(raw_pp[76]), .cin(raw_pp[91]), .sum(w_39), .carry(w_40));
    wire w_41, w_42;
    full_adder FA7 (.a(w_4), .b(w_5), .cin(raw_pp[47]), .sum(w_41), .carry(w_42));
    wire w_43, w_44;
    full_adder FA8 (.a(raw_pp[62]), .b(raw_pp[77]), .cin(raw_pp[92]), .sum(w_43), .carry(w_44));
    wire w_45, w_46;
    full_adder FA9 (.a(w_6), .b(w_7), .cin(raw_pp[48]), .sum(w_45), .carry(w_46));
    wire w_47, w_48;
    full_adder FA10 (.a(raw_pp[63]), .b(raw_pp[78]), .cin(raw_pp[93]), .sum(w_47), .carry(w_48));
    wire w_49, w_50;
    full_adder FA11 (.a(w_8), .b(w_9), .cin(raw_pp[49]), .sum(w_49), .carry(w_50));
    wire w_51, w_52;
    full_adder FA12 (.a(raw_pp[64]), .b(raw_pp[79]), .cin(raw_pp[94]), .sum(w_51), .carry(w_52));
    wire w_53, w_54;
    full_adder FA13 (.a(w_10), .b(w_11), .cin(raw_pp[50]), .sum(w_53), .carry(w_54));
    wire w_55, w_56;
    full_adder FA14 (.a(raw_pp[65]), .b(raw_pp[80]), .cin(raw_pp[95]), .sum(w_55), .carry(w_56));
    wire w_57, w_58;
    full_adder FA15 (.a(w_12), .b(w_13), .cin(raw_pp[51]), .sum(w_57), .carry(w_58));
    wire w_59, w_60;
    full_adder FA16 (.a(raw_pp[66]), .b(raw_pp[81]), .cin(raw_pp[96]), .sum(w_59), .carry(w_60));
    wire w_61, w_62;
    full_adder FA17 (.a(w_14), .b(raw_pp_corr[5]), .cin(raw_pp[52]), .sum(w_61), .carry(w_62));
    wire w_63, w_64;
    full_adder FA18 (.a(raw_pp[67]), .b(raw_pp[82]), .cin(raw_pp[97]), .sum(w_63), .carry(w_64));
    wire w_65, w_66;
    full_adder FA19 (.a(raw_pp_corr[6]), .b(raw_pp[53]), .cin(raw_pp[68]), .sum(w_65), .carry(w_66));
    wire w_67, w_68;
    half_adder HA13 (.a(raw_pp[83]), .b(raw_pp[98]), .sum(w_67), .carry(w_68));
    wire w_69, w_70;
    full_adder FA20 (.a(raw_pp_corr[7]), .b(raw_pp[69]), .cin(raw_pp[84]), .sum(w_69), .carry(w_70));
    wire w_71, w_72;
    half_adder HA14 (.a(raw_pp_corr[8]), .b(raw_pp[70]), .sum(w_71), .carry(w_72));
    wire w_73, w_74;
    half_adder HA15 (.a(raw_pp_corr[9]), .b(raw_pp[71]), .sum(w_73), .carry(w_74));

    // Pipeline Register Bank: Post-Stage 2 Layer
    wire [106:0] stage2_D;
    wire [106:0] stage2_Q;
    assign stage2_D = {raw_pp[106], raw_pp_corr[14], raw_pp[105], raw_pp_corr[13], raw_pp[104], raw_pp[89], raw_pp_corr[12], raw_pp[103], raw_pp[88], raw_pp_corr[11], raw_pp[102], raw_pp[87], raw_pp_corr[10], w_74, raw_pp[101], raw_pp[86], w_73, w_72, raw_pp[100], raw_pp[85], w_71, w_70, raw_pp[99], w_69, w_68, w_66, w_67, w_65, w_64, w_62, w_63, w_61, w_60, w_58, w_59, w_57, w_56, w_54, w_55, w_53, w_52, w_50, w_51, w_49, w_48, w_46, w_47, w_45, w_44, w_42, w_43, w_41, w_40, w_38, w_39, w_37, w_36, w_34, w_35, w_33, w_32, w_30, w_31, w_29, w_28, w_26, w_27, w_25, w_24, w_22, raw_pp_cin[4], w_23, w_21, w_20, raw_pp[56], raw_pp[41], w_19, w_18, raw_pp[55], raw_pp[40], w_17, w_16, raw_pp_cin[3], raw_pp[54], raw_pp[39], w_15, raw_pp[38], raw_pp[23], raw_pp[8], raw_pp[37], raw_pp[22], raw_pp[7], raw_pp_cin[2], raw_pp[36], raw_pp[21], raw_pp[6], raw_pp[20], raw_pp[5], raw_pp[19], raw_pp[4], raw_pp_cin[1], raw_pp[18], raw_pp[3], raw_pp[2], raw_pp[1], raw_pp_cin[0], raw_pp[0]};
    register_bank #(.WIDTH(107)) reg_stage_2 (
        .clk(clk), .rst(rst), .en(en), .D(stage2_D), .Q(stage2_Q)
    );

    // ========================================================
    // Stage 3
    // ========================================================
    wire w_75, w_76;
    half_adder HA16 (.a(stage2_Q[11]), .b(stage2_Q[12]), .sum(w_75), .carry(w_76));
    wire w_77, w_78;
    half_adder HA17 (.a(stage2_Q[15]), .b(stage2_Q[16]), .sum(w_77), .carry(w_78));
    wire w_79, w_80;
    half_adder HA18 (.a(stage2_Q[18]), .b(stage2_Q[19]), .sum(w_79), .carry(w_80));
    wire w_81, w_82;
    full_adder FA21 (.a(stage2_Q[21]), .b(stage2_Q[22]), .cin(stage2_Q[23]), .sum(w_81), .carry(w_82));
    wire w_83, w_84;
    full_adder FA22 (.a(stage2_Q[25]), .b(stage2_Q[26]), .cin(stage2_Q[27]), .sum(w_83), .carry(w_84));
    wire w_85, w_86;
    full_adder FA23 (.a(stage2_Q[29]), .b(stage2_Q[30]), .cin(stage2_Q[31]), .sum(w_85), .carry(w_86));
    wire w_87, w_88;
    full_adder FA24 (.a(stage2_Q[33]), .b(stage2_Q[34]), .cin(stage2_Q[35]), .sum(w_87), .carry(w_88));
    wire w_89, w_90;
    full_adder FA25 (.a(stage2_Q[37]), .b(stage2_Q[38]), .cin(stage2_Q[39]), .sum(w_89), .carry(w_90));
    wire w_91, w_92;
    full_adder FA26 (.a(stage2_Q[41]), .b(stage2_Q[42]), .cin(stage2_Q[43]), .sum(w_91), .carry(w_92));
    wire w_93, w_94;
    full_adder FA27 (.a(stage2_Q[45]), .b(stage2_Q[46]), .cin(stage2_Q[47]), .sum(w_93), .carry(w_94));
    wire w_95, w_96;
    full_adder FA28 (.a(stage2_Q[49]), .b(stage2_Q[50]), .cin(stage2_Q[51]), .sum(w_95), .carry(w_96));
    wire w_97, w_98;
    full_adder FA29 (.a(stage2_Q[53]), .b(stage2_Q[54]), .cin(stage2_Q[55]), .sum(w_97), .carry(w_98));
    wire w_99, w_100;
    full_adder FA30 (.a(stage2_Q[57]), .b(stage2_Q[58]), .cin(stage2_Q[59]), .sum(w_99), .carry(w_100));
    wire w_101, w_102;
    full_adder FA31 (.a(stage2_Q[61]), .b(stage2_Q[62]), .cin(stage2_Q[63]), .sum(w_101), .carry(w_102));
    wire w_103, w_104;
    full_adder FA32 (.a(stage2_Q[65]), .b(stage2_Q[66]), .cin(stage2_Q[67]), .sum(w_103), .carry(w_104));
    wire w_105, w_106;
    full_adder FA33 (.a(stage2_Q[69]), .b(stage2_Q[70]), .cin(stage2_Q[71]), .sum(w_105), .carry(w_106));
    wire w_107, w_108;
    full_adder FA34 (.a(stage2_Q[73]), .b(stage2_Q[74]), .cin(stage2_Q[75]), .sum(w_107), .carry(w_108));
    wire w_109, w_110;
    full_adder FA35 (.a(stage2_Q[77]), .b(stage2_Q[78]), .cin(stage2_Q[79]), .sum(w_109), .carry(w_110));
    wire w_111, w_112;
    full_adder FA36 (.a(stage2_Q[81]), .b(stage2_Q[82]), .cin(stage2_Q[83]), .sum(w_111), .carry(w_112));
    wire w_113, w_114;
    full_adder FA37 (.a(stage2_Q[85]), .b(stage2_Q[86]), .cin(stage2_Q[87]), .sum(w_113), .carry(w_114));
    wire w_115, w_116;
    full_adder FA38 (.a(stage2_Q[89]), .b(stage2_Q[90]), .cin(stage2_Q[91]), .sum(w_115), .carry(w_116));
    wire w_117, w_118;
    full_adder FA39 (.a(stage2_Q[93]), .b(stage2_Q[94]), .cin(stage2_Q[95]), .sum(w_117), .carry(w_118));
    wire w_119, w_120;
    half_adder HA19 (.a(stage2_Q[97]), .b(stage2_Q[98]), .sum(w_119), .carry(w_120));
    wire w_121, w_122;
    half_adder HA20 (.a(stage2_Q[100]), .b(stage2_Q[101]), .sum(w_121), .carry(w_122));

    // ========================================================
    // Stage 4
    // ========================================================
    wire w_123, w_124;
    half_adder HA21 (.a(stage2_Q[4]), .b(stage2_Q[5]), .sum(w_123), .carry(w_124));
    wire w_125, w_126;
    half_adder HA22 (.a(stage2_Q[7]), .b(stage2_Q[8]), .sum(w_125), .carry(w_126));
    wire w_127, w_128;
    half_adder HA23 (.a(stage2_Q[9]), .b(stage2_Q[10]), .sum(w_127), .carry(w_128));
    wire w_129, w_130;
    full_adder FA40 (.a(w_75), .b(stage2_Q[13]), .cin(stage2_Q[14]), .sum(w_129), .carry(w_130));
    wire w_131, w_132;
    full_adder FA41 (.a(w_76), .b(w_77), .cin(stage2_Q[17]), .sum(w_131), .carry(w_132));
    wire w_133, w_134;
    full_adder FA42 (.a(w_78), .b(w_79), .cin(stage2_Q[20]), .sum(w_133), .carry(w_134));
    wire w_135, w_136;
    full_adder FA43 (.a(w_80), .b(w_81), .cin(stage2_Q[24]), .sum(w_135), .carry(w_136));
    wire w_137, w_138;
    full_adder FA44 (.a(w_82), .b(w_83), .cin(stage2_Q[28]), .sum(w_137), .carry(w_138));
    wire w_139, w_140;
    full_adder FA45 (.a(w_84), .b(w_85), .cin(stage2_Q[32]), .sum(w_139), .carry(w_140));
    wire w_141, w_142;
    full_adder FA46 (.a(w_86), .b(w_87), .cin(stage2_Q[36]), .sum(w_141), .carry(w_142));
    wire w_143, w_144;
    full_adder FA47 (.a(w_88), .b(w_89), .cin(stage2_Q[40]), .sum(w_143), .carry(w_144));
    wire w_145, w_146;
    full_adder FA48 (.a(w_90), .b(w_91), .cin(stage2_Q[44]), .sum(w_145), .carry(w_146));
    wire w_147, w_148;
    full_adder FA49 (.a(w_92), .b(w_93), .cin(stage2_Q[48]), .sum(w_147), .carry(w_148));
    wire w_149, w_150;
    full_adder FA50 (.a(w_94), .b(w_95), .cin(stage2_Q[52]), .sum(w_149), .carry(w_150));
    wire w_151, w_152;
    full_adder FA51 (.a(w_96), .b(w_97), .cin(stage2_Q[56]), .sum(w_151), .carry(w_152));
    wire w_153, w_154;
    full_adder FA52 (.a(w_98), .b(w_99), .cin(stage2_Q[60]), .sum(w_153), .carry(w_154));
    wire w_155, w_156;
    full_adder FA53 (.a(w_100), .b(w_101), .cin(stage2_Q[64]), .sum(w_155), .carry(w_156));
    wire w_157, w_158;
    full_adder FA54 (.a(w_102), .b(w_103), .cin(stage2_Q[68]), .sum(w_157), .carry(w_158));
    wire w_159, w_160;
    full_adder FA55 (.a(w_104), .b(w_105), .cin(stage2_Q[72]), .sum(w_159), .carry(w_160));
    wire w_161, w_162;
    full_adder FA56 (.a(w_106), .b(w_107), .cin(stage2_Q[76]), .sum(w_161), .carry(w_162));
    wire w_163, w_164;
    full_adder FA57 (.a(w_108), .b(w_109), .cin(stage2_Q[80]), .sum(w_163), .carry(w_164));
    wire w_165, w_166;
    full_adder FA58 (.a(w_110), .b(w_111), .cin(stage2_Q[84]), .sum(w_165), .carry(w_166));
    wire w_167, w_168;
    full_adder FA59 (.a(w_112), .b(w_113), .cin(stage2_Q[88]), .sum(w_167), .carry(w_168));
    wire w_169, w_170;
    full_adder FA60 (.a(w_114), .b(w_115), .cin(stage2_Q[92]), .sum(w_169), .carry(w_170));
    wire w_171, w_172;
    full_adder FA61 (.a(w_116), .b(w_117), .cin(stage2_Q[96]), .sum(w_171), .carry(w_172));
    wire w_173, w_174;
    full_adder FA62 (.a(w_118), .b(w_119), .cin(stage2_Q[99]), .sum(w_173), .carry(w_174));
    wire w_175, w_176;
    full_adder FA63 (.a(w_120), .b(w_121), .cin(stage2_Q[102]), .sum(w_175), .carry(w_176));
    wire w_177, w_178;
    full_adder FA64 (.a(w_122), .b(stage2_Q[103]), .cin(stage2_Q[104]), .sum(w_177), .carry(w_178));
    wire w_179, w_180;
    half_adder HA24 (.a(stage2_Q[105]), .b(stage2_Q[106]), .sum(w_179), .carry(w_180));

    // Pipeline Register Bank: Post-Stage 4 Layer
    wire [61:0] stage4_D;
    wire [61:0] stage4_Q;
    assign stage4_D = {w_179, w_178, w_177, w_176, w_175, w_174, w_173, w_172, w_171, w_170, w_169, w_168, w_167, w_166, w_165, w_164, w_163, w_162, w_161, w_160, w_159, w_158, w_157, w_156, w_155, w_154, w_153, w_152, w_151, w_150, w_149, w_148, w_147, w_146, w_145, w_144, w_143, w_142, w_141, w_140, w_139, w_138, w_137, w_136, w_135, w_134, w_133, w_132, w_131, w_130, w_129, w_128, w_127, w_126, w_125, w_124, stage2_Q[6], w_123, stage2_Q[3], stage2_Q[2], stage2_Q[1], stage2_Q[0]};
    register_bank #(.WIDTH(62)) reg_stage_4 (
        .clk(clk), .rst(rst), .en(en), .D(stage4_D), .Q(stage4_Q)
    );

    // ========================================================
    // Vector Preparation for Final Addition
    // ========================================================
    wire [31:0] adder_vec_A_raw = {stage4_Q[60], stage4_Q[58], stage4_Q[56], stage4_Q[54], stage4_Q[52], stage4_Q[50], stage4_Q[48], stage4_Q[46], stage4_Q[44], stage4_Q[42], stage4_Q[40], stage4_Q[38], stage4_Q[36], stage4_Q[34], stage4_Q[32], stage4_Q[30], stage4_Q[28], stage4_Q[26], stage4_Q[24], stage4_Q[22], stage4_Q[20], stage4_Q[18], stage4_Q[16], stage4_Q[14], stage4_Q[12], stage4_Q[10], stage4_Q[8], stage4_Q[6], stage4_Q[4], stage4_Q[3], stage4_Q[2], stage4_Q[0]};
    wire [31:0] adder_vec_B_raw = {stage4_Q[61], stage4_Q[59], stage4_Q[57], stage4_Q[55], stage4_Q[53], stage4_Q[51], stage4_Q[49], stage4_Q[47], stage4_Q[45], stage4_Q[43], stage4_Q[41], stage4_Q[39], stage4_Q[37], stage4_Q[35], stage4_Q[33], stage4_Q[31], stage4_Q[29], stage4_Q[27], stage4_Q[25], stage4_Q[23], stage4_Q[21], stage4_Q[19], stage4_Q[17], stage4_Q[15], stage4_Q[13], stage4_Q[11], stage4_Q[9], stage4_Q[7], stage4_Q[5], 1'b0, 1'b0, stage4_Q[1]};

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
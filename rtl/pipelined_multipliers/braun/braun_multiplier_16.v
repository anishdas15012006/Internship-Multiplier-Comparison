// ========================================================
// Dynamically Generated Pipelined Braun Multiplier
// Configuration: N = 16
// ========================================================

module braun_multiplier_16 (
    input wire clk,
    input wire rst,
    input wire en,
    input wire [15:0] A,
    input wire [15:0] B,
    output wire [31:0] Product
);

    // Definitive logical critical-path latency
    localparam PIPELINE_LATENCY = 9;

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
    half_adder HA_r1_c0 (.a(raw_pp[16]), .b(raw_pp[1]), .sum(w_1), .carry(w_2));
    wire w_3, w_4;
    half_adder HA_r1_c1 (.a(raw_pp[17]), .b(raw_pp[2]), .sum(w_3), .carry(w_4));
    wire w_5, w_6;
    half_adder HA_r1_c2 (.a(raw_pp[18]), .b(raw_pp[3]), .sum(w_5), .carry(w_6));
    wire w_7, w_8;
    half_adder HA_r1_c3 (.a(raw_pp[19]), .b(raw_pp[4]), .sum(w_7), .carry(w_8));
    wire w_9, w_10;
    half_adder HA_r1_c4 (.a(raw_pp[20]), .b(raw_pp[5]), .sum(w_9), .carry(w_10));
    wire w_11, w_12;
    half_adder HA_r1_c5 (.a(raw_pp[21]), .b(raw_pp[6]), .sum(w_11), .carry(w_12));
    wire w_13, w_14;
    half_adder HA_r1_c6 (.a(raw_pp[22]), .b(raw_pp[7]), .sum(w_13), .carry(w_14));
    wire w_15, w_16;
    half_adder HA_r1_c7 (.a(raw_pp[23]), .b(raw_pp[8]), .sum(w_15), .carry(w_16));
    wire w_17, w_18;
    half_adder HA_r1_c8 (.a(raw_pp[24]), .b(raw_pp[9]), .sum(w_17), .carry(w_18));
    wire w_19, w_20;
    half_adder HA_r1_c9 (.a(raw_pp[25]), .b(raw_pp[10]), .sum(w_19), .carry(w_20));
    wire w_21, w_22;
    half_adder HA_r1_c10 (.a(raw_pp[26]), .b(raw_pp[11]), .sum(w_21), .carry(w_22));
    wire w_23, w_24;
    half_adder HA_r1_c11 (.a(raw_pp[27]), .b(raw_pp[12]), .sum(w_23), .carry(w_24));
    wire w_25, w_26;
    half_adder HA_r1_c12 (.a(raw_pp[28]), .b(raw_pp[13]), .sum(w_25), .carry(w_26));
    wire w_27, w_28;
    half_adder HA_r1_c13 (.a(raw_pp[29]), .b(raw_pp[14]), .sum(w_27), .carry(w_28));
    wire w_29, w_30;
    half_adder HA_r1_c14 (.a(raw_pp[30]), .b(raw_pp[15]), .sum(w_29), .carry(w_30));

    // ========================================================
    // Stage 2
    // ========================================================
    wire w_31, w_32;
    full_adder FA_r2_c0 (.a(raw_pp[32]), .b(w_3), .cin(w_2), .sum(w_31), .carry(w_32));
    wire w_33, w_34;
    full_adder FA_r2_c1 (.a(raw_pp[33]), .b(w_5), .cin(w_4), .sum(w_33), .carry(w_34));
    wire w_35, w_36;
    full_adder FA_r2_c2 (.a(raw_pp[34]), .b(w_7), .cin(w_6), .sum(w_35), .carry(w_36));
    wire w_37, w_38;
    full_adder FA_r2_c3 (.a(raw_pp[35]), .b(w_9), .cin(w_8), .sum(w_37), .carry(w_38));
    wire w_39, w_40;
    full_adder FA_r2_c4 (.a(raw_pp[36]), .b(w_11), .cin(w_10), .sum(w_39), .carry(w_40));
    wire w_41, w_42;
    full_adder FA_r2_c5 (.a(raw_pp[37]), .b(w_13), .cin(w_12), .sum(w_41), .carry(w_42));
    wire w_43, w_44;
    full_adder FA_r2_c6 (.a(raw_pp[38]), .b(w_15), .cin(w_14), .sum(w_43), .carry(w_44));
    wire w_45, w_46;
    full_adder FA_r2_c7 (.a(raw_pp[39]), .b(w_17), .cin(w_16), .sum(w_45), .carry(w_46));
    wire w_47, w_48;
    full_adder FA_r2_c8 (.a(raw_pp[40]), .b(w_19), .cin(w_18), .sum(w_47), .carry(w_48));
    wire w_49, w_50;
    full_adder FA_r2_c9 (.a(raw_pp[41]), .b(w_21), .cin(w_20), .sum(w_49), .carry(w_50));
    wire w_51, w_52;
    full_adder FA_r2_c10 (.a(raw_pp[42]), .b(w_23), .cin(w_22), .sum(w_51), .carry(w_52));
    wire w_53, w_54;
    full_adder FA_r2_c11 (.a(raw_pp[43]), .b(w_25), .cin(w_24), .sum(w_53), .carry(w_54));
    wire w_55, w_56;
    full_adder FA_r2_c12 (.a(raw_pp[44]), .b(w_27), .cin(w_26), .sum(w_55), .carry(w_56));
    wire w_57, w_58;
    full_adder FA_r2_c13 (.a(raw_pp[45]), .b(w_29), .cin(w_28), .sum(w_57), .carry(w_58));
    wire w_59, w_60;
    full_adder FA_r2_c14 (.a(raw_pp[46]), .b(raw_pp[31]), .cin(w_30), .sum(w_59), .carry(w_60));

    // Pipeline Register Bank: Post-Stage 2 Layer
    wire [240:0] stage2_D;
    wire [240:0] stage2_Q;
    assign stage2_D = {raw_pp[255], raw_pp[254], raw_pp[239], raw_pp[253], raw_pp[238], raw_pp[223], raw_pp[252], raw_pp[237], raw_pp[222], raw_pp[207], raw_pp[251], raw_pp[236], raw_pp[221], raw_pp[206], raw_pp[191], raw_pp[250], raw_pp[235], raw_pp[220], raw_pp[205], raw_pp[190], raw_pp[175], raw_pp[249], raw_pp[234], raw_pp[219], raw_pp[204], raw_pp[189], raw_pp[174], raw_pp[159], raw_pp[248], raw_pp[233], raw_pp[218], raw_pp[203], raw_pp[188], raw_pp[173], raw_pp[158], raw_pp[143], raw_pp[247], raw_pp[232], raw_pp[217], raw_pp[202], raw_pp[187], raw_pp[172], raw_pp[157], raw_pp[142], raw_pp[127], raw_pp[246], raw_pp[231], raw_pp[216], raw_pp[201], raw_pp[186], raw_pp[171], raw_pp[156], raw_pp[141], raw_pp[126], raw_pp[111], raw_pp[245], raw_pp[230], raw_pp[215], raw_pp[200], raw_pp[185], raw_pp[170], raw_pp[155], raw_pp[140], raw_pp[125], raw_pp[110], raw_pp[95], raw_pp[244], raw_pp[229], raw_pp[214], raw_pp[199], raw_pp[184], raw_pp[169], raw_pp[154], raw_pp[139], raw_pp[124], raw_pp[109], raw_pp[94], raw_pp[79], raw_pp[243], raw_pp[228], raw_pp[213], raw_pp[198], raw_pp[183], raw_pp[168], raw_pp[153], raw_pp[138], raw_pp[123], raw_pp[108], raw_pp[93], raw_pp[78], raw_pp[63], raw_pp[242], raw_pp[227], raw_pp[212], raw_pp[197], raw_pp[182], raw_pp[167], raw_pp[152], raw_pp[137], raw_pp[122], raw_pp[107], raw_pp[92], raw_pp[77], raw_pp[62], w_60, raw_pp[47], raw_pp[241], raw_pp[226], raw_pp[211], raw_pp[196], raw_pp[181], raw_pp[166], raw_pp[151], raw_pp[136], raw_pp[121], raw_pp[106], raw_pp[91], raw_pp[76], raw_pp[61], w_58, w_59, raw_pp[240], raw_pp[225], raw_pp[210], raw_pp[195], raw_pp[180], raw_pp[165], raw_pp[150], raw_pp[135], raw_pp[120], raw_pp[105], raw_pp[90], raw_pp[75], raw_pp[60], w_56, w_57, raw_pp[224], raw_pp[209], raw_pp[194], raw_pp[179], raw_pp[164], raw_pp[149], raw_pp[134], raw_pp[119], raw_pp[104], raw_pp[89], raw_pp[74], raw_pp[59], w_54, w_55, raw_pp[208], raw_pp[193], raw_pp[178], raw_pp[163], raw_pp[148], raw_pp[133], raw_pp[118], raw_pp[103], raw_pp[88], raw_pp[73], raw_pp[58], w_52, w_53, raw_pp[192], raw_pp[177], raw_pp[162], raw_pp[147], raw_pp[132], raw_pp[117], raw_pp[102], raw_pp[87], raw_pp[72], raw_pp[57], w_50, w_51, raw_pp[176], raw_pp[161], raw_pp[146], raw_pp[131], raw_pp[116], raw_pp[101], raw_pp[86], raw_pp[71], raw_pp[56], w_48, w_49, raw_pp[160], raw_pp[145], raw_pp[130], raw_pp[115], raw_pp[100], raw_pp[85], raw_pp[70], raw_pp[55], w_46, w_47, raw_pp[144], raw_pp[129], raw_pp[114], raw_pp[99], raw_pp[84], raw_pp[69], raw_pp[54], w_44, w_45, raw_pp[128], raw_pp[113], raw_pp[98], raw_pp[83], raw_pp[68], raw_pp[53], w_42, w_43, raw_pp[112], raw_pp[97], raw_pp[82], raw_pp[67], raw_pp[52], w_40, w_41, raw_pp[96], raw_pp[81], raw_pp[66], raw_pp[51], w_38, w_39, raw_pp[80], raw_pp[65], raw_pp[50], w_36, w_37, raw_pp[64], raw_pp[49], w_34, w_35, raw_pp[48], w_32, w_33, w_31, w_1, raw_pp[0]};
    register_bank #(.WIDTH(241)) reg_stage_2 (
        .clk(clk), .rst(rst), .en(en), .D(stage2_D), .Q(stage2_Q)
    );

    // ========================================================
    // Stage 3
    // ========================================================
    wire w_61, w_62;
    full_adder FA_r3_c0 (.a(stage2_Q[5]), .b(stage2_Q[3]), .cin(stage2_Q[4]), .sum(w_61), .carry(w_62));
    wire w_63, w_64;
    full_adder FA_r3_c1 (.a(stage2_Q[8]), .b(stage2_Q[6]), .cin(stage2_Q[7]), .sum(w_63), .carry(w_64));
    wire w_65, w_66;
    full_adder FA_r3_c2 (.a(stage2_Q[12]), .b(stage2_Q[10]), .cin(stage2_Q[11]), .sum(w_65), .carry(w_66));
    wire w_67, w_68;
    full_adder FA_r3_c3 (.a(stage2_Q[17]), .b(stage2_Q[15]), .cin(stage2_Q[16]), .sum(w_67), .carry(w_68));
    wire w_69, w_70;
    full_adder FA_r3_c4 (.a(stage2_Q[23]), .b(stage2_Q[21]), .cin(stage2_Q[22]), .sum(w_69), .carry(w_70));
    wire w_71, w_72;
    full_adder FA_r3_c5 (.a(stage2_Q[30]), .b(stage2_Q[28]), .cin(stage2_Q[29]), .sum(w_71), .carry(w_72));
    wire w_73, w_74;
    full_adder FA_r3_c6 (.a(stage2_Q[38]), .b(stage2_Q[36]), .cin(stage2_Q[37]), .sum(w_73), .carry(w_74));
    wire w_75, w_76;
    full_adder FA_r3_c7 (.a(stage2_Q[47]), .b(stage2_Q[45]), .cin(stage2_Q[46]), .sum(w_75), .carry(w_76));
    wire w_77, w_78;
    full_adder FA_r3_c8 (.a(stage2_Q[57]), .b(stage2_Q[55]), .cin(stage2_Q[56]), .sum(w_77), .carry(w_78));
    wire w_79, w_80;
    full_adder FA_r3_c9 (.a(stage2_Q[68]), .b(stage2_Q[66]), .cin(stage2_Q[67]), .sum(w_79), .carry(w_80));
    wire w_81, w_82;
    full_adder FA_r3_c10 (.a(stage2_Q[80]), .b(stage2_Q[78]), .cin(stage2_Q[79]), .sum(w_81), .carry(w_82));
    wire w_83, w_84;
    full_adder FA_r3_c11 (.a(stage2_Q[93]), .b(stage2_Q[91]), .cin(stage2_Q[92]), .sum(w_83), .carry(w_84));
    wire w_85, w_86;
    full_adder FA_r3_c12 (.a(stage2_Q[107]), .b(stage2_Q[105]), .cin(stage2_Q[106]), .sum(w_85), .carry(w_86));
    wire w_87, w_88;
    full_adder FA_r3_c13 (.a(stage2_Q[122]), .b(stage2_Q[120]), .cin(stage2_Q[121]), .sum(w_87), .carry(w_88));
    wire w_89, w_90;
    full_adder FA_r3_c14 (.a(stage2_Q[137]), .b(stage2_Q[135]), .cin(stage2_Q[136]), .sum(w_89), .carry(w_90));

    // ========================================================
    // Stage 4
    // ========================================================
    wire w_91, w_92;
    full_adder FA_r4_c0 (.a(stage2_Q[9]), .b(w_63), .cin(w_62), .sum(w_91), .carry(w_92));
    wire w_93, w_94;
    full_adder FA_r4_c1 (.a(stage2_Q[13]), .b(w_65), .cin(w_64), .sum(w_93), .carry(w_94));
    wire w_95, w_96;
    full_adder FA_r4_c2 (.a(stage2_Q[18]), .b(w_67), .cin(w_66), .sum(w_95), .carry(w_96));
    wire w_97, w_98;
    full_adder FA_r4_c3 (.a(stage2_Q[24]), .b(w_69), .cin(w_68), .sum(w_97), .carry(w_98));
    wire w_99, w_100;
    full_adder FA_r4_c4 (.a(stage2_Q[31]), .b(w_71), .cin(w_70), .sum(w_99), .carry(w_100));
    wire w_101, w_102;
    full_adder FA_r4_c5 (.a(stage2_Q[39]), .b(w_73), .cin(w_72), .sum(w_101), .carry(w_102));
    wire w_103, w_104;
    full_adder FA_r4_c6 (.a(stage2_Q[48]), .b(w_75), .cin(w_74), .sum(w_103), .carry(w_104));
    wire w_105, w_106;
    full_adder FA_r4_c7 (.a(stage2_Q[58]), .b(w_77), .cin(w_76), .sum(w_105), .carry(w_106));
    wire w_107, w_108;
    full_adder FA_r4_c8 (.a(stage2_Q[69]), .b(w_79), .cin(w_78), .sum(w_107), .carry(w_108));
    wire w_109, w_110;
    full_adder FA_r4_c9 (.a(stage2_Q[81]), .b(w_81), .cin(w_80), .sum(w_109), .carry(w_110));
    wire w_111, w_112;
    full_adder FA_r4_c10 (.a(stage2_Q[94]), .b(w_83), .cin(w_82), .sum(w_111), .carry(w_112));
    wire w_113, w_114;
    full_adder FA_r4_c11 (.a(stage2_Q[108]), .b(w_85), .cin(w_84), .sum(w_113), .carry(w_114));
    wire w_115, w_116;
    full_adder FA_r4_c12 (.a(stage2_Q[123]), .b(w_87), .cin(w_86), .sum(w_115), .carry(w_116));
    wire w_117, w_118;
    full_adder FA_r4_c13 (.a(stage2_Q[138]), .b(w_89), .cin(w_88), .sum(w_117), .carry(w_118));
    wire w_119, w_120;
    full_adder FA_r4_c14 (.a(stage2_Q[151]), .b(stage2_Q[150]), .cin(w_90), .sum(w_119), .carry(w_120));

    // Pipeline Register Bank: Post-Stage 4 Layer
    wire [210:0] stage4_D;
    wire [210:0] stage4_Q;
    assign stage4_D = {stage2_Q[240], stage2_Q[239], stage2_Q[238], stage2_Q[237], stage2_Q[236], stage2_Q[235], stage2_Q[234], stage2_Q[233], stage2_Q[232], stage2_Q[231], stage2_Q[230], stage2_Q[229], stage2_Q[228], stage2_Q[227], stage2_Q[226], stage2_Q[225], stage2_Q[224], stage2_Q[223], stage2_Q[222], stage2_Q[221], stage2_Q[220], stage2_Q[219], stage2_Q[218], stage2_Q[217], stage2_Q[216], stage2_Q[215], stage2_Q[214], stage2_Q[213], stage2_Q[212], stage2_Q[211], stage2_Q[210], stage2_Q[209], stage2_Q[208], stage2_Q[207], stage2_Q[206], stage2_Q[205], stage2_Q[204], stage2_Q[203], stage2_Q[202], stage2_Q[201], stage2_Q[200], stage2_Q[199], stage2_Q[198], stage2_Q[197], stage2_Q[196], stage2_Q[195], stage2_Q[194], stage2_Q[193], stage2_Q[192], stage2_Q[191], stage2_Q[190], stage2_Q[189], stage2_Q[188], stage2_Q[187], stage2_Q[186], stage2_Q[185], stage2_Q[184], stage2_Q[183], stage2_Q[182], stage2_Q[181], stage2_Q[180], stage2_Q[179], stage2_Q[178], stage2_Q[177], stage2_Q[176], stage2_Q[175], stage2_Q[174], stage2_Q[173], stage2_Q[172], stage2_Q[171], stage2_Q[170], stage2_Q[169], stage2_Q[168], stage2_Q[167], stage2_Q[166], stage2_Q[165], stage2_Q[164], w_120, stage2_Q[163], stage2_Q[162], stage2_Q[161], stage2_Q[160], stage2_Q[159], stage2_Q[158], stage2_Q[157], stage2_Q[156], stage2_Q[155], stage2_Q[154], stage2_Q[153], stage2_Q[152], w_118, w_119, stage2_Q[149], stage2_Q[148], stage2_Q[147], stage2_Q[146], stage2_Q[145], stage2_Q[144], stage2_Q[143], stage2_Q[142], stage2_Q[141], stage2_Q[140], stage2_Q[139], w_116, w_117, stage2_Q[134], stage2_Q[133], stage2_Q[132], stage2_Q[131], stage2_Q[130], stage2_Q[129], stage2_Q[128], stage2_Q[127], stage2_Q[126], stage2_Q[125], stage2_Q[124], w_114, w_115, stage2_Q[119], stage2_Q[118], stage2_Q[117], stage2_Q[116], stage2_Q[115], stage2_Q[114], stage2_Q[113], stage2_Q[112], stage2_Q[111], stage2_Q[110], stage2_Q[109], w_112, w_113, stage2_Q[104], stage2_Q[103], stage2_Q[102], stage2_Q[101], stage2_Q[100], stage2_Q[99], stage2_Q[98], stage2_Q[97], stage2_Q[96], stage2_Q[95], w_110, w_111, stage2_Q[90], stage2_Q[89], stage2_Q[88], stage2_Q[87], stage2_Q[86], stage2_Q[85], stage2_Q[84], stage2_Q[83], stage2_Q[82], w_108, w_109, stage2_Q[77], stage2_Q[76], stage2_Q[75], stage2_Q[74], stage2_Q[73], stage2_Q[72], stage2_Q[71], stage2_Q[70], w_106, w_107, stage2_Q[65], stage2_Q[64], stage2_Q[63], stage2_Q[62], stage2_Q[61], stage2_Q[60], stage2_Q[59], w_104, w_105, stage2_Q[54], stage2_Q[53], stage2_Q[52], stage2_Q[51], stage2_Q[50], stage2_Q[49], w_102, w_103, stage2_Q[44], stage2_Q[43], stage2_Q[42], stage2_Q[41], stage2_Q[40], w_100, w_101, stage2_Q[35], stage2_Q[34], stage2_Q[33], stage2_Q[32], w_98, w_99, stage2_Q[27], stage2_Q[26], stage2_Q[25], w_96, w_97, stage2_Q[20], stage2_Q[19], w_94, w_95, stage2_Q[14], w_92, w_93, w_91, w_61, stage2_Q[2], stage2_Q[1], stage2_Q[0]};
    register_bank #(.WIDTH(211)) reg_stage_4 (
        .clk(clk), .rst(rst), .en(en), .D(stage4_D), .Q(stage4_Q)
    );

    // ========================================================
    // Stage 5
    // ========================================================
    wire w_121, w_122;
    full_adder FA_r5_c0 (.a(stage4_Q[7]), .b(stage4_Q[5]), .cin(stage4_Q[6]), .sum(w_121), .carry(w_122));
    wire w_123, w_124;
    full_adder FA_r5_c1 (.a(stage4_Q[10]), .b(stage4_Q[8]), .cin(stage4_Q[9]), .sum(w_123), .carry(w_124));
    wire w_125, w_126;
    full_adder FA_r5_c2 (.a(stage4_Q[14]), .b(stage4_Q[12]), .cin(stage4_Q[13]), .sum(w_125), .carry(w_126));
    wire w_127, w_128;
    full_adder FA_r5_c3 (.a(stage4_Q[19]), .b(stage4_Q[17]), .cin(stage4_Q[18]), .sum(w_127), .carry(w_128));
    wire w_129, w_130;
    full_adder FA_r5_c4 (.a(stage4_Q[25]), .b(stage4_Q[23]), .cin(stage4_Q[24]), .sum(w_129), .carry(w_130));
    wire w_131, w_132;
    full_adder FA_r5_c5 (.a(stage4_Q[32]), .b(stage4_Q[30]), .cin(stage4_Q[31]), .sum(w_131), .carry(w_132));
    wire w_133, w_134;
    full_adder FA_r5_c6 (.a(stage4_Q[40]), .b(stage4_Q[38]), .cin(stage4_Q[39]), .sum(w_133), .carry(w_134));
    wire w_135, w_136;
    full_adder FA_r5_c7 (.a(stage4_Q[49]), .b(stage4_Q[47]), .cin(stage4_Q[48]), .sum(w_135), .carry(w_136));
    wire w_137, w_138;
    full_adder FA_r5_c8 (.a(stage4_Q[59]), .b(stage4_Q[57]), .cin(stage4_Q[58]), .sum(w_137), .carry(w_138));
    wire w_139, w_140;
    full_adder FA_r5_c9 (.a(stage4_Q[70]), .b(stage4_Q[68]), .cin(stage4_Q[69]), .sum(w_139), .carry(w_140));
    wire w_141, w_142;
    full_adder FA_r5_c10 (.a(stage4_Q[82]), .b(stage4_Q[80]), .cin(stage4_Q[81]), .sum(w_141), .carry(w_142));
    wire w_143, w_144;
    full_adder FA_r5_c11 (.a(stage4_Q[95]), .b(stage4_Q[93]), .cin(stage4_Q[94]), .sum(w_143), .carry(w_144));
    wire w_145, w_146;
    full_adder FA_r5_c12 (.a(stage4_Q[108]), .b(stage4_Q[106]), .cin(stage4_Q[107]), .sum(w_145), .carry(w_146));
    wire w_147, w_148;
    full_adder FA_r5_c13 (.a(stage4_Q[121]), .b(stage4_Q[119]), .cin(stage4_Q[120]), .sum(w_147), .carry(w_148));
    wire w_149, w_150;
    full_adder FA_r5_c14 (.a(stage4_Q[134]), .b(stage4_Q[132]), .cin(stage4_Q[133]), .sum(w_149), .carry(w_150));

    // ========================================================
    // Stage 6
    // ========================================================
    wire w_151, w_152;
    full_adder FA_r6_c0 (.a(stage4_Q[11]), .b(w_123), .cin(w_122), .sum(w_151), .carry(w_152));
    wire w_153, w_154;
    full_adder FA_r6_c1 (.a(stage4_Q[15]), .b(w_125), .cin(w_124), .sum(w_153), .carry(w_154));
    wire w_155, w_156;
    full_adder FA_r6_c2 (.a(stage4_Q[20]), .b(w_127), .cin(w_126), .sum(w_155), .carry(w_156));
    wire w_157, w_158;
    full_adder FA_r6_c3 (.a(stage4_Q[26]), .b(w_129), .cin(w_128), .sum(w_157), .carry(w_158));
    wire w_159, w_160;
    full_adder FA_r6_c4 (.a(stage4_Q[33]), .b(w_131), .cin(w_130), .sum(w_159), .carry(w_160));
    wire w_161, w_162;
    full_adder FA_r6_c5 (.a(stage4_Q[41]), .b(w_133), .cin(w_132), .sum(w_161), .carry(w_162));
    wire w_163, w_164;
    full_adder FA_r6_c6 (.a(stage4_Q[50]), .b(w_135), .cin(w_134), .sum(w_163), .carry(w_164));
    wire w_165, w_166;
    full_adder FA_r6_c7 (.a(stage4_Q[60]), .b(w_137), .cin(w_136), .sum(w_165), .carry(w_166));
    wire w_167, w_168;
    full_adder FA_r6_c8 (.a(stage4_Q[71]), .b(w_139), .cin(w_138), .sum(w_167), .carry(w_168));
    wire w_169, w_170;
    full_adder FA_r6_c9 (.a(stage4_Q[83]), .b(w_141), .cin(w_140), .sum(w_169), .carry(w_170));
    wire w_171, w_172;
    full_adder FA_r6_c10 (.a(stage4_Q[96]), .b(w_143), .cin(w_142), .sum(w_171), .carry(w_172));
    wire w_173, w_174;
    full_adder FA_r6_c11 (.a(stage4_Q[109]), .b(w_145), .cin(w_144), .sum(w_173), .carry(w_174));
    wire w_175, w_176;
    full_adder FA_r6_c12 (.a(stage4_Q[122]), .b(w_147), .cin(w_146), .sum(w_175), .carry(w_176));
    wire w_177, w_178;
    full_adder FA_r6_c13 (.a(stage4_Q[135]), .b(w_149), .cin(w_148), .sum(w_177), .carry(w_178));
    wire w_179, w_180;
    full_adder FA_r6_c14 (.a(stage4_Q[146]), .b(stage4_Q[145]), .cin(w_150), .sum(w_179), .carry(w_180));

    // Pipeline Register Bank: Post-Stage 6 Layer
    wire [180:0] stage6_D;
    wire [180:0] stage6_Q;
    assign stage6_D = {stage4_Q[210], stage4_Q[209], stage4_Q[208], stage4_Q[207], stage4_Q[206], stage4_Q[205], stage4_Q[204], stage4_Q[203], stage4_Q[202], stage4_Q[201], stage4_Q[200], stage4_Q[199], stage4_Q[198], stage4_Q[197], stage4_Q[196], stage4_Q[195], stage4_Q[194], stage4_Q[193], stage4_Q[192], stage4_Q[191], stage4_Q[190], stage4_Q[189], stage4_Q[188], stage4_Q[187], stage4_Q[186], stage4_Q[185], stage4_Q[184], stage4_Q[183], stage4_Q[182], stage4_Q[181], stage4_Q[180], stage4_Q[179], stage4_Q[178], stage4_Q[177], stage4_Q[176], stage4_Q[175], stage4_Q[174], stage4_Q[173], stage4_Q[172], stage4_Q[171], stage4_Q[170], stage4_Q[169], stage4_Q[168], stage4_Q[167], stage4_Q[166], stage4_Q[165], stage4_Q[164], stage4_Q[163], stage4_Q[162], stage4_Q[161], stage4_Q[160], stage4_Q[159], stage4_Q[158], stage4_Q[157], w_180, stage4_Q[156], stage4_Q[155], stage4_Q[154], stage4_Q[153], stage4_Q[152], stage4_Q[151], stage4_Q[150], stage4_Q[149], stage4_Q[148], stage4_Q[147], w_178, w_179, stage4_Q[144], stage4_Q[143], stage4_Q[142], stage4_Q[141], stage4_Q[140], stage4_Q[139], stage4_Q[138], stage4_Q[137], stage4_Q[136], w_176, w_177, stage4_Q[131], stage4_Q[130], stage4_Q[129], stage4_Q[128], stage4_Q[127], stage4_Q[126], stage4_Q[125], stage4_Q[124], stage4_Q[123], w_174, w_175, stage4_Q[118], stage4_Q[117], stage4_Q[116], stage4_Q[115], stage4_Q[114], stage4_Q[113], stage4_Q[112], stage4_Q[111], stage4_Q[110], w_172, w_173, stage4_Q[105], stage4_Q[104], stage4_Q[103], stage4_Q[102], stage4_Q[101], stage4_Q[100], stage4_Q[99], stage4_Q[98], stage4_Q[97], w_170, w_171, stage4_Q[92], stage4_Q[91], stage4_Q[90], stage4_Q[89], stage4_Q[88], stage4_Q[87], stage4_Q[86], stage4_Q[85], stage4_Q[84], w_168, w_169, stage4_Q[79], stage4_Q[78], stage4_Q[77], stage4_Q[76], stage4_Q[75], stage4_Q[74], stage4_Q[73], stage4_Q[72], w_166, w_167, stage4_Q[67], stage4_Q[66], stage4_Q[65], stage4_Q[64], stage4_Q[63], stage4_Q[62], stage4_Q[61], w_164, w_165, stage4_Q[56], stage4_Q[55], stage4_Q[54], stage4_Q[53], stage4_Q[52], stage4_Q[51], w_162, w_163, stage4_Q[46], stage4_Q[45], stage4_Q[44], stage4_Q[43], stage4_Q[42], w_160, w_161, stage4_Q[37], stage4_Q[36], stage4_Q[35], stage4_Q[34], w_158, w_159, stage4_Q[29], stage4_Q[28], stage4_Q[27], w_156, w_157, stage4_Q[22], stage4_Q[21], w_154, w_155, stage4_Q[16], w_152, w_153, w_151, w_121, stage4_Q[4], stage4_Q[3], stage4_Q[2], stage4_Q[1], stage4_Q[0]};
    register_bank #(.WIDTH(181)) reg_stage_6 (
        .clk(clk), .rst(rst), .en(en), .D(stage6_D), .Q(stage6_Q)
    );

    // ========================================================
    // Stage 7
    // ========================================================
    wire w_181, w_182;
    full_adder FA_r7_c0 (.a(stage6_Q[9]), .b(stage6_Q[7]), .cin(stage6_Q[8]), .sum(w_181), .carry(w_182));
    wire w_183, w_184;
    full_adder FA_r7_c1 (.a(stage6_Q[12]), .b(stage6_Q[10]), .cin(stage6_Q[11]), .sum(w_183), .carry(w_184));
    wire w_185, w_186;
    full_adder FA_r7_c2 (.a(stage6_Q[16]), .b(stage6_Q[14]), .cin(stage6_Q[15]), .sum(w_185), .carry(w_186));
    wire w_187, w_188;
    full_adder FA_r7_c3 (.a(stage6_Q[21]), .b(stage6_Q[19]), .cin(stage6_Q[20]), .sum(w_187), .carry(w_188));
    wire w_189, w_190;
    full_adder FA_r7_c4 (.a(stage6_Q[27]), .b(stage6_Q[25]), .cin(stage6_Q[26]), .sum(w_189), .carry(w_190));
    wire w_191, w_192;
    full_adder FA_r7_c5 (.a(stage6_Q[34]), .b(stage6_Q[32]), .cin(stage6_Q[33]), .sum(w_191), .carry(w_192));
    wire w_193, w_194;
    full_adder FA_r7_c6 (.a(stage6_Q[42]), .b(stage6_Q[40]), .cin(stage6_Q[41]), .sum(w_193), .carry(w_194));
    wire w_195, w_196;
    full_adder FA_r7_c7 (.a(stage6_Q[51]), .b(stage6_Q[49]), .cin(stage6_Q[50]), .sum(w_195), .carry(w_196));
    wire w_197, w_198;
    full_adder FA_r7_c8 (.a(stage6_Q[61]), .b(stage6_Q[59]), .cin(stage6_Q[60]), .sum(w_197), .carry(w_198));
    wire w_199, w_200;
    full_adder FA_r7_c9 (.a(stage6_Q[72]), .b(stage6_Q[70]), .cin(stage6_Q[71]), .sum(w_199), .carry(w_200));
    wire w_201, w_202;
    full_adder FA_r7_c10 (.a(stage6_Q[83]), .b(stage6_Q[81]), .cin(stage6_Q[82]), .sum(w_201), .carry(w_202));
    wire w_203, w_204;
    full_adder FA_r7_c11 (.a(stage6_Q[94]), .b(stage6_Q[92]), .cin(stage6_Q[93]), .sum(w_203), .carry(w_204));
    wire w_205, w_206;
    full_adder FA_r7_c12 (.a(stage6_Q[105]), .b(stage6_Q[103]), .cin(stage6_Q[104]), .sum(w_205), .carry(w_206));
    wire w_207, w_208;
    full_adder FA_r7_c13 (.a(stage6_Q[116]), .b(stage6_Q[114]), .cin(stage6_Q[115]), .sum(w_207), .carry(w_208));
    wire w_209, w_210;
    full_adder FA_r7_c14 (.a(stage6_Q[127]), .b(stage6_Q[125]), .cin(stage6_Q[126]), .sum(w_209), .carry(w_210));

    // ========================================================
    // Stage 8
    // ========================================================
    wire w_211, w_212;
    full_adder FA_r8_c0 (.a(stage6_Q[13]), .b(w_183), .cin(w_182), .sum(w_211), .carry(w_212));
    wire w_213, w_214;
    full_adder FA_r8_c1 (.a(stage6_Q[17]), .b(w_185), .cin(w_184), .sum(w_213), .carry(w_214));
    wire w_215, w_216;
    full_adder FA_r8_c2 (.a(stage6_Q[22]), .b(w_187), .cin(w_186), .sum(w_215), .carry(w_216));
    wire w_217, w_218;
    full_adder FA_r8_c3 (.a(stage6_Q[28]), .b(w_189), .cin(w_188), .sum(w_217), .carry(w_218));
    wire w_219, w_220;
    full_adder FA_r8_c4 (.a(stage6_Q[35]), .b(w_191), .cin(w_190), .sum(w_219), .carry(w_220));
    wire w_221, w_222;
    full_adder FA_r8_c5 (.a(stage6_Q[43]), .b(w_193), .cin(w_192), .sum(w_221), .carry(w_222));
    wire w_223, w_224;
    full_adder FA_r8_c6 (.a(stage6_Q[52]), .b(w_195), .cin(w_194), .sum(w_223), .carry(w_224));
    wire w_225, w_226;
    full_adder FA_r8_c7 (.a(stage6_Q[62]), .b(w_197), .cin(w_196), .sum(w_225), .carry(w_226));
    wire w_227, w_228;
    full_adder FA_r8_c8 (.a(stage6_Q[73]), .b(w_199), .cin(w_198), .sum(w_227), .carry(w_228));
    wire w_229, w_230;
    full_adder FA_r8_c9 (.a(stage6_Q[84]), .b(w_201), .cin(w_200), .sum(w_229), .carry(w_230));
    wire w_231, w_232;
    full_adder FA_r8_c10 (.a(stage6_Q[95]), .b(w_203), .cin(w_202), .sum(w_231), .carry(w_232));
    wire w_233, w_234;
    full_adder FA_r8_c11 (.a(stage6_Q[106]), .b(w_205), .cin(w_204), .sum(w_233), .carry(w_234));
    wire w_235, w_236;
    full_adder FA_r8_c12 (.a(stage6_Q[117]), .b(w_207), .cin(w_206), .sum(w_235), .carry(w_236));
    wire w_237, w_238;
    full_adder FA_r8_c13 (.a(stage6_Q[128]), .b(w_209), .cin(w_208), .sum(w_237), .carry(w_238));
    wire w_239, w_240;
    full_adder FA_r8_c14 (.a(stage6_Q[137]), .b(stage6_Q[136]), .cin(w_210), .sum(w_239), .carry(w_240));

    // Pipeline Register Bank: Post-Stage 8 Layer
    wire [150:0] stage8_D;
    wire [150:0] stage8_Q;
    assign stage8_D = {stage6_Q[180], stage6_Q[179], stage6_Q[178], stage6_Q[177], stage6_Q[176], stage6_Q[175], stage6_Q[174], stage6_Q[173], stage6_Q[172], stage6_Q[171], stage6_Q[170], stage6_Q[169], stage6_Q[168], stage6_Q[167], stage6_Q[166], stage6_Q[165], stage6_Q[164], stage6_Q[163], stage6_Q[162], stage6_Q[161], stage6_Q[160], stage6_Q[159], stage6_Q[158], stage6_Q[157], stage6_Q[156], stage6_Q[155], stage6_Q[154], stage6_Q[153], stage6_Q[152], stage6_Q[151], stage6_Q[150], stage6_Q[149], stage6_Q[148], stage6_Q[147], stage6_Q[146], w_240, stage6_Q[145], stage6_Q[144], stage6_Q[143], stage6_Q[142], stage6_Q[141], stage6_Q[140], stage6_Q[139], stage6_Q[138], w_238, w_239, stage6_Q[135], stage6_Q[134], stage6_Q[133], stage6_Q[132], stage6_Q[131], stage6_Q[130], stage6_Q[129], w_236, w_237, stage6_Q[124], stage6_Q[123], stage6_Q[122], stage6_Q[121], stage6_Q[120], stage6_Q[119], stage6_Q[118], w_234, w_235, stage6_Q[113], stage6_Q[112], stage6_Q[111], stage6_Q[110], stage6_Q[109], stage6_Q[108], stage6_Q[107], w_232, w_233, stage6_Q[102], stage6_Q[101], stage6_Q[100], stage6_Q[99], stage6_Q[98], stage6_Q[97], stage6_Q[96], w_230, w_231, stage6_Q[91], stage6_Q[90], stage6_Q[89], stage6_Q[88], stage6_Q[87], stage6_Q[86], stage6_Q[85], w_228, w_229, stage6_Q[80], stage6_Q[79], stage6_Q[78], stage6_Q[77], stage6_Q[76], stage6_Q[75], stage6_Q[74], w_226, w_227, stage6_Q[69], stage6_Q[68], stage6_Q[67], stage6_Q[66], stage6_Q[65], stage6_Q[64], stage6_Q[63], w_224, w_225, stage6_Q[58], stage6_Q[57], stage6_Q[56], stage6_Q[55], stage6_Q[54], stage6_Q[53], w_222, w_223, stage6_Q[48], stage6_Q[47], stage6_Q[46], stage6_Q[45], stage6_Q[44], w_220, w_221, stage6_Q[39], stage6_Q[38], stage6_Q[37], stage6_Q[36], w_218, w_219, stage6_Q[31], stage6_Q[30], stage6_Q[29], w_216, w_217, stage6_Q[24], stage6_Q[23], w_214, w_215, stage6_Q[18], w_212, w_213, w_211, w_181, stage6_Q[6], stage6_Q[5], stage6_Q[4], stage6_Q[3], stage6_Q[2], stage6_Q[1], stage6_Q[0]};
    register_bank #(.WIDTH(151)) reg_stage_8 (
        .clk(clk), .rst(rst), .en(en), .D(stage8_D), .Q(stage8_Q)
    );

    // ========================================================
    // Stage 9
    // ========================================================
    wire w_241, w_242;
    full_adder FA_r9_c0 (.a(stage8_Q[11]), .b(stage8_Q[9]), .cin(stage8_Q[10]), .sum(w_241), .carry(w_242));
    wire w_243, w_244;
    full_adder FA_r9_c1 (.a(stage8_Q[14]), .b(stage8_Q[12]), .cin(stage8_Q[13]), .sum(w_243), .carry(w_244));
    wire w_245, w_246;
    full_adder FA_r9_c2 (.a(stage8_Q[18]), .b(stage8_Q[16]), .cin(stage8_Q[17]), .sum(w_245), .carry(w_246));
    wire w_247, w_248;
    full_adder FA_r9_c3 (.a(stage8_Q[23]), .b(stage8_Q[21]), .cin(stage8_Q[22]), .sum(w_247), .carry(w_248));
    wire w_249, w_250;
    full_adder FA_r9_c4 (.a(stage8_Q[29]), .b(stage8_Q[27]), .cin(stage8_Q[28]), .sum(w_249), .carry(w_250));
    wire w_251, w_252;
    full_adder FA_r9_c5 (.a(stage8_Q[36]), .b(stage8_Q[34]), .cin(stage8_Q[35]), .sum(w_251), .carry(w_252));
    wire w_253, w_254;
    full_adder FA_r9_c6 (.a(stage8_Q[44]), .b(stage8_Q[42]), .cin(stage8_Q[43]), .sum(w_253), .carry(w_254));
    wire w_255, w_256;
    full_adder FA_r9_c7 (.a(stage8_Q[53]), .b(stage8_Q[51]), .cin(stage8_Q[52]), .sum(w_255), .carry(w_256));
    wire w_257, w_258;
    full_adder FA_r9_c8 (.a(stage8_Q[62]), .b(stage8_Q[60]), .cin(stage8_Q[61]), .sum(w_257), .carry(w_258));
    wire w_259, w_260;
    full_adder FA_r9_c9 (.a(stage8_Q[71]), .b(stage8_Q[69]), .cin(stage8_Q[70]), .sum(w_259), .carry(w_260));
    wire w_261, w_262;
    full_adder FA_r9_c10 (.a(stage8_Q[80]), .b(stage8_Q[78]), .cin(stage8_Q[79]), .sum(w_261), .carry(w_262));
    wire w_263, w_264;
    full_adder FA_r9_c11 (.a(stage8_Q[89]), .b(stage8_Q[87]), .cin(stage8_Q[88]), .sum(w_263), .carry(w_264));
    wire w_265, w_266;
    full_adder FA_r9_c12 (.a(stage8_Q[98]), .b(stage8_Q[96]), .cin(stage8_Q[97]), .sum(w_265), .carry(w_266));
    wire w_267, w_268;
    full_adder FA_r9_c13 (.a(stage8_Q[107]), .b(stage8_Q[105]), .cin(stage8_Q[106]), .sum(w_267), .carry(w_268));
    wire w_269, w_270;
    full_adder FA_r9_c14 (.a(stage8_Q[116]), .b(stage8_Q[114]), .cin(stage8_Q[115]), .sum(w_269), .carry(w_270));

    // ========================================================
    // Stage 10
    // ========================================================
    wire w_271, w_272;
    full_adder FA_r10_c0 (.a(stage8_Q[15]), .b(w_243), .cin(w_242), .sum(w_271), .carry(w_272));
    wire w_273, w_274;
    full_adder FA_r10_c1 (.a(stage8_Q[19]), .b(w_245), .cin(w_244), .sum(w_273), .carry(w_274));
    wire w_275, w_276;
    full_adder FA_r10_c2 (.a(stage8_Q[24]), .b(w_247), .cin(w_246), .sum(w_275), .carry(w_276));
    wire w_277, w_278;
    full_adder FA_r10_c3 (.a(stage8_Q[30]), .b(w_249), .cin(w_248), .sum(w_277), .carry(w_278));
    wire w_279, w_280;
    full_adder FA_r10_c4 (.a(stage8_Q[37]), .b(w_251), .cin(w_250), .sum(w_279), .carry(w_280));
    wire w_281, w_282;
    full_adder FA_r10_c5 (.a(stage8_Q[45]), .b(w_253), .cin(w_252), .sum(w_281), .carry(w_282));
    wire w_283, w_284;
    full_adder FA_r10_c6 (.a(stage8_Q[54]), .b(w_255), .cin(w_254), .sum(w_283), .carry(w_284));
    wire w_285, w_286;
    full_adder FA_r10_c7 (.a(stage8_Q[63]), .b(w_257), .cin(w_256), .sum(w_285), .carry(w_286));
    wire w_287, w_288;
    full_adder FA_r10_c8 (.a(stage8_Q[72]), .b(w_259), .cin(w_258), .sum(w_287), .carry(w_288));
    wire w_289, w_290;
    full_adder FA_r10_c9 (.a(stage8_Q[81]), .b(w_261), .cin(w_260), .sum(w_289), .carry(w_290));
    wire w_291, w_292;
    full_adder FA_r10_c10 (.a(stage8_Q[90]), .b(w_263), .cin(w_262), .sum(w_291), .carry(w_292));
    wire w_293, w_294;
    full_adder FA_r10_c11 (.a(stage8_Q[99]), .b(w_265), .cin(w_264), .sum(w_293), .carry(w_294));
    wire w_295, w_296;
    full_adder FA_r10_c12 (.a(stage8_Q[108]), .b(w_267), .cin(w_266), .sum(w_295), .carry(w_296));
    wire w_297, w_298;
    full_adder FA_r10_c13 (.a(stage8_Q[117]), .b(w_269), .cin(w_268), .sum(w_297), .carry(w_298));
    wire w_299, w_300;
    full_adder FA_r10_c14 (.a(stage8_Q[124]), .b(stage8_Q[123]), .cin(w_270), .sum(w_299), .carry(w_300));

    // Pipeline Register Bank: Post-Stage 10 Layer
    wire [120:0] stage10_D;
    wire [120:0] stage10_Q;
    assign stage10_D = {stage8_Q[150], stage8_Q[149], stage8_Q[148], stage8_Q[147], stage8_Q[146], stage8_Q[145], stage8_Q[144], stage8_Q[143], stage8_Q[142], stage8_Q[141], stage8_Q[140], stage8_Q[139], stage8_Q[138], stage8_Q[137], stage8_Q[136], stage8_Q[135], stage8_Q[134], stage8_Q[133], stage8_Q[132], stage8_Q[131], w_300, stage8_Q[130], stage8_Q[129], stage8_Q[128], stage8_Q[127], stage8_Q[126], stage8_Q[125], w_298, w_299, stage8_Q[122], stage8_Q[121], stage8_Q[120], stage8_Q[119], stage8_Q[118], w_296, w_297, stage8_Q[113], stage8_Q[112], stage8_Q[111], stage8_Q[110], stage8_Q[109], w_294, w_295, stage8_Q[104], stage8_Q[103], stage8_Q[102], stage8_Q[101], stage8_Q[100], w_292, w_293, stage8_Q[95], stage8_Q[94], stage8_Q[93], stage8_Q[92], stage8_Q[91], w_290, w_291, stage8_Q[86], stage8_Q[85], stage8_Q[84], stage8_Q[83], stage8_Q[82], w_288, w_289, stage8_Q[77], stage8_Q[76], stage8_Q[75], stage8_Q[74], stage8_Q[73], w_286, w_287, stage8_Q[68], stage8_Q[67], stage8_Q[66], stage8_Q[65], stage8_Q[64], w_284, w_285, stage8_Q[59], stage8_Q[58], stage8_Q[57], stage8_Q[56], stage8_Q[55], w_282, w_283, stage8_Q[50], stage8_Q[49], stage8_Q[48], stage8_Q[47], stage8_Q[46], w_280, w_281, stage8_Q[41], stage8_Q[40], stage8_Q[39], stage8_Q[38], w_278, w_279, stage8_Q[33], stage8_Q[32], stage8_Q[31], w_276, w_277, stage8_Q[26], stage8_Q[25], w_274, w_275, stage8_Q[20], w_272, w_273, w_271, w_241, stage8_Q[8], stage8_Q[7], stage8_Q[6], stage8_Q[5], stage8_Q[4], stage8_Q[3], stage8_Q[2], stage8_Q[1], stage8_Q[0]};
    register_bank #(.WIDTH(121)) reg_stage_10 (
        .clk(clk), .rst(rst), .en(en), .D(stage10_D), .Q(stage10_Q)
    );

    // ========================================================
    // Stage 11
    // ========================================================
    wire w_301, w_302;
    full_adder FA_r11_c0 (.a(stage10_Q[13]), .b(stage10_Q[11]), .cin(stage10_Q[12]), .sum(w_301), .carry(w_302));
    wire w_303, w_304;
    full_adder FA_r11_c1 (.a(stage10_Q[16]), .b(stage10_Q[14]), .cin(stage10_Q[15]), .sum(w_303), .carry(w_304));
    wire w_305, w_306;
    full_adder FA_r11_c2 (.a(stage10_Q[20]), .b(stage10_Q[18]), .cin(stage10_Q[19]), .sum(w_305), .carry(w_306));
    wire w_307, w_308;
    full_adder FA_r11_c3 (.a(stage10_Q[25]), .b(stage10_Q[23]), .cin(stage10_Q[24]), .sum(w_307), .carry(w_308));
    wire w_309, w_310;
    full_adder FA_r11_c4 (.a(stage10_Q[31]), .b(stage10_Q[29]), .cin(stage10_Q[30]), .sum(w_309), .carry(w_310));
    wire w_311, w_312;
    full_adder FA_r11_c5 (.a(stage10_Q[38]), .b(stage10_Q[36]), .cin(stage10_Q[37]), .sum(w_311), .carry(w_312));
    wire w_313, w_314;
    full_adder FA_r11_c6 (.a(stage10_Q[45]), .b(stage10_Q[43]), .cin(stage10_Q[44]), .sum(w_313), .carry(w_314));
    wire w_315, w_316;
    full_adder FA_r11_c7 (.a(stage10_Q[52]), .b(stage10_Q[50]), .cin(stage10_Q[51]), .sum(w_315), .carry(w_316));
    wire w_317, w_318;
    full_adder FA_r11_c8 (.a(stage10_Q[59]), .b(stage10_Q[57]), .cin(stage10_Q[58]), .sum(w_317), .carry(w_318));
    wire w_319, w_320;
    full_adder FA_r11_c9 (.a(stage10_Q[66]), .b(stage10_Q[64]), .cin(stage10_Q[65]), .sum(w_319), .carry(w_320));
    wire w_321, w_322;
    full_adder FA_r11_c10 (.a(stage10_Q[73]), .b(stage10_Q[71]), .cin(stage10_Q[72]), .sum(w_321), .carry(w_322));
    wire w_323, w_324;
    full_adder FA_r11_c11 (.a(stage10_Q[80]), .b(stage10_Q[78]), .cin(stage10_Q[79]), .sum(w_323), .carry(w_324));
    wire w_325, w_326;
    full_adder FA_r11_c12 (.a(stage10_Q[87]), .b(stage10_Q[85]), .cin(stage10_Q[86]), .sum(w_325), .carry(w_326));
    wire w_327, w_328;
    full_adder FA_r11_c13 (.a(stage10_Q[94]), .b(stage10_Q[92]), .cin(stage10_Q[93]), .sum(w_327), .carry(w_328));
    wire w_329, w_330;
    full_adder FA_r11_c14 (.a(stage10_Q[101]), .b(stage10_Q[99]), .cin(stage10_Q[100]), .sum(w_329), .carry(w_330));

    // ========================================================
    // Stage 12
    // ========================================================
    wire w_331, w_332;
    full_adder FA_r12_c0 (.a(stage10_Q[17]), .b(w_303), .cin(w_302), .sum(w_331), .carry(w_332));
    wire w_333, w_334;
    full_adder FA_r12_c1 (.a(stage10_Q[21]), .b(w_305), .cin(w_304), .sum(w_333), .carry(w_334));
    wire w_335, w_336;
    full_adder FA_r12_c2 (.a(stage10_Q[26]), .b(w_307), .cin(w_306), .sum(w_335), .carry(w_336));
    wire w_337, w_338;
    full_adder FA_r12_c3 (.a(stage10_Q[32]), .b(w_309), .cin(w_308), .sum(w_337), .carry(w_338));
    wire w_339, w_340;
    full_adder FA_r12_c4 (.a(stage10_Q[39]), .b(w_311), .cin(w_310), .sum(w_339), .carry(w_340));
    wire w_341, w_342;
    full_adder FA_r12_c5 (.a(stage10_Q[46]), .b(w_313), .cin(w_312), .sum(w_341), .carry(w_342));
    wire w_343, w_344;
    full_adder FA_r12_c6 (.a(stage10_Q[53]), .b(w_315), .cin(w_314), .sum(w_343), .carry(w_344));
    wire w_345, w_346;
    full_adder FA_r12_c7 (.a(stage10_Q[60]), .b(w_317), .cin(w_316), .sum(w_345), .carry(w_346));
    wire w_347, w_348;
    full_adder FA_r12_c8 (.a(stage10_Q[67]), .b(w_319), .cin(w_318), .sum(w_347), .carry(w_348));
    wire w_349, w_350;
    full_adder FA_r12_c9 (.a(stage10_Q[74]), .b(w_321), .cin(w_320), .sum(w_349), .carry(w_350));
    wire w_351, w_352;
    full_adder FA_r12_c10 (.a(stage10_Q[81]), .b(w_323), .cin(w_322), .sum(w_351), .carry(w_352));
    wire w_353, w_354;
    full_adder FA_r12_c11 (.a(stage10_Q[88]), .b(w_325), .cin(w_324), .sum(w_353), .carry(w_354));
    wire w_355, w_356;
    full_adder FA_r12_c12 (.a(stage10_Q[95]), .b(w_327), .cin(w_326), .sum(w_355), .carry(w_356));
    wire w_357, w_358;
    full_adder FA_r12_c13 (.a(stage10_Q[102]), .b(w_329), .cin(w_328), .sum(w_357), .carry(w_358));
    wire w_359, w_360;
    full_adder FA_r12_c14 (.a(stage10_Q[107]), .b(stage10_Q[106]), .cin(w_330), .sum(w_359), .carry(w_360));

    // Pipeline Register Bank: Post-Stage 12 Layer
    wire [90:0] stage12_D;
    wire [90:0] stage12_Q;
    assign stage12_D = {stage10_Q[120], stage10_Q[119], stage10_Q[118], stage10_Q[117], stage10_Q[116], stage10_Q[115], stage10_Q[114], stage10_Q[113], stage10_Q[112], w_360, stage10_Q[111], stage10_Q[110], stage10_Q[109], stage10_Q[108], w_358, w_359, stage10_Q[105], stage10_Q[104], stage10_Q[103], w_356, w_357, stage10_Q[98], stage10_Q[97], stage10_Q[96], w_354, w_355, stage10_Q[91], stage10_Q[90], stage10_Q[89], w_352, w_353, stage10_Q[84], stage10_Q[83], stage10_Q[82], w_350, w_351, stage10_Q[77], stage10_Q[76], stage10_Q[75], w_348, w_349, stage10_Q[70], stage10_Q[69], stage10_Q[68], w_346, w_347, stage10_Q[63], stage10_Q[62], stage10_Q[61], w_344, w_345, stage10_Q[56], stage10_Q[55], stage10_Q[54], w_342, w_343, stage10_Q[49], stage10_Q[48], stage10_Q[47], w_340, w_341, stage10_Q[42], stage10_Q[41], stage10_Q[40], w_338, w_339, stage10_Q[35], stage10_Q[34], stage10_Q[33], w_336, w_337, stage10_Q[28], stage10_Q[27], w_334, w_335, stage10_Q[22], w_332, w_333, w_331, w_301, stage10_Q[10], stage10_Q[9], stage10_Q[8], stage10_Q[7], stage10_Q[6], stage10_Q[5], stage10_Q[4], stage10_Q[3], stage10_Q[2], stage10_Q[1], stage10_Q[0]};
    register_bank #(.WIDTH(91)) reg_stage_12 (
        .clk(clk), .rst(rst), .en(en), .D(stage12_D), .Q(stage12_Q)
    );

    // ========================================================
    // Stage 13
    // ========================================================
    wire w_361, w_362;
    full_adder FA_r13_c0 (.a(stage12_Q[15]), .b(stage12_Q[13]), .cin(stage12_Q[14]), .sum(w_361), .carry(w_362));
    wire w_363, w_364;
    full_adder FA_r13_c1 (.a(stage12_Q[18]), .b(stage12_Q[16]), .cin(stage12_Q[17]), .sum(w_363), .carry(w_364));
    wire w_365, w_366;
    full_adder FA_r13_c2 (.a(stage12_Q[22]), .b(stage12_Q[20]), .cin(stage12_Q[21]), .sum(w_365), .carry(w_366));
    wire w_367, w_368;
    full_adder FA_r13_c3 (.a(stage12_Q[27]), .b(stage12_Q[25]), .cin(stage12_Q[26]), .sum(w_367), .carry(w_368));
    wire w_369, w_370;
    full_adder FA_r13_c4 (.a(stage12_Q[32]), .b(stage12_Q[30]), .cin(stage12_Q[31]), .sum(w_369), .carry(w_370));
    wire w_371, w_372;
    full_adder FA_r13_c5 (.a(stage12_Q[37]), .b(stage12_Q[35]), .cin(stage12_Q[36]), .sum(w_371), .carry(w_372));
    wire w_373, w_374;
    full_adder FA_r13_c6 (.a(stage12_Q[42]), .b(stage12_Q[40]), .cin(stage12_Q[41]), .sum(w_373), .carry(w_374));
    wire w_375, w_376;
    full_adder FA_r13_c7 (.a(stage12_Q[47]), .b(stage12_Q[45]), .cin(stage12_Q[46]), .sum(w_375), .carry(w_376));
    wire w_377, w_378;
    full_adder FA_r13_c8 (.a(stage12_Q[52]), .b(stage12_Q[50]), .cin(stage12_Q[51]), .sum(w_377), .carry(w_378));
    wire w_379, w_380;
    full_adder FA_r13_c9 (.a(stage12_Q[57]), .b(stage12_Q[55]), .cin(stage12_Q[56]), .sum(w_379), .carry(w_380));
    wire w_381, w_382;
    full_adder FA_r13_c10 (.a(stage12_Q[62]), .b(stage12_Q[60]), .cin(stage12_Q[61]), .sum(w_381), .carry(w_382));
    wire w_383, w_384;
    full_adder FA_r13_c11 (.a(stage12_Q[67]), .b(stage12_Q[65]), .cin(stage12_Q[66]), .sum(w_383), .carry(w_384));
    wire w_385, w_386;
    full_adder FA_r13_c12 (.a(stage12_Q[72]), .b(stage12_Q[70]), .cin(stage12_Q[71]), .sum(w_385), .carry(w_386));
    wire w_387, w_388;
    full_adder FA_r13_c13 (.a(stage12_Q[77]), .b(stage12_Q[75]), .cin(stage12_Q[76]), .sum(w_387), .carry(w_388));
    wire w_389, w_390;
    full_adder FA_r13_c14 (.a(stage12_Q[82]), .b(stage12_Q[80]), .cin(stage12_Q[81]), .sum(w_389), .carry(w_390));

    // ========================================================
    // Stage 14
    // ========================================================
    wire w_391, w_392;
    full_adder FA_r14_c0 (.a(stage12_Q[19]), .b(w_363), .cin(w_362), .sum(w_391), .carry(w_392));
    wire w_393, w_394;
    full_adder FA_r14_c1 (.a(stage12_Q[23]), .b(w_365), .cin(w_364), .sum(w_393), .carry(w_394));
    wire w_395, w_396;
    full_adder FA_r14_c2 (.a(stage12_Q[28]), .b(w_367), .cin(w_366), .sum(w_395), .carry(w_396));
    wire w_397, w_398;
    full_adder FA_r14_c3 (.a(stage12_Q[33]), .b(w_369), .cin(w_368), .sum(w_397), .carry(w_398));
    wire w_399, w_400;
    full_adder FA_r14_c4 (.a(stage12_Q[38]), .b(w_371), .cin(w_370), .sum(w_399), .carry(w_400));
    wire w_401, w_402;
    full_adder FA_r14_c5 (.a(stage12_Q[43]), .b(w_373), .cin(w_372), .sum(w_401), .carry(w_402));
    wire w_403, w_404;
    full_adder FA_r14_c6 (.a(stage12_Q[48]), .b(w_375), .cin(w_374), .sum(w_403), .carry(w_404));
    wire w_405, w_406;
    full_adder FA_r14_c7 (.a(stage12_Q[53]), .b(w_377), .cin(w_376), .sum(w_405), .carry(w_406));
    wire w_407, w_408;
    full_adder FA_r14_c8 (.a(stage12_Q[58]), .b(w_379), .cin(w_378), .sum(w_407), .carry(w_408));
    wire w_409, w_410;
    full_adder FA_r14_c9 (.a(stage12_Q[63]), .b(w_381), .cin(w_380), .sum(w_409), .carry(w_410));
    wire w_411, w_412;
    full_adder FA_r14_c10 (.a(stage12_Q[68]), .b(w_383), .cin(w_382), .sum(w_411), .carry(w_412));
    wire w_413, w_414;
    full_adder FA_r14_c11 (.a(stage12_Q[73]), .b(w_385), .cin(w_384), .sum(w_413), .carry(w_414));
    wire w_415, w_416;
    full_adder FA_r14_c12 (.a(stage12_Q[78]), .b(w_387), .cin(w_386), .sum(w_415), .carry(w_416));
    wire w_417, w_418;
    full_adder FA_r14_c13 (.a(stage12_Q[83]), .b(w_389), .cin(w_388), .sum(w_417), .carry(w_418));
    wire w_419, w_420;
    full_adder FA_r14_c14 (.a(stage12_Q[86]), .b(stage12_Q[85]), .cin(w_390), .sum(w_419), .carry(w_420));

    // Pipeline Register Bank: Post-Stage 14 Layer
    wire [60:0] stage14_D;
    wire [60:0] stage14_Q;
    assign stage14_D = {stage12_Q[90], stage12_Q[89], w_420, stage12_Q[88], stage12_Q[87], w_418, w_419, stage12_Q[84], w_416, w_417, stage12_Q[79], w_414, w_415, stage12_Q[74], w_412, w_413, stage12_Q[69], w_410, w_411, stage12_Q[64], w_408, w_409, stage12_Q[59], w_406, w_407, stage12_Q[54], w_404, w_405, stage12_Q[49], w_402, w_403, stage12_Q[44], w_400, w_401, stage12_Q[39], w_398, w_399, stage12_Q[34], w_396, w_397, stage12_Q[29], w_394, w_395, stage12_Q[24], w_392, w_393, w_391, w_361, stage12_Q[12], stage12_Q[11], stage12_Q[10], stage12_Q[9], stage12_Q[8], stage12_Q[7], stage12_Q[6], stage12_Q[5], stage12_Q[4], stage12_Q[3], stage12_Q[2], stage12_Q[1], stage12_Q[0]};
    register_bank #(.WIDTH(61)) reg_stage_14 (
        .clk(clk), .rst(rst), .en(en), .D(stage14_D), .Q(stage14_Q)
    );

    // ========================================================
    // Stage 15
    // ========================================================
    wire w_421, w_422;
    full_adder FA_r15_c0 (.a(stage14_Q[17]), .b(stage14_Q[15]), .cin(stage14_Q[16]), .sum(w_421), .carry(w_422));
    wire w_423, w_424;
    full_adder FA_r15_c1 (.a(stage14_Q[20]), .b(stage14_Q[18]), .cin(stage14_Q[19]), .sum(w_423), .carry(w_424));
    wire w_425, w_426;
    full_adder FA_r15_c2 (.a(stage14_Q[23]), .b(stage14_Q[21]), .cin(stage14_Q[22]), .sum(w_425), .carry(w_426));
    wire w_427, w_428;
    full_adder FA_r15_c3 (.a(stage14_Q[26]), .b(stage14_Q[24]), .cin(stage14_Q[25]), .sum(w_427), .carry(w_428));
    wire w_429, w_430;
    full_adder FA_r15_c4 (.a(stage14_Q[29]), .b(stage14_Q[27]), .cin(stage14_Q[28]), .sum(w_429), .carry(w_430));
    wire w_431, w_432;
    full_adder FA_r15_c5 (.a(stage14_Q[32]), .b(stage14_Q[30]), .cin(stage14_Q[31]), .sum(w_431), .carry(w_432));
    wire w_433, w_434;
    full_adder FA_r15_c6 (.a(stage14_Q[35]), .b(stage14_Q[33]), .cin(stage14_Q[34]), .sum(w_433), .carry(w_434));
    wire w_435, w_436;
    full_adder FA_r15_c7 (.a(stage14_Q[38]), .b(stage14_Q[36]), .cin(stage14_Q[37]), .sum(w_435), .carry(w_436));
    wire w_437, w_438;
    full_adder FA_r15_c8 (.a(stage14_Q[41]), .b(stage14_Q[39]), .cin(stage14_Q[40]), .sum(w_437), .carry(w_438));
    wire w_439, w_440;
    full_adder FA_r15_c9 (.a(stage14_Q[44]), .b(stage14_Q[42]), .cin(stage14_Q[43]), .sum(w_439), .carry(w_440));
    wire w_441, w_442;
    full_adder FA_r15_c10 (.a(stage14_Q[47]), .b(stage14_Q[45]), .cin(stage14_Q[46]), .sum(w_441), .carry(w_442));
    wire w_443, w_444;
    full_adder FA_r15_c11 (.a(stage14_Q[50]), .b(stage14_Q[48]), .cin(stage14_Q[49]), .sum(w_443), .carry(w_444));
    wire w_445, w_446;
    full_adder FA_r15_c12 (.a(stage14_Q[53]), .b(stage14_Q[51]), .cin(stage14_Q[52]), .sum(w_445), .carry(w_446));
    wire w_447, w_448;
    full_adder FA_r15_c13 (.a(stage14_Q[56]), .b(stage14_Q[54]), .cin(stage14_Q[55]), .sum(w_447), .carry(w_448));
    wire w_449, w_450;
    full_adder FA_r15_c14 (.a(stage14_Q[59]), .b(stage14_Q[57]), .cin(stage14_Q[58]), .sum(w_449), .carry(w_450));

    // ========================================================
    // Stage 16
    // ========================================================
    wire w_451, w_452;
    half_adder HA_merge_c16 (.a(w_423), .b(w_422), .sum(w_451), .carry(w_452));
    wire w_453, w_454;
    full_adder FA_merge_c17 (.a(w_425), .b(w_424), .cin(w_452), .sum(w_453), .carry(w_454));
    wire w_455, w_456;
    full_adder FA_merge_c18 (.a(w_427), .b(w_426), .cin(w_454), .sum(w_455), .carry(w_456));
    wire w_457, w_458;
    full_adder FA_merge_c19 (.a(w_429), .b(w_428), .cin(w_456), .sum(w_457), .carry(w_458));
    wire w_459, w_460;
    full_adder FA_merge_c20 (.a(w_431), .b(w_430), .cin(w_458), .sum(w_459), .carry(w_460));
    wire w_461, w_462;
    full_adder FA_merge_c21 (.a(w_433), .b(w_432), .cin(w_460), .sum(w_461), .carry(w_462));
    wire w_463, w_464;
    full_adder FA_merge_c22 (.a(w_435), .b(w_434), .cin(w_462), .sum(w_463), .carry(w_464));
    wire w_465, w_466;
    full_adder FA_merge_c23 (.a(w_437), .b(w_436), .cin(w_464), .sum(w_465), .carry(w_466));
    wire w_467, w_468;
    full_adder FA_merge_c24 (.a(w_439), .b(w_438), .cin(w_466), .sum(w_467), .carry(w_468));
    wire w_469, w_470;
    full_adder FA_merge_c25 (.a(w_441), .b(w_440), .cin(w_468), .sum(w_469), .carry(w_470));
    wire w_471, w_472;
    full_adder FA_merge_c26 (.a(w_443), .b(w_442), .cin(w_470), .sum(w_471), .carry(w_472));
    wire w_473, w_474;
    full_adder FA_merge_c27 (.a(w_445), .b(w_444), .cin(w_472), .sum(w_473), .carry(w_474));
    wire w_475, w_476;
    full_adder FA_merge_c28 (.a(w_447), .b(w_446), .cin(w_474), .sum(w_475), .carry(w_476));
    wire w_477, w_478;
    full_adder FA_merge_c29 (.a(w_449), .b(w_448), .cin(w_476), .sum(w_477), .carry(w_478));
    wire w_479, w_480;
    full_adder FA_merge_c30 (.a(stage14_Q[60]), .b(w_450), .cin(w_478), .sum(w_479), .carry(w_480));

    // ========================================================
    // Final Output Assembly
    // (no separate carry-propagate adder needed -- the array +
    // closing ripple merge above already resolve every column
    // to a single final bit)
    // ========================================================
    wire [31:0] raw_final_product;
    assign raw_final_product[0] = stage14_Q[0];
    assign raw_final_product[1] = stage14_Q[1];
    assign raw_final_product[2] = stage14_Q[2];
    assign raw_final_product[3] = stage14_Q[3];
    assign raw_final_product[4] = stage14_Q[4];
    assign raw_final_product[5] = stage14_Q[5];
    assign raw_final_product[6] = stage14_Q[6];
    assign raw_final_product[7] = stage14_Q[7];
    assign raw_final_product[8] = stage14_Q[8];
    assign raw_final_product[9] = stage14_Q[9];
    assign raw_final_product[10] = stage14_Q[10];
    assign raw_final_product[11] = stage14_Q[11];
    assign raw_final_product[12] = stage14_Q[12];
    assign raw_final_product[13] = stage14_Q[13];
    assign raw_final_product[14] = stage14_Q[14];
    assign raw_final_product[15] = w_421;
    assign raw_final_product[16] = w_451;
    assign raw_final_product[17] = w_453;
    assign raw_final_product[18] = w_455;
    assign raw_final_product[19] = w_457;
    assign raw_final_product[20] = w_459;
    assign raw_final_product[21] = w_461;
    assign raw_final_product[22] = w_463;
    assign raw_final_product[23] = w_465;
    assign raw_final_product[24] = w_467;
    assign raw_final_product[25] = w_469;
    assign raw_final_product[26] = w_471;
    assign raw_final_product[27] = w_473;
    assign raw_final_product[28] = w_475;
    assign raw_final_product[29] = w_477;
    assign raw_final_product[30] = w_479;
    assign raw_final_product[31] = w_480;

    // ========================================================
    // Boundary Pipeline Registers: Final Output (Product)
    // ========================================================
    register_bank #(.WIDTH(32)) reg_output_product (
        .clk(clk), .rst(rst), .en(en), .D(raw_final_product), .Q(Product)
    );

endmodule
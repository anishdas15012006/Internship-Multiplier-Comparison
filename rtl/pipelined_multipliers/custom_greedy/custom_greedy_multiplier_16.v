// ============================================================================
// Dynamically Generated Pipelined Custom Greedy Column Reduction Multiplier
// Configuration: N = 16
// ============================================================================

module custom_greedy_multiplier_16 (
    input wire clk,
    input wire rst,
    input wire en,
    input wire [15:0] A,
    input wire [15:0] B,
    output wire [31:0] Product
);

    // Definitive logical critical-path latency
    localparam PIPELINE_LATENCY = 17;

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
    half_adder HA_0 (.a(raw_pp[1]), .b(raw_pp[16]), .sum(w_1), .carry(w_2));

    // ========================================================
    // Stage 2
    // ========================================================
    wire w_3, w_4;
    full_adder FA_0 (.a(raw_pp[2]), .b(raw_pp[17]), .cin(raw_pp[32]), .sum(w_3), .carry(w_4));
    wire w_5, w_6;
    half_adder HA_1 (.a(w_2), .b(w_3), .sum(w_5), .carry(w_6));

    // Pipeline Register Bank: Post-Stage 2 Layer
    wire [254:0] stage2_D;
    wire [254:0] stage2_Q;
    assign stage2_D = {raw_pp[255], raw_pp[254], raw_pp[239], raw_pp[253], raw_pp[238], raw_pp[223], raw_pp[252], raw_pp[237], raw_pp[222], raw_pp[207], raw_pp[251], raw_pp[236], raw_pp[221], raw_pp[206], raw_pp[191], raw_pp[250], raw_pp[235], raw_pp[220], raw_pp[205], raw_pp[190], raw_pp[175], raw_pp[249], raw_pp[234], raw_pp[219], raw_pp[204], raw_pp[189], raw_pp[174], raw_pp[159], raw_pp[248], raw_pp[233], raw_pp[218], raw_pp[203], raw_pp[188], raw_pp[173], raw_pp[158], raw_pp[143], raw_pp[247], raw_pp[232], raw_pp[217], raw_pp[202], raw_pp[187], raw_pp[172], raw_pp[157], raw_pp[142], raw_pp[127], raw_pp[246], raw_pp[231], raw_pp[216], raw_pp[201], raw_pp[186], raw_pp[171], raw_pp[156], raw_pp[141], raw_pp[126], raw_pp[111], raw_pp[245], raw_pp[230], raw_pp[215], raw_pp[200], raw_pp[185], raw_pp[170], raw_pp[155], raw_pp[140], raw_pp[125], raw_pp[110], raw_pp[95], raw_pp[244], raw_pp[229], raw_pp[214], raw_pp[199], raw_pp[184], raw_pp[169], raw_pp[154], raw_pp[139], raw_pp[124], raw_pp[109], raw_pp[94], raw_pp[79], raw_pp[243], raw_pp[228], raw_pp[213], raw_pp[198], raw_pp[183], raw_pp[168], raw_pp[153], raw_pp[138], raw_pp[123], raw_pp[108], raw_pp[93], raw_pp[78], raw_pp[63], raw_pp[242], raw_pp[227], raw_pp[212], raw_pp[197], raw_pp[182], raw_pp[167], raw_pp[152], raw_pp[137], raw_pp[122], raw_pp[107], raw_pp[92], raw_pp[77], raw_pp[62], raw_pp[47], raw_pp[241], raw_pp[226], raw_pp[211], raw_pp[196], raw_pp[181], raw_pp[166], raw_pp[151], raw_pp[136], raw_pp[121], raw_pp[106], raw_pp[91], raw_pp[76], raw_pp[61], raw_pp[46], raw_pp[31], raw_pp[240], raw_pp[225], raw_pp[210], raw_pp[195], raw_pp[180], raw_pp[165], raw_pp[150], raw_pp[135], raw_pp[120], raw_pp[105], raw_pp[90], raw_pp[75], raw_pp[60], raw_pp[45], raw_pp[30], raw_pp[15], raw_pp[224], raw_pp[209], raw_pp[194], raw_pp[179], raw_pp[164], raw_pp[149], raw_pp[134], raw_pp[119], raw_pp[104], raw_pp[89], raw_pp[74], raw_pp[59], raw_pp[44], raw_pp[29], raw_pp[14], raw_pp[208], raw_pp[193], raw_pp[178], raw_pp[163], raw_pp[148], raw_pp[133], raw_pp[118], raw_pp[103], raw_pp[88], raw_pp[73], raw_pp[58], raw_pp[43], raw_pp[28], raw_pp[13], raw_pp[192], raw_pp[177], raw_pp[162], raw_pp[147], raw_pp[132], raw_pp[117], raw_pp[102], raw_pp[87], raw_pp[72], raw_pp[57], raw_pp[42], raw_pp[27], raw_pp[12], raw_pp[176], raw_pp[161], raw_pp[146], raw_pp[131], raw_pp[116], raw_pp[101], raw_pp[86], raw_pp[71], raw_pp[56], raw_pp[41], raw_pp[26], raw_pp[11], raw_pp[160], raw_pp[145], raw_pp[130], raw_pp[115], raw_pp[100], raw_pp[85], raw_pp[70], raw_pp[55], raw_pp[40], raw_pp[25], raw_pp[10], raw_pp[144], raw_pp[129], raw_pp[114], raw_pp[99], raw_pp[84], raw_pp[69], raw_pp[54], raw_pp[39], raw_pp[24], raw_pp[9], raw_pp[128], raw_pp[113], raw_pp[98], raw_pp[83], raw_pp[68], raw_pp[53], raw_pp[38], raw_pp[23], raw_pp[8], raw_pp[112], raw_pp[97], raw_pp[82], raw_pp[67], raw_pp[52], raw_pp[37], raw_pp[22], raw_pp[7], raw_pp[96], raw_pp[81], raw_pp[66], raw_pp[51], raw_pp[36], raw_pp[21], raw_pp[6], raw_pp[80], raw_pp[65], raw_pp[50], raw_pp[35], raw_pp[20], raw_pp[5], raw_pp[64], raw_pp[49], raw_pp[34], raw_pp[19], raw_pp[4], w_6, w_4, raw_pp[48], raw_pp[33], raw_pp[18], raw_pp[3], w_5, w_1, raw_pp[0]};
    register_bank #(.WIDTH(255)) reg_stage_2 (
        .clk(clk), .rst(rst), .en(en), .D(stage2_D), .Q(stage2_Q)
    );

    // ========================================================
    // Stage 3
    // ========================================================
    wire w_7, w_8;
    full_adder FA_1 (.a(stage2_Q[3]), .b(stage2_Q[4]), .cin(stage2_Q[5]), .sum(w_7), .carry(w_8));
    wire w_9, w_10;
    full_adder FA_2 (.a(stage2_Q[6]), .b(stage2_Q[7]), .cin(stage2_Q[8]), .sum(w_9), .carry(w_10));
    wire w_11, w_12;
    half_adder HA_2 (.a(w_7), .b(w_9), .sum(w_11), .carry(w_12));

    // ========================================================
    // Stage 4
    // ========================================================
    wire w_13, w_14;
    full_adder FA_3 (.a(stage2_Q[9]), .b(stage2_Q[10]), .cin(stage2_Q[11]), .sum(w_13), .carry(w_14));
    wire w_15, w_16;
    full_adder FA_4 (.a(stage2_Q[12]), .b(stage2_Q[13]), .cin(w_8), .sum(w_15), .carry(w_16));
    wire w_17, w_18;
    full_adder FA_5 (.a(w_10), .b(w_12), .cin(w_13), .sum(w_17), .carry(w_18));
    wire w_19, w_20;
    half_adder HA_3 (.a(w_15), .b(w_17), .sum(w_19), .carry(w_20));

    // Pipeline Register Bank: Post-Stage 4 Layer
    wire [249:0] stage4_D;
    wire [249:0] stage4_Q;
    assign stage4_D = {stage2_Q[254], stage2_Q[253], stage2_Q[252], stage2_Q[251], stage2_Q[250], stage2_Q[249], stage2_Q[248], stage2_Q[247], stage2_Q[246], stage2_Q[245], stage2_Q[244], stage2_Q[243], stage2_Q[242], stage2_Q[241], stage2_Q[240], stage2_Q[239], stage2_Q[238], stage2_Q[237], stage2_Q[236], stage2_Q[235], stage2_Q[234], stage2_Q[233], stage2_Q[232], stage2_Q[231], stage2_Q[230], stage2_Q[229], stage2_Q[228], stage2_Q[227], stage2_Q[226], stage2_Q[225], stage2_Q[224], stage2_Q[223], stage2_Q[222], stage2_Q[221], stage2_Q[220], stage2_Q[219], stage2_Q[218], stage2_Q[217], stage2_Q[216], stage2_Q[215], stage2_Q[214], stage2_Q[213], stage2_Q[212], stage2_Q[211], stage2_Q[210], stage2_Q[209], stage2_Q[208], stage2_Q[207], stage2_Q[206], stage2_Q[205], stage2_Q[204], stage2_Q[203], stage2_Q[202], stage2_Q[201], stage2_Q[200], stage2_Q[199], stage2_Q[198], stage2_Q[197], stage2_Q[196], stage2_Q[195], stage2_Q[194], stage2_Q[193], stage2_Q[192], stage2_Q[191], stage2_Q[190], stage2_Q[189], stage2_Q[188], stage2_Q[187], stage2_Q[186], stage2_Q[185], stage2_Q[184], stage2_Q[183], stage2_Q[182], stage2_Q[181], stage2_Q[180], stage2_Q[179], stage2_Q[178], stage2_Q[177], stage2_Q[176], stage2_Q[175], stage2_Q[174], stage2_Q[173], stage2_Q[172], stage2_Q[171], stage2_Q[170], stage2_Q[169], stage2_Q[168], stage2_Q[167], stage2_Q[166], stage2_Q[165], stage2_Q[164], stage2_Q[163], stage2_Q[162], stage2_Q[161], stage2_Q[160], stage2_Q[159], stage2_Q[158], stage2_Q[157], stage2_Q[156], stage2_Q[155], stage2_Q[154], stage2_Q[153], stage2_Q[152], stage2_Q[151], stage2_Q[150], stage2_Q[149], stage2_Q[148], stage2_Q[147], stage2_Q[146], stage2_Q[145], stage2_Q[144], stage2_Q[143], stage2_Q[142], stage2_Q[141], stage2_Q[140], stage2_Q[139], stage2_Q[138], stage2_Q[137], stage2_Q[136], stage2_Q[135], stage2_Q[134], stage2_Q[133], stage2_Q[132], stage2_Q[131], stage2_Q[130], stage2_Q[129], stage2_Q[128], stage2_Q[127], stage2_Q[126], stage2_Q[125], stage2_Q[124], stage2_Q[123], stage2_Q[122], stage2_Q[121], stage2_Q[120], stage2_Q[119], stage2_Q[118], stage2_Q[117], stage2_Q[116], stage2_Q[115], stage2_Q[114], stage2_Q[113], stage2_Q[112], stage2_Q[111], stage2_Q[110], stage2_Q[109], stage2_Q[108], stage2_Q[107], stage2_Q[106], stage2_Q[105], stage2_Q[104], stage2_Q[103], stage2_Q[102], stage2_Q[101], stage2_Q[100], stage2_Q[99], stage2_Q[98], stage2_Q[97], stage2_Q[96], stage2_Q[95], stage2_Q[94], stage2_Q[93], stage2_Q[92], stage2_Q[91], stage2_Q[90], stage2_Q[89], stage2_Q[88], stage2_Q[87], stage2_Q[86], stage2_Q[85], stage2_Q[84], stage2_Q[83], stage2_Q[82], stage2_Q[81], stage2_Q[80], stage2_Q[79], stage2_Q[78], stage2_Q[77], stage2_Q[76], stage2_Q[75], stage2_Q[74], stage2_Q[73], stage2_Q[72], stage2_Q[71], stage2_Q[70], stage2_Q[69], stage2_Q[68], stage2_Q[67], stage2_Q[66], stage2_Q[65], stage2_Q[64], stage2_Q[63], stage2_Q[62], stage2_Q[61], stage2_Q[60], stage2_Q[59], stage2_Q[58], stage2_Q[57], stage2_Q[56], stage2_Q[55], stage2_Q[54], stage2_Q[53], stage2_Q[52], stage2_Q[51], stage2_Q[50], stage2_Q[49], stage2_Q[48], stage2_Q[47], stage2_Q[46], stage2_Q[45], stage2_Q[44], stage2_Q[43], stage2_Q[42], stage2_Q[41], stage2_Q[40], stage2_Q[39], stage2_Q[38], stage2_Q[37], stage2_Q[36], stage2_Q[35], stage2_Q[34], stage2_Q[33], stage2_Q[32], stage2_Q[31], stage2_Q[30], stage2_Q[29], stage2_Q[28], stage2_Q[27], stage2_Q[26], stage2_Q[25], stage2_Q[24], stage2_Q[23], stage2_Q[22], stage2_Q[21], stage2_Q[20], w_20, w_18, w_16, w_14, stage2_Q[19], stage2_Q[18], stage2_Q[17], stage2_Q[16], stage2_Q[15], stage2_Q[14], w_19, w_11, stage2_Q[2], stage2_Q[1], stage2_Q[0]};
    register_bank #(.WIDTH(250)) reg_stage_4 (
        .clk(clk), .rst(rst), .en(en), .D(stage4_D), .Q(stage4_Q)
    );

    // ========================================================
    // Stage 5
    // ========================================================
    wire w_21, w_22;
    full_adder FA_6 (.a(stage4_Q[5]), .b(stage4_Q[6]), .cin(stage4_Q[7]), .sum(w_21), .carry(w_22));
    wire w_23, w_24;
    full_adder FA_7 (.a(stage4_Q[8]), .b(stage4_Q[9]), .cin(stage4_Q[10]), .sum(w_23), .carry(w_24));
    wire w_25, w_26;
    full_adder FA_8 (.a(stage4_Q[11]), .b(stage4_Q[12]), .cin(stage4_Q[13]), .sum(w_25), .carry(w_26));
    wire w_27, w_28;
    full_adder FA_9 (.a(stage4_Q[14]), .b(w_21), .cin(w_23), .sum(w_27), .carry(w_28));
    wire w_29, w_30;
    half_adder HA_4 (.a(w_25), .b(w_27), .sum(w_29), .carry(w_30));

    // ========================================================
    // Stage 6
    // ========================================================
    wire w_31, w_32;
    full_adder FA_10 (.a(stage4_Q[15]), .b(stage4_Q[16]), .cin(stage4_Q[17]), .sum(w_31), .carry(w_32));
    wire w_33, w_34;
    full_adder FA_11 (.a(stage4_Q[18]), .b(stage4_Q[19]), .cin(stage4_Q[20]), .sum(w_33), .carry(w_34));
    wire w_35, w_36;
    full_adder FA_12 (.a(stage4_Q[21]), .b(w_22), .cin(w_24), .sum(w_35), .carry(w_36));
    wire w_37, w_38;
    full_adder FA_13 (.a(w_26), .b(w_28), .cin(w_30), .sum(w_37), .carry(w_38));
    wire w_39, w_40;
    full_adder FA_14 (.a(w_31), .b(w_33), .cin(w_35), .sum(w_39), .carry(w_40));
    wire w_41, w_42;
    half_adder HA_5 (.a(w_37), .b(w_39), .sum(w_41), .carry(w_42));

    // Pipeline Register Bank: Post-Stage 6 Layer
    wire [240:0] stage6_D;
    wire [240:0] stage6_Q;
    assign stage6_D = {stage4_Q[249], stage4_Q[248], stage4_Q[247], stage4_Q[246], stage4_Q[245], stage4_Q[244], stage4_Q[243], stage4_Q[242], stage4_Q[241], stage4_Q[240], stage4_Q[239], stage4_Q[238], stage4_Q[237], stage4_Q[236], stage4_Q[235], stage4_Q[234], stage4_Q[233], stage4_Q[232], stage4_Q[231], stage4_Q[230], stage4_Q[229], stage4_Q[228], stage4_Q[227], stage4_Q[226], stage4_Q[225], stage4_Q[224], stage4_Q[223], stage4_Q[222], stage4_Q[221], stage4_Q[220], stage4_Q[219], stage4_Q[218], stage4_Q[217], stage4_Q[216], stage4_Q[215], stage4_Q[214], stage4_Q[213], stage4_Q[212], stage4_Q[211], stage4_Q[210], stage4_Q[209], stage4_Q[208], stage4_Q[207], stage4_Q[206], stage4_Q[205], stage4_Q[204], stage4_Q[203], stage4_Q[202], stage4_Q[201], stage4_Q[200], stage4_Q[199], stage4_Q[198], stage4_Q[197], stage4_Q[196], stage4_Q[195], stage4_Q[194], stage4_Q[193], stage4_Q[192], stage4_Q[191], stage4_Q[190], stage4_Q[189], stage4_Q[188], stage4_Q[187], stage4_Q[186], stage4_Q[185], stage4_Q[184], stage4_Q[183], stage4_Q[182], stage4_Q[181], stage4_Q[180], stage4_Q[179], stage4_Q[178], stage4_Q[177], stage4_Q[176], stage4_Q[175], stage4_Q[174], stage4_Q[173], stage4_Q[172], stage4_Q[171], stage4_Q[170], stage4_Q[169], stage4_Q[168], stage4_Q[167], stage4_Q[166], stage4_Q[165], stage4_Q[164], stage4_Q[163], stage4_Q[162], stage4_Q[161], stage4_Q[160], stage4_Q[159], stage4_Q[158], stage4_Q[157], stage4_Q[156], stage4_Q[155], stage4_Q[154], stage4_Q[153], stage4_Q[152], stage4_Q[151], stage4_Q[150], stage4_Q[149], stage4_Q[148], stage4_Q[147], stage4_Q[146], stage4_Q[145], stage4_Q[144], stage4_Q[143], stage4_Q[142], stage4_Q[141], stage4_Q[140], stage4_Q[139], stage4_Q[138], stage4_Q[137], stage4_Q[136], stage4_Q[135], stage4_Q[134], stage4_Q[133], stage4_Q[132], stage4_Q[131], stage4_Q[130], stage4_Q[129], stage4_Q[128], stage4_Q[127], stage4_Q[126], stage4_Q[125], stage4_Q[124], stage4_Q[123], stage4_Q[122], stage4_Q[121], stage4_Q[120], stage4_Q[119], stage4_Q[118], stage4_Q[117], stage4_Q[116], stage4_Q[115], stage4_Q[114], stage4_Q[113], stage4_Q[112], stage4_Q[111], stage4_Q[110], stage4_Q[109], stage4_Q[108], stage4_Q[107], stage4_Q[106], stage4_Q[105], stage4_Q[104], stage4_Q[103], stage4_Q[102], stage4_Q[101], stage4_Q[100], stage4_Q[99], stage4_Q[98], stage4_Q[97], stage4_Q[96], stage4_Q[95], stage4_Q[94], stage4_Q[93], stage4_Q[92], stage4_Q[91], stage4_Q[90], stage4_Q[89], stage4_Q[88], stage4_Q[87], stage4_Q[86], stage4_Q[85], stage4_Q[84], stage4_Q[83], stage4_Q[82], stage4_Q[81], stage4_Q[80], stage4_Q[79], stage4_Q[78], stage4_Q[77], stage4_Q[76], stage4_Q[75], stage4_Q[74], stage4_Q[73], stage4_Q[72], stage4_Q[71], stage4_Q[70], stage4_Q[69], stage4_Q[68], stage4_Q[67], stage4_Q[66], stage4_Q[65], stage4_Q[64], stage4_Q[63], stage4_Q[62], stage4_Q[61], stage4_Q[60], stage4_Q[59], stage4_Q[58], stage4_Q[57], stage4_Q[56], stage4_Q[55], stage4_Q[54], stage4_Q[53], stage4_Q[52], stage4_Q[51], stage4_Q[50], stage4_Q[49], stage4_Q[48], stage4_Q[47], stage4_Q[46], stage4_Q[45], stage4_Q[44], stage4_Q[43], stage4_Q[42], stage4_Q[41], stage4_Q[40], stage4_Q[39], stage4_Q[38], stage4_Q[37], stage4_Q[36], stage4_Q[35], stage4_Q[34], stage4_Q[33], stage4_Q[32], stage4_Q[31], stage4_Q[30], w_42, w_40, w_38, w_36, w_34, w_32, stage4_Q[29], stage4_Q[28], stage4_Q[27], stage4_Q[26], stage4_Q[25], stage4_Q[24], stage4_Q[23], stage4_Q[22], w_41, w_29, stage4_Q[4], stage4_Q[3], stage4_Q[2], stage4_Q[1], stage4_Q[0]};
    register_bank #(.WIDTH(241)) reg_stage_6 (
        .clk(clk), .rst(rst), .en(en), .D(stage6_D), .Q(stage6_Q)
    );

    // ========================================================
    // Stage 7
    // ========================================================
    wire w_43, w_44;
    full_adder FA_15 (.a(stage6_Q[7]), .b(stage6_Q[8]), .cin(stage6_Q[9]), .sum(w_43), .carry(w_44));
    wire w_45, w_46;
    full_adder FA_16 (.a(stage6_Q[10]), .b(stage6_Q[11]), .cin(stage6_Q[12]), .sum(w_45), .carry(w_46));
    wire w_47, w_48;
    full_adder FA_17 (.a(stage6_Q[13]), .b(stage6_Q[14]), .cin(stage6_Q[15]), .sum(w_47), .carry(w_48));
    wire w_49, w_50;
    full_adder FA_18 (.a(stage6_Q[16]), .b(stage6_Q[17]), .cin(stage6_Q[18]), .sum(w_49), .carry(w_50));
    wire w_51, w_52;
    full_adder FA_19 (.a(stage6_Q[19]), .b(stage6_Q[20]), .cin(w_43), .sum(w_51), .carry(w_52));
    wire w_53, w_54;
    full_adder FA_20 (.a(w_45), .b(w_47), .cin(w_49), .sum(w_53), .carry(w_54));
    wire w_55, w_56;
    half_adder HA_6 (.a(w_51), .b(w_53), .sum(w_55), .carry(w_56));

    // ========================================================
    // Stage 8
    // ========================================================
    wire w_57, w_58;
    full_adder FA_21 (.a(stage6_Q[21]), .b(stage6_Q[22]), .cin(stage6_Q[23]), .sum(w_57), .carry(w_58));
    wire w_59, w_60;
    full_adder FA_22 (.a(stage6_Q[24]), .b(stage6_Q[25]), .cin(stage6_Q[26]), .sum(w_59), .carry(w_60));
    wire w_61, w_62;
    full_adder FA_23 (.a(stage6_Q[27]), .b(stage6_Q[28]), .cin(stage6_Q[29]), .sum(w_61), .carry(w_62));
    wire w_63, w_64;
    full_adder FA_24 (.a(w_44), .b(w_46), .cin(w_48), .sum(w_63), .carry(w_64));
    wire w_65, w_66;
    full_adder FA_25 (.a(w_50), .b(w_52), .cin(w_54), .sum(w_65), .carry(w_66));
    wire w_67, w_68;
    full_adder FA_26 (.a(w_56), .b(w_57), .cin(w_59), .sum(w_67), .carry(w_68));
    wire w_69, w_70;
    full_adder FA_27 (.a(w_61), .b(w_63), .cin(w_65), .sum(w_69), .carry(w_70));
    wire w_71, w_72;
    half_adder HA_7 (.a(w_67), .b(w_69), .sum(w_71), .carry(w_72));

    // Pipeline Register Bank: Post-Stage 8 Layer
    wire [227:0] stage8_D;
    wire [227:0] stage8_Q;
    assign stage8_D = {stage6_Q[240], stage6_Q[239], stage6_Q[238], stage6_Q[237], stage6_Q[236], stage6_Q[235], stage6_Q[234], stage6_Q[233], stage6_Q[232], stage6_Q[231], stage6_Q[230], stage6_Q[229], stage6_Q[228], stage6_Q[227], stage6_Q[226], stage6_Q[225], stage6_Q[224], stage6_Q[223], stage6_Q[222], stage6_Q[221], stage6_Q[220], stage6_Q[219], stage6_Q[218], stage6_Q[217], stage6_Q[216], stage6_Q[215], stage6_Q[214], stage6_Q[213], stage6_Q[212], stage6_Q[211], stage6_Q[210], stage6_Q[209], stage6_Q[208], stage6_Q[207], stage6_Q[206], stage6_Q[205], stage6_Q[204], stage6_Q[203], stage6_Q[202], stage6_Q[201], stage6_Q[200], stage6_Q[199], stage6_Q[198], stage6_Q[197], stage6_Q[196], stage6_Q[195], stage6_Q[194], stage6_Q[193], stage6_Q[192], stage6_Q[191], stage6_Q[190], stage6_Q[189], stage6_Q[188], stage6_Q[187], stage6_Q[186], stage6_Q[185], stage6_Q[184], stage6_Q[183], stage6_Q[182], stage6_Q[181], stage6_Q[180], stage6_Q[179], stage6_Q[178], stage6_Q[177], stage6_Q[176], stage6_Q[175], stage6_Q[174], stage6_Q[173], stage6_Q[172], stage6_Q[171], stage6_Q[170], stage6_Q[169], stage6_Q[168], stage6_Q[167], stage6_Q[166], stage6_Q[165], stage6_Q[164], stage6_Q[163], stage6_Q[162], stage6_Q[161], stage6_Q[160], stage6_Q[159], stage6_Q[158], stage6_Q[157], stage6_Q[156], stage6_Q[155], stage6_Q[154], stage6_Q[153], stage6_Q[152], stage6_Q[151], stage6_Q[150], stage6_Q[149], stage6_Q[148], stage6_Q[147], stage6_Q[146], stage6_Q[145], stage6_Q[144], stage6_Q[143], stage6_Q[142], stage6_Q[141], stage6_Q[140], stage6_Q[139], stage6_Q[138], stage6_Q[137], stage6_Q[136], stage6_Q[135], stage6_Q[134], stage6_Q[133], stage6_Q[132], stage6_Q[131], stage6_Q[130], stage6_Q[129], stage6_Q[128], stage6_Q[127], stage6_Q[126], stage6_Q[125], stage6_Q[124], stage6_Q[123], stage6_Q[122], stage6_Q[121], stage6_Q[120], stage6_Q[119], stage6_Q[118], stage6_Q[117], stage6_Q[116], stage6_Q[115], stage6_Q[114], stage6_Q[113], stage6_Q[112], stage6_Q[111], stage6_Q[110], stage6_Q[109], stage6_Q[108], stage6_Q[107], stage6_Q[106], stage6_Q[105], stage6_Q[104], stage6_Q[103], stage6_Q[102], stage6_Q[101], stage6_Q[100], stage6_Q[99], stage6_Q[98], stage6_Q[97], stage6_Q[96], stage6_Q[95], stage6_Q[94], stage6_Q[93], stage6_Q[92], stage6_Q[91], stage6_Q[90], stage6_Q[89], stage6_Q[88], stage6_Q[87], stage6_Q[86], stage6_Q[85], stage6_Q[84], stage6_Q[83], stage6_Q[82], stage6_Q[81], stage6_Q[80], stage6_Q[79], stage6_Q[78], stage6_Q[77], stage6_Q[76], stage6_Q[75], stage6_Q[74], stage6_Q[73], stage6_Q[72], stage6_Q[71], stage6_Q[70], stage6_Q[69], stage6_Q[68], stage6_Q[67], stage6_Q[66], stage6_Q[65], stage6_Q[64], stage6_Q[63], stage6_Q[62], stage6_Q[61], stage6_Q[60], stage6_Q[59], stage6_Q[58], stage6_Q[57], stage6_Q[56], stage6_Q[55], stage6_Q[54], stage6_Q[53], stage6_Q[52], stage6_Q[51], stage6_Q[50], stage6_Q[49], stage6_Q[48], stage6_Q[47], stage6_Q[46], stage6_Q[45], stage6_Q[44], stage6_Q[43], stage6_Q[42], stage6_Q[41], stage6_Q[40], w_72, w_70, w_68, w_66, w_64, w_62, w_60, w_58, stage6_Q[39], stage6_Q[38], stage6_Q[37], stage6_Q[36], stage6_Q[35], stage6_Q[34], stage6_Q[33], stage6_Q[32], stage6_Q[31], stage6_Q[30], w_71, w_55, stage6_Q[6], stage6_Q[5], stage6_Q[4], stage6_Q[3], stage6_Q[2], stage6_Q[1], stage6_Q[0]};
    register_bank #(.WIDTH(228)) reg_stage_8 (
        .clk(clk), .rst(rst), .en(en), .D(stage8_D), .Q(stage8_Q)
    );

    // ========================================================
    // Stage 9
    // ========================================================
    wire w_73, w_74;
    full_adder FA_28 (.a(stage8_Q[9]), .b(stage8_Q[10]), .cin(stage8_Q[11]), .sum(w_73), .carry(w_74));
    wire w_75, w_76;
    full_adder FA_29 (.a(stage8_Q[12]), .b(stage8_Q[13]), .cin(stage8_Q[14]), .sum(w_75), .carry(w_76));
    wire w_77, w_78;
    full_adder FA_30 (.a(stage8_Q[15]), .b(stage8_Q[16]), .cin(stage8_Q[17]), .sum(w_77), .carry(w_78));
    wire w_79, w_80;
    full_adder FA_31 (.a(stage8_Q[18]), .b(stage8_Q[19]), .cin(stage8_Q[20]), .sum(w_79), .carry(w_80));
    wire w_81, w_82;
    full_adder FA_32 (.a(stage8_Q[21]), .b(stage8_Q[22]), .cin(stage8_Q[23]), .sum(w_81), .carry(w_82));
    wire w_83, w_84;
    full_adder FA_33 (.a(stage8_Q[24]), .b(stage8_Q[25]), .cin(stage8_Q[26]), .sum(w_83), .carry(w_84));
    wire w_85, w_86;
    full_adder FA_34 (.a(w_73), .b(w_75), .cin(w_77), .sum(w_85), .carry(w_86));
    wire w_87, w_88;
    full_adder FA_35 (.a(w_79), .b(w_81), .cin(w_83), .sum(w_87), .carry(w_88));
    wire w_89, w_90;
    half_adder HA_8 (.a(w_85), .b(w_87), .sum(w_89), .carry(w_90));

    // ========================================================
    // Stage 10
    // ========================================================
    wire w_91, w_92;
    full_adder FA_36 (.a(stage8_Q[27]), .b(stage8_Q[28]), .cin(stage8_Q[29]), .sum(w_91), .carry(w_92));
    wire w_93, w_94;
    full_adder FA_37 (.a(stage8_Q[30]), .b(stage8_Q[31]), .cin(stage8_Q[32]), .sum(w_93), .carry(w_94));
    wire w_95, w_96;
    full_adder FA_38 (.a(stage8_Q[33]), .b(stage8_Q[34]), .cin(stage8_Q[35]), .sum(w_95), .carry(w_96));
    wire w_97, w_98;
    full_adder FA_39 (.a(stage8_Q[36]), .b(stage8_Q[37]), .cin(w_74), .sum(w_97), .carry(w_98));
    wire w_99, w_100;
    full_adder FA_40 (.a(w_76), .b(w_78), .cin(w_80), .sum(w_99), .carry(w_100));
    wire w_101, w_102;
    full_adder FA_41 (.a(w_82), .b(w_84), .cin(w_86), .sum(w_101), .carry(w_102));
    wire w_103, w_104;
    full_adder FA_42 (.a(w_88), .b(w_90), .cin(w_91), .sum(w_103), .carry(w_104));
    wire w_105, w_106;
    full_adder FA_43 (.a(w_93), .b(w_95), .cin(w_97), .sum(w_105), .carry(w_106));
    wire w_107, w_108;
    full_adder FA_44 (.a(w_99), .b(w_101), .cin(w_103), .sum(w_107), .carry(w_108));
    wire w_109, w_110;
    half_adder HA_9 (.a(w_105), .b(w_107), .sum(w_109), .carry(w_110));

    // Pipeline Register Bank: Post-Stage 10 Layer
    wire [210:0] stage10_D;
    wire [210:0] stage10_Q;
    assign stage10_D = {stage8_Q[227], stage8_Q[226], stage8_Q[225], stage8_Q[224], stage8_Q[223], stage8_Q[222], stage8_Q[221], stage8_Q[220], stage8_Q[219], stage8_Q[218], stage8_Q[217], stage8_Q[216], stage8_Q[215], stage8_Q[214], stage8_Q[213], stage8_Q[212], stage8_Q[211], stage8_Q[210], stage8_Q[209], stage8_Q[208], stage8_Q[207], stage8_Q[206], stage8_Q[205], stage8_Q[204], stage8_Q[203], stage8_Q[202], stage8_Q[201], stage8_Q[200], stage8_Q[199], stage8_Q[198], stage8_Q[197], stage8_Q[196], stage8_Q[195], stage8_Q[194], stage8_Q[193], stage8_Q[192], stage8_Q[191], stage8_Q[190], stage8_Q[189], stage8_Q[188], stage8_Q[187], stage8_Q[186], stage8_Q[185], stage8_Q[184], stage8_Q[183], stage8_Q[182], stage8_Q[181], stage8_Q[180], stage8_Q[179], stage8_Q[178], stage8_Q[177], stage8_Q[176], stage8_Q[175], stage8_Q[174], stage8_Q[173], stage8_Q[172], stage8_Q[171], stage8_Q[170], stage8_Q[169], stage8_Q[168], stage8_Q[167], stage8_Q[166], stage8_Q[165], stage8_Q[164], stage8_Q[163], stage8_Q[162], stage8_Q[161], stage8_Q[160], stage8_Q[159], stage8_Q[158], stage8_Q[157], stage8_Q[156], stage8_Q[155], stage8_Q[154], stage8_Q[153], stage8_Q[152], stage8_Q[151], stage8_Q[150], stage8_Q[149], stage8_Q[148], stage8_Q[147], stage8_Q[146], stage8_Q[145], stage8_Q[144], stage8_Q[143], stage8_Q[142], stage8_Q[141], stage8_Q[140], stage8_Q[139], stage8_Q[138], stage8_Q[137], stage8_Q[136], stage8_Q[135], stage8_Q[134], stage8_Q[133], stage8_Q[132], stage8_Q[131], stage8_Q[130], stage8_Q[129], stage8_Q[128], stage8_Q[127], stage8_Q[126], stage8_Q[125], stage8_Q[124], stage8_Q[123], stage8_Q[122], stage8_Q[121], stage8_Q[120], stage8_Q[119], stage8_Q[118], stage8_Q[117], stage8_Q[116], stage8_Q[115], stage8_Q[114], stage8_Q[113], stage8_Q[112], stage8_Q[111], stage8_Q[110], stage8_Q[109], stage8_Q[108], stage8_Q[107], stage8_Q[106], stage8_Q[105], stage8_Q[104], stage8_Q[103], stage8_Q[102], stage8_Q[101], stage8_Q[100], stage8_Q[99], stage8_Q[98], stage8_Q[97], stage8_Q[96], stage8_Q[95], stage8_Q[94], stage8_Q[93], stage8_Q[92], stage8_Q[91], stage8_Q[90], stage8_Q[89], stage8_Q[88], stage8_Q[87], stage8_Q[86], stage8_Q[85], stage8_Q[84], stage8_Q[83], stage8_Q[82], stage8_Q[81], stage8_Q[80], stage8_Q[79], stage8_Q[78], stage8_Q[77], stage8_Q[76], stage8_Q[75], stage8_Q[74], stage8_Q[73], stage8_Q[72], stage8_Q[71], stage8_Q[70], stage8_Q[69], stage8_Q[68], stage8_Q[67], stage8_Q[66], stage8_Q[65], stage8_Q[64], stage8_Q[63], stage8_Q[62], stage8_Q[61], stage8_Q[60], stage8_Q[59], stage8_Q[58], stage8_Q[57], stage8_Q[56], stage8_Q[55], stage8_Q[54], stage8_Q[53], stage8_Q[52], stage8_Q[51], stage8_Q[50], w_110, w_108, w_106, w_104, w_102, w_100, w_98, w_96, w_94, w_92, stage8_Q[49], stage8_Q[48], stage8_Q[47], stage8_Q[46], stage8_Q[45], stage8_Q[44], stage8_Q[43], stage8_Q[42], stage8_Q[41], stage8_Q[40], stage8_Q[39], stage8_Q[38], w_109, w_89, stage8_Q[8], stage8_Q[7], stage8_Q[6], stage8_Q[5], stage8_Q[4], stage8_Q[3], stage8_Q[2], stage8_Q[1], stage8_Q[0]};
    register_bank #(.WIDTH(211)) reg_stage_10 (
        .clk(clk), .rst(rst), .en(en), .D(stage10_D), .Q(stage10_Q)
    );

    // ========================================================
    // Stage 11
    // ========================================================
    wire w_111, w_112;
    full_adder FA_45 (.a(stage10_Q[11]), .b(stage10_Q[12]), .cin(stage10_Q[13]), .sum(w_111), .carry(w_112));
    wire w_113, w_114;
    full_adder FA_46 (.a(stage10_Q[14]), .b(stage10_Q[15]), .cin(stage10_Q[16]), .sum(w_113), .carry(w_114));
    wire w_115, w_116;
    full_adder FA_47 (.a(stage10_Q[17]), .b(stage10_Q[18]), .cin(stage10_Q[19]), .sum(w_115), .carry(w_116));
    wire w_117, w_118;
    full_adder FA_48 (.a(stage10_Q[20]), .b(stage10_Q[21]), .cin(stage10_Q[22]), .sum(w_117), .carry(w_118));
    wire w_119, w_120;
    full_adder FA_49 (.a(stage10_Q[23]), .b(stage10_Q[24]), .cin(stage10_Q[25]), .sum(w_119), .carry(w_120));
    wire w_121, w_122;
    full_adder FA_50 (.a(stage10_Q[26]), .b(stage10_Q[27]), .cin(stage10_Q[28]), .sum(w_121), .carry(w_122));
    wire w_123, w_124;
    full_adder FA_51 (.a(stage10_Q[29]), .b(stage10_Q[30]), .cin(stage10_Q[31]), .sum(w_123), .carry(w_124));
    wire w_125, w_126;
    full_adder FA_52 (.a(stage10_Q[32]), .b(w_111), .cin(w_113), .sum(w_125), .carry(w_126));
    wire w_127, w_128;
    full_adder FA_53 (.a(w_115), .b(w_117), .cin(w_119), .sum(w_127), .carry(w_128));
    wire w_129, w_130;
    full_adder FA_54 (.a(w_121), .b(w_123), .cin(w_125), .sum(w_129), .carry(w_130));
    wire w_131, w_132;
    half_adder HA_10 (.a(w_127), .b(w_129), .sum(w_131), .carry(w_132));

    // ========================================================
    // Stage 12
    // ========================================================
    wire w_133, w_134;
    full_adder FA_55 (.a(stage10_Q[33]), .b(stage10_Q[34]), .cin(stage10_Q[35]), .sum(w_133), .carry(w_134));
    wire w_135, w_136;
    full_adder FA_56 (.a(stage10_Q[36]), .b(stage10_Q[37]), .cin(stage10_Q[38]), .sum(w_135), .carry(w_136));
    wire w_137, w_138;
    full_adder FA_57 (.a(stage10_Q[39]), .b(stage10_Q[40]), .cin(stage10_Q[41]), .sum(w_137), .carry(w_138));
    wire w_139, w_140;
    full_adder FA_58 (.a(stage10_Q[42]), .b(stage10_Q[43]), .cin(stage10_Q[44]), .sum(w_139), .carry(w_140));
    wire w_141, w_142;
    full_adder FA_59 (.a(stage10_Q[45]), .b(w_112), .cin(w_114), .sum(w_141), .carry(w_142));
    wire w_143, w_144;
    full_adder FA_60 (.a(w_116), .b(w_118), .cin(w_120), .sum(w_143), .carry(w_144));
    wire w_145, w_146;
    full_adder FA_61 (.a(w_122), .b(w_124), .cin(w_126), .sum(w_145), .carry(w_146));
    wire w_147, w_148;
    full_adder FA_62 (.a(w_128), .b(w_130), .cin(w_132), .sum(w_147), .carry(w_148));
    wire w_149, w_150;
    full_adder FA_63 (.a(w_133), .b(w_135), .cin(w_137), .sum(w_149), .carry(w_150));
    wire w_151, w_152;
    full_adder FA_64 (.a(w_139), .b(w_141), .cin(w_143), .sum(w_151), .carry(w_152));
    wire w_153, w_154;
    full_adder FA_65 (.a(w_145), .b(w_147), .cin(w_149), .sum(w_153), .carry(w_154));
    wire w_155, w_156;
    half_adder HA_11 (.a(w_151), .b(w_153), .sum(w_155), .carry(w_156));

    // Pipeline Register Bank: Post-Stage 12 Layer
    wire [189:0] stage12_D;
    wire [189:0] stage12_Q;
    assign stage12_D = {stage10_Q[210], stage10_Q[209], stage10_Q[208], stage10_Q[207], stage10_Q[206], stage10_Q[205], stage10_Q[204], stage10_Q[203], stage10_Q[202], stage10_Q[201], stage10_Q[200], stage10_Q[199], stage10_Q[198], stage10_Q[197], stage10_Q[196], stage10_Q[195], stage10_Q[194], stage10_Q[193], stage10_Q[192], stage10_Q[191], stage10_Q[190], stage10_Q[189], stage10_Q[188], stage10_Q[187], stage10_Q[186], stage10_Q[185], stage10_Q[184], stage10_Q[183], stage10_Q[182], stage10_Q[181], stage10_Q[180], stage10_Q[179], stage10_Q[178], stage10_Q[177], stage10_Q[176], stage10_Q[175], stage10_Q[174], stage10_Q[173], stage10_Q[172], stage10_Q[171], stage10_Q[170], stage10_Q[169], stage10_Q[168], stage10_Q[167], stage10_Q[166], stage10_Q[165], stage10_Q[164], stage10_Q[163], stage10_Q[162], stage10_Q[161], stage10_Q[160], stage10_Q[159], stage10_Q[158], stage10_Q[157], stage10_Q[156], stage10_Q[155], stage10_Q[154], stage10_Q[153], stage10_Q[152], stage10_Q[151], stage10_Q[150], stage10_Q[149], stage10_Q[148], stage10_Q[147], stage10_Q[146], stage10_Q[145], stage10_Q[144], stage10_Q[143], stage10_Q[142], stage10_Q[141], stage10_Q[140], stage10_Q[139], stage10_Q[138], stage10_Q[137], stage10_Q[136], stage10_Q[135], stage10_Q[134], stage10_Q[133], stage10_Q[132], stage10_Q[131], stage10_Q[130], stage10_Q[129], stage10_Q[128], stage10_Q[127], stage10_Q[126], stage10_Q[125], stage10_Q[124], stage10_Q[123], stage10_Q[122], stage10_Q[121], stage10_Q[120], stage10_Q[119], stage10_Q[118], stage10_Q[117], stage10_Q[116], stage10_Q[115], stage10_Q[114], stage10_Q[113], stage10_Q[112], stage10_Q[111], stage10_Q[110], stage10_Q[109], stage10_Q[108], stage10_Q[107], stage10_Q[106], stage10_Q[105], stage10_Q[104], stage10_Q[103], stage10_Q[102], stage10_Q[101], stage10_Q[100], stage10_Q[99], stage10_Q[98], stage10_Q[97], stage10_Q[96], stage10_Q[95], stage10_Q[94], stage10_Q[93], stage10_Q[92], stage10_Q[91], stage10_Q[90], stage10_Q[89], stage10_Q[88], stage10_Q[87], stage10_Q[86], stage10_Q[85], stage10_Q[84], stage10_Q[83], stage10_Q[82], stage10_Q[81], stage10_Q[80], stage10_Q[79], stage10_Q[78], stage10_Q[77], stage10_Q[76], stage10_Q[75], stage10_Q[74], stage10_Q[73], stage10_Q[72], stage10_Q[71], stage10_Q[70], stage10_Q[69], stage10_Q[68], stage10_Q[67], stage10_Q[66], stage10_Q[65], stage10_Q[64], stage10_Q[63], stage10_Q[62], stage10_Q[61], stage10_Q[60], w_156, w_154, w_152, w_150, w_148, w_146, w_144, w_142, w_140, w_138, w_136, w_134, stage10_Q[59], stage10_Q[58], stage10_Q[57], stage10_Q[56], stage10_Q[55], stage10_Q[54], stage10_Q[53], stage10_Q[52], stage10_Q[51], stage10_Q[50], stage10_Q[49], stage10_Q[48], stage10_Q[47], stage10_Q[46], w_155, w_131, stage10_Q[10], stage10_Q[9], stage10_Q[8], stage10_Q[7], stage10_Q[6], stage10_Q[5], stage10_Q[4], stage10_Q[3], stage10_Q[2], stage10_Q[1], stage10_Q[0]};
    register_bank #(.WIDTH(190)) reg_stage_12 (
        .clk(clk), .rst(rst), .en(en), .D(stage12_D), .Q(stage12_Q)
    );

    // ========================================================
    // Stage 13
    // ========================================================
    wire w_157, w_158;
    full_adder FA_66 (.a(stage12_Q[13]), .b(stage12_Q[14]), .cin(stage12_Q[15]), .sum(w_157), .carry(w_158));
    wire w_159, w_160;
    full_adder FA_67 (.a(stage12_Q[16]), .b(stage12_Q[17]), .cin(stage12_Q[18]), .sum(w_159), .carry(w_160));
    wire w_161, w_162;
    full_adder FA_68 (.a(stage12_Q[19]), .b(stage12_Q[20]), .cin(stage12_Q[21]), .sum(w_161), .carry(w_162));
    wire w_163, w_164;
    full_adder FA_69 (.a(stage12_Q[22]), .b(stage12_Q[23]), .cin(stage12_Q[24]), .sum(w_163), .carry(w_164));
    wire w_165, w_166;
    full_adder FA_70 (.a(stage12_Q[25]), .b(stage12_Q[26]), .cin(stage12_Q[27]), .sum(w_165), .carry(w_166));
    wire w_167, w_168;
    full_adder FA_71 (.a(stage12_Q[28]), .b(stage12_Q[29]), .cin(stage12_Q[30]), .sum(w_167), .carry(w_168));
    wire w_169, w_170;
    full_adder FA_72 (.a(stage12_Q[31]), .b(stage12_Q[32]), .cin(stage12_Q[33]), .sum(w_169), .carry(w_170));
    wire w_171, w_172;
    full_adder FA_73 (.a(stage12_Q[34]), .b(stage12_Q[35]), .cin(stage12_Q[36]), .sum(w_171), .carry(w_172));
    wire w_173, w_174;
    full_adder FA_74 (.a(stage12_Q[37]), .b(stage12_Q[38]), .cin(w_157), .sum(w_173), .carry(w_174));
    wire w_175, w_176;
    full_adder FA_75 (.a(w_159), .b(w_161), .cin(w_163), .sum(w_175), .carry(w_176));
    wire w_177, w_178;
    full_adder FA_76 (.a(w_165), .b(w_167), .cin(w_169), .sum(w_177), .carry(w_178));
    wire w_179, w_180;
    full_adder FA_77 (.a(w_171), .b(w_173), .cin(w_175), .sum(w_179), .carry(w_180));
    wire w_181, w_182;
    half_adder HA_12 (.a(w_177), .b(w_179), .sum(w_181), .carry(w_182));

    // ========================================================
    // Stage 14
    // ========================================================
    wire w_183, w_184;
    full_adder FA_78 (.a(stage12_Q[39]), .b(stage12_Q[40]), .cin(stage12_Q[41]), .sum(w_183), .carry(w_184));
    wire w_185, w_186;
    full_adder FA_79 (.a(stage12_Q[42]), .b(stage12_Q[43]), .cin(stage12_Q[44]), .sum(w_185), .carry(w_186));
    wire w_187, w_188;
    full_adder FA_80 (.a(stage12_Q[45]), .b(stage12_Q[46]), .cin(stage12_Q[47]), .sum(w_187), .carry(w_188));
    wire w_189, w_190;
    full_adder FA_81 (.a(stage12_Q[48]), .b(stage12_Q[49]), .cin(stage12_Q[50]), .sum(w_189), .carry(w_190));
    wire w_191, w_192;
    full_adder FA_82 (.a(stage12_Q[51]), .b(stage12_Q[52]), .cin(stage12_Q[53]), .sum(w_191), .carry(w_192));
    wire w_193, w_194;
    full_adder FA_83 (.a(w_158), .b(w_160), .cin(w_162), .sum(w_193), .carry(w_194));
    wire w_195, w_196;
    full_adder FA_84 (.a(w_164), .b(w_166), .cin(w_168), .sum(w_195), .carry(w_196));
    wire w_197, w_198;
    full_adder FA_85 (.a(w_170), .b(w_172), .cin(w_174), .sum(w_197), .carry(w_198));
    wire w_199, w_200;
    full_adder FA_86 (.a(w_176), .b(w_178), .cin(w_180), .sum(w_199), .carry(w_200));
    wire w_201, w_202;
    full_adder FA_87 (.a(w_182), .b(w_183), .cin(w_185), .sum(w_201), .carry(w_202));
    wire w_203, w_204;
    full_adder FA_88 (.a(w_187), .b(w_189), .cin(w_191), .sum(w_203), .carry(w_204));
    wire w_205, w_206;
    full_adder FA_89 (.a(w_193), .b(w_195), .cin(w_197), .sum(w_205), .carry(w_206));
    wire w_207, w_208;
    full_adder FA_90 (.a(w_199), .b(w_201), .cin(w_203), .sum(w_207), .carry(w_208));
    wire w_209, w_210;
    half_adder HA_13 (.a(w_205), .b(w_207), .sum(w_209), .carry(w_210));

    // Pipeline Register Bank: Post-Stage 14 Layer
    wire [164:0] stage14_D;
    wire [164:0] stage14_Q;
    assign stage14_D = {stage12_Q[189], stage12_Q[188], stage12_Q[187], stage12_Q[186], stage12_Q[185], stage12_Q[184], stage12_Q[183], stage12_Q[182], stage12_Q[181], stage12_Q[180], stage12_Q[179], stage12_Q[178], stage12_Q[177], stage12_Q[176], stage12_Q[175], stage12_Q[174], stage12_Q[173], stage12_Q[172], stage12_Q[171], stage12_Q[170], stage12_Q[169], stage12_Q[168], stage12_Q[167], stage12_Q[166], stage12_Q[165], stage12_Q[164], stage12_Q[163], stage12_Q[162], stage12_Q[161], stage12_Q[160], stage12_Q[159], stage12_Q[158], stage12_Q[157], stage12_Q[156], stage12_Q[155], stage12_Q[154], stage12_Q[153], stage12_Q[152], stage12_Q[151], stage12_Q[150], stage12_Q[149], stage12_Q[148], stage12_Q[147], stage12_Q[146], stage12_Q[145], stage12_Q[144], stage12_Q[143], stage12_Q[142], stage12_Q[141], stage12_Q[140], stage12_Q[139], stage12_Q[138], stage12_Q[137], stage12_Q[136], stage12_Q[135], stage12_Q[134], stage12_Q[133], stage12_Q[132], stage12_Q[131], stage12_Q[130], stage12_Q[129], stage12_Q[128], stage12_Q[127], stage12_Q[126], stage12_Q[125], stage12_Q[124], stage12_Q[123], stage12_Q[122], stage12_Q[121], stage12_Q[120], stage12_Q[119], stage12_Q[118], stage12_Q[117], stage12_Q[116], stage12_Q[115], stage12_Q[114], stage12_Q[113], stage12_Q[112], stage12_Q[111], stage12_Q[110], stage12_Q[109], stage12_Q[108], stage12_Q[107], stage12_Q[106], stage12_Q[105], stage12_Q[104], stage12_Q[103], stage12_Q[102], stage12_Q[101], stage12_Q[100], stage12_Q[99], stage12_Q[98], stage12_Q[97], stage12_Q[96], stage12_Q[95], stage12_Q[94], stage12_Q[93], stage12_Q[92], stage12_Q[91], stage12_Q[90], stage12_Q[89], stage12_Q[88], stage12_Q[87], stage12_Q[86], stage12_Q[85], stage12_Q[84], stage12_Q[83], stage12_Q[82], stage12_Q[81], stage12_Q[80], stage12_Q[79], stage12_Q[78], stage12_Q[77], stage12_Q[76], stage12_Q[75], stage12_Q[74], stage12_Q[73], stage12_Q[72], stage12_Q[71], stage12_Q[70], w_210, w_208, w_206, w_204, w_202, w_200, w_198, w_196, w_194, w_192, w_190, w_188, w_186, w_184, stage12_Q[69], stage12_Q[68], stage12_Q[67], stage12_Q[66], stage12_Q[65], stage12_Q[64], stage12_Q[63], stage12_Q[62], stage12_Q[61], stage12_Q[60], stage12_Q[59], stage12_Q[58], stage12_Q[57], stage12_Q[56], stage12_Q[55], stage12_Q[54], w_209, w_181, stage12_Q[12], stage12_Q[11], stage12_Q[10], stage12_Q[9], stage12_Q[8], stage12_Q[7], stage12_Q[6], stage12_Q[5], stage12_Q[4], stage12_Q[3], stage12_Q[2], stage12_Q[1], stage12_Q[0]};
    register_bank #(.WIDTH(165)) reg_stage_14 (
        .clk(clk), .rst(rst), .en(en), .D(stage14_D), .Q(stage14_Q)
    );

    // ========================================================
    // Stage 15
    // ========================================================
    wire w_211, w_212;
    full_adder FA_91 (.a(stage14_Q[15]), .b(stage14_Q[16]), .cin(stage14_Q[17]), .sum(w_211), .carry(w_212));
    wire w_213, w_214;
    full_adder FA_92 (.a(stage14_Q[18]), .b(stage14_Q[19]), .cin(stage14_Q[20]), .sum(w_213), .carry(w_214));
    wire w_215, w_216;
    full_adder FA_93 (.a(stage14_Q[21]), .b(stage14_Q[22]), .cin(stage14_Q[23]), .sum(w_215), .carry(w_216));
    wire w_217, w_218;
    full_adder FA_94 (.a(stage14_Q[24]), .b(stage14_Q[25]), .cin(stage14_Q[26]), .sum(w_217), .carry(w_218));
    wire w_219, w_220;
    full_adder FA_95 (.a(stage14_Q[27]), .b(stage14_Q[28]), .cin(stage14_Q[29]), .sum(w_219), .carry(w_220));
    wire w_221, w_222;
    full_adder FA_96 (.a(stage14_Q[30]), .b(stage14_Q[31]), .cin(stage14_Q[32]), .sum(w_221), .carry(w_222));
    wire w_223, w_224;
    full_adder FA_97 (.a(stage14_Q[33]), .b(stage14_Q[34]), .cin(stage14_Q[35]), .sum(w_223), .carry(w_224));
    wire w_225, w_226;
    full_adder FA_98 (.a(stage14_Q[36]), .b(stage14_Q[37]), .cin(stage14_Q[38]), .sum(w_225), .carry(w_226));
    wire w_227, w_228;
    full_adder FA_99 (.a(stage14_Q[39]), .b(stage14_Q[40]), .cin(stage14_Q[41]), .sum(w_227), .carry(w_228));
    wire w_229, w_230;
    full_adder FA_100 (.a(stage14_Q[42]), .b(stage14_Q[43]), .cin(stage14_Q[44]), .sum(w_229), .carry(w_230));
    wire w_231, w_232;
    full_adder FA_101 (.a(w_211), .b(w_213), .cin(w_215), .sum(w_231), .carry(w_232));
    wire w_233, w_234;
    full_adder FA_102 (.a(w_217), .b(w_219), .cin(w_221), .sum(w_233), .carry(w_234));
    wire w_235, w_236;
    full_adder FA_103 (.a(w_223), .b(w_225), .cin(w_227), .sum(w_235), .carry(w_236));
    wire w_237, w_238;
    full_adder FA_104 (.a(w_229), .b(w_231), .cin(w_233), .sum(w_237), .carry(w_238));
    wire w_239, w_240;
    half_adder HA_14 (.a(w_235), .b(w_237), .sum(w_239), .carry(w_240));

    // ========================================================
    // Stage 16
    // ========================================================
    wire w_241, w_242;
    full_adder FA_105 (.a(stage14_Q[45]), .b(stage14_Q[46]), .cin(stage14_Q[47]), .sum(w_241), .carry(w_242));
    wire w_243, w_244;
    full_adder FA_106 (.a(stage14_Q[48]), .b(stage14_Q[49]), .cin(stage14_Q[50]), .sum(w_243), .carry(w_244));
    wire w_245, w_246;
    full_adder FA_107 (.a(stage14_Q[51]), .b(stage14_Q[52]), .cin(stage14_Q[53]), .sum(w_245), .carry(w_246));
    wire w_247, w_248;
    full_adder FA_108 (.a(stage14_Q[54]), .b(stage14_Q[55]), .cin(stage14_Q[56]), .sum(w_247), .carry(w_248));
    wire w_249, w_250;
    full_adder FA_109 (.a(stage14_Q[57]), .b(stage14_Q[58]), .cin(stage14_Q[59]), .sum(w_249), .carry(w_250));
    wire w_251, w_252;
    full_adder FA_110 (.a(w_212), .b(w_214), .cin(w_216), .sum(w_251), .carry(w_252));
    wire w_253, w_254;
    full_adder FA_111 (.a(w_218), .b(w_220), .cin(w_222), .sum(w_253), .carry(w_254));
    wire w_255, w_256;
    full_adder FA_112 (.a(w_224), .b(w_226), .cin(w_228), .sum(w_255), .carry(w_256));
    wire w_257, w_258;
    full_adder FA_113 (.a(w_230), .b(w_232), .cin(w_234), .sum(w_257), .carry(w_258));
    wire w_259, w_260;
    full_adder FA_114 (.a(w_236), .b(w_238), .cin(w_240), .sum(w_259), .carry(w_260));
    wire w_261, w_262;
    full_adder FA_115 (.a(w_241), .b(w_243), .cin(w_245), .sum(w_261), .carry(w_262));
    wire w_263, w_264;
    full_adder FA_116 (.a(w_247), .b(w_249), .cin(w_251), .sum(w_263), .carry(w_264));
    wire w_265, w_266;
    full_adder FA_117 (.a(w_253), .b(w_255), .cin(w_257), .sum(w_265), .carry(w_266));
    wire w_267, w_268;
    full_adder FA_118 (.a(w_259), .b(w_261), .cin(w_263), .sum(w_267), .carry(w_268));
    wire w_269, w_270;
    half_adder HA_15 (.a(w_265), .b(w_267), .sum(w_269), .carry(w_270));

    // Pipeline Register Bank: Post-Stage 16 Layer
    wire [136:0] stage16_D;
    wire [136:0] stage16_Q;
    assign stage16_D = {stage14_Q[164], stage14_Q[163], stage14_Q[162], stage14_Q[161], stage14_Q[160], stage14_Q[159], stage14_Q[158], stage14_Q[157], stage14_Q[156], stage14_Q[155], stage14_Q[154], stage14_Q[153], stage14_Q[152], stage14_Q[151], stage14_Q[150], stage14_Q[149], stage14_Q[148], stage14_Q[147], stage14_Q[146], stage14_Q[145], stage14_Q[144], stage14_Q[143], stage14_Q[142], stage14_Q[141], stage14_Q[140], stage14_Q[139], stage14_Q[138], stage14_Q[137], stage14_Q[136], stage14_Q[135], stage14_Q[134], stage14_Q[133], stage14_Q[132], stage14_Q[131], stage14_Q[130], stage14_Q[129], stage14_Q[128], stage14_Q[127], stage14_Q[126], stage14_Q[125], stage14_Q[124], stage14_Q[123], stage14_Q[122], stage14_Q[121], stage14_Q[120], stage14_Q[119], stage14_Q[118], stage14_Q[117], stage14_Q[116], stage14_Q[115], stage14_Q[114], stage14_Q[113], stage14_Q[112], stage14_Q[111], stage14_Q[110], stage14_Q[109], stage14_Q[108], stage14_Q[107], stage14_Q[106], stage14_Q[105], stage14_Q[104], stage14_Q[103], stage14_Q[102], stage14_Q[101], stage14_Q[100], stage14_Q[99], stage14_Q[98], stage14_Q[97], stage14_Q[96], stage14_Q[95], stage14_Q[94], stage14_Q[93], stage14_Q[92], stage14_Q[91], stage14_Q[90], stage14_Q[89], stage14_Q[88], stage14_Q[87], stage14_Q[86], stage14_Q[85], stage14_Q[84], stage14_Q[83], stage14_Q[82], stage14_Q[81], stage14_Q[80], stage14_Q[79], stage14_Q[78], stage14_Q[77], stage14_Q[76], stage14_Q[75], stage14_Q[74], w_270, w_268, w_266, w_264, w_262, w_260, w_258, w_256, w_254, w_252, w_250, w_248, w_246, w_244, w_242, stage14_Q[73], stage14_Q[72], stage14_Q[71], stage14_Q[70], stage14_Q[69], stage14_Q[68], stage14_Q[67], stage14_Q[66], stage14_Q[65], stage14_Q[64], stage14_Q[63], stage14_Q[62], stage14_Q[61], stage14_Q[60], w_269, w_239, stage14_Q[14], stage14_Q[13], stage14_Q[12], stage14_Q[11], stage14_Q[10], stage14_Q[9], stage14_Q[8], stage14_Q[7], stage14_Q[6], stage14_Q[5], stage14_Q[4], stage14_Q[3], stage14_Q[2], stage14_Q[1], stage14_Q[0]};
    register_bank #(.WIDTH(137)) reg_stage_16 (
        .clk(clk), .rst(rst), .en(en), .D(stage16_D), .Q(stage16_Q)
    );

    // ========================================================
    // Stage 17
    // ========================================================
    wire w_271, w_272;
    full_adder FA_119 (.a(stage16_Q[17]), .b(stage16_Q[18]), .cin(stage16_Q[19]), .sum(w_271), .carry(w_272));
    wire w_273, w_274;
    full_adder FA_120 (.a(stage16_Q[20]), .b(stage16_Q[21]), .cin(stage16_Q[22]), .sum(w_273), .carry(w_274));
    wire w_275, w_276;
    full_adder FA_121 (.a(stage16_Q[23]), .b(stage16_Q[24]), .cin(stage16_Q[25]), .sum(w_275), .carry(w_276));
    wire w_277, w_278;
    full_adder FA_122 (.a(stage16_Q[26]), .b(stage16_Q[27]), .cin(stage16_Q[28]), .sum(w_277), .carry(w_278));
    wire w_279, w_280;
    full_adder FA_123 (.a(stage16_Q[29]), .b(stage16_Q[30]), .cin(stage16_Q[31]), .sum(w_279), .carry(w_280));
    wire w_281, w_282;
    full_adder FA_124 (.a(stage16_Q[32]), .b(stage16_Q[33]), .cin(stage16_Q[34]), .sum(w_281), .carry(w_282));
    wire w_283, w_284;
    full_adder FA_125 (.a(stage16_Q[35]), .b(stage16_Q[36]), .cin(stage16_Q[37]), .sum(w_283), .carry(w_284));
    wire w_285, w_286;
    full_adder FA_126 (.a(stage16_Q[38]), .b(stage16_Q[39]), .cin(stage16_Q[40]), .sum(w_285), .carry(w_286));
    wire w_287, w_288;
    full_adder FA_127 (.a(stage16_Q[41]), .b(stage16_Q[42]), .cin(stage16_Q[43]), .sum(w_287), .carry(w_288));
    wire w_289, w_290;
    full_adder FA_128 (.a(stage16_Q[44]), .b(stage16_Q[45]), .cin(w_271), .sum(w_289), .carry(w_290));
    wire w_291, w_292;
    full_adder FA_129 (.a(w_273), .b(w_275), .cin(w_277), .sum(w_291), .carry(w_292));
    wire w_293, w_294;
    full_adder FA_130 (.a(w_279), .b(w_281), .cin(w_283), .sum(w_293), .carry(w_294));
    wire w_295, w_296;
    full_adder FA_131 (.a(w_285), .b(w_287), .cin(w_289), .sum(w_295), .carry(w_296));
    wire w_297, w_298;
    full_adder FA_132 (.a(w_291), .b(w_293), .cin(w_295), .sum(w_297), .carry(w_298));

    // ========================================================
    // Stage 18
    // ========================================================
    wire w_299, w_300;
    full_adder FA_133 (.a(stage16_Q[46]), .b(stage16_Q[47]), .cin(stage16_Q[48]), .sum(w_299), .carry(w_300));
    wire w_301, w_302;
    full_adder FA_134 (.a(stage16_Q[49]), .b(stage16_Q[50]), .cin(stage16_Q[51]), .sum(w_301), .carry(w_302));
    wire w_303, w_304;
    full_adder FA_135 (.a(stage16_Q[52]), .b(stage16_Q[53]), .cin(stage16_Q[54]), .sum(w_303), .carry(w_304));
    wire w_305, w_306;
    full_adder FA_136 (.a(stage16_Q[55]), .b(stage16_Q[56]), .cin(stage16_Q[57]), .sum(w_305), .carry(w_306));
    wire w_307, w_308;
    full_adder FA_137 (.a(stage16_Q[58]), .b(w_272), .cin(w_274), .sum(w_307), .carry(w_308));
    wire w_309, w_310;
    full_adder FA_138 (.a(w_276), .b(w_278), .cin(w_280), .sum(w_309), .carry(w_310));
    wire w_311, w_312;
    full_adder FA_139 (.a(w_282), .b(w_284), .cin(w_286), .sum(w_311), .carry(w_312));
    wire w_313, w_314;
    full_adder FA_140 (.a(w_288), .b(w_290), .cin(w_292), .sum(w_313), .carry(w_314));
    wire w_315, w_316;
    full_adder FA_141 (.a(w_294), .b(w_296), .cin(w_298), .sum(w_315), .carry(w_316));
    wire w_317, w_318;
    full_adder FA_142 (.a(w_299), .b(w_301), .cin(w_303), .sum(w_317), .carry(w_318));
    wire w_319, w_320;
    full_adder FA_143 (.a(w_305), .b(w_307), .cin(w_309), .sum(w_319), .carry(w_320));
    wire w_321, w_322;
    full_adder FA_144 (.a(w_311), .b(w_313), .cin(w_315), .sum(w_321), .carry(w_322));
    wire w_323, w_324;
    full_adder FA_145 (.a(w_317), .b(w_319), .cin(w_321), .sum(w_323), .carry(w_324));

    // Pipeline Register Bank: Post-Stage 18 Layer
    wire [109:0] stage18_D;
    wire [109:0] stage18_Q;
    assign stage18_D = {stage16_Q[136], stage16_Q[135], stage16_Q[134], stage16_Q[133], stage16_Q[132], stage16_Q[131], stage16_Q[130], stage16_Q[129], stage16_Q[128], stage16_Q[127], stage16_Q[126], stage16_Q[125], stage16_Q[124], stage16_Q[123], stage16_Q[122], stage16_Q[121], stage16_Q[120], stage16_Q[119], stage16_Q[118], stage16_Q[117], stage16_Q[116], stage16_Q[115], stage16_Q[114], stage16_Q[113], stage16_Q[112], stage16_Q[111], stage16_Q[110], stage16_Q[109], stage16_Q[108], stage16_Q[107], stage16_Q[106], stage16_Q[105], stage16_Q[104], stage16_Q[103], stage16_Q[102], stage16_Q[101], stage16_Q[100], stage16_Q[99], stage16_Q[98], stage16_Q[97], stage16_Q[96], stage16_Q[95], stage16_Q[94], stage16_Q[93], stage16_Q[92], stage16_Q[91], stage16_Q[90], stage16_Q[89], stage16_Q[88], stage16_Q[87], stage16_Q[86], stage16_Q[85], stage16_Q[84], stage16_Q[83], stage16_Q[82], stage16_Q[81], stage16_Q[80], stage16_Q[79], stage16_Q[78], stage16_Q[77], stage16_Q[76], stage16_Q[75], stage16_Q[74], stage16_Q[73], stage16_Q[72], stage16_Q[71], w_324, w_322, w_320, w_318, w_316, w_314, w_312, w_310, w_308, w_306, w_304, w_302, w_300, stage16_Q[70], stage16_Q[69], stage16_Q[68], stage16_Q[67], stage16_Q[66], stage16_Q[65], stage16_Q[64], stage16_Q[63], stage16_Q[62], stage16_Q[61], stage16_Q[60], stage16_Q[59], w_323, w_297, stage16_Q[16], stage16_Q[15], stage16_Q[14], stage16_Q[13], stage16_Q[12], stage16_Q[11], stage16_Q[10], stage16_Q[9], stage16_Q[8], stage16_Q[7], stage16_Q[6], stage16_Q[5], stage16_Q[4], stage16_Q[3], stage16_Q[2], stage16_Q[1], stage16_Q[0]};
    register_bank #(.WIDTH(110)) reg_stage_18 (
        .clk(clk), .rst(rst), .en(en), .D(stage18_D), .Q(stage18_Q)
    );

    // ========================================================
    // Stage 19
    // ========================================================
    wire w_325, w_326;
    full_adder FA_146 (.a(stage18_Q[19]), .b(stage18_Q[20]), .cin(stage18_Q[21]), .sum(w_325), .carry(w_326));
    wire w_327, w_328;
    full_adder FA_147 (.a(stage18_Q[22]), .b(stage18_Q[23]), .cin(stage18_Q[24]), .sum(w_327), .carry(w_328));
    wire w_329, w_330;
    full_adder FA_148 (.a(stage18_Q[25]), .b(stage18_Q[26]), .cin(stage18_Q[27]), .sum(w_329), .carry(w_330));
    wire w_331, w_332;
    full_adder FA_149 (.a(stage18_Q[28]), .b(stage18_Q[29]), .cin(stage18_Q[30]), .sum(w_331), .carry(w_332));
    wire w_333, w_334;
    full_adder FA_150 (.a(stage18_Q[31]), .b(stage18_Q[32]), .cin(stage18_Q[33]), .sum(w_333), .carry(w_334));
    wire w_335, w_336;
    full_adder FA_151 (.a(stage18_Q[34]), .b(stage18_Q[35]), .cin(stage18_Q[36]), .sum(w_335), .carry(w_336));
    wire w_337, w_338;
    full_adder FA_152 (.a(stage18_Q[37]), .b(stage18_Q[38]), .cin(stage18_Q[39]), .sum(w_337), .carry(w_338));
    wire w_339, w_340;
    full_adder FA_153 (.a(stage18_Q[40]), .b(stage18_Q[41]), .cin(stage18_Q[42]), .sum(w_339), .carry(w_340));
    wire w_341, w_342;
    full_adder FA_154 (.a(stage18_Q[43]), .b(w_325), .cin(w_327), .sum(w_341), .carry(w_342));
    wire w_343, w_344;
    full_adder FA_155 (.a(w_329), .b(w_331), .cin(w_333), .sum(w_343), .carry(w_344));
    wire w_345, w_346;
    full_adder FA_156 (.a(w_335), .b(w_337), .cin(w_339), .sum(w_345), .carry(w_346));
    wire w_347, w_348;
    full_adder FA_157 (.a(w_341), .b(w_343), .cin(w_345), .sum(w_347), .carry(w_348));

    // ========================================================
    // Stage 20
    // ========================================================
    wire w_349, w_350;
    full_adder FA_158 (.a(stage18_Q[44]), .b(stage18_Q[45]), .cin(stage18_Q[46]), .sum(w_349), .carry(w_350));
    wire w_351, w_352;
    full_adder FA_159 (.a(stage18_Q[47]), .b(stage18_Q[48]), .cin(stage18_Q[49]), .sum(w_351), .carry(w_352));
    wire w_353, w_354;
    full_adder FA_160 (.a(stage18_Q[50]), .b(stage18_Q[51]), .cin(stage18_Q[52]), .sum(w_353), .carry(w_354));
    wire w_355, w_356;
    full_adder FA_161 (.a(stage18_Q[53]), .b(stage18_Q[54]), .cin(w_326), .sum(w_355), .carry(w_356));
    wire w_357, w_358;
    full_adder FA_162 (.a(w_328), .b(w_330), .cin(w_332), .sum(w_357), .carry(w_358));
    wire w_359, w_360;
    full_adder FA_163 (.a(w_334), .b(w_336), .cin(w_338), .sum(w_359), .carry(w_360));
    wire w_361, w_362;
    full_adder FA_164 (.a(w_340), .b(w_342), .cin(w_344), .sum(w_361), .carry(w_362));
    wire w_363, w_364;
    full_adder FA_165 (.a(w_346), .b(w_348), .cin(w_349), .sum(w_363), .carry(w_364));
    wire w_365, w_366;
    full_adder FA_166 (.a(w_351), .b(w_353), .cin(w_355), .sum(w_365), .carry(w_366));
    wire w_367, w_368;
    full_adder FA_167 (.a(w_357), .b(w_359), .cin(w_361), .sum(w_367), .carry(w_368));
    wire w_369, w_370;
    full_adder FA_168 (.a(w_363), .b(w_365), .cin(w_367), .sum(w_369), .carry(w_370));

    // Pipeline Register Bank: Post-Stage 20 Layer
    wire [86:0] stage20_D;
    wire [86:0] stage20_Q;
    assign stage20_D = {stage18_Q[109], stage18_Q[108], stage18_Q[107], stage18_Q[106], stage18_Q[105], stage18_Q[104], stage18_Q[103], stage18_Q[102], stage18_Q[101], stage18_Q[100], stage18_Q[99], stage18_Q[98], stage18_Q[97], stage18_Q[96], stage18_Q[95], stage18_Q[94], stage18_Q[93], stage18_Q[92], stage18_Q[91], stage18_Q[90], stage18_Q[89], stage18_Q[88], stage18_Q[87], stage18_Q[86], stage18_Q[85], stage18_Q[84], stage18_Q[83], stage18_Q[82], stage18_Q[81], stage18_Q[80], stage18_Q[79], stage18_Q[78], stage18_Q[77], stage18_Q[76], stage18_Q[75], stage18_Q[74], stage18_Q[73], stage18_Q[72], stage18_Q[71], stage18_Q[70], stage18_Q[69], stage18_Q[68], stage18_Q[67], stage18_Q[66], stage18_Q[65], w_370, w_368, w_366, w_364, w_362, w_360, w_358, w_356, w_354, w_352, w_350, stage18_Q[64], stage18_Q[63], stage18_Q[62], stage18_Q[61], stage18_Q[60], stage18_Q[59], stage18_Q[58], stage18_Q[57], stage18_Q[56], stage18_Q[55], w_369, w_347, stage18_Q[18], stage18_Q[17], stage18_Q[16], stage18_Q[15], stage18_Q[14], stage18_Q[13], stage18_Q[12], stage18_Q[11], stage18_Q[10], stage18_Q[9], stage18_Q[8], stage18_Q[7], stage18_Q[6], stage18_Q[5], stage18_Q[4], stage18_Q[3], stage18_Q[2], stage18_Q[1], stage18_Q[0]};
    register_bank #(.WIDTH(87)) reg_stage_20 (
        .clk(clk), .rst(rst), .en(en), .D(stage20_D), .Q(stage20_Q)
    );

    // ========================================================
    // Stage 21
    // ========================================================
    wire w_371, w_372;
    full_adder FA_169 (.a(stage20_Q[21]), .b(stage20_Q[22]), .cin(stage20_Q[23]), .sum(w_371), .carry(w_372));
    wire w_373, w_374;
    full_adder FA_170 (.a(stage20_Q[24]), .b(stage20_Q[25]), .cin(stage20_Q[26]), .sum(w_373), .carry(w_374));
    wire w_375, w_376;
    full_adder FA_171 (.a(stage20_Q[27]), .b(stage20_Q[28]), .cin(stage20_Q[29]), .sum(w_375), .carry(w_376));
    wire w_377, w_378;
    full_adder FA_172 (.a(stage20_Q[30]), .b(stage20_Q[31]), .cin(stage20_Q[32]), .sum(w_377), .carry(w_378));
    wire w_379, w_380;
    full_adder FA_173 (.a(stage20_Q[33]), .b(stage20_Q[34]), .cin(stage20_Q[35]), .sum(w_379), .carry(w_380));
    wire w_381, w_382;
    full_adder FA_174 (.a(stage20_Q[36]), .b(stage20_Q[37]), .cin(stage20_Q[38]), .sum(w_381), .carry(w_382));
    wire w_383, w_384;
    full_adder FA_175 (.a(stage20_Q[39]), .b(stage20_Q[40]), .cin(stage20_Q[41]), .sum(w_383), .carry(w_384));
    wire w_385, w_386;
    full_adder FA_176 (.a(w_371), .b(w_373), .cin(w_375), .sum(w_385), .carry(w_386));
    wire w_387, w_388;
    full_adder FA_177 (.a(w_377), .b(w_379), .cin(w_381), .sum(w_387), .carry(w_388));
    wire w_389, w_390;
    full_adder FA_178 (.a(w_383), .b(w_385), .cin(w_387), .sum(w_389), .carry(w_390));

    // ========================================================
    // Stage 22
    // ========================================================
    wire w_391, w_392;
    full_adder FA_179 (.a(stage20_Q[42]), .b(stage20_Q[43]), .cin(stage20_Q[44]), .sum(w_391), .carry(w_392));
    wire w_393, w_394;
    full_adder FA_180 (.a(stage20_Q[45]), .b(stage20_Q[46]), .cin(stage20_Q[47]), .sum(w_393), .carry(w_394));
    wire w_395, w_396;
    full_adder FA_181 (.a(stage20_Q[48]), .b(stage20_Q[49]), .cin(stage20_Q[50]), .sum(w_395), .carry(w_396));
    wire w_397, w_398;
    full_adder FA_182 (.a(w_372), .b(w_374), .cin(w_376), .sum(w_397), .carry(w_398));
    wire w_399, w_400;
    full_adder FA_183 (.a(w_378), .b(w_380), .cin(w_382), .sum(w_399), .carry(w_400));
    wire w_401, w_402;
    full_adder FA_184 (.a(w_384), .b(w_386), .cin(w_388), .sum(w_401), .carry(w_402));
    wire w_403, w_404;
    full_adder FA_185 (.a(w_390), .b(w_391), .cin(w_393), .sum(w_403), .carry(w_404));
    wire w_405, w_406;
    full_adder FA_186 (.a(w_395), .b(w_397), .cin(w_399), .sum(w_405), .carry(w_406));
    wire w_407, w_408;
    full_adder FA_187 (.a(w_401), .b(w_403), .cin(w_405), .sum(w_407), .carry(w_408));

    // Pipeline Register Bank: Post-Stage 22 Layer
    wire [67:0] stage22_D;
    wire [67:0] stage22_Q;
    assign stage22_D = {stage20_Q[86], stage20_Q[85], stage20_Q[84], stage20_Q[83], stage20_Q[82], stage20_Q[81], stage20_Q[80], stage20_Q[79], stage20_Q[78], stage20_Q[77], stage20_Q[76], stage20_Q[75], stage20_Q[74], stage20_Q[73], stage20_Q[72], stage20_Q[71], stage20_Q[70], stage20_Q[69], stage20_Q[68], stage20_Q[67], stage20_Q[66], stage20_Q[65], stage20_Q[64], stage20_Q[63], stage20_Q[62], stage20_Q[61], stage20_Q[60], stage20_Q[59], w_408, w_406, w_404, w_402, w_400, w_398, w_396, w_394, w_392, stage20_Q[58], stage20_Q[57], stage20_Q[56], stage20_Q[55], stage20_Q[54], stage20_Q[53], stage20_Q[52], stage20_Q[51], w_407, w_389, stage20_Q[20], stage20_Q[19], stage20_Q[18], stage20_Q[17], stage20_Q[16], stage20_Q[15], stage20_Q[14], stage20_Q[13], stage20_Q[12], stage20_Q[11], stage20_Q[10], stage20_Q[9], stage20_Q[8], stage20_Q[7], stage20_Q[6], stage20_Q[5], stage20_Q[4], stage20_Q[3], stage20_Q[2], stage20_Q[1], stage20_Q[0]};
    register_bank #(.WIDTH(68)) reg_stage_22 (
        .clk(clk), .rst(rst), .en(en), .D(stage22_D), .Q(stage22_Q)
    );

    // ========================================================
    // Stage 23
    // ========================================================
    wire w_409, w_410;
    full_adder FA_188 (.a(stage22_Q[23]), .b(stage22_Q[24]), .cin(stage22_Q[25]), .sum(w_409), .carry(w_410));
    wire w_411, w_412;
    full_adder FA_189 (.a(stage22_Q[26]), .b(stage22_Q[27]), .cin(stage22_Q[28]), .sum(w_411), .carry(w_412));
    wire w_413, w_414;
    full_adder FA_190 (.a(stage22_Q[29]), .b(stage22_Q[30]), .cin(stage22_Q[31]), .sum(w_413), .carry(w_414));
    wire w_415, w_416;
    full_adder FA_191 (.a(stage22_Q[32]), .b(stage22_Q[33]), .cin(stage22_Q[34]), .sum(w_415), .carry(w_416));
    wire w_417, w_418;
    full_adder FA_192 (.a(stage22_Q[35]), .b(stage22_Q[36]), .cin(stage22_Q[37]), .sum(w_417), .carry(w_418));
    wire w_419, w_420;
    full_adder FA_193 (.a(stage22_Q[38]), .b(stage22_Q[39]), .cin(w_409), .sum(w_419), .carry(w_420));
    wire w_421, w_422;
    full_adder FA_194 (.a(w_411), .b(w_413), .cin(w_415), .sum(w_421), .carry(w_422));
    wire w_423, w_424;
    full_adder FA_195 (.a(w_417), .b(w_419), .cin(w_421), .sum(w_423), .carry(w_424));

    // ========================================================
    // Stage 24
    // ========================================================
    wire w_425, w_426;
    full_adder FA_196 (.a(stage22_Q[40]), .b(stage22_Q[41]), .cin(stage22_Q[42]), .sum(w_425), .carry(w_426));
    wire w_427, w_428;
    full_adder FA_197 (.a(stage22_Q[43]), .b(stage22_Q[44]), .cin(stage22_Q[45]), .sum(w_427), .carry(w_428));
    wire w_429, w_430;
    full_adder FA_198 (.a(stage22_Q[46]), .b(w_410), .cin(w_412), .sum(w_429), .carry(w_430));
    wire w_431, w_432;
    full_adder FA_199 (.a(w_414), .b(w_416), .cin(w_418), .sum(w_431), .carry(w_432));
    wire w_433, w_434;
    full_adder FA_200 (.a(w_420), .b(w_422), .cin(w_424), .sum(w_433), .carry(w_434));
    wire w_435, w_436;
    full_adder FA_201 (.a(w_425), .b(w_427), .cin(w_429), .sum(w_435), .carry(w_436));
    wire w_437, w_438;
    full_adder FA_202 (.a(w_431), .b(w_433), .cin(w_435), .sum(w_437), .carry(w_438));

    // Pipeline Register Bank: Post-Stage 24 Layer
    wire [52:0] stage24_D;
    wire [52:0] stage24_Q;
    assign stage24_D = {stage22_Q[67], stage22_Q[66], stage22_Q[65], stage22_Q[64], stage22_Q[63], stage22_Q[62], stage22_Q[61], stage22_Q[60], stage22_Q[59], stage22_Q[58], stage22_Q[57], stage22_Q[56], stage22_Q[55], stage22_Q[54], stage22_Q[53], w_438, w_436, w_434, w_432, w_430, w_428, w_426, stage22_Q[52], stage22_Q[51], stage22_Q[50], stage22_Q[49], stage22_Q[48], stage22_Q[47], w_437, w_423, stage22_Q[22], stage22_Q[21], stage22_Q[20], stage22_Q[19], stage22_Q[18], stage22_Q[17], stage22_Q[16], stage22_Q[15], stage22_Q[14], stage22_Q[13], stage22_Q[12], stage22_Q[11], stage22_Q[10], stage22_Q[9], stage22_Q[8], stage22_Q[7], stage22_Q[6], stage22_Q[5], stage22_Q[4], stage22_Q[3], stage22_Q[2], stage22_Q[1], stage22_Q[0]};
    register_bank #(.WIDTH(53)) reg_stage_24 (
        .clk(clk), .rst(rst), .en(en), .D(stage24_D), .Q(stage24_Q)
    );

    // ========================================================
    // Stage 25
    // ========================================================
    wire w_439, w_440;
    full_adder FA_203 (.a(stage24_Q[25]), .b(stage24_Q[26]), .cin(stage24_Q[27]), .sum(w_439), .carry(w_440));
    wire w_441, w_442;
    full_adder FA_204 (.a(stage24_Q[28]), .b(stage24_Q[29]), .cin(stage24_Q[30]), .sum(w_441), .carry(w_442));
    wire w_443, w_444;
    full_adder FA_205 (.a(stage24_Q[31]), .b(stage24_Q[32]), .cin(stage24_Q[33]), .sum(w_443), .carry(w_444));
    wire w_445, w_446;
    full_adder FA_206 (.a(stage24_Q[34]), .b(stage24_Q[35]), .cin(stage24_Q[36]), .sum(w_445), .carry(w_446));
    wire w_447, w_448;
    full_adder FA_207 (.a(stage24_Q[37]), .b(w_439), .cin(w_441), .sum(w_447), .carry(w_448));
    wire w_449, w_450;
    full_adder FA_208 (.a(w_443), .b(w_445), .cin(w_447), .sum(w_449), .carry(w_450));

    // ========================================================
    // Stage 26
    // ========================================================
    wire w_451, w_452;
    full_adder FA_209 (.a(stage24_Q[38]), .b(stage24_Q[39]), .cin(stage24_Q[40]), .sum(w_451), .carry(w_452));
    wire w_453, w_454;
    full_adder FA_210 (.a(stage24_Q[41]), .b(stage24_Q[42]), .cin(w_440), .sum(w_453), .carry(w_454));
    wire w_455, w_456;
    full_adder FA_211 (.a(w_442), .b(w_444), .cin(w_446), .sum(w_455), .carry(w_456));
    wire w_457, w_458;
    full_adder FA_212 (.a(w_448), .b(w_450), .cin(w_451), .sum(w_457), .carry(w_458));
    wire w_459, w_460;
    full_adder FA_213 (.a(w_453), .b(w_455), .cin(w_457), .sum(w_459), .carry(w_460));

    // Pipeline Register Bank: Post-Stage 26 Layer
    wire [41:0] stage26_D;
    wire [41:0] stage26_Q;
    assign stage26_D = {stage24_Q[52], stage24_Q[51], stage24_Q[50], stage24_Q[49], stage24_Q[48], stage24_Q[47], w_460, w_458, w_456, w_454, w_452, stage24_Q[46], stage24_Q[45], stage24_Q[44], stage24_Q[43], w_459, w_449, stage24_Q[24], stage24_Q[23], stage24_Q[22], stage24_Q[21], stage24_Q[20], stage24_Q[19], stage24_Q[18], stage24_Q[17], stage24_Q[16], stage24_Q[15], stage24_Q[14], stage24_Q[13], stage24_Q[12], stage24_Q[11], stage24_Q[10], stage24_Q[9], stage24_Q[8], stage24_Q[7], stage24_Q[6], stage24_Q[5], stage24_Q[4], stage24_Q[3], stage24_Q[2], stage24_Q[1], stage24_Q[0]};
    register_bank #(.WIDTH(42)) reg_stage_26 (
        .clk(clk), .rst(rst), .en(en), .D(stage26_D), .Q(stage26_Q)
    );

    // ========================================================
    // Stage 27
    // ========================================================
    wire w_461, w_462;
    full_adder FA_214 (.a(stage26_Q[27]), .b(stage26_Q[28]), .cin(stage26_Q[29]), .sum(w_461), .carry(w_462));
    wire w_463, w_464;
    full_adder FA_215 (.a(stage26_Q[30]), .b(stage26_Q[31]), .cin(stage26_Q[32]), .sum(w_463), .carry(w_464));
    wire w_465, w_466;
    full_adder FA_216 (.a(stage26_Q[33]), .b(stage26_Q[34]), .cin(stage26_Q[35]), .sum(w_465), .carry(w_466));
    wire w_467, w_468;
    full_adder FA_217 (.a(w_461), .b(w_463), .cin(w_465), .sum(w_467), .carry(w_468));

    // ========================================================
    // Stage 28
    // ========================================================
    wire w_469, w_470;
    full_adder FA_218 (.a(stage26_Q[36]), .b(stage26_Q[37]), .cin(stage26_Q[38]), .sum(w_469), .carry(w_470));
    wire w_471, w_472;
    full_adder FA_219 (.a(w_462), .b(w_464), .cin(w_466), .sum(w_471), .carry(w_472));
    wire w_473, w_474;
    full_adder FA_220 (.a(w_468), .b(w_469), .cin(w_471), .sum(w_473), .carry(w_474));

    // Pipeline Register Bank: Post-Stage 28 Layer
    wire [34:0] stage28_D;
    wire [34:0] stage28_Q;
    assign stage28_D = {stage26_Q[41], w_474, w_472, w_470, stage26_Q[40], stage26_Q[39], w_473, w_467, stage26_Q[26], stage26_Q[25], stage26_Q[24], stage26_Q[23], stage26_Q[22], stage26_Q[21], stage26_Q[20], stage26_Q[19], stage26_Q[18], stage26_Q[17], stage26_Q[16], stage26_Q[15], stage26_Q[14], stage26_Q[13], stage26_Q[12], stage26_Q[11], stage26_Q[10], stage26_Q[9], stage26_Q[8], stage26_Q[7], stage26_Q[6], stage26_Q[5], stage26_Q[4], stage26_Q[3], stage26_Q[2], stage26_Q[1], stage26_Q[0]};
    register_bank #(.WIDTH(35)) reg_stage_28 (
        .clk(clk), .rst(rst), .en(en), .D(stage28_D), .Q(stage28_Q)
    );

    // ========================================================
    // Stage 29
    // ========================================================
    wire w_475, w_476;
    full_adder FA_221 (.a(stage28_Q[29]), .b(stage28_Q[30]), .cin(stage28_Q[31]), .sum(w_475), .carry(w_476));
    wire w_477, w_478;
    full_adder FA_222 (.a(stage28_Q[32]), .b(stage28_Q[33]), .cin(w_475), .sum(w_477), .carry(w_478));

    // ========================================================
    // Stage 30
    // ========================================================
    wire w_479, w_480;
    full_adder FA_223 (.a(stage28_Q[34]), .b(w_476), .cin(w_478), .sum(w_479), .carry(w_480));

    // Pipeline Register Bank: Post-Stage 30 Layer
    wire [31:0] stage30_D;
    wire [31:0] stage30_Q;
    assign stage30_D = {w_480, w_479, w_477, stage28_Q[28], stage28_Q[27], stage28_Q[26], stage28_Q[25], stage28_Q[24], stage28_Q[23], stage28_Q[22], stage28_Q[21], stage28_Q[20], stage28_Q[19], stage28_Q[18], stage28_Q[17], stage28_Q[16], stage28_Q[15], stage28_Q[14], stage28_Q[13], stage28_Q[12], stage28_Q[11], stage28_Q[10], stage28_Q[9], stage28_Q[8], stage28_Q[7], stage28_Q[6], stage28_Q[5], stage28_Q[4], stage28_Q[3], stage28_Q[2], stage28_Q[1], stage28_Q[0]};
    register_bank #(.WIDTH(32)) reg_stage_30 (
        .clk(clk), .rst(rst), .en(en), .D(stage30_D), .Q(stage30_Q)
    );

    // ========================================================
    // Vector Preparation for Final Product
    // ========================================================
    wire [31:0] raw_product_vec = {stage30_Q[31], stage30_Q[30], stage30_Q[29], stage30_Q[28], stage30_Q[27], stage30_Q[26], stage30_Q[25], stage30_Q[24], stage30_Q[23], stage30_Q[22], stage30_Q[21], stage30_Q[20], stage30_Q[19], stage30_Q[18], stage30_Q[17], stage30_Q[16], stage30_Q[15], stage30_Q[14], stage30_Q[13], stage30_Q[12], stage30_Q[11], stage30_Q[10], stage30_Q[9], stage30_Q[8], stage30_Q[7], stage30_Q[6], stage30_Q[5], stage30_Q[4], stage30_Q[3], stage30_Q[2], stage30_Q[1], stage30_Q[0]};

    // ========================================================
    // Boundary Pipeline Registers: Final Output (Product)
    // ========================================================
    register_bank #(.WIDTH(32)) reg_output_product (
        .clk(clk), .rst(rst), .en(en), .D(raw_product_vec), .Q(Product)
    );

endmodule
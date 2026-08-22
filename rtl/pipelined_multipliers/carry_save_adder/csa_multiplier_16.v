// ======================================================================
// Dynamically Generated Pipelined Array - Carry Save Adder Multiplier
// Configuration: N = 16
// ======================================================================

module csa_multiplier_16 (
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
    wire [15:0] csa_sum_r1;
    wire [15:0] csa_carry_r1;
    carry_save_adder #(.N(16)) csa_row_1 (
        .A({raw_pp[31], raw_pp[30], raw_pp[29], raw_pp[28], raw_pp[27], raw_pp[26], raw_pp[25], raw_pp[24], raw_pp[23], raw_pp[22], raw_pp[21], raw_pp[20], raw_pp[19], raw_pp[18], raw_pp[17], raw_pp[16]}), .B({1'b0, raw_pp[15], raw_pp[14], raw_pp[13], raw_pp[12], raw_pp[11], raw_pp[10], raw_pp[9], raw_pp[8], raw_pp[7], raw_pp[6], raw_pp[5], raw_pp[4], raw_pp[3], raw_pp[2], raw_pp[1]}), .C({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
        .SUM(csa_sum_r1), .CARRY(csa_carry_r1)
    );

    // ========================================================
    // Stage 2
    // ========================================================
    wire [15:0] csa_sum_r2;
    wire [15:0] csa_carry_r2;
    carry_save_adder #(.N(16)) csa_row_2 (
        .A({raw_pp[47], raw_pp[46], raw_pp[45], raw_pp[44], raw_pp[43], raw_pp[42], raw_pp[41], raw_pp[40], raw_pp[39], raw_pp[38], raw_pp[37], raw_pp[36], raw_pp[35], raw_pp[34], raw_pp[33], raw_pp[32]}), .B({1'b0, csa_sum_r1[15], csa_sum_r1[14], csa_sum_r1[13], csa_sum_r1[12], csa_sum_r1[11], csa_sum_r1[10], csa_sum_r1[9], csa_sum_r1[8], csa_sum_r1[7], csa_sum_r1[6], csa_sum_r1[5], csa_sum_r1[4], csa_sum_r1[3], csa_sum_r1[2], csa_sum_r1[1]}), .C({1'b0, csa_carry_r1[14], csa_carry_r1[13], csa_carry_r1[12], csa_carry_r1[11], csa_carry_r1[10], csa_carry_r1[9], csa_carry_r1[8], csa_carry_r1[7], csa_carry_r1[6], csa_carry_r1[5], csa_carry_r1[4], csa_carry_r1[3], csa_carry_r1[2], csa_carry_r1[1], csa_carry_r1[0]}),
        .SUM(csa_sum_r2), .CARRY(csa_carry_r2)
    );

    // Pipeline Register Bank: Post-Stage 2 Layer
    wire [269:0] stage2_D;
    wire [269:0] stage2_Q;
    assign stage2_D = {1'b0, 1'b0, raw_pp[255], 1'b0, 1'b0, raw_pp[254], raw_pp[239], 1'b0, 1'b0, raw_pp[253], raw_pp[238], raw_pp[223], 1'b0, 1'b0, raw_pp[252], raw_pp[237], raw_pp[222], raw_pp[207], 1'b0, 1'b0, raw_pp[251], raw_pp[236], raw_pp[221], raw_pp[206], raw_pp[191], 1'b0, 1'b0, raw_pp[250], raw_pp[235], raw_pp[220], raw_pp[205], raw_pp[190], raw_pp[175], 1'b0, 1'b0, raw_pp[249], raw_pp[234], raw_pp[219], raw_pp[204], raw_pp[189], raw_pp[174], raw_pp[159], 1'b0, 1'b0, raw_pp[248], raw_pp[233], raw_pp[218], raw_pp[203], raw_pp[188], raw_pp[173], raw_pp[158], raw_pp[143], 1'b0, 1'b0, raw_pp[247], raw_pp[232], raw_pp[217], raw_pp[202], raw_pp[187], raw_pp[172], raw_pp[157], raw_pp[142], raw_pp[127], 1'b0, 1'b0, raw_pp[246], raw_pp[231], raw_pp[216], raw_pp[201], raw_pp[186], raw_pp[171], raw_pp[156], raw_pp[141], raw_pp[126], raw_pp[111], 1'b0, 1'b0, raw_pp[245], raw_pp[230], raw_pp[215], raw_pp[200], raw_pp[185], raw_pp[170], raw_pp[155], raw_pp[140], raw_pp[125], raw_pp[110], raw_pp[95], 1'b0, 1'b0, raw_pp[244], raw_pp[229], raw_pp[214], raw_pp[199], raw_pp[184], raw_pp[169], raw_pp[154], raw_pp[139], raw_pp[124], raw_pp[109], raw_pp[94], raw_pp[79], 1'b0, 1'b0, raw_pp[243], raw_pp[228], raw_pp[213], raw_pp[198], raw_pp[183], raw_pp[168], raw_pp[153], raw_pp[138], raw_pp[123], raw_pp[108], raw_pp[93], raw_pp[78], raw_pp[63], 1'b0, 1'b0, raw_pp[242], raw_pp[227], raw_pp[212], raw_pp[197], raw_pp[182], raw_pp[167], raw_pp[152], raw_pp[137], raw_pp[122], raw_pp[107], raw_pp[92], raw_pp[77], raw_pp[62], csa_carry_r2[14], csa_sum_r2[15], raw_pp[241], raw_pp[226], raw_pp[211], raw_pp[196], raw_pp[181], raw_pp[166], raw_pp[151], raw_pp[136], raw_pp[121], raw_pp[106], raw_pp[91], raw_pp[76], raw_pp[61], csa_carry_r2[13], csa_sum_r2[14], raw_pp[240], raw_pp[225], raw_pp[210], raw_pp[195], raw_pp[180], raw_pp[165], raw_pp[150], raw_pp[135], raw_pp[120], raw_pp[105], raw_pp[90], raw_pp[75], raw_pp[60], csa_carry_r2[12], csa_sum_r2[13], raw_pp[224], raw_pp[209], raw_pp[194], raw_pp[179], raw_pp[164], raw_pp[149], raw_pp[134], raw_pp[119], raw_pp[104], raw_pp[89], raw_pp[74], raw_pp[59], csa_carry_r2[11], csa_sum_r2[12], raw_pp[208], raw_pp[193], raw_pp[178], raw_pp[163], raw_pp[148], raw_pp[133], raw_pp[118], raw_pp[103], raw_pp[88], raw_pp[73], raw_pp[58], csa_carry_r2[10], csa_sum_r2[11], raw_pp[192], raw_pp[177], raw_pp[162], raw_pp[147], raw_pp[132], raw_pp[117], raw_pp[102], raw_pp[87], raw_pp[72], raw_pp[57], csa_carry_r2[9], csa_sum_r2[10], raw_pp[176], raw_pp[161], raw_pp[146], raw_pp[131], raw_pp[116], raw_pp[101], raw_pp[86], raw_pp[71], raw_pp[56], csa_carry_r2[8], csa_sum_r2[9], raw_pp[160], raw_pp[145], raw_pp[130], raw_pp[115], raw_pp[100], raw_pp[85], raw_pp[70], raw_pp[55], csa_carry_r2[7], csa_sum_r2[8], raw_pp[144], raw_pp[129], raw_pp[114], raw_pp[99], raw_pp[84], raw_pp[69], raw_pp[54], csa_carry_r2[6], csa_sum_r2[7], raw_pp[128], raw_pp[113], raw_pp[98], raw_pp[83], raw_pp[68], raw_pp[53], csa_carry_r2[5], csa_sum_r2[6], raw_pp[112], raw_pp[97], raw_pp[82], raw_pp[67], raw_pp[52], csa_carry_r2[4], csa_sum_r2[5], raw_pp[96], raw_pp[81], raw_pp[66], raw_pp[51], csa_carry_r2[3], csa_sum_r2[4], raw_pp[80], raw_pp[65], raw_pp[50], csa_carry_r2[2], csa_sum_r2[3], raw_pp[64], raw_pp[49], csa_carry_r2[1], csa_sum_r2[2], raw_pp[48], csa_carry_r2[0], csa_sum_r2[1], 1'b0, csa_sum_r2[0], csa_sum_r1[0], raw_pp[0]};
    register_bank #(.WIDTH(270)) reg_stage_2 (
        .clk(clk), .rst(rst), .en(en), .D(stage2_D), .Q(stage2_Q)
    );

    // ========================================================
    // Stage 3
    // ========================================================
    wire [15:0] csa_sum_r3;
    wire [15:0] csa_carry_r3;
    carry_save_adder #(.N(16)) csa_row_3 (
        .A({stage2_Q[153], stage2_Q[138], stage2_Q[123], stage2_Q[108], stage2_Q[94], stage2_Q[81], stage2_Q[69], stage2_Q[58], stage2_Q[48], stage2_Q[39], stage2_Q[31], stage2_Q[24], stage2_Q[18], stage2_Q[13], stage2_Q[9], stage2_Q[6]}), .B({stage2_Q[151], stage2_Q[136], stage2_Q[121], stage2_Q[106], stage2_Q[92], stage2_Q[79], stage2_Q[67], stage2_Q[56], stage2_Q[46], stage2_Q[37], stage2_Q[29], stage2_Q[22], stage2_Q[16], stage2_Q[11], stage2_Q[7], stage2_Q[4]}), .C({stage2_Q[152], stage2_Q[137], stage2_Q[122], stage2_Q[107], stage2_Q[93], stage2_Q[80], stage2_Q[68], stage2_Q[57], stage2_Q[47], stage2_Q[38], stage2_Q[30], stage2_Q[23], stage2_Q[17], stage2_Q[12], stage2_Q[8], stage2_Q[5]}),
        .SUM(csa_sum_r3), .CARRY(csa_carry_r3)
    );

    // ========================================================
    // Stage 4
    // ========================================================
    wire [15:0] csa_sum_r4;
    wire [15:0] csa_carry_r4;
    carry_save_adder #(.N(16)) csa_row_4 (
        .A({stage2_Q[168], stage2_Q[154], stage2_Q[139], stage2_Q[124], stage2_Q[109], stage2_Q[95], stage2_Q[82], stage2_Q[70], stage2_Q[59], stage2_Q[49], stage2_Q[40], stage2_Q[32], stage2_Q[25], stage2_Q[19], stage2_Q[14], stage2_Q[10]}), .B({stage2_Q[166], csa_sum_r3[15], csa_sum_r3[14], csa_sum_r3[13], csa_sum_r3[12], csa_sum_r3[11], csa_sum_r3[10], csa_sum_r3[9], csa_sum_r3[8], csa_sum_r3[7], csa_sum_r3[6], csa_sum_r3[5], csa_sum_r3[4], csa_sum_r3[3], csa_sum_r3[2], csa_sum_r3[1]}), .C({stage2_Q[167], csa_carry_r3[14], csa_carry_r3[13], csa_carry_r3[12], csa_carry_r3[11], csa_carry_r3[10], csa_carry_r3[9], csa_carry_r3[8], csa_carry_r3[7], csa_carry_r3[6], csa_carry_r3[5], csa_carry_r3[4], csa_carry_r3[3], csa_carry_r3[2], csa_carry_r3[1], csa_carry_r3[0]}),
        .SUM(csa_sum_r4), .CARRY(csa_carry_r4)
    );

    // Pipeline Register Bank: Post-Stage 4 Layer
    wire [235:0] stage4_D;
    wire [235:0] stage4_Q;
    assign stage4_D = {stage2_Q[269], stage2_Q[268], stage2_Q[267], stage2_Q[266], stage2_Q[265], stage2_Q[264], stage2_Q[263], stage2_Q[262], stage2_Q[261], stage2_Q[260], stage2_Q[259], stage2_Q[258], stage2_Q[257], stage2_Q[256], stage2_Q[255], stage2_Q[254], stage2_Q[253], stage2_Q[252], stage2_Q[251], stage2_Q[250], stage2_Q[249], stage2_Q[248], stage2_Q[247], stage2_Q[246], stage2_Q[245], stage2_Q[244], stage2_Q[243], stage2_Q[242], stage2_Q[241], stage2_Q[240], stage2_Q[239], stage2_Q[238], stage2_Q[237], stage2_Q[236], stage2_Q[235], stage2_Q[234], stage2_Q[233], stage2_Q[232], stage2_Q[231], stage2_Q[230], stage2_Q[229], stage2_Q[228], stage2_Q[227], stage2_Q[226], stage2_Q[225], stage2_Q[224], stage2_Q[223], stage2_Q[222], stage2_Q[221], stage2_Q[220], stage2_Q[219], stage2_Q[218], stage2_Q[217], stage2_Q[216], stage2_Q[215], stage2_Q[214], stage2_Q[213], stage2_Q[212], stage2_Q[211], stage2_Q[210], stage2_Q[209], stage2_Q[208], stage2_Q[207], stage2_Q[206], stage2_Q[205], stage2_Q[204], stage2_Q[203], stage2_Q[202], stage2_Q[201], stage2_Q[200], stage2_Q[199], stage2_Q[198], stage2_Q[197], stage2_Q[196], stage2_Q[195], stage2_Q[194], stage2_Q[193], stage2_Q[192], stage2_Q[191], stage2_Q[190], stage2_Q[189], stage2_Q[188], stage2_Q[187], stage2_Q[186], stage2_Q[185], stage2_Q[184], stage2_Q[183], stage2_Q[182], stage2_Q[181], stage2_Q[180], stage2_Q[179], stage2_Q[178], stage2_Q[177], stage2_Q[176], stage2_Q[175], stage2_Q[174], stage2_Q[173], stage2_Q[172], stage2_Q[171], stage2_Q[170], stage2_Q[169], csa_carry_r4[14], csa_sum_r4[15], stage2_Q[165], stage2_Q[164], stage2_Q[163], stage2_Q[162], stage2_Q[161], stage2_Q[160], stage2_Q[159], stage2_Q[158], stage2_Q[157], stage2_Q[156], stage2_Q[155], csa_carry_r4[13], csa_sum_r4[14], stage2_Q[150], stage2_Q[149], stage2_Q[148], stage2_Q[147], stage2_Q[146], stage2_Q[145], stage2_Q[144], stage2_Q[143], stage2_Q[142], stage2_Q[141], stage2_Q[140], csa_carry_r4[12], csa_sum_r4[13], stage2_Q[135], stage2_Q[134], stage2_Q[133], stage2_Q[132], stage2_Q[131], stage2_Q[130], stage2_Q[129], stage2_Q[128], stage2_Q[127], stage2_Q[126], stage2_Q[125], csa_carry_r4[11], csa_sum_r4[12], stage2_Q[120], stage2_Q[119], stage2_Q[118], stage2_Q[117], stage2_Q[116], stage2_Q[115], stage2_Q[114], stage2_Q[113], stage2_Q[112], stage2_Q[111], stage2_Q[110], csa_carry_r4[10], csa_sum_r4[11], stage2_Q[105], stage2_Q[104], stage2_Q[103], stage2_Q[102], stage2_Q[101], stage2_Q[100], stage2_Q[99], stage2_Q[98], stage2_Q[97], stage2_Q[96], csa_carry_r4[9], csa_sum_r4[10], stage2_Q[91], stage2_Q[90], stage2_Q[89], stage2_Q[88], stage2_Q[87], stage2_Q[86], stage2_Q[85], stage2_Q[84], stage2_Q[83], csa_carry_r4[8], csa_sum_r4[9], stage2_Q[78], stage2_Q[77], stage2_Q[76], stage2_Q[75], stage2_Q[74], stage2_Q[73], stage2_Q[72], stage2_Q[71], csa_carry_r4[7], csa_sum_r4[8], stage2_Q[66], stage2_Q[65], stage2_Q[64], stage2_Q[63], stage2_Q[62], stage2_Q[61], stage2_Q[60], csa_carry_r4[6], csa_sum_r4[7], stage2_Q[55], stage2_Q[54], stage2_Q[53], stage2_Q[52], stage2_Q[51], stage2_Q[50], csa_carry_r4[5], csa_sum_r4[6], stage2_Q[45], stage2_Q[44], stage2_Q[43], stage2_Q[42], stage2_Q[41], csa_carry_r4[4], csa_sum_r4[5], stage2_Q[36], stage2_Q[35], stage2_Q[34], stage2_Q[33], csa_carry_r4[3], csa_sum_r4[4], stage2_Q[28], stage2_Q[27], stage2_Q[26], csa_carry_r4[2], csa_sum_r4[3], stage2_Q[21], stage2_Q[20], csa_carry_r4[1], csa_sum_r4[2], stage2_Q[15], csa_carry_r4[0], csa_sum_r4[1], 1'b0, csa_sum_r4[0], csa_sum_r3[0], stage2_Q[2], stage2_Q[1], stage2_Q[0]};
    register_bank #(.WIDTH(236)) reg_stage_4 (
        .clk(clk), .rst(rst), .en(en), .D(stage4_D), .Q(stage4_Q)
    );

    // ========================================================
    // Stage 5
    // ========================================================
    wire [15:0] csa_sum_r5;
    wire [15:0] csa_carry_r5;
    carry_save_adder #(.N(16)) csa_row_5 (
        .A({stage4_Q[148], stage4_Q[135], stage4_Q[122], stage4_Q[109], stage4_Q[96], stage4_Q[83], stage4_Q[71], stage4_Q[60], stage4_Q[50], stage4_Q[41], stage4_Q[33], stage4_Q[26], stage4_Q[20], stage4_Q[15], stage4_Q[11], stage4_Q[8]}), .B({stage4_Q[146], stage4_Q[133], stage4_Q[120], stage4_Q[107], stage4_Q[94], stage4_Q[81], stage4_Q[69], stage4_Q[58], stage4_Q[48], stage4_Q[39], stage4_Q[31], stage4_Q[24], stage4_Q[18], stage4_Q[13], stage4_Q[9], stage4_Q[6]}), .C({stage4_Q[147], stage4_Q[134], stage4_Q[121], stage4_Q[108], stage4_Q[95], stage4_Q[82], stage4_Q[70], stage4_Q[59], stage4_Q[49], stage4_Q[40], stage4_Q[32], stage4_Q[25], stage4_Q[19], stage4_Q[14], stage4_Q[10], stage4_Q[7]}),
        .SUM(csa_sum_r5), .CARRY(csa_carry_r5)
    );

    // ========================================================
    // Stage 6
    // ========================================================
    wire [15:0] csa_sum_r6;
    wire [15:0] csa_carry_r6;
    carry_save_adder #(.N(16)) csa_row_6 (
        .A({stage4_Q[161], stage4_Q[149], stage4_Q[136], stage4_Q[123], stage4_Q[110], stage4_Q[97], stage4_Q[84], stage4_Q[72], stage4_Q[61], stage4_Q[51], stage4_Q[42], stage4_Q[34], stage4_Q[27], stage4_Q[21], stage4_Q[16], stage4_Q[12]}), .B({stage4_Q[159], csa_sum_r5[15], csa_sum_r5[14], csa_sum_r5[13], csa_sum_r5[12], csa_sum_r5[11], csa_sum_r5[10], csa_sum_r5[9], csa_sum_r5[8], csa_sum_r5[7], csa_sum_r5[6], csa_sum_r5[5], csa_sum_r5[4], csa_sum_r5[3], csa_sum_r5[2], csa_sum_r5[1]}), .C({stage4_Q[160], csa_carry_r5[14], csa_carry_r5[13], csa_carry_r5[12], csa_carry_r5[11], csa_carry_r5[10], csa_carry_r5[9], csa_carry_r5[8], csa_carry_r5[7], csa_carry_r5[6], csa_carry_r5[5], csa_carry_r5[4], csa_carry_r5[3], csa_carry_r5[2], csa_carry_r5[1], csa_carry_r5[0]}),
        .SUM(csa_sum_r6), .CARRY(csa_carry_r6)
    );

    // Pipeline Register Bank: Post-Stage 6 Layer
    wire [201:0] stage6_D;
    wire [201:0] stage6_Q;
    assign stage6_D = {stage4_Q[235], stage4_Q[234], stage4_Q[233], stage4_Q[232], stage4_Q[231], stage4_Q[230], stage4_Q[229], stage4_Q[228], stage4_Q[227], stage4_Q[226], stage4_Q[225], stage4_Q[224], stage4_Q[223], stage4_Q[222], stage4_Q[221], stage4_Q[220], stage4_Q[219], stage4_Q[218], stage4_Q[217], stage4_Q[216], stage4_Q[215], stage4_Q[214], stage4_Q[213], stage4_Q[212], stage4_Q[211], stage4_Q[210], stage4_Q[209], stage4_Q[208], stage4_Q[207], stage4_Q[206], stage4_Q[205], stage4_Q[204], stage4_Q[203], stage4_Q[202], stage4_Q[201], stage4_Q[200], stage4_Q[199], stage4_Q[198], stage4_Q[197], stage4_Q[196], stage4_Q[195], stage4_Q[194], stage4_Q[193], stage4_Q[192], stage4_Q[191], stage4_Q[190], stage4_Q[189], stage4_Q[188], stage4_Q[187], stage4_Q[186], stage4_Q[185], stage4_Q[184], stage4_Q[183], stage4_Q[182], stage4_Q[181], stage4_Q[180], stage4_Q[179], stage4_Q[178], stage4_Q[177], stage4_Q[176], stage4_Q[175], stage4_Q[174], stage4_Q[173], stage4_Q[172], stage4_Q[171], stage4_Q[170], stage4_Q[169], stage4_Q[168], stage4_Q[167], stage4_Q[166], stage4_Q[165], stage4_Q[164], stage4_Q[163], stage4_Q[162], csa_carry_r6[14], csa_sum_r6[15], stage4_Q[158], stage4_Q[157], stage4_Q[156], stage4_Q[155], stage4_Q[154], stage4_Q[153], stage4_Q[152], stage4_Q[151], stage4_Q[150], csa_carry_r6[13], csa_sum_r6[14], stage4_Q[145], stage4_Q[144], stage4_Q[143], stage4_Q[142], stage4_Q[141], stage4_Q[140], stage4_Q[139], stage4_Q[138], stage4_Q[137], csa_carry_r6[12], csa_sum_r6[13], stage4_Q[132], stage4_Q[131], stage4_Q[130], stage4_Q[129], stage4_Q[128], stage4_Q[127], stage4_Q[126], stage4_Q[125], stage4_Q[124], csa_carry_r6[11], csa_sum_r6[12], stage4_Q[119], stage4_Q[118], stage4_Q[117], stage4_Q[116], stage4_Q[115], stage4_Q[114], stage4_Q[113], stage4_Q[112], stage4_Q[111], csa_carry_r6[10], csa_sum_r6[11], stage4_Q[106], stage4_Q[105], stage4_Q[104], stage4_Q[103], stage4_Q[102], stage4_Q[101], stage4_Q[100], stage4_Q[99], stage4_Q[98], csa_carry_r6[9], csa_sum_r6[10], stage4_Q[93], stage4_Q[92], stage4_Q[91], stage4_Q[90], stage4_Q[89], stage4_Q[88], stage4_Q[87], stage4_Q[86], stage4_Q[85], csa_carry_r6[8], csa_sum_r6[9], stage4_Q[80], stage4_Q[79], stage4_Q[78], stage4_Q[77], stage4_Q[76], stage4_Q[75], stage4_Q[74], stage4_Q[73], csa_carry_r6[7], csa_sum_r6[8], stage4_Q[68], stage4_Q[67], stage4_Q[66], stage4_Q[65], stage4_Q[64], stage4_Q[63], stage4_Q[62], csa_carry_r6[6], csa_sum_r6[7], stage4_Q[57], stage4_Q[56], stage4_Q[55], stage4_Q[54], stage4_Q[53], stage4_Q[52], csa_carry_r6[5], csa_sum_r6[6], stage4_Q[47], stage4_Q[46], stage4_Q[45], stage4_Q[44], stage4_Q[43], csa_carry_r6[4], csa_sum_r6[5], stage4_Q[38], stage4_Q[37], stage4_Q[36], stage4_Q[35], csa_carry_r6[3], csa_sum_r6[4], stage4_Q[30], stage4_Q[29], stage4_Q[28], csa_carry_r6[2], csa_sum_r6[3], stage4_Q[23], stage4_Q[22], csa_carry_r6[1], csa_sum_r6[2], stage4_Q[17], csa_carry_r6[0], csa_sum_r6[1], 1'b0, csa_sum_r6[0], csa_sum_r5[0], stage4_Q[4], stage4_Q[3], stage4_Q[2], stage4_Q[1], stage4_Q[0]};
    register_bank #(.WIDTH(202)) reg_stage_6 (
        .clk(clk), .rst(rst), .en(en), .D(stage6_D), .Q(stage6_Q)
    );

    // ========================================================
    // Stage 7
    // ========================================================
    wire [15:0] csa_sum_r7;
    wire [15:0] csa_carry_r7;
    carry_save_adder #(.N(16)) csa_row_7 (
        .A({stage6_Q[139], stage6_Q[128], stage6_Q[117], stage6_Q[106], stage6_Q[95], stage6_Q[84], stage6_Q[73], stage6_Q[62], stage6_Q[52], stage6_Q[43], stage6_Q[35], stage6_Q[28], stage6_Q[22], stage6_Q[17], stage6_Q[13], stage6_Q[10]}), .B({stage6_Q[137], stage6_Q[126], stage6_Q[115], stage6_Q[104], stage6_Q[93], stage6_Q[82], stage6_Q[71], stage6_Q[60], stage6_Q[50], stage6_Q[41], stage6_Q[33], stage6_Q[26], stage6_Q[20], stage6_Q[15], stage6_Q[11], stage6_Q[8]}), .C({stage6_Q[138], stage6_Q[127], stage6_Q[116], stage6_Q[105], stage6_Q[94], stage6_Q[83], stage6_Q[72], stage6_Q[61], stage6_Q[51], stage6_Q[42], stage6_Q[34], stage6_Q[27], stage6_Q[21], stage6_Q[16], stage6_Q[12], stage6_Q[9]}),
        .SUM(csa_sum_r7), .CARRY(csa_carry_r7)
    );

    // ========================================================
    // Stage 8
    // ========================================================
    wire [15:0] csa_sum_r8;
    wire [15:0] csa_carry_r8;
    carry_save_adder #(.N(16)) csa_row_8 (
        .A({stage6_Q[150], stage6_Q[140], stage6_Q[129], stage6_Q[118], stage6_Q[107], stage6_Q[96], stage6_Q[85], stage6_Q[74], stage6_Q[63], stage6_Q[53], stage6_Q[44], stage6_Q[36], stage6_Q[29], stage6_Q[23], stage6_Q[18], stage6_Q[14]}), .B({stage6_Q[148], csa_sum_r7[15], csa_sum_r7[14], csa_sum_r7[13], csa_sum_r7[12], csa_sum_r7[11], csa_sum_r7[10], csa_sum_r7[9], csa_sum_r7[8], csa_sum_r7[7], csa_sum_r7[6], csa_sum_r7[5], csa_sum_r7[4], csa_sum_r7[3], csa_sum_r7[2], csa_sum_r7[1]}), .C({stage6_Q[149], csa_carry_r7[14], csa_carry_r7[13], csa_carry_r7[12], csa_carry_r7[11], csa_carry_r7[10], csa_carry_r7[9], csa_carry_r7[8], csa_carry_r7[7], csa_carry_r7[6], csa_carry_r7[5], csa_carry_r7[4], csa_carry_r7[3], csa_carry_r7[2], csa_carry_r7[1], csa_carry_r7[0]}),
        .SUM(csa_sum_r8), .CARRY(csa_carry_r8)
    );

    // Pipeline Register Bank: Post-Stage 8 Layer
    wire [167:0] stage8_D;
    wire [167:0] stage8_Q;
    assign stage8_D = {stage6_Q[201], stage6_Q[200], stage6_Q[199], stage6_Q[198], stage6_Q[197], stage6_Q[196], stage6_Q[195], stage6_Q[194], stage6_Q[193], stage6_Q[192], stage6_Q[191], stage6_Q[190], stage6_Q[189], stage6_Q[188], stage6_Q[187], stage6_Q[186], stage6_Q[185], stage6_Q[184], stage6_Q[183], stage6_Q[182], stage6_Q[181], stage6_Q[180], stage6_Q[179], stage6_Q[178], stage6_Q[177], stage6_Q[176], stage6_Q[175], stage6_Q[174], stage6_Q[173], stage6_Q[172], stage6_Q[171], stage6_Q[170], stage6_Q[169], stage6_Q[168], stage6_Q[167], stage6_Q[166], stage6_Q[165], stage6_Q[164], stage6_Q[163], stage6_Q[162], stage6_Q[161], stage6_Q[160], stage6_Q[159], stage6_Q[158], stage6_Q[157], stage6_Q[156], stage6_Q[155], stage6_Q[154], stage6_Q[153], stage6_Q[152], stage6_Q[151], csa_carry_r8[14], csa_sum_r8[15], stage6_Q[147], stage6_Q[146], stage6_Q[145], stage6_Q[144], stage6_Q[143], stage6_Q[142], stage6_Q[141], csa_carry_r8[13], csa_sum_r8[14], stage6_Q[136], stage6_Q[135], stage6_Q[134], stage6_Q[133], stage6_Q[132], stage6_Q[131], stage6_Q[130], csa_carry_r8[12], csa_sum_r8[13], stage6_Q[125], stage6_Q[124], stage6_Q[123], stage6_Q[122], stage6_Q[121], stage6_Q[120], stage6_Q[119], csa_carry_r8[11], csa_sum_r8[12], stage6_Q[114], stage6_Q[113], stage6_Q[112], stage6_Q[111], stage6_Q[110], stage6_Q[109], stage6_Q[108], csa_carry_r8[10], csa_sum_r8[11], stage6_Q[103], stage6_Q[102], stage6_Q[101], stage6_Q[100], stage6_Q[99], stage6_Q[98], stage6_Q[97], csa_carry_r8[9], csa_sum_r8[10], stage6_Q[92], stage6_Q[91], stage6_Q[90], stage6_Q[89], stage6_Q[88], stage6_Q[87], stage6_Q[86], csa_carry_r8[8], csa_sum_r8[9], stage6_Q[81], stage6_Q[80], stage6_Q[79], stage6_Q[78], stage6_Q[77], stage6_Q[76], stage6_Q[75], csa_carry_r8[7], csa_sum_r8[8], stage6_Q[70], stage6_Q[69], stage6_Q[68], stage6_Q[67], stage6_Q[66], stage6_Q[65], stage6_Q[64], csa_carry_r8[6], csa_sum_r8[7], stage6_Q[59], stage6_Q[58], stage6_Q[57], stage6_Q[56], stage6_Q[55], stage6_Q[54], csa_carry_r8[5], csa_sum_r8[6], stage6_Q[49], stage6_Q[48], stage6_Q[47], stage6_Q[46], stage6_Q[45], csa_carry_r8[4], csa_sum_r8[5], stage6_Q[40], stage6_Q[39], stage6_Q[38], stage6_Q[37], csa_carry_r8[3], csa_sum_r8[4], stage6_Q[32], stage6_Q[31], stage6_Q[30], csa_carry_r8[2], csa_sum_r8[3], stage6_Q[25], stage6_Q[24], csa_carry_r8[1], csa_sum_r8[2], stage6_Q[19], csa_carry_r8[0], csa_sum_r8[1], 1'b0, csa_sum_r8[0], csa_sum_r7[0], stage6_Q[6], stage6_Q[5], stage6_Q[4], stage6_Q[3], stage6_Q[2], stage6_Q[1], stage6_Q[0]};
    register_bank #(.WIDTH(168)) reg_stage_8 (
        .clk(clk), .rst(rst), .en(en), .D(stage8_D), .Q(stage8_Q)
    );

    // ========================================================
    // Stage 9
    // ========================================================
    wire [15:0] csa_sum_r9;
    wire [15:0] csa_carry_r9;
    carry_save_adder #(.N(16)) csa_row_9 (
        .A({stage8_Q[126], stage8_Q[117], stage8_Q[108], stage8_Q[99], stage8_Q[90], stage8_Q[81], stage8_Q[72], stage8_Q[63], stage8_Q[54], stage8_Q[45], stage8_Q[37], stage8_Q[30], stage8_Q[24], stage8_Q[19], stage8_Q[15], stage8_Q[12]}), .B({stage8_Q[124], stage8_Q[115], stage8_Q[106], stage8_Q[97], stage8_Q[88], stage8_Q[79], stage8_Q[70], stage8_Q[61], stage8_Q[52], stage8_Q[43], stage8_Q[35], stage8_Q[28], stage8_Q[22], stage8_Q[17], stage8_Q[13], stage8_Q[10]}), .C({stage8_Q[125], stage8_Q[116], stage8_Q[107], stage8_Q[98], stage8_Q[89], stage8_Q[80], stage8_Q[71], stage8_Q[62], stage8_Q[53], stage8_Q[44], stage8_Q[36], stage8_Q[29], stage8_Q[23], stage8_Q[18], stage8_Q[14], stage8_Q[11]}),
        .SUM(csa_sum_r9), .CARRY(csa_carry_r9)
    );

    // ========================================================
    // Stage 10
    // ========================================================
    wire [15:0] csa_sum_r10;
    wire [15:0] csa_carry_r10;
    carry_save_adder #(.N(16)) csa_row_10 (
        .A({stage8_Q[135], stage8_Q[127], stage8_Q[118], stage8_Q[109], stage8_Q[100], stage8_Q[91], stage8_Q[82], stage8_Q[73], stage8_Q[64], stage8_Q[55], stage8_Q[46], stage8_Q[38], stage8_Q[31], stage8_Q[25], stage8_Q[20], stage8_Q[16]}), .B({stage8_Q[133], csa_sum_r9[15], csa_sum_r9[14], csa_sum_r9[13], csa_sum_r9[12], csa_sum_r9[11], csa_sum_r9[10], csa_sum_r9[9], csa_sum_r9[8], csa_sum_r9[7], csa_sum_r9[6], csa_sum_r9[5], csa_sum_r9[4], csa_sum_r9[3], csa_sum_r9[2], csa_sum_r9[1]}), .C({stage8_Q[134], csa_carry_r9[14], csa_carry_r9[13], csa_carry_r9[12], csa_carry_r9[11], csa_carry_r9[10], csa_carry_r9[9], csa_carry_r9[8], csa_carry_r9[7], csa_carry_r9[6], csa_carry_r9[5], csa_carry_r9[4], csa_carry_r9[3], csa_carry_r9[2], csa_carry_r9[1], csa_carry_r9[0]}),
        .SUM(csa_sum_r10), .CARRY(csa_carry_r10)
    );

    // Pipeline Register Bank: Post-Stage 10 Layer
    wire [133:0] stage10_D;
    wire [133:0] stage10_Q;
    assign stage10_D = {stage8_Q[167], stage8_Q[166], stage8_Q[165], stage8_Q[164], stage8_Q[163], stage8_Q[162], stage8_Q[161], stage8_Q[160], stage8_Q[159], stage8_Q[158], stage8_Q[157], stage8_Q[156], stage8_Q[155], stage8_Q[154], stage8_Q[153], stage8_Q[152], stage8_Q[151], stage8_Q[150], stage8_Q[149], stage8_Q[148], stage8_Q[147], stage8_Q[146], stage8_Q[145], stage8_Q[144], stage8_Q[143], stage8_Q[142], stage8_Q[141], stage8_Q[140], stage8_Q[139], stage8_Q[138], stage8_Q[137], stage8_Q[136], csa_carry_r10[14], csa_sum_r10[15], stage8_Q[132], stage8_Q[131], stage8_Q[130], stage8_Q[129], stage8_Q[128], csa_carry_r10[13], csa_sum_r10[14], stage8_Q[123], stage8_Q[122], stage8_Q[121], stage8_Q[120], stage8_Q[119], csa_carry_r10[12], csa_sum_r10[13], stage8_Q[114], stage8_Q[113], stage8_Q[112], stage8_Q[111], stage8_Q[110], csa_carry_r10[11], csa_sum_r10[12], stage8_Q[105], stage8_Q[104], stage8_Q[103], stage8_Q[102], stage8_Q[101], csa_carry_r10[10], csa_sum_r10[11], stage8_Q[96], stage8_Q[95], stage8_Q[94], stage8_Q[93], stage8_Q[92], csa_carry_r10[9], csa_sum_r10[10], stage8_Q[87], stage8_Q[86], stage8_Q[85], stage8_Q[84], stage8_Q[83], csa_carry_r10[8], csa_sum_r10[9], stage8_Q[78], stage8_Q[77], stage8_Q[76], stage8_Q[75], stage8_Q[74], csa_carry_r10[7], csa_sum_r10[8], stage8_Q[69], stage8_Q[68], stage8_Q[67], stage8_Q[66], stage8_Q[65], csa_carry_r10[6], csa_sum_r10[7], stage8_Q[60], stage8_Q[59], stage8_Q[58], stage8_Q[57], stage8_Q[56], csa_carry_r10[5], csa_sum_r10[6], stage8_Q[51], stage8_Q[50], stage8_Q[49], stage8_Q[48], stage8_Q[47], csa_carry_r10[4], csa_sum_r10[5], stage8_Q[42], stage8_Q[41], stage8_Q[40], stage8_Q[39], csa_carry_r10[3], csa_sum_r10[4], stage8_Q[34], stage8_Q[33], stage8_Q[32], csa_carry_r10[2], csa_sum_r10[3], stage8_Q[27], stage8_Q[26], csa_carry_r10[1], csa_sum_r10[2], stage8_Q[21], csa_carry_r10[0], csa_sum_r10[1], 1'b0, csa_sum_r10[0], csa_sum_r9[0], stage8_Q[8], stage8_Q[7], stage8_Q[6], stage8_Q[5], stage8_Q[4], stage8_Q[3], stage8_Q[2], stage8_Q[1], stage8_Q[0]};
    register_bank #(.WIDTH(134)) reg_stage_10 (
        .clk(clk), .rst(rst), .en(en), .D(stage10_D), .Q(stage10_Q)
    );

    // ========================================================
    // Stage 11
    // ========================================================
    wire [15:0] csa_sum_r11;
    wire [15:0] csa_carry_r11;
    carry_save_adder #(.N(16)) csa_row_11 (
        .A({stage10_Q[109], stage10_Q[102], stage10_Q[95], stage10_Q[88], stage10_Q[81], stage10_Q[74], stage10_Q[67], stage10_Q[60], stage10_Q[53], stage10_Q[46], stage10_Q[39], stage10_Q[32], stage10_Q[26], stage10_Q[21], stage10_Q[17], stage10_Q[14]}), .B({stage10_Q[107], stage10_Q[100], stage10_Q[93], stage10_Q[86], stage10_Q[79], stage10_Q[72], stage10_Q[65], stage10_Q[58], stage10_Q[51], stage10_Q[44], stage10_Q[37], stage10_Q[30], stage10_Q[24], stage10_Q[19], stage10_Q[15], stage10_Q[12]}), .C({stage10_Q[108], stage10_Q[101], stage10_Q[94], stage10_Q[87], stage10_Q[80], stage10_Q[73], stage10_Q[66], stage10_Q[59], stage10_Q[52], stage10_Q[45], stage10_Q[38], stage10_Q[31], stage10_Q[25], stage10_Q[20], stage10_Q[16], stage10_Q[13]}),
        .SUM(csa_sum_r11), .CARRY(csa_carry_r11)
    );

    // ========================================================
    // Stage 12
    // ========================================================
    wire [15:0] csa_sum_r12;
    wire [15:0] csa_carry_r12;
    carry_save_adder #(.N(16)) csa_row_12 (
        .A({stage10_Q[116], stage10_Q[110], stage10_Q[103], stage10_Q[96], stage10_Q[89], stage10_Q[82], stage10_Q[75], stage10_Q[68], stage10_Q[61], stage10_Q[54], stage10_Q[47], stage10_Q[40], stage10_Q[33], stage10_Q[27], stage10_Q[22], stage10_Q[18]}), .B({stage10_Q[114], csa_sum_r11[15], csa_sum_r11[14], csa_sum_r11[13], csa_sum_r11[12], csa_sum_r11[11], csa_sum_r11[10], csa_sum_r11[9], csa_sum_r11[8], csa_sum_r11[7], csa_sum_r11[6], csa_sum_r11[5], csa_sum_r11[4], csa_sum_r11[3], csa_sum_r11[2], csa_sum_r11[1]}), .C({stage10_Q[115], csa_carry_r11[14], csa_carry_r11[13], csa_carry_r11[12], csa_carry_r11[11], csa_carry_r11[10], csa_carry_r11[9], csa_carry_r11[8], csa_carry_r11[7], csa_carry_r11[6], csa_carry_r11[5], csa_carry_r11[4], csa_carry_r11[3], csa_carry_r11[2], csa_carry_r11[1], csa_carry_r11[0]}),
        .SUM(csa_sum_r12), .CARRY(csa_carry_r12)
    );

    // Pipeline Register Bank: Post-Stage 12 Layer
    wire [99:0] stage12_D;
    wire [99:0] stage12_Q;
    assign stage12_D = {stage10_Q[133], stage10_Q[132], stage10_Q[131], stage10_Q[130], stage10_Q[129], stage10_Q[128], stage10_Q[127], stage10_Q[126], stage10_Q[125], stage10_Q[124], stage10_Q[123], stage10_Q[122], stage10_Q[121], stage10_Q[120], stage10_Q[119], stage10_Q[118], stage10_Q[117], csa_carry_r12[14], csa_sum_r12[15], stage10_Q[113], stage10_Q[112], stage10_Q[111], csa_carry_r12[13], csa_sum_r12[14], stage10_Q[106], stage10_Q[105], stage10_Q[104], csa_carry_r12[12], csa_sum_r12[13], stage10_Q[99], stage10_Q[98], stage10_Q[97], csa_carry_r12[11], csa_sum_r12[12], stage10_Q[92], stage10_Q[91], stage10_Q[90], csa_carry_r12[10], csa_sum_r12[11], stage10_Q[85], stage10_Q[84], stage10_Q[83], csa_carry_r12[9], csa_sum_r12[10], stage10_Q[78], stage10_Q[77], stage10_Q[76], csa_carry_r12[8], csa_sum_r12[9], stage10_Q[71], stage10_Q[70], stage10_Q[69], csa_carry_r12[7], csa_sum_r12[8], stage10_Q[64], stage10_Q[63], stage10_Q[62], csa_carry_r12[6], csa_sum_r12[7], stage10_Q[57], stage10_Q[56], stage10_Q[55], csa_carry_r12[5], csa_sum_r12[6], stage10_Q[50], stage10_Q[49], stage10_Q[48], csa_carry_r12[4], csa_sum_r12[5], stage10_Q[43], stage10_Q[42], stage10_Q[41], csa_carry_r12[3], csa_sum_r12[4], stage10_Q[36], stage10_Q[35], stage10_Q[34], csa_carry_r12[2], csa_sum_r12[3], stage10_Q[29], stage10_Q[28], csa_carry_r12[1], csa_sum_r12[2], stage10_Q[23], csa_carry_r12[0], csa_sum_r12[1], 1'b0, csa_sum_r12[0], csa_sum_r11[0], stage10_Q[10], stage10_Q[9], stage10_Q[8], stage10_Q[7], stage10_Q[6], stage10_Q[5], stage10_Q[4], stage10_Q[3], stage10_Q[2], stage10_Q[1], stage10_Q[0]};
    register_bank #(.WIDTH(100)) reg_stage_12 (
        .clk(clk), .rst(rst), .en(en), .D(stage12_D), .Q(stage12_Q)
    );

    // ========================================================
    // Stage 13
    // ========================================================
    wire [15:0] csa_sum_r13;
    wire [15:0] csa_carry_r13;
    carry_save_adder #(.N(16)) csa_row_13 (
        .A({stage12_Q[88], stage12_Q[83], stage12_Q[78], stage12_Q[73], stage12_Q[68], stage12_Q[63], stage12_Q[58], stage12_Q[53], stage12_Q[48], stage12_Q[43], stage12_Q[38], stage12_Q[33], stage12_Q[28], stage12_Q[23], stage12_Q[19], stage12_Q[16]}), .B({stage12_Q[86], stage12_Q[81], stage12_Q[76], stage12_Q[71], stage12_Q[66], stage12_Q[61], stage12_Q[56], stage12_Q[51], stage12_Q[46], stage12_Q[41], stage12_Q[36], stage12_Q[31], stage12_Q[26], stage12_Q[21], stage12_Q[17], stage12_Q[14]}), .C({stage12_Q[87], stage12_Q[82], stage12_Q[77], stage12_Q[72], stage12_Q[67], stage12_Q[62], stage12_Q[57], stage12_Q[52], stage12_Q[47], stage12_Q[42], stage12_Q[37], stage12_Q[32], stage12_Q[27], stage12_Q[22], stage12_Q[18], stage12_Q[15]}),
        .SUM(csa_sum_r13), .CARRY(csa_carry_r13)
    );

    // ========================================================
    // Stage 14
    // ========================================================
    wire [15:0] csa_sum_r14;
    wire [15:0] csa_carry_r14;
    carry_save_adder #(.N(16)) csa_row_14 (
        .A({stage12_Q[93], stage12_Q[89], stage12_Q[84], stage12_Q[79], stage12_Q[74], stage12_Q[69], stage12_Q[64], stage12_Q[59], stage12_Q[54], stage12_Q[49], stage12_Q[44], stage12_Q[39], stage12_Q[34], stage12_Q[29], stage12_Q[24], stage12_Q[20]}), .B({stage12_Q[91], csa_sum_r13[15], csa_sum_r13[14], csa_sum_r13[13], csa_sum_r13[12], csa_sum_r13[11], csa_sum_r13[10], csa_sum_r13[9], csa_sum_r13[8], csa_sum_r13[7], csa_sum_r13[6], csa_sum_r13[5], csa_sum_r13[4], csa_sum_r13[3], csa_sum_r13[2], csa_sum_r13[1]}), .C({stage12_Q[92], csa_carry_r13[14], csa_carry_r13[13], csa_carry_r13[12], csa_carry_r13[11], csa_carry_r13[10], csa_carry_r13[9], csa_carry_r13[8], csa_carry_r13[7], csa_carry_r13[6], csa_carry_r13[5], csa_carry_r13[4], csa_carry_r13[3], csa_carry_r13[2], csa_carry_r13[1], csa_carry_r13[0]}),
        .SUM(csa_sum_r14), .CARRY(csa_carry_r14)
    );

    // Pipeline Register Bank: Post-Stage 14 Layer
    wire [65:0] stage14_D;
    wire [65:0] stage14_Q;
    assign stage14_D = {stage12_Q[99], stage12_Q[98], stage12_Q[97], stage12_Q[96], stage12_Q[95], stage12_Q[94], csa_carry_r14[14], csa_sum_r14[15], stage12_Q[90], csa_carry_r14[13], csa_sum_r14[14], stage12_Q[85], csa_carry_r14[12], csa_sum_r14[13], stage12_Q[80], csa_carry_r14[11], csa_sum_r14[12], stage12_Q[75], csa_carry_r14[10], csa_sum_r14[11], stage12_Q[70], csa_carry_r14[9], csa_sum_r14[10], stage12_Q[65], csa_carry_r14[8], csa_sum_r14[9], stage12_Q[60], csa_carry_r14[7], csa_sum_r14[8], stage12_Q[55], csa_carry_r14[6], csa_sum_r14[7], stage12_Q[50], csa_carry_r14[5], csa_sum_r14[6], stage12_Q[45], csa_carry_r14[4], csa_sum_r14[5], stage12_Q[40], csa_carry_r14[3], csa_sum_r14[4], stage12_Q[35], csa_carry_r14[2], csa_sum_r14[3], stage12_Q[30], csa_carry_r14[1], csa_sum_r14[2], stage12_Q[25], csa_carry_r14[0], csa_sum_r14[1], 1'b0, csa_sum_r14[0], csa_sum_r13[0], stage12_Q[12], stage12_Q[11], stage12_Q[10], stage12_Q[9], stage12_Q[8], stage12_Q[7], stage12_Q[6], stage12_Q[5], stage12_Q[4], stage12_Q[3], stage12_Q[2], stage12_Q[1], stage12_Q[0]};
    register_bank #(.WIDTH(66)) reg_stage_14 (
        .clk(clk), .rst(rst), .en(en), .D(stage14_D), .Q(stage14_Q)
    );

    // ========================================================
    // Stage 15
    // ========================================================
    wire [15:0] csa_sum_r15;
    wire [15:0] csa_carry_r15;
    carry_save_adder #(.N(16)) csa_row_15 (
        .A({stage14_Q[63], stage14_Q[60], stage14_Q[57], stage14_Q[54], stage14_Q[51], stage14_Q[48], stage14_Q[45], stage14_Q[42], stage14_Q[39], stage14_Q[36], stage14_Q[33], stage14_Q[30], stage14_Q[27], stage14_Q[24], stage14_Q[21], stage14_Q[18]}), .B({stage14_Q[61], stage14_Q[58], stage14_Q[55], stage14_Q[52], stage14_Q[49], stage14_Q[46], stage14_Q[43], stage14_Q[40], stage14_Q[37], stage14_Q[34], stage14_Q[31], stage14_Q[28], stage14_Q[25], stage14_Q[22], stage14_Q[19], stage14_Q[16]}), .C({stage14_Q[62], stage14_Q[59], stage14_Q[56], stage14_Q[53], stage14_Q[50], stage14_Q[47], stage14_Q[44], stage14_Q[41], stage14_Q[38], stage14_Q[35], stage14_Q[32], stage14_Q[29], stage14_Q[26], stage14_Q[23], stage14_Q[20], stage14_Q[17]}),
        .SUM(csa_sum_r15), .CARRY(csa_carry_r15)
    );

    // ========================================================
    // Stage 16
    // ========================================================
    wire [15:0] final_csa_merge_sum;
    wire final_csa_merge_cout;
    ripple_carry_adder #(.N(16)) rca_final_merge (
        .A({csa_sum_r15[15], csa_sum_r15[14], csa_sum_r15[13], csa_sum_r15[12], csa_sum_r15[11], csa_sum_r15[10], csa_sum_r15[9], csa_sum_r15[8], csa_sum_r15[7], csa_sum_r15[6], csa_sum_r15[5], csa_sum_r15[4], csa_sum_r15[3], csa_sum_r15[2], csa_sum_r15[1], csa_sum_r15[0]}), .B({csa_carry_r15[14], csa_carry_r15[13], csa_carry_r15[12], csa_carry_r15[11], csa_carry_r15[10], csa_carry_r15[9], csa_carry_r15[8], csa_carry_r15[7], csa_carry_r15[6], csa_carry_r15[5], csa_carry_r15[4], csa_carry_r15[3], csa_carry_r15[2], csa_carry_r15[1], csa_carry_r15[0], 1'b0}), .Cin(1'b0),
        .Sum(final_csa_merge_sum), .Cout(final_csa_merge_cout)
    );

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
    assign raw_final_product[15] = final_csa_merge_sum[0];
    assign raw_final_product[16] = final_csa_merge_sum[1];
    assign raw_final_product[17] = final_csa_merge_sum[2];
    assign raw_final_product[18] = final_csa_merge_sum[3];
    assign raw_final_product[19] = final_csa_merge_sum[4];
    assign raw_final_product[20] = final_csa_merge_sum[5];
    assign raw_final_product[21] = final_csa_merge_sum[6];
    assign raw_final_product[22] = final_csa_merge_sum[7];
    assign raw_final_product[23] = final_csa_merge_sum[8];
    assign raw_final_product[24] = final_csa_merge_sum[9];
    assign raw_final_product[25] = final_csa_merge_sum[10];
    assign raw_final_product[26] = final_csa_merge_sum[11];
    assign raw_final_product[27] = final_csa_merge_sum[12];
    assign raw_final_product[28] = final_csa_merge_sum[13];
    assign raw_final_product[29] = final_csa_merge_sum[14];
    assign raw_final_product[30] = final_csa_merge_sum[15];
    assign raw_final_product[31] = final_csa_merge_cout;

    // ========================================================
    // Boundary Pipeline Registers: Final Output (Product)
    // ========================================================
    register_bank #(.WIDTH(32)) reg_output_product (
        .clk(clk), .rst(rst), .en(en), .D(raw_final_product), .Q(Product)
    );

endmodule
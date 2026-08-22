`default_nettype none
`timescale 1ns/1ps

module row_adder_multiplier_16(
   input wire [15:0] A,
   input wire [15:0] B,

   output wire [31:0] P
);

wire [255:0] pp;

partial_product_generator #(
   .N(16)
)
PPG(
    .A(A),
    .B(B),
    .pp(pp)
);

wire [31:0] row0;
wire [31:0] row1;
wire [31:0] row2;
wire [31:0] row3;
wire [31:0] row4;
wire [31:0] row5;
wire [31:0] row6;
wire [31:0] row7;
wire [31:0] row8;
wire [31:0] row9;
wire [31:0] row10;
wire [31:0] row11;
wire [31:0] row12;
wire [31:0] row13;
wire [31:0] row14;
wire [31:0] row15;

wire [31:0] sum0;
wire [31:0] sum1;
wire [31:0] sum2;
wire [31:0] sum3;
wire [31:0] sum4;
wire [31:0] sum5;
wire [31:0] sum6;
wire [31:0] sum7;
wire [31:0] sum8;
wire [31:0] sum9;
wire [31:0] sum10;
wire [31:0] sum11;
wire [31:0] sum12;
wire [31:0] sum13;

wire cout0;
wire cout1;
wire cout2;
wire cout3;
wire cout4;
wire cout5;
wire cout6;
wire cout7;
wire cout8;
wire cout9;
wire cout10;
wire cout11;
wire cout12;
wire cout13;
wire cout14;

assign row0  = {16'b0, pp[15], pp[14], pp[13], pp[12], pp[11], pp[10], pp[9], pp[8], pp[7], pp[6], pp[5], pp[4], pp[3], pp[2], pp[1], pp[0]};
assign row1  = {15'b0, pp[31], pp[30], pp[29], pp[28], pp[27], pp[26], pp[25], pp[24], pp[23], pp[22], pp[21], pp[20], pp[19], pp[18], pp[17], pp[16], 1'b0};
assign row2  = {14'b0, pp[47], pp[46], pp[45], pp[44], pp[43], pp[42], pp[41], pp[40], pp[39], pp[38], pp[37], pp[36], pp[35], pp[34], pp[33], pp[32], 2'b0};
assign row3  = {13'b0, pp[63], pp[62], pp[61], pp[60], pp[59], pp[58], pp[57], pp[56], pp[55], pp[54], pp[53], pp[52], pp[51], pp[50], pp[49], pp[48], 3'b0};
assign row4  = {12'b0, pp[79], pp[78], pp[77], pp[76], pp[75], pp[74], pp[73], pp[72], pp[71], pp[70], pp[69], pp[68], pp[67], pp[66], pp[65], pp[64], 4'b0};
assign row5  = {11'b0, pp[95], pp[94], pp[93], pp[92], pp[91], pp[90], pp[89], pp[88], pp[87], pp[86], pp[85], pp[84], pp[83], pp[82], pp[81], pp[80], 5'b0};
assign row6  = {10'b0, pp[111], pp[110], pp[109], pp[108], pp[107], pp[106], pp[105], pp[104], pp[103], pp[102], pp[101], pp[100], pp[99], pp[98], pp[97], pp[96], 6'b0};
assign row7  = {9'b0, pp[127], pp[126], pp[125], pp[124], pp[123], pp[122], pp[121], pp[120], pp[119], pp[118], pp[117], pp[116], pp[115], pp[114], pp[113], pp[112], 7'b0};
assign row8  = {8'b0, pp[143], pp[142], pp[141], pp[140], pp[139], pp[138], pp[137], pp[136], pp[135], pp[134], pp[133], pp[132], pp[131], pp[130], pp[129], pp[128], 8'b0};
assign row9  = {7'b0, pp[159], pp[158], pp[157], pp[156], pp[155], pp[154], pp[153], pp[152], pp[151], pp[150], pp[149], pp[148], pp[147], pp[146], pp[145], pp[144], 9'b0};
assign row10  = {6'b0, pp[175], pp[174], pp[173], pp[172], pp[171], pp[170], pp[169], pp[168], pp[167], pp[166], pp[165], pp[164], pp[163], pp[162], pp[161], pp[160], 10'b0};
assign row11  = {5'b0, pp[191], pp[190], pp[189], pp[188], pp[187], pp[186], pp[185], pp[184], pp[183], pp[182], pp[181], pp[180], pp[179], pp[178], pp[177], pp[176], 11'b0};
assign row12  = {4'b0, pp[207], pp[206], pp[205], pp[204], pp[203], pp[202], pp[201], pp[200], pp[199], pp[198], pp[197], pp[196], pp[195], pp[194], pp[193], pp[192], 12'b0};
assign row13  = {3'b0, pp[223], pp[222], pp[221], pp[220], pp[219], pp[218], pp[217], pp[216], pp[215], pp[214], pp[213], pp[212], pp[211], pp[210], pp[209], pp[208], 13'b0};
assign row14  = {2'b0, pp[239], pp[238], pp[237], pp[236], pp[235], pp[234], pp[233], pp[232], pp[231], pp[230], pp[229], pp[228], pp[227], pp[226], pp[225], pp[224], 14'b0};
assign row15  = {1'b0, pp[255], pp[254], pp[253], pp[252], pp[251], pp[250], pp[249], pp[248], pp[247], pp[246], pp[245], pp[244], pp[243], pp[242], pp[241], pp[240], 15'b0};


        ripple_carry_adder #(
            .N(32)
        )
        RCA_0(
            .A(row0),
            .B(row1),
            .Cin(1'b0),
            .Sum(sum0),
            .Cout(cout0)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_1(
            .A(sum0),
            .B(row2),
            .Cin(1'b0),
            .Sum(sum1),
            .Cout(cout1)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_2(
            .A(sum1),
            .B(row3),
            .Cin(1'b0),
            .Sum(sum2),
            .Cout(cout2)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_3(
            .A(sum2),
            .B(row4),
            .Cin(1'b0),
            .Sum(sum3),
            .Cout(cout3)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_4(
            .A(sum3),
            .B(row5),
            .Cin(1'b0),
            .Sum(sum4),
            .Cout(cout4)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_5(
            .A(sum4),
            .B(row6),
            .Cin(1'b0),
            .Sum(sum5),
            .Cout(cout5)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_6(
            .A(sum5),
            .B(row7),
            .Cin(1'b0),
            .Sum(sum6),
            .Cout(cout6)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_7(
            .A(sum6),
            .B(row8),
            .Cin(1'b0),
            .Sum(sum7),
            .Cout(cout7)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_8(
            .A(sum7),
            .B(row9),
            .Cin(1'b0),
            .Sum(sum8),
            .Cout(cout8)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_9(
            .A(sum8),
            .B(row10),
            .Cin(1'b0),
            .Sum(sum9),
            .Cout(cout9)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_10(
            .A(sum9),
            .B(row11),
            .Cin(1'b0),
            .Sum(sum10),
            .Cout(cout10)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_11(
            .A(sum10),
            .B(row12),
            .Cin(1'b0),
            .Sum(sum11),
            .Cout(cout11)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_12(
            .A(sum11),
            .B(row13),
            .Cin(1'b0),
            .Sum(sum12),
            .Cout(cout12)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_13(
            .A(sum12),
            .B(row14),
            .Cin(1'b0),
            .Sum(sum13),
            .Cout(cout13)
        );

        ripple_carry_adder #(
            .N(32)
        )
        RCA_14(
            .A(sum13),
            .B(row15),
            .Cin(1'b0),
            .Sum(P),
            .Cout(cout14)
        );
endmodule

`default_nettype wire
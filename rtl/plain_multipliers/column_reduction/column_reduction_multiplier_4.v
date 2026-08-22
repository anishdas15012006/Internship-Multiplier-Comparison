module column_reduction_multiplier_4 (
    input  [3:0] A,
    input  [3:0] B,
    
    output [7:0] P
);

    // Partial Products

    wire pp00, pp01, pp02, pp03;
    wire pp10, pp11, pp12, pp13;
    wire pp20, pp21, pp22, pp23;
    wire pp30, pp31, pp32, pp33;

    assign pp00 = A[0] & B[0];
    assign pp01 = A[1] & B[0];
    assign pp02 = A[2] & B[0];
    assign pp03 = A[3] & B[0];

    assign pp10 = A[0] & B[1];
    assign pp11 = A[1] & B[1];
    assign pp12 = A[2] & B[1];
    assign pp13 = A[3] & B[1];

    assign pp20 = A[0] & B[2];
    assign pp21 = A[1] & B[2];
    assign pp22 = A[2] & B[2];
    assign pp23 = A[3] & B[2];

    assign pp30 = A[0] & B[3];
    assign pp31 = A[1] & B[3];
    assign pp32 = A[2] & B[3];
    assign pp33 = A[3] & B[3];

    //--------------------------------------------------
    // Internal Signals
    //--------------------------------------------------

    wire s1, c1;

    wire s2, c2;
    wire s3, c3;

    wire s4, c4;
    wire s5, c5;
    wire s6, c6;

    wire s7, c7;
    wire s8, c8;
    wire s9, c9;

    wire s10, c10;
    wire s11, c11;

    wire s12, c12;

    //--------------------------------------------------
    // P0
    //--------------------------------------------------

    assign P[0] = pp00;

    //--------------------------------------------------
    // P1
    //--------------------------------------------------

    half_adder HA1 (
        .a(pp01),
        .b(pp10),
        .sum(P[1]),
        .carry(c1)
    );

    //--------------------------------------------------
    // P2
    //--------------------------------------------------

    full_adder FA1 (
        .a(pp02),
        .b(pp11),
        .cin(pp20),
        .sum(s2),
        .carry(c2)
    );

    half_adder HA2 (
        .a(s2),
        .b(c1),
        .sum(P[2]),
        .carry(c3)
    );

    //--------------------------------------------------
    // P3
    //--------------------------------------------------

    full_adder FA2 (
        .a(pp30),
        .b(pp21),
        .cin(pp12),
        .sum(s4),
        .carry(c4)
    );

    full_adder FA3 (
        .a(pp03),
        .b(c2),
        .cin(c3),
        .sum(s5),
        .carry(c5)
    );

    half_adder HA3 (
        .a(s4),
        .b(s5),
        .sum(P[3]),
        .carry(c6)
    );

    //--------------------------------------------------
    // P4
    //--------------------------------------------------

    full_adder FA4 (
        .a(pp31),
        .b(pp22),
        .cin(pp13),
        .sum(s7),
        .carry(c7)
    );

    full_adder FA5 (
        .a(c4),
        .b(c5),
        .cin(c6),
        .sum(s8),
        .carry(c8)
    );

    half_adder HA4 (
        .a(s7),
        .b(s8),
        .sum(P[4]),
        .carry(c9)
    );

    //--------------------------------------------------
    // P5
    //--------------------------------------------------

    full_adder FA6 (
        .a(c7),
        .b(c8),
        .cin(c9),
        .sum(s10),
        .carry(c10)
    );

    full_adder FA7 (
        .a(s10),
        .b(pp32),
        .cin(pp23),
        .sum(P[5]),
        .carry(c11)
    );

    //--------------------------------------------------
    // P6
    //--------------------------------------------------

    full_adder FA8 (
        .a(pp33),
        .b(c10),
        .cin(c11),
        .sum(P[6]),
        .carry(P[7])
    );

endmodule
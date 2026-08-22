`timescale 1ns/1ps
`default_nettype none

module tb_booth_dadda_radix8_multiplier_16 #(
    parameter SIGNED_A = 0,
    parameter SIGNED_B = 0
);

reg  [15:0] A;
reg  [15:0] B;
reg  clk; reg  rst; reg  en;
wire [31:0] P;

integer i; integer errors;
integer pipe_count;

reg [15:0] history_A_1;
reg [15:0] history_B_1;
reg [15:0] history_A_2;
reg [15:0] history_B_2;
reg [15:0] history_A_3;
reg [15:0] history_B_3;
reg [15:0] history_A_4;
reg [15:0] history_B_4;

booth_dadda_radix8_multiplier_16 #(
    .SIGNED_A(SIGNED_A),
    .SIGNED_B(SIGNED_B)
) DUT (
    .clk(clk), .rst(rst), .en(en),
    .A(A), .B(B), .Product(P)
);

always #10 clk = ~clk;

    // Reference Golden Models supporting Radix-2 Booth masking structures
    wire [31:0] ref_uu = $unsigned(history_A_4) * $unsigned(history_B_4);
    wire [31:0] ref_su = $signed(history_A_4) * $signed({1'b0, history_B_4});
    wire [31:0] ref_us = $signed({1'b0, history_A_4}) * $signed(history_B_4);
    wire [31:0] ref_ss = $signed(history_A_4) * $signed(history_B_4);
    wire [31:0] expected_P = (SIGNED_A && SIGNED_B) ? ref_ss :
                                        (SIGNED_A)            ? ref_su :
                                        (SIGNED_B)            ? ref_us :
                                                                ref_uu;
initial begin
    $dumpfile("waves/booth_dadda/radix8/booth_dadda_radix8_16.vcd");
    $dumpvars(0, tb_booth_dadda_radix8_multiplier_16);

    errors = 0;
    pipe_count = 0;
    clk = 0; rst = 1; en = 1; A = 0; B = 0;
    @(posedge clk); #1 rst = 0; @(posedge clk);

    for(i = 0; i < 10000; i = i + 1) begin
        @(negedge clk);
        A = $random & 65535;
        B = $random & 65535;
        @(posedge clk); #1;

        if (pipe_count >= 4) begin
            if (P !== expected_P) begin
                $display("FAIL A=%0d B=%0d EXP=%0d GOT=%0d", $signed(history_A_4), $signed(history_B_4), $signed(expected_P), $signed(P));
                errors = errors + 1; $finish;
            end
        end else begin
            pipe_count = pipe_count + 1;
        end
    end

    repeat(4) begin
        @(posedge clk); #1;
        if (P !== expected_P) begin
            $display("FAIL A=%0d B=%0d EXP=%0d GOT=%0d", $signed(history_A_4), $signed(history_B_4), $signed(expected_P), $signed(P));
            errors = errors + 1; $finish;
        end
    end

    if(errors == 0)
        $display("========================================================\nPASS : ALL RANDOM 10000 TESTS PASSED\n========================================================");
    else
        $display("========================================================\nFAIL : %0d TOTAL ERRORS FOUND\n========================================================", errors);
    $finish;
end
always @(posedge clk) begin
    if (rst) begin
        history_A_1 <= 0;
        history_B_1 <= 0;
        history_A_2 <= 0;
        history_B_2 <= 0;
        history_A_3 <= 0;
        history_B_3 <= 0;
        history_A_4 <= 0;
        history_B_4 <= 0;
    end else if (en) begin
        history_A_1 <= A;
        history_B_1 <= B;
        history_A_2 <= history_A_1;
        history_B_2 <= history_B_1;
        history_A_3 <= history_A_2;
        history_B_3 <= history_B_2;
        history_A_4 <= history_A_3;
        history_B_4 <= history_B_3;
    end
end

endmodule
`default_nettype wire
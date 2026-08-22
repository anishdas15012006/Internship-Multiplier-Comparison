`timescale 1ns/1ps
`default_nettype none

module tb_custom_greedy_multiplier_16;

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
reg [15:0] history_A_5;
reg [15:0] history_B_5;
reg [15:0] history_A_6;
reg [15:0] history_B_6;
reg [15:0] history_A_7;
reg [15:0] history_B_7;
reg [15:0] history_A_8;
reg [15:0] history_B_8;
reg [15:0] history_A_9;
reg [15:0] history_B_9;
reg [15:0] history_A_10;
reg [15:0] history_B_10;
reg [15:0] history_A_11;
reg [15:0] history_B_11;
reg [15:0] history_A_12;
reg [15:0] history_B_12;
reg [15:0] history_A_13;
reg [15:0] history_B_13;
reg [15:0] history_A_14;
reg [15:0] history_B_14;
reg [15:0] history_A_15;
reg [15:0] history_B_15;
reg [15:0] history_A_16;
reg [15:0] history_B_16;
reg [15:0] history_A_17;
reg [15:0] history_B_17;

custom_greedy_multiplier_16 DUT (
    .clk(clk), .rst(rst), .en(en),
    .A(A), .B(B), .Product(P)
);

always #10 clk = ~clk;

initial begin
    $dumpfile("waves/custom_greedy/custom_greedy_16.vcd");
    $dumpvars(0, tb_custom_greedy_multiplier_16);

    errors = 0;
    pipe_count = 0;
    clk = 0; rst = 1; en = 1; A = 0; B = 0;
    @(posedge clk); #1 rst = 0; @(posedge clk);

    for(i = 0; i < 10000; i = i + 1) begin
        @(negedge clk);
        A = $random & 65535;
        B = $random & 65535;
        @(posedge clk); #1;

        if (pipe_count >= 17) begin
            if (P !== ({ 16'b0, history_A_17 } * { 16'b0, history_B_17 })) begin
                $display("FAIL A=%0d B=%0d EXP=%0d GOT=%0d", $unsigned(history_A_17), $unsigned(history_B_17), $unsigned({ 16'b0, history_A_17 } * { 16'b0, history_B_17 }), $unsigned(P));
                errors = errors + 1; $finish;
            end
        end else begin
            pipe_count = pipe_count + 1;
        end
    end

    repeat(17) begin
        @(posedge clk); #1;
        if (P !== ({ 16'b0, history_A_17 } * { 16'b0, history_B_17 })) begin
            $display("FAIL A=%0d B=%0d EXP=%0d GOT=%0d", $unsigned(history_A_17), $unsigned(history_B_17), $unsigned({ 16'b0, history_A_17 } * { 16'b0, history_B_17 }), $unsigned(P));
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
        history_A_5 <= 0;
        history_B_5 <= 0;
        history_A_6 <= 0;
        history_B_6 <= 0;
        history_A_7 <= 0;
        history_B_7 <= 0;
        history_A_8 <= 0;
        history_B_8 <= 0;
        history_A_9 <= 0;
        history_B_9 <= 0;
        history_A_10 <= 0;
        history_B_10 <= 0;
        history_A_11 <= 0;
        history_B_11 <= 0;
        history_A_12 <= 0;
        history_B_12 <= 0;
        history_A_13 <= 0;
        history_B_13 <= 0;
        history_A_14 <= 0;
        history_B_14 <= 0;
        history_A_15 <= 0;
        history_B_15 <= 0;
        history_A_16 <= 0;
        history_B_16 <= 0;
        history_A_17 <= 0;
        history_B_17 <= 0;
    end else if (en) begin
        history_A_1 <= A;
        history_B_1 <= B;
        history_A_2 <= history_A_1;
        history_B_2 <= history_B_1;
        history_A_3 <= history_A_2;
        history_B_3 <= history_B_2;
        history_A_4 <= history_A_3;
        history_B_4 <= history_B_3;
        history_A_5 <= history_A_4;
        history_B_5 <= history_B_4;
        history_A_6 <= history_A_5;
        history_B_6 <= history_B_5;
        history_A_7 <= history_A_6;
        history_B_7 <= history_B_6;
        history_A_8 <= history_A_7;
        history_B_8 <= history_B_7;
        history_A_9 <= history_A_8;
        history_B_9 <= history_B_8;
        history_A_10 <= history_A_9;
        history_B_10 <= history_B_9;
        history_A_11 <= history_A_10;
        history_B_11 <= history_B_10;
        history_A_12 <= history_A_11;
        history_B_12 <= history_B_11;
        history_A_13 <= history_A_12;
        history_B_13 <= history_B_12;
        history_A_14 <= history_A_13;
        history_B_14 <= history_B_13;
        history_A_15 <= history_A_14;
        history_B_15 <= history_B_14;
        history_A_16 <= history_A_15;
        history_B_16 <= history_B_15;
        history_A_17 <= history_A_16;
        history_B_17 <= history_B_16;
    end
end

endmodule
`default_nettype wire
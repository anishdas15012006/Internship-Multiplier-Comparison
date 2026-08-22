`timescale 1ns/1ps
`default_nettype none

module tb_row_adder_multiplier_16;

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

row_adder_multiplier_16 DUT (
    .clk(clk), .rst(rst), .en(en),
    .A(A), .B(B), .Product(P)
);

always #10 clk = ~clk;

initial begin
    $dumpfile("waves/row_adder/row_adder_16.vcd");
    $dumpvars(0, tb_row_adder_multiplier_16);

    errors = 0;
    pipe_count = 0;
    clk = 0; rst = 1; en = 1; A = 0; B = 0;
    @(posedge clk); #1 rst = 0; @(posedge clk);

    for(i = 0; i < 10000; i = i + 1) begin
        @(negedge clk);
        A = $random & 65535;
        B = $random & 65535;
        @(posedge clk); #1;

        if (pipe_count >= 9) begin
            if (P !== ({ 16'b0, history_A_9 } * { 16'b0, history_B_9 })) begin
                $display("FAIL A=%0d B=%0d EXP=%0d GOT=%0d", $unsigned(history_A_9), $unsigned(history_B_9), $unsigned({ 16'b0, history_A_9 } * { 16'b0, history_B_9 }), $unsigned(P));
                errors = errors + 1; $finish;
            end
        end else begin
            pipe_count = pipe_count + 1;
        end
    end

    repeat(9) begin
        @(posedge clk); #1;
        if (P !== ({ 16'b0, history_A_9 } * { 16'b0, history_B_9 })) begin
            $display("FAIL A=%0d B=%0d EXP=%0d GOT=%0d", $unsigned(history_A_9), $unsigned(history_B_9), $unsigned({ 16'b0, history_A_9 } * { 16'b0, history_B_9 }), $unsigned(P));
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
    end
end

endmodule
`default_nettype wire
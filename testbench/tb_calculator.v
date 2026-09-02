`timescale 1ns / 1ps

module tb_calculator;
    reg clk;
    reg reset;
    reg [7:0] switch_in;
    reg [1:0] op_select;
    reg btn_store_a;
    reg btn_execute;

    wire [6:0] display_seg;
    wire [3:0] display_an;

    // UUT Block
    calculator_top uut (
        .clk(clk),
        .reset(reset),
        .switch_in(switch_in),
        .op_select(op_select),
        .btn_store_a(btn_store_a),
        .btn_execute(btn_execute),
        .display_seg(display_seg),
        .display_an(display_an)
    );

    // 50MHz Clock loop
    always #10 clk = ~clk;

    initial begin
        // Optional setup if running on Icarus Verilog
        $dumpfile("calculator_waveform.vcd");
        $dumpvars(0, tb_calculator);

        // System Init
        clk = 0;
        reset = 1;
        switch_in = 0;
        op_select = 0;
        btn_store_a = 0;
        btn_execute = 0;

        #40 reset = 0; // Release Reset

        // --- MATH TRANSACTION: Let's calculate 7 + 4 ---
        #20 switch_in = 8'd7;     // Dial up value '7' on switches
        #20 btn_store_a = 1;      // Push Load Button
        #20 btn_store_a = 0;      // Release Button

        #40 switch_in = 8'd4;     // Dial up value '4' on switches
        op_select = 2'b00;        // Set Opcode to addition (00)
        #20 btn_execute = 1;      // Click Execute Calculation
        #20 btn_execute = 0;      // Release Button

        #40;
        $display("Simulation Done! Seven Seg Segment Value (active-low hex active): %b", display_seg);
        $finish;
    end
endmodule
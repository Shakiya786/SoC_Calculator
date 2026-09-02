`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: National Institute of Technology Durgapur 
// Design Name: 
// Module Name: calculator_top.v
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 


//////////////////////////////////////////////////////////////////////////////////


module calculator_top (
    input clk,
    input reset,
    input [7:0] switch_in,    
    input [1:0] op_select,    
    input btn_store_a,        
    input btn_execute,        
    output [6:0] display_seg, 
    output [3:0] display_an   
);

    // Control and Data wires interconnecting the modules
    wire load_A, load_B, load_out;
    wire [7:0] reg_A, reg_B, reg_out;
    wire [7:0] alu_wire_out;

    // Fixed active-low selection for 1st digit of 7-segment display
    assign display_an = 4'b1110; 

    // 1. Instantiate FSM Controller
    fsm_controller controller (
        .clk(clk),
        .reset(reset),
        .btn_store_a(btn_store_a),
        .btn_execute(btn_execute),
        .load_A(load_A),
        .load_B(load_B),
        .load_out(load_out)
    );

    // 2. Instantiate Register File
    registers reg_file (
        .clk(clk),
        .reset(reset),
        .data_in(switch_in),
        .load_A(load_A),
        .load_B(load_B),
        .load_out(load_out),
        .alu_result(alu_wire_out),
        .reg_A(reg_A),
        .reg_B(reg_B),
        .reg_out(reg_out)
    );

    // 3. Instantiate ALU
    alu main_alu (
        .A(reg_A),
        .B(reg_B),
        .opcode(op_select),
        .result(alu_wire_out)
    );

    // 4. Instantiate Display Decoder
    seven_seg_decoder display_unit (
        .bin_digit(reg_out[3:0]), // displays lower 4 bits in Hex format
        .seg(display_seg)
    );

endmodule

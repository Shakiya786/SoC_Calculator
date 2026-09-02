module registers (
    input clk,
    input reset,
    input [7:0] data_in,
    input load_A,
    input load_B,
    input load_out,
    input [7:0] alu_result,
    output reg [7:0] reg_A,
    output reg [7:0] reg_B,
    output reg [7:0] reg_out
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            reg_A   <= 8'h00;
            reg_B   <= 8'h00;
            reg_out <= 8'h00;
        end else begin
            if (load_A)   reg_A   <= data_in;
            if (load_B)   reg_B   <= data_in;
            if (load_out) reg_out <= alu_result;
        end
    end
endmodule
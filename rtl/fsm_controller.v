module fsm_controller (
    input clk,
    input reset,
    input btn_store_a,
    input btn_execute,
    output reg load_A,
    output reg load_B,
    output reg load_out
);
    // state definitionns
    localparam STATE_IDLE    = 2'b00,
               STATE_SAVE_A  = 2'b01,
               STATE_SAVE_B  = 2'b10,
               STATE_EXECUTE = 2'b11;

    reg [1:0] current_state, next_state;

    // State Register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= STATE_IDLE;
        else
            current_state <= next_state;
    end

    // Next State Logic
    always @(*) begin
        next_state = current_state;
        case (current_state)
            STATE_IDLE: begin
                if (btn_store_a) next_state = STATE_SAVE_A;
            end
            STATE_SAVE_A: begin
                if (!btn_store_a) next_state = STATE_SAVE_B;
            end
            STATE_SAVE_B: begin
                if (btn_execute) next_state = STATE_EXECUTE;
            end
            STATE_EXECUTE: begin
                if (!btn_execute) next_state = STATE_IDLE;
            end
            default: next_state = STATE_IDLE;
        endcase
    end

    // Output Control Signals (Combinational)
    always @(*) begin
        load_A   = 1'b0;
        load_B   = 1'b0;
        load_out = 1'b0;

        case (current_state)
            STATE_SAVE_A:  load_A   = 1'b1;
            STATE_SAVE_B:  load_B   = 1'b1;
            STATE_EXECUTE: load_out = 1'b1;
            default: begin
                load_A   = 1'b0;
                load_B   = 1'b0;
                load_out = 1'b0;
            end
        endcase
    end
endmodule
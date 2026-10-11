module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case (state)
            RIGHT:begin
                if(bump_right) next_state=LEFT;
                else begin
                    next_state=RIGHT;
                end
            end
            LEFT:begin
                if(bump_left) next_state=RIGHT;
                else begin
                    next_state=LEFT;
                end
            end
        endcase     
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) state<=LEFT;
        else begin
            state<=next_state;
        end
    end

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state ==RIGHT);

endmodule

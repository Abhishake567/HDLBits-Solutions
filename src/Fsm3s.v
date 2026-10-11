module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    // State transition logic
    parameter A=0,B=1,C=2,D=3;
    reg [2:0] state;
    reg [2:0] next_state;
    // State transition logic
    always @ (*) begin
        case(state)
            A: next_state= in ? B:A;
            B: next_state= in ? B:C;
            C: next_state= in ? D:A;
            D: next_state= in ? B:C;
        endcase
    end
     always @ (posedge clk) begin
        if(reset==1'b1)state<=A;
        else begin 
            state<=next_state;
        end
    end

    // State flip-flops with synchronous reset

    // Output logic
    assign out = (state==D ?1:0);
endmodule

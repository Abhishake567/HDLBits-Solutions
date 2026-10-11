module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter A=7,B=3,C=1,D=0;
    reg [2:0] state,next_state;
    wire sup;
    
    always @ (*) begin
        case(state)
            A: begin
                if(s==A)next_state=A;
                else begin
                    next_state=B;
                    
                end
            end
            B: begin
                if(s==B)next_state=B;
                else if(s==A) begin
                    next_state=A;
                end
                else if(s==C) begin
                    next_state=C;
                         
                end
            end
            C:begin
                if(s==C)next_state=C;
                else if(s==B) begin
                    next_state=B;
                end
                else if(s==D) begin
                    next_state=D;
                    
                end
            end
            D:begin
                if(s==D) begin
                    next_state=D;     
                end
                else if(s==C) begin
                    next_state=C;
                end
            end
        endcase
    end

    always @ (posedge clk) begin
        if(reset==1'b1) begin
            state<=D;
            sup<=0;
        end           
        else begin
            state<=next_state;
            if(state==next_state)
            sup<=sup;
            else if(state>next_state)
            sup<=0;
            else if(state<next_state)
            sup<=1;
        end
        
    end
    assign dfr =(sup==0);
    always @ (*) begin
        case(state)
            A:begin
                fr3=1'b0;
                fr2=1'b0;
                fr1=1'b0;
            end
            B:begin
                fr3=1'b0;
                fr2=1'b0;
                fr1=1'b1;
            end
            C:begin
                fr3=1'b0;
                fr2=1'b1;
                fr1=1'b1;
            end
            D:begin
                fr3=1'b1;
                fr2=1'b1;
                fr1=1'b1;
                
            end
        endcase
    end

endmodule

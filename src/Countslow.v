module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always @ (posedge clk ) begin
        if(reset==1'b1) q<=4'b0;
        else if (slowena==1'b1 && q==4'd9)begin
            q<=4'b0;
        end
        else if (slowena==1'b1) begin
            q++;
        end
    end
    
endmodule

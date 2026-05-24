module counter_lab5 (
    input clock,       
    input reset_n,     
    input enable,      
    input up_down,     
    output reg [3:0] q_out 
);
    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            q_out <= 4'b0000;
        end 
        else if (enable) begin
            if (up_down) begin
                q_out <= q_out + 1'b1;
            end 
            else begin
                q_out <= q_out - 1'b1;
            end
        end
    end
endmodule
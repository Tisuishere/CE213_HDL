module count_4bit_2(CLK, ENA, Clear, Q);
    input CLK, ENA, Clear;      
    output reg [3:0] Q; 

    always @(posedge CLK or negedge Clear) begin
        if (!Clear) begin
            Q <= 4'b0000;
        end 
        else if (ENA) begin
				if (Q == 4'd9) begin 
					Q<=0;
				end else begin
					Q <= Q + 1'b1;
				end
        end
    end
	 
endmodule 
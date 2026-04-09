module lab2_2_3 (CLK, Reset, ENA, H0, H1);
	input CLK,Reset,ENA;
	output [6:0] H0, H1;
	reg [3:0]Q1;
	reg [3:0]Q2;
	wire CLK_up;
	delay_1s (CLK,Reset,CLK_up);
	always @(posedge CLK or negedge Reset) begin
		if(!Reset) begin
			Q1 <= 4'b000;
			Q2 <= 4'b000;
		end
		else if(CLK_up) begin
			if (Q1 == 4'd9) begin
					Q1 <= 4'b0000;
					Q2 <= Q2 +1'b1;
				end
			else
				Q1 <= Q1 + 1'b1;
		end
	end
	bcd_to_led7(Q1,H0);
	bcd_to_led7(Q2,H1);
endmodule 
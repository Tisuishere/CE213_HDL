module lab2_3_2(CLK, Reset, ENA, H0, H1, H2, H3, H4, H5, H6, H7);
	input CLK, Reset, ENA;
	output [6:0]H0,H1,H2,H3,H4,H5,H6,H7;

	reg [2:0]Q;
	wire CLK_up;
	delay_1s (CLK,Reset,CLK_up);
	always @(posedge CLK or negedge Reset) begin
		if(!Reset)
			Q <= 3'b000;
		else if(CLK_up && ENA)
		begin
			if(Q == 3'd7)
				Q <= 3'd0;
			else
				Q <= Q + 1;
		end
	end

	lab1_2d(Q, H0, H1, H2, H3, H4, H5, H6, H7);

endmodule 
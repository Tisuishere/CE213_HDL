module lab2_2_2 (CLK, Reset, ENA, out);
	input CLK,Reset,ENA;
	output [6:0] out;

	wire [3:0]Q;
	wire CLK_up;
	delay_1s (CLK,Reset,CLK_up);
	count_4bit_2(CLK_up,ENA,Reset,Q); 
	bcd_to_led7(Q,out);
endmodule
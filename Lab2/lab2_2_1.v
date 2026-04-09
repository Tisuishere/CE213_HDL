module lab2_2_1 (CLK,Reset,ENA, out);
	input CLK,Reset,ENA;
	output [6:0] out;
	
	wire [3:0]Q;
	count_4bit_2(CLK,ENA,Reset,Q);
	bcd_to_led7(Q,out);
endmodule
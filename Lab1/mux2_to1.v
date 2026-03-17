module mux_2to1 (x,y,s,m);
	input x,y,s;
	output m;
	assign m = (x & ~s) | (y & s);
endmodule 
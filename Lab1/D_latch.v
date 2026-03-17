module D_latch(D,CLK,Q);
	input D,CLK;
	output Q;
	wire S_g,R_g,Qb;
	nand(S_g,D,CLK);
	nand(R_g,~D,CLK);
	nand(Q,Qb,S_g);
	nand(Qb,Q,R_g);
endmodule

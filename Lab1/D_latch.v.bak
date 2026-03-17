module D_latch(D,CLK,Q);
	input D,CLK;
	output Q;
	wire S_g,R_g,Qb;
	nand n1(S_g,D,CLK);
	nand n2(R_g,~D,CLK);
	nand n3(Q,Qb,S_g);
	nand n4(Qb,Q,R_g);
endmodule

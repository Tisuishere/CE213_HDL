module D_flipflop(D,CLK,Q,Qn);
	input D,CLK;
	output Q,Qn;
	wire Qm;
	D_latch(D,~CLK,Qm);
	D_latch(Qm,CLK,Q);
	not g1(Qn,Q);
endmodule

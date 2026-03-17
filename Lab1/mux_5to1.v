module mux_5to1(u,v,w,x,y,s,m);
	input	u,v,x,w,y;
	input	[2:0]s;
	output	m;
	wire uv,wx,uvwx;
	mux_2to1 (u,v,s[0],uv);
	mux_2to1 (w,x,s[0],wx);
	mux_2to1 (uv,wx,s[1],uvwx);
	mux_2to1 (uvwx,y,s[2],m);
endmodule

module mux_5to1_3bit(u,v,w,x,y,s,m);
	input	[2:0]u,v,x,w,y;
	input	[2:0]s;
	output	[2:0]m;
    mux_5to1 m0(u[0],v[0],w[0],x[0],y[0],s,m[0]);
    mux_5to1 m1(u[1],v[1],w[1],x[1],y[1],s,m[1]);
    mux_5to1 m2(u[2],v[2],w[2],x[2],y[2],s,m[2]);
endmodule

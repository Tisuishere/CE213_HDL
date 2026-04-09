module T_flipflop (CLK, Reset, T, Q);
    input CLK, Reset, T;
    output reg Q;
	 
    always @(posedge CLK or negedge Reset) begin
        if (!Reset) begin
            Q <= 1'b0;      
        end else begin
            if (T) begin
                Q <= ~Q;    
            end else begin
                Q <= Q;    
            end
        end
    end
endmodule

module count_4bit_1( CLK, ENA, Clear, Q);
    input CLK, ENA, Clear;
    output [3:0] Q;

	wire t1,t2,t3;

	T_flipflop(CLK,Clear,ENA,Q[0]);

	and(t1,Q[0],ENA);
	T_flipflop(CLK,Clear,t1,Q[1]);

	and(t2,Q[1],t1);
	T_flipflop(CLK,Clear,t2,Q[2]);

	and(t3,Q[2],t2);
	T_flipflop(CLK,Clear,t3,Q[3]);

endmodule
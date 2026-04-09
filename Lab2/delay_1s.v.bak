module delay_1s(
	input CLK,
	output out
);
	reg [25:0]Q;
	reg done;
	always @ (posedge CLK) begin
		if (Q == 26'd49999999) begin
			done <= 1'b1;
			Q <= 26'd0;
		end else begin
				done <= 1'b0;
				Q <= Q+1'b1;
			end
	end
	assign out = done;
endmodule
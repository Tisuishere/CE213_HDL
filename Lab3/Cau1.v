module Cau1 (
	input wire x,
	input wire clk,
	output wire z
);
	`define s0 3'b000	// nhận 1 số 0 (z=0)
	`define s1 3'b001 // nhận 2 số 0 (z=0)
	`define s2 3'b010 // nhận 3 số 0 (z=0)
	`define s3 3'b011 // nhận 4 số 0 hoặc nhiều hơn (z=1)
	`define s4 3'b100 // nhận 1 số 1 (z=0)
	`define s5 3'b101 // nhận 2 số 1 (z=0)
	`define s6 3'b110 // nhận 3 số 1 (z=0)
	`define s7 3'b111 // nhận 4 số 1 hoặc nhiều hơn (z=1)
	
	reg [2:0] curr, next;
	initial curr = `s0;
	always @(posedge clk) begin
		curr <= next;
	end
	
	always @(*) begin
		case (curr)
				`s0: next = (x==1'b0) ? `s1 : `s4;
				`s1: next = (x==1'b0) ? `s2 : `s4;
				`s2: next = (x==1'b0) ? `s3 : `s4;
				`s3: next = (x==1'b0) ? `s3 : `s4;
				`s4: next = (x==1'b1) ? `s5 : `s0;
				`s5: next = (x==1'b1) ? `s6 : `s0;
				`s6: next = (x==1'b1) ? `s7 : `s0;
				`s7: next = (x==1'b1) ? `s7 : `s0;
				default: next = `s0;
		endcase
	end
	
	assign z = (curr==`s3)||(curr==`s7);
endmodule

module traffic_light(
	input wire clk_1s,
	output reg NS_R, NS_Y, NS_G,
	output reg EW_R, EW_Y, EW_G
);
	`define s0 3'd0
	`define s1 3'd1
	`define s2 3'd2
	`define s3 3'd3
	`define s4 3'd4
	`define s5 3'd5
	
	reg [2:0] curr, next;
	reg [3:0] timer;
	
	initial begin
		curr = `s0;
		timer = 0;
	end
	
	always @(posedge clk_1s) begin
		if (timer == get_delay(curr) - 1) begin
			curr <= next;
			timer <= 0;
		end else begin
			timer <= timer + 1;
		end
	end
	
	always @(*) begin
		case (curr)
			`s0: next = `s1;
			`s1: next = `s2;
			`s2: next = `s3;
			`s3: next = `s4;
			`s4: next = `s5;
			`s5: next = `s0;
			default: next = `s0;
		endcase
	end
	
	always @(*) begin
		NS_R=0; NS_Y=0; NS_G=0;
		EW_R=0; EW_Y=0; EW_G=0;
		case (curr)
			`s0: begin NS_G=1; EW_R=1; end 
			`s1: begin NS_Y=1; EW_R=1; end
			`s2: begin NS_R=1; EW_R=1; end
			`s3: begin NS_R=1; EW_G=1; end
			`s4: begin NS_R=1; EW_Y=1; end
			`s5: begin NS_R=1; EW_R=1; end
		endcase
	end
	
	function [3:0] get_delay;
		input [2:0] state;
		case (state)
			`s0: get_delay = 5;
			`s1: get_delay = 1;
			`s2: get_delay = 1;
			`s3: get_delay = 5;
			`s4: get_delay = 1;
			`s5: get_delay = 1;
			default: get_delay = 1;
		endcase
	endfunction
endmodule

	
module delay_1s (CLOCK_50, reset, out);
	input CLOCK_50, reset;
	output  out;
	// 50Mhz -> T = 1/f = 2*10^-8, cần 1s -> 50M lần <-> 0->49 999 999 -> cần 26bit
	reg [25:0] counter = 0;
	always @(posedge CLOCK_50 or negedge reset) begin 
		if (!reset) begin 
			counter <= 26'd0;
			end
		else if (counter != 26'd49999999) begin 
			counter <= counter + 26'd1;
			end
		else begin 
			counter <= 26'd0;
		end
	end 
	assign out = (counter == 26'd49999999) ? 1:0;
endmodule
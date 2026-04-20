module clock_1s (
	input wire CLOCK_50,
	output reg clock_1s
);
	reg [25:0] count;
	always @(posedge CLOCK_50) begin
    if (count == 26'd1) begin // 0.5 giây d24999999
        count <= 26'd0;
        clock_1s <= ~clock_1s; // Đảo trạng thái
    end else count <= count + 1'b1;
end
endmodule

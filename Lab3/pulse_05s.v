module pulse_05s (
    input wire clk,
    input wire rst_n,
    output reg pulse
);
    reg [24:0] count;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 0;
            pulse <= 0;
        end else if (count == 25'd1) begin //24_999_999
            count <= 0;
            pulse <= 1; // Kích cạnh lên sau 0.5s
        end else begin
            count <= count + 1;
            pulse <= 0;
        end
    end
endmodule
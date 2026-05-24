module Dual_Port_Ram (
    input wire clk,                 
    input wire [9:0] Address,       
    input wire [31:0] WriteData,    
    input wire WriteEn,             
    input wire ReadEn,              
    output reg [31:0] ReadData      
);
    reg [31:0] ram [0:63];

    always @(posedge clk) begin
        if (WriteEn) begin
            ram[Address] <= WriteData;
        end
    end

    always @(*) begin
        if (ReadEn) begin
            ReadData = ram[Address];
        end else begin
            ReadData = 32'd0;
        end
    end

endmodule

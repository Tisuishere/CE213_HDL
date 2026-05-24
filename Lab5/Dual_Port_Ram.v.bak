module Dual_Port_Ram (
    input wire clk,                 
    input wire [9:0] Address,       //2^10 = 1024
    input wire [7:0] WriteData,    
    input wire WriteEn,            
    input wire ReadEn,              
    output reg [7:0] ReadData       
);
    reg [7:0] ram [0:1023];
    always @(posedge clk) begin
        if (WriteEn) begin
            ram[Address] <= WriteData;
        end
    end
    always @(posedge clk) begin
        if (ReadEn) begin
            ReadData <= ram[Address];
        end
    end

endmodule
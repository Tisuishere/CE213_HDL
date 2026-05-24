module RegisterFile (
    input  wire        clk,            
    input  wire        rst_n,          
    input  wire [4:0]  ReadAddress1,   
    input  wire [4:0]  ReadAddress2,   
    input  wire [4:0]  WriteAddress,   
    input  wire [31:0] WriteData,      
    input  wire        WriteEn,        
    output wire [31:0] ReadData1,      
    output wire [31:0] ReadData2       
);
    reg [31:0] rf [31:0];
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < 32; i = i + 1) begin
                rf[i] <= 32'b0;
            end
        end else begin
            if (WriteEn) begin
                rf[WriteAddress] <= WriteData;
            end
        end
    end
    assign ReadData1 = rf[ReadAddress1];
    assign ReadData2 = rf[ReadAddress2];
endmodule

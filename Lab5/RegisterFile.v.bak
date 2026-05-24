module RegisterFile (
    input  wire        clk,           
    input  wire        rst_n,         
    input  wire [4:0]  ReadAddress1,	//Đchi đọc 1  
    input  wire [4:0]  ReadAddress2,  	//Đchi đọc 2
    input  wire [4:0]  WriteAddress,  	//Đchi ghi
    input  wire [31:0] WriteData,     	//Data được ghi
    input  wire        WriteEn,       	//Cho phép ghi
    output wire [31:0] ReadData1,     	//Oụt 1 
    output wire [31:0] ReadData2      	//Out 2
);
    reg [31:0] rf [31:0];
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Reset toàn bộ thanh ghi về 0
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
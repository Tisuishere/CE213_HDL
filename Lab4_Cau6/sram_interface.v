module sram_interface (
   input  [15:0] SW,        
   input  [1:0]  KEY,       
   
   output [6:0]  HEX0,
   output [6:0]  HEX1,
   output [6:0]  HEX2,
   output [6:0]  HEX3,
	
   output [6:0]  HEX4,
   output [6:0]  HEX5,
   output [6:0]  HEX6,
   output [6:0]  HEX7,
	
   inout  [15:0] SRAM_DQ,   
   output [17:0] SRAM_ADDR, 
   output        SRAM_CE_N, 
   output        SRAM_OE_N, 
   output        SRAM_WE_N, 
   output        SRAM_LB_N, 
   output        SRAM_UB_N  
);

   wire oe_n = KEY[0]; 
   wire we_n = KEY[1];
	
   assign SRAM_ADDR = {10'b0, SW[15:8]};

   assign SRAM_CE_N = 1'b0;   
   assign SRAM_LB_N = 1'b0;   
   assign SRAM_UB_N = 1'b0;   
   assign SRAM_OE_N = oe_n;
   assign SRAM_WE_N = we_n;
   assign SRAM_DQ = (we_n == 1'b0) ? {8'h00, SW[7:0]} : 16'bz;

   wire [15:0] read_data = SRAM_DQ;

   hex_decoder h0(read_data[3:0],   HEX0);
   hex_decoder h1(read_data[7:4],   HEX1);
   hex_decoder h2(read_data[11:8],  HEX2);
   hex_decoder h3(read_data[15:12], HEX3);


endmodule
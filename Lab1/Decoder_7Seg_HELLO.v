module Decoder_7Seg_HELLO (c,hex);
	input  [2:0] c;    
   output [6:0] hex;
	assign hex =   (c == 3'b000) ? 7'b0001001 : 
						(c == 3'b001) ? 7'b0000110 :  
                  (c == 3'b010) ? 7'b1000111 :   
                  (c == 3'b011) ? 7'b1000111 :  
                  (c == 3'b100) ? 7'b1000000 :  
                                  7'b1111111 ;  

endmodule 
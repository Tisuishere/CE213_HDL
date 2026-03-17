module lab1_2c (SW,HEX0,HEX1,HEX2,HEX3,HEX4);
	input [17:15] SW;
	output [6:0]  HEX4, HEX3, HEX2, HEX1, HEX0;
	// H=000, E=001, L=010, L_1=011, O=100
	Mux_seg({SW[17:15], 3'b000, 3'b001, 3'b010, 3'b011, 3'b100}, HEX4); //HELLO
	Mux_seg({SW[17:15], 3'b001, 3'b010, 3'b011, 3'b100, 3'b000}, HEX3); //ELLOH
	Mux_seg({SW[17:15], 3'b010, 3'b011, 3'b100, 3'b000, 3'b001}, HEX2); //LLOHE
	Mux_seg({SW[17:15], 3'b011, 3'b100, 3'b000, 3'b001, 3'b010}, HEX1); //LOHEL
	Mux_seg({SW[17:15], 3'b100, 3'b000, 3'b001, 3'b010, 3'b011}, HEX0); //OHELL
endmodule

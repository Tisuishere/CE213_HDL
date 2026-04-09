module mux_8to1_3bit_assign (i0, i1, i2, i3, i4, i5, i6, i7, s, m);
    input [2:0] i0, i1, i2, i3, i4, i5, i6, i7;
    input [2:0] s;
    output [2:0] m;
    assign m = (s == 3'b000) ? i0 :
               (s == 3'b001) ? i1 :
               (s == 3'b010) ? i2 :
               (s == 3'b011) ? i3 :
               (s == 3'b100) ? i4 :
               (s == 3'b101) ? i5 :
               (s == 3'b110) ? i6 :
                               i7; //3'b111
endmodule

module lab1_2d (SW, H0, H1, H2, H3, H4, H5, H6, H7);
    input  [17:15] SW;
    output [6:0]   H0, H1, H2, H3, H4, H5, H6, H7;
    wire [2:0] c0, c1, c2, c3, c4, c5, c6, c7;
    //H=000, E=001, L1=010, L2=011, O=100, 0=111
    mux_8to1_3bit_assign m7 (3'b111, 3'b111, 3'b111, 3'b000, 3'b001, 3'b010, 3'b011, 3'b100, SW[17:15], c7);
    mux_8to1_3bit_assign m6 (3'b111, 3'b111, 3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b111, SW[17:15], c6);
    mux_8to1_3bit_assign m5 (3'b111, 3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b111, 3'b111, SW[17:15], c5);
    mux_8to1_3bit_assign m4 (3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b111, 3'b111, 3'b111, SW[17:15], c4);
    mux_8to1_3bit_assign m3 (3'b001, 3'b010, 3'b011, 3'b100, 3'b111, 3'b111, 3'b111, 3'b000, SW[17:15], c3);
    mux_8to1_3bit_assign m2 (3'b010, 3'b011, 3'b100, 3'b111, 3'b111, 3'b111, 3'b000, 3'b001, SW[17:15], c2);
    mux_8to1_3bit_assign m1 (3'b011, 3'b100, 3'b111, 3'b111, 3'b111, 3'b000, 3'b001, 3'b010, SW[17:15], c1);
    mux_8to1_3bit_assign m0 (3'b100, 3'b111, 3'b111, 3'b111, 3'b000, 3'b001, 3'b010, 3'b011, SW[17:15], c0);

    Decoder_7Seg_HELLO d7 (c7, H7);
    Decoder_7Seg_HELLO d6 (c6, H6);
    Decoder_7Seg_HELLO d5 (c5, H5);
    Decoder_7Seg_HELLO d4 (c4, H4);
    Decoder_7Seg_HELLO d3 (c3, H3);
    Decoder_7Seg_HELLO d2 (c2, H2);
    Decoder_7Seg_HELLO d1 (c1, H1);
    Decoder_7Seg_HELLO d0 (c0, H0);
endmodule 
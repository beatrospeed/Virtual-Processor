module CONFF (
input [31:0] busContents, 
input [31:0]  IR, 
output wire  q

); 

wire[3:0] c2 = IR[22:19]; 
wire[1:0] c_l= c2[1:0]; 
	    //beq zero
assign q = (c_l==2'b00 ? busContents == 0 : 0) |
	    //bneq zero 
 		(c_l==2'b01 ? busContents != 0 : 0) |
 		       //gtr zero
			 (c_l==2'b10 ? busContents > 0 : 0) |
			    //lte 0 
 				(c_l== 2'b11 ? busContents < 0 : 0) ;

endmodule	


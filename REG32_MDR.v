module Reg32(input [31:0] D, input clock, input clear, input load, output reg[31:0] Q); 
	always @(posedge clock)
		if(clear)
		begin
			Q <= 32'b0; 
			end 
			else if(load)
			begin 
			Q  <= D; 
			end 
endmodule 


module mdr_reg (output [31:0] Q, input [31:0] mdata_in, input MDR_read, input clock, input reset, input mdr_in, input [31:0] BusMuxOut 
  ); 

	wire [31:0] d; 
	MD_Mux MD_mux (d, BusMuxOut, mdata_in,MDR_read); 
	
	Reg32 q (d, clock, reset,mdr_in, Q); 
	
endmodule



	
	
		
		

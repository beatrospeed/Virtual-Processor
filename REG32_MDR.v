module REG32(input [31:0] D, input clock, input reset, output reg[31:0] Q); 
	always @(posedge clock)
		if(clear)
		begin
			Q <= 32'b0; 
			end else if(reset)
			begin 
			Q  <= D; 
			end 
endmodule 


module mdr_reg (input [31:0] out, input [31:0] BusMuxOut, input [31:0] mdata_in, input MDR_read 
input reset, input clock, input mdr_in); 

	wire [31:0] d; 
	MD_MUX MD_mux (d, BusMuxOut, mdata_in,MDR_read); 
	
	Reg32 q (d, clock, reset,mdr_in,q); 
	
endmodule



	
	
		
		

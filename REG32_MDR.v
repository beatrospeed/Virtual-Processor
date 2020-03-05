module Reg32(input [31:0] D, input clock, input clear, input load, output reg [31:0] Q); 
	always @(*)
		if(clear)
		begin
			Q <= 32'b0; 
			end 
			else if(load)
			begin 
			Q  <= D; 
			end 
endmodule 

module Reg64(input [63:0] D, input clock, input clear, input load, output reg [63:0] Q); 
	always @(posedge clock)
		if(clear)
		begin
			Q <= 64'b0; 
			end 
			else if(load)
			begin 
			Q  <= D; 
			end 
endmodule 

module mdr_reg (output [31:0] Q, input [31:0] mdata_in, input MDRin, input clock, 
		input reset, input MDR_in, input [31:0] BusMuxOut); 

	wire [31:0] d; 
	MD_Mux MD_mux (.Output(d), .A(BusMuxOut), .B(mdata_in),.Select(MDR_in)); 
	
	Reg32 q (.D(d), .clock(clock),.clear(reset), .load(MDRin), .Q(Q)); 
	
endmodule



	
	
		
		

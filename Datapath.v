`timescale 1ns/10ps

module dataPath(
	//encoder inputs 	
	input reg R0out, R1out, R2out, R3out, R4out,
	 R5out, R6out, R7out, R8out, R9out,
	 R10out, R11out, R12out, R13out, R14out,
	 R15out, HIout, LOout, Zhighout, Zlowout,
	 PCout, MDRout, In_Portout, Cout, in24,
	 in25, in26, in27, in28, in29, in30,
	 in31,
	 


	//Bus encoder inputs
	input reg BusMuxin_R0, BusMuxin_R1, BusMuxin_R2,
	 BusMuxin_R3, BusMuxin_R4, BusMuxin_R5,
	 BusMuxin_R6, BusMuxin_R7, BusMuxin_R8,
	 BusMuxin_R9, BusMuxin_R10, BusMuxin_R11,
	 BusMuxin_R12, BusMuxin_R13, BusMuxin_R14,
	 BusMuxin_R15, BusMuxin_HIout, BusMuxin_LOout,
	 BusMuxin_Zhighout, BusMuxin_Zlowout, BusMuxin_PCout,
	 BusMuxin_MDRout, BusMuxin_In_Portout, BusMuxin_Cin,
	 BusMuxin_in24, BusMuxin_in25, BusMuxin_in26,
	 BusMuxin_in27, BusMuxin_in28, BusMuxin_in29,
	 BusMuxin_in30, BusMuxin_in31, 

	 input load, //load enable for mdr
	 input clk,
	 input reset, 
	 input [31:0] Mdata_in, 
	 input [3:0] control, 
	 input ADD, SUB, MUL, DIV, SHR, SHL, ROR, ROL, AND, OR, NEG, NOT, IncPc,
	 output [31:0] Mdatain,
	 output [31:0] zhigh_d, zlow_d, 
	 output [31:0] BusMuxOut, IRval, MDRval,HIval, LOval
	 

);
	Reg32 PC ();



endmodule 
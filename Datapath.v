`timescale 1ns/10ps

module dataPath(
	
	input R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, Yin,
   Zin, HIin, LOin, InPortin, OutPortin, MARin, MDRin, IRin, PCin,
	

	//Bus encoder inputs
	input BusMuxin_R0, BusMuxin_R1, BusMuxin_R2,
	 BusMuxin_R3, BusMuxin_R4, BusMuxin_R5,
	 BusMuxin_R6, BusMuxin_R7, BusMuxin_R8,
	 BusMuxin_R9, BusMuxin_R10, BusMuxin_R11,
	 BusMuxin_R12, BusMuxin_R13, BusMuxin_R14,
	 BusMuxin_R15, BusMuxin_HIout, BusMuxin_LOout,
	 BusMuxin_Zhighout, BusMuxin_Zlowout, BusMuxin_PCout,
	 BusMuxin_MDRout, BusMuxin_In_Portout, BusMuxin_Cin,
	 BusMuxin_in24, BusMuxin_in25, BusMuxin_in26,
	 BusMuxin_in27, BusMuxin_in28, BusMuxin_in29,
	 BusMuxin_in30, BusMuxin_in31, Y_in, Z_in,

	 input load, //load enable for mdr
	 input clk,
	 input reset, 
	 input [31:0] Mdata_in, 
	 input [3:0] control, 
	 input ADD, SUB, MUL, DIV, SHR, SHL, ROR, ROL, AND, OR, NEG, NOT, IncPc,
	 output [31:0] Mdatain,
	 output [31:0] ZVal, 
	 output [31:0] Bus, IRval, MDRval,HIval, LOval
	 

);
	wire [4:0] Select_D; 
	wire [31:0] Y_D, InPort_D, OutPort_D, MAR_D, PCVal_D; 
	wire [63:0] ALUVal_D; 
	
	
	Reg32 Y(Bus, clk, reset, y_in, Y_D); 
	Reg32 Z(ALUVal_D, clk, reset, Z_in, Zval);
	Reg32 HI(Bus, clk reset, HIin, HIval); 
   Reg32 LO(Bus, Clock, Reset, LOin, LOval);
	Reg32 InPort(32'b0, Clock, Reset, InPortin, InPortVal);
   Reg32 OutPort(bus, Clock, Reset, OutPortin, OutPortVal);
   Reg32 MDR(bus, clk, reset, MARin, MAR_D);
   mdr_reg mdr(bus ,MDRval, mDataIn, Read,Reset, Clock, MDRin);
   Reg32 IR(bus, Clock, Reset, IRin, IRVal);
   Reg32 PC(bus, Clock, Reset, PCin, PCVal);


endmodule 
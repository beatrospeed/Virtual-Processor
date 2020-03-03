`timescale 1ns/10ps

module dataPath(
	
	input R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, Yin,
   Zin, HIin, LOin, InPortin, OutPortin, MARin, MDRin, IRin, PCin,
	

	//bus encoder inputs
	output BusMuxin_R0, BusMuxin_R1, BusMuxin_R2,
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

	 output [31:0] R0Val,R1Val,R2Val,R3Val,R4Val,R5Val,R6Val,R7Val,R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,R15Val,

	 input load, //load enable for mdr
	 input clk,
	 input reset, 
	 input [31:0] Mdata_in, 
	 input [3:0] control, 
	 input ADD, SUB, MUL, DIV, SHR, SHL, ROR, ROL, AND, OR, NEG, NOT, IncPc,
	 output [31:0] Mdatain,
	 output [63:0] ZVal,
	 output wire [31:0] bus,IRval, MDRval,HIval, LOval
	 
);
	
	wire [4:0] Select_D; 
	wire [31:0] YVal, InPort_D, OutPort_D, MAR_D, PCVal,CVal,in24Val,in25Val,in26Val,in27Val,in28Val,in29Val,in30Val,in31Val; 
	wire [63:0] ALUVal_D; 
	
	
	Reg32 Y(bus, clk, reset, Y_in, YVal); 
	Reg32 Z(ALUVal_D, clk, reset, Z_in, Zval);
	Reg32 HI(bus, clk, reset, HIin, HIval); 
   Reg32 LO(bus, clk, reset, LOin, LOval);
	Reg32 InPort(32'b0, clk, reset, InPortin,InPortVal);
   Reg32 OutPort(bus, clk, reset, OutPortin, OutPortVal);
   Reg32 MDR(BusMuxin_MDRout, clk, reset, MARin, MAR_D);
   mdr_reg mdr(BusMuxin_MDRout ,MDRval, mDataIn, load ,reset, clk, MDRin);
   Reg32 IR(bus, clk, reset, IRin, IRval);
   Reg32 PC(bus, clk, reset, PCin, PCVal);
   Reg32 R0(bus, clk, reset, R0in, R0Val); 
   Reg32 R1(bus, clk, reset, R1in, R1Val); 
   Reg32 R2(bus, clk, reset, R2in, R2Val); 
   Reg32 R3(bus, clk, reset, R3in, R3Val); 
   Reg32 R4(bus, clk, reset, R4in, R4Val); 
   Reg32 R5(bus, clk, reset, R5in, R5Val); 
   Reg32 R6(bus, clk, reset, R6in, R6Val); 
   Reg32 R7(bus, clk, reset, R7in, R7Val); 
   Reg32 R8(bus, clk, reset, R8in, R8Val); 
   Reg32 R9(bus, clk, reset, R9in, R9Val); 
   Reg32 R10(bus, clk, reset, R10in, R10Val); 
   Reg32 R11(bus, clk, reset, R11in, R11Val); 
   Reg32 R12(bus, clk, reset, R12in, R12Val); 
   Reg32 R13(bus, clk, reset, R13in, R13Val); 
   Reg32 R14(bus, clk, reset, R14in, R14Val); 
   Reg32 R15(bus, clk, reset, R15in, R15Val); 	

   
	encoder_32_to_5 BusMux_encoder(Select_D,BusMuxin_R0, BusMuxin_R1, BusMuxin_R2,
									 BusMuxin_R3, BusMuxin_R4, BusMuxin_R5,
									 BusMuxin_R6, BusMuxin_R7, BusMuxin_R8,
									 BusMuxin_R9, BusMuxin_R10, BusMuxin_R11,
									 BusMuxin_R12, BusMuxin_R13, BusMuxin_R14,
									 BusMuxin_R15, BusMuxin_HIout, BusMuxin_LOout,
									 BusMuxin_Zhighout, BusMuxin_Zlowout, BusMuxin_PCout,
									 BusMuxin_MDRout, BusMuxin_In_Portout, BusMuxin_Cin,
									 BusMuxin_in24, BusMuxin_in25, BusMuxin_in26,
									 BusMuxin_in27, BusMuxin_in28, BusMuxin_in29,
									 BusMuxin_in30, BusMuxin_in31);

	Mux_32_to_1 Bus_Mux(bus,Select_D,R0Val,R1Val,R2Val,R3Val,R4Val,R5Val,R6Val,R7Val,
	R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,R15Val,HIval,LOval,ZVal[63:32], ZVal[31:0],
	PCVal,MDRval,InPortVal,CVal,in24Val,in25Val,in26Val,in27Val,in28Val,in29Val,in30Val,in31Val);
	
	alu Alu(ZVal[63:32], ZVal[31:0],YVal,bus,control,IncPc,clk);

endmodule 
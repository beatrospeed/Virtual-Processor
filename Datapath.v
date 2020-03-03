`timescale 1ns/10ps

module dataPath(


	input PCout,Zlowout, MDRout,R2out,R4out, MARin,Z_in, PCin, MDRin,IRin,Y_in,IncPc, load, input [3:0] control, R5in, R2in,R4in,clk,
	input [31:0] Mdatain,
	output 
	
	 
);
	
	wire R0out, R1out, R3out, R5out, R6out, R7out, R8out, R9out,
	R10out, R11out, R12out, R13out, R14out, R15out,HIout, LOout,
	InPortout, OutPortout,Cout, R0in, R1in, R3in, R6in, R7in, R8in,
	R9in, R10in, R11in, R12in, R13in, R14in, R15in, HIin, LOin,
	Zhighin, Zlowin, InPortin, Cin, reset; 


	 wire [31:0] R0Val,R1Val,R2Val,R3Val,R4Val,R5Val,R6Val,R7Val,R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,R15Val;
	 
	 wire [3:0] ADD, SUB, MUL, DIV, SHR, SHL, ROR, ROL, OR, NEG, NOT;
	 
	wire [63:0] ZVal;
	wire [31:0] bus,IRval, MDRval,HIval, LOval;
	wire [4:0] Select_D; 
	wire [31:0] YVal, InPort_D, OutPort_D, MAR_D, PCVal,CVal; 
	wire [63:0] ALUVal_D; 
	
	
	Reg32 Y(bus, clk, reset, Y_in, YVal); 
	Reg32 Z(ALUVal_D, clk, reset, Z_in, Zval);
	Reg32 HI(bus, clk, reset, HIin, HIval); 
   Reg32 LO(bus, clk, reset, LOin, LOval);
	//Reg32 InPort(32'b0, clk, reset, InPortin,InPortVal);
   //Reg32 OutPort(bus, clk, reset, OutPortin, OutPortVal);
   
   mdr_reg mdr(MDRout,mDataIn,load,clk ,reset,MDRin, MDRval);
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

   
	encoder_32_to_5 BusMux_encoder(Select_D, clk , R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
   	HIout, LOout,Zhighout,Zlowout,PCout, MDRout, InPortout,Cout);

	Mux_32_to_1 Bus_Mux(bus,R0Val,R1Val,R2Val,R3Val,R4Val,R5Val,R6Val,R7Val,
	R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,R15Val,HIval,LOval,ZVal[63:32], ZVal[31:0],
	PCVal,MDRval,InPortVal,CVal,Select_D);
	
	alu Alu(ZVal[63:32], ZVal[31:0],YVal,bus,control,IncPc,clk);

endmodule 
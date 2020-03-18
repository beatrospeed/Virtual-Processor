`timescale 1ns/10ps

module dataPath(


	input PCout,Zlowout, MDRout,R2out,R4out, MARin,Zin,
	PCin, MDRin,IRin,Yin,IncPc, read, R5in, R2in,R4in,clk,
	input [3:0] control,
	input [31:0] Mdatain,
	input R0out, R1out, R3out, R5out, R6out, R7out, R8out, R9out,
	R10out, R11out, R12out, R13out, R14out, R15out,HIout, LOout,
	InPortout, OutPortout,Cout, Zhighout,
	R0in, R1in, R3in, R6in, R7in, R8in,
	R9in, R10in, R11in, R12in, R13in, R14in, R15in, HIin, LOin,
	Zhighin, Zlowin, InPortin, Cin, reset,
	output wire [31:0] R0Val,R1Val,R2Val,R3Val,R4Val,R5Val,R6Val,R7Val,R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,R15Val,bus,MDRval,mux_data_out,YVal,
	output wire [63:0] ZVal,ALUVal_D,
	input BAout
);
	
	


	 
	 
	
	
	
	 
	wire [31:0] R0TempOut;
	wire [31:0] IRval,HIval, LOval;
	wire [4:0] Select_D; 
	wire [31:0]  InPort_D, OutPort_D, PCVal,CVal;//, mux_data_out;  
	wire [8:0]  MAR_D; // THis is 9 bits as specified by the CPU phase 2 Instructions
	
	
   Reg32 HI(bus, clk, reset, HIin, HIval); 
   Reg32 LO(bus, clk, reset, LOin, LOval);
   Reg32 Y(bus, clk, reset, Yin, YVal);
   Reg64 Z(ALUVal_D, clk, reset, Zin, ZVal);
   
	
	MD_Mux md_mux(mux_data_out, bus, Mdatain, read);
	Reg32  mdrReg(mux_data_out,clk,reset,MDRin, MDRval);
	
	Reg32 InPort(32'b0, clk, reset, InPortin, InPort_D);
   Reg32 IR(bus, clk, reset, IRin, IRval);
   Reg32 PC(bus, clk, reset, PCin, PCVal);
	
	Reg32 MAR(bus, clk, reset, MARin, MAR_D);
	
	
   Reg32 R0(bus, clk, reset, R0in, R0TempOut);   assign R0Val = ((~BAout) & R0TempOut);// based on schematic
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

   
	encoder_32_to_5 BusMux_encoder(.SelectOut(Select_D), .R0out(R0out), .R1out(R1out), .R2out(R2out), .R3out(R3out), .R4out(R4out),.R5out(R5out),
	.R6out(R6out), .R7out(R7out), .R8out(R8out), .R9out(R9out), .R10out(R10out), .R11out(R11out), .R12out(R12out), .R13out(R13out), .R14out(R14out), .R15out(R15out),
   	.HIout(HIout), .LOout(LOout),.Zhighout(Zhighout),.Zlowout(Zlowout),.PCout(PCout), .MDRout(MDRout), .In_Portout(InPortout),.Cout(Cout));

	Mux_32_to_1 Bus_Mux(bus,R0Val,R1Val,R2Val,R3Val,
	R4Val,R5Val,R6Val,R7Val,R8Val,R9Val,R10Val,
	R11Val,R12Val,R13Val,R14Val,R15Val,HIval,LOval,ZVal[63:32],
	ZVal[31:0],PCVal,MDRval,InPort_D,CVal,Select_D);
	
	alu Alu(ALUVal_D,YVal,bus,control,IncPc,clk);

endmodule 
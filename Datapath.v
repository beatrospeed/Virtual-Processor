

module dataPath(
	input CONin,
	input [31:0] InportData,
	input PCout,Zlowout, MDRout, MARin,Zin,
	PCin,MDRin, read, write,IRin,Yin,IncPc,clk,
	input [1:0] mdr_read,
	input [3:0] control,
	input HIout, LOout,
	input InPortout, OutPortout,Cout, Zhighout, 
	HIin, LOin, Zhighin, Zlowin, InPortin, reset,
	input BAout,OutPortin,Rin,Rout,GRA, GRB, GRC,
	input [31:0] Immediate,
	//demonstration ports
	output wire [31:0] R0Val,R1Val,R2Val,R3Val,R4Val,R5Val,R6Val,
	R7Val,R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,
	R15Val,IRval,bus,MDRval,mux_data_out,YVal,R0TempOut,
	C_sign_extended,InPort_D, OutPort_D, PCVal,Mdatain,
	output wire [31:0] ZVal1,ZVal2,ALUVal_D1,ALUVal_D2, 
	output wire [15:0] Rin_Select, Rout_Select,
	output wire [31:0] MAR_D,
	output wire Branch
	
);
	
	wire [31:0]HIval, LOval;
	wire [4:0] Select_D;

	
	wire  negateBA; 
	
	not(negateBA, BAout);
	and(R0Val[0], R0TempOut[0], negateBA);
	and(R0Val[1], R0TempOut[1], negateBA);
	and(R0Val[2], R0TempOut[2], negateBA);
	and(R0Val[3], R0TempOut[3], negateBA);
	and(R0Val[4], R0TempOut[4], negateBA);
	and(R0Val[5], R0TempOut[5], negateBA);
	and(R0Val[6], R0TempOut[6], negateBA);
	and(R0Val[7], R0TempOut[7], negateBA);
	and(R0Val[8], R0TempOut[8], negateBA);
	and(R0Val[9], R0TempOut[9], negateBA);
	and(R0Val[10], R0TempOut[10], negateBA);
	and(R0Val[11], R0TempOut[11], negateBA);
	and(R0Val[12], R0TempOut[12], negateBA);
	and(R0Val[13], R0TempOut[13], negateBA);
	and(R0Val[14], R0TempOut[14], negateBA);
	and(R0Val[15], R0TempOut[15], negateBA);
	and(R0Val[16], R0TempOut[16], negateBA);
	and(R0Val[17], R0TempOut[17], negateBA);
	and(R0Val[18], R0TempOut[18], negateBA);
	and(R0Val[19], R0TempOut[19], negateBA);
	and(R0Val[20], R0TempOut[20], negateBA);
	and(R0Val[21], R0TempOut[21], negateBA);
	and(R0Val[22], R0TempOut[22], negateBA);
	and(R0Val[23], R0TempOut[23], negateBA);
	and(R0Val[24], R0TempOut[24], negateBA);
	and(R0Val[25], R0TempOut[25], negateBA);
	and(R0Val[26], R0TempOut[26], negateBA);
	and(R0Val[27], R0TempOut[27], negateBA);
	and(R0Val[28], R0TempOut[28], negateBA);
	and(R0Val[29], R0TempOut[29], negateBA);
	and(R0Val[30], R0TempOut[30], negateBA);
	and(R0Val[31], R0TempOut[31], negateBA);

   Reg32 HI(bus, clk, reset, HIin, HIval); 
   Reg32 LO(bus, clk, reset, LOin, LOval);
   Reg32 Y(bus, clk, reset, Yin, YVal);
   Reg32 Zlow(ALUVal_D1, clk, reset, Zlowin, ZVal1);
   Reg32 Zhigh(ALUVal_D2, clk, reset, Zhighin, ZVal2);
   
	MD_Mux md_mux(mux_data_out, bus, Mdatain, Immediate,32'b0, mdr_read);
	Reg32  mdrReg(mux_data_out,clk,reset,MDRin, MDRval);
   Reg32 InPort(InportData, clk, reset, InPortin, InPort_D);
   Reg32 Outport(bus,clk,reset,OutPortin, OutPort_D);
   Reg32 IR(bus, clk, reset, IRin, IRval);
   Reg32 PC(bus, clk, reset, PCin, PCVal);
   Reg32 MAR(bus, clk, reset, MARin, MAR_D);
   Reg32 R0(bus, clk, reset, Rin_Select[0], R0TempOut); 

   Reg32 R1(bus, clk, reset, Rin_Select[1], R1Val); 
   Reg32 R2(bus, clk, reset, Rin_Select[2], R2Val); 
   Reg32 R3(bus, clk, reset, Rin_Select[3], R3Val); 
   Reg32 R4(bus, clk, reset, Rin_Select[4], R4Val); 
   Reg32 R5(bus, clk, reset, Rin_Select[5], R5Val); 
   Reg32 R6(bus, clk, reset, Rin_Select[6], R6Val); 
   Reg32 R7(bus, clk, reset, Rin_Select[7], R7Val); 
   Reg32 R8(bus, clk, reset, Rin_Select[8], R8Val); 
   Reg32 R9(bus, clk, reset, Rin_Select[9], R9Val); 
   Reg32 R10(bus, clk, reset, Rin_Select[10], R10Val); 
   Reg32 R11(bus, clk, reset, Rin_Select[11], R11Val); 
   Reg32 R12(bus, clk, reset, Rin_Select[12], R12Val); 
   Reg32 R13(bus, clk, reset, Rin_Select[13], R13Val); 
   Reg32 R14(bus, clk, reset, Rin_Select[14], R14Val); 
   Reg32 R15(bus, clk, reset, Rin_Select[15], R15Val); 	
	
	RAM ram(Mdatain, clk, read, write,MDRval ,MAR_D); 
	
	SelectEncode SelectAndEncodeoutput (Rin_Select, Rout_Select, C_sign_extended,IRval,Rin, Rout, BAout,GRA, GRB, GRC);
   
	encoder_32_to_5 BusMux_encoder(.SelectOut(Select_D), .R0out(Rout_Select[0]), .R1out(Rout_Select[1]), .R2out(Rout_Select[2]), .R3out(Rout_Select[3]), .R4out(Rout_Select[4]),.R5out(Rout_Select[5]),
	.R6out(Rout_Select[6]), .R7out(Rout_Select[7]), .R8out(Rout_Select[8]), .R9out(Rout_Select[9]), .R10out(Rout_Select[10]), .R11out(Rout_Select[11]), .R12out(Rout_Select[12]), .R13out(Rout_Select[13]), .R14out(Rout_Select[14]), .R15out(Rout_Select[15]),
   	.HIout(HIout), .LOout(LOout),.Zhighout(Zhighout),.Zlowout(Zlowout),.PCout(PCout), .MDRout(MDRout), .In_Portout(InPortout),.Cout(Cout));

	Mux_32_to_1 Bus_Mux(bus,R0Val,R1Val,R2Val,R3Val,
	R4Val,R5Val,R6Val,R7Val,R8Val,R9Val,R10Val,
	R11Val,R12Val,R13Val,R14Val,R15Val,HIval,LOval,ZVal2,
	ZVal1,PCVal,MDRval,InPort_D,C_sign_extended,Select_D);
	
	alu Alu(ALUVal_D1,ALUVal_D2,YVal,bus,control,IncPc,clk);
	
	CONFF controlLogic(bus,IRval,CONin,Branch); 

endmodule 
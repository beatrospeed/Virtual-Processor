

module dataPath(
	input PCout,Zlowout, MDRout, MARin,Zin,
	PCin,MDRin, read, write,IRin,Yin,IncPc,clk,
	input [1:0] mdr_read,
	input [3:0] control,
	input HIout, LOout,InPortout, OutPortout,Cout, Zhighout, 
	HIin, LOin, Zhighin, Zlowin, InPortin, Cin, reset,
	input BAout,OutPortin,Rin,Rout,GRA, GRB, GRC,
	input [31:0] Immediate,
	//demonstration ports
	output wire [31:0] R0Val,R1Val,R2Val,R3Val,R4Val,R5Val,R6Val,
	R7Val,R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,
	R15Val,IRval,bus,MDRval,mux_data_out,YVal,R0TempOut,
	C_sign_extended,InPort_D, OutPort_D, PCVal,CVal,Mdatain,
	output wire [63:0] ZVal,ALUVal_D, 
	output wire [15:0] Rin_Select, Rout_Select,
	output wire [31:0] MAR_D
	
);
	
	wire [31:0]HIval, LOval;
	wire [4:0] Select_D; 	
	wire [31:0] temp; 
	assign temp [0] = ~BAout; 
	assign temp [1] = ~BAout; 
	assign temp [2] = ~BAout; 
	assign temp [3] = ~BAout; 
	assign temp [4] = ~BAout; 
	assign temp [5] = ~BAout; 
	assign temp [6] = ~BAout; 
	assign temp [7] = ~BAout; 
	assign temp [8] = ~BAout; 
	assign temp [9] = ~BAout; 
	assign temp [10] = ~BAout; 
	assign temp [11] = ~BAout; 
	assign temp [12] = ~BAout; 
	assign temp [13] = ~BAout; 
	assign temp [14] = ~BAout; 
	assign temp [15] = ~BAout; 
	assign temp [16] = ~BAout; 
	assign temp [17] = ~BAout; 
	assign temp [18] = ~BAout; 
	assign temp [19] = ~BAout; 
	assign temp [20] = ~BAout; 
	assign temp [21] = ~BAout; 
	assign temp [22] = ~BAout; 
	assign temp [23] = ~BAout; 
	assign temp [24] = ~BAout; 
	assign temp [25] = ~BAout; 
	assign temp [26] = ~BAout; 
	assign temp [27] = ~BAout; 
	assign temp [28] = ~BAout; 
	assign temp [29] = ~BAout; 
	assign temp [30] = ~BAout; 
	assign temp [31] = ~BAout; 

   Reg32 HI(bus, clk, reset, HIin, HIval); 
   Reg32 LO(bus, clk, reset, LOin, LOval);
   Reg32 Y(bus, clk, reset, Yin, YVal);
   Reg64 Z(ALUVal_D, clk, reset, Zin, ZVal);
   Reg32 C(C_sign_extended,clk,reset,Cin,CVal);
	MD_Mux md_mux(mux_data_out, bus, Mdatain, Immediate,32'b0, mdr_read);
	Reg32  mdrReg(mux_data_out,clk,reset,MDRin, MDRval);
   Reg32 InPort(32'b0, clk, reset, InPortin, InPort_D);
   Reg32 Outport(bus,clk,reset,OutPortin, OutPort_D);
   Reg32 IR(bus, clk, reset, IRin, IRval);
   Reg32 PC(bus, clk, reset, PCin, PCVal);
   Reg32 MAR(bus, clk, reset, MARin, MAR_D);
   Reg32 R0(bus, clk, reset, Rin_Select[0], R0TempOut); 
	assign R0Val = R0TempOut & temp; 
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
	R11Val,R12Val,R13Val,R14Val,R15Val,HIval,LOval,ZVal[63:32],
	ZVal[31:0],PCVal,MDRval,InPort_D,CVal,Select_D);
	
	alu Alu(ALUVal_D,YVal,bus,control,IncPc,clk);

endmodule 
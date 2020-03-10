module Mux_32_to_1(output reg [31:0] BusMuxOut,input [31:0] R0in,input [31:0] R1in,input[31:0] R2in,input [31:0] R3in,input [31:0] R4in
,input [31:0] R5in,input [31:0] R6in,input [31:0] R7in,input [31:0] R8in,input [31:0] R9in,input [31:0] R10in,input [31:0] R11in,input [31:0] R12in,input [31:0] R13in,input [31:0] R14in,input [31:0] R15in,
input [31:0] HIoutin,input [31:0] LOoutin,input [31:0] Zhighoutin,input [31:0] Zlowoutin,input [31:0] PCoutin,input [31:0] MDRoutin,input [31:0] In_Portoutin,input [31:0] Coutin,
input [4:0] Selectin);

always@(*)
	case(Selectin)
	0: BusMuxOut = R0in;
	1: BusMuxOut = R1in;
	2: BusMuxOut = R2in;
	3: BusMuxOut = R3in;
	4: BusMuxOut = R4in;
	5: BusMuxOut = R5in;
	6: BusMuxOut = R6in;
	7: BusMuxOut = R7in;
	8: BusMuxOut = R8in;
	9: BusMuxOut = R9in;
	10: BusMuxOut = R10in;
	11: BusMuxOut = R11in;
	12: BusMuxOut = R12in;
	13: BusMuxOut = R13in;
	14: BusMuxOut = R14in;
	15: BusMuxOut = R15in;
	16: BusMuxOut =HIoutin;
	17: BusMuxOut =LOoutin;
	18: BusMuxOut =Zhighoutin;
	19: BusMuxOut =Zlowoutin;
	20: BusMuxOut =PCoutin;
	21: BusMuxOut =MDRoutin;
	22: BusMuxOut =In_Portoutin;
	23: BusMuxOut =Coutin;
	endcase
endmodule
	
	



module Mux_32_to_1(output reg [31:0] BusMuxOut,input [31:0] R0in,input [31:0] R1in,input[31:0] R2in,input [31:0] R3in,input [31:0] R4in
,input [31:0] R5in,input [31:0] R6in,input [31:0] R7in,input [31:0] R8in,input [31:0] R9in,input [31:0] R10in,input [31:0] R11in,input [31:0] R12in,input [31:0] R13in,input [31:0] R14in,input [31:0] R15in,
input [31:0] HIoutin,input [31:0] LOoutin,input [31:0] Zhighoutin,input [31:0] Zlowoutin,input [31:0] PCoutin,input [31:0] MDRoutin,input [31:0] In_Portoutin,input [31:0] Coutin,
input [4:0] Selectin);

always@(*)
	begin
	if(Selectin==0) BusMuxOut = R0in;
	else if(Selectin==1) BusMuxOut = R1in;
	else if(Selectin==2) BusMuxOut = R2in;
	else if(Selectin==3) BusMuxOut = R3in;
	else if(Selectin==4) BusMuxOut = R4in;
	else if(Selectin==5) BusMuxOut = R5in;
	else if(Selectin==6) BusMuxOut = R6in;
	else if(Selectin==7) BusMuxOut = R7in;
	else if(Selectin==8) BusMuxOut = R8in;
	else if(Selectin==9) BusMuxOut = R9in;
	else if(Selectin==10) BusMuxOut = R10in;
	else if(Selectin==11) BusMuxOut = R11in;
	else if(Selectin==12) BusMuxOut = R12in;
	else if(Selectin==13) BusMuxOut = R13in;
	else if(Selectin==14) BusMuxOut = R14in;
	else if(Selectin==15) BusMuxOut = R15in;
	else if(Selectin==16) BusMuxOut =HIoutin;
	else if(Selectin==17) BusMuxOut =LOoutin;
	else if(Selectin==18) BusMuxOut =Zhighoutin;
	else if(Selectin==19) BusMuxOut =Zlowoutin;
	else if(Selectin==20) BusMuxOut =PCoutin;
	else if(Selectin==21) BusMuxOut =MDRoutin;
	else if(Selectin==22) BusMuxOut =In_Portoutin;
	else if(Selectin==23) BusMuxOut =Coutin;
	end
endmodule
	
	



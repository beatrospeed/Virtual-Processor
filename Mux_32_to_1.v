module Mux_32_to_1(output reg [31:0] BusMuxOut,input R0in,input R1in,input R2in,input R3in,input R4in
,input R5in,input R6in,input R7in,input R8in,input R9in,input R10in,input R11in,input R12in,input R13in,input R14in,input R15in,
input HIoutin,input LOoutin,input Zhighoutin,input Zlowoutin,input PCoutin,input MDRoutin,input In_Portoutin,input Coutin,
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
	
	



module Mux_32_to_1(output reg [31:0] BusMuxOut,input BusMuxin_R0,input BusMuxin_R1,input BusMuxin_R2,input BusMuxin_R3,input BusMuxin_R4,input BusMuxin_R5,input BusMuxin_R6,input BusMuxin_R7,input BusMuxin_R8,input BusMuxin_R9,input BusMuxin_R10,input BusMuxin_R11,input BusMuxin_R12,input BusMuxin_R13,input BusMuxin_R14,input BusMuxin_R15,input BusMuxin_HIout,input BusMuxin_LOout,input BusMuxin_Zhighout,input BusMuxin_Zlowout,input BusMuxin_PCout,input BusMuxin_MDRout,input BusMuxin_In_Portout,input BusMuxin_Cout,input [4:0] Select);

always@(*)
	begin
	if(Select==0) BusMuxOut = BusMuxin_R0;
	else if(Select==1) BusMuxOut = BusMuxin_R1;
	else if(Select==2) BusMuxOut = BusMuxin_R2;
	else if(Select==3) BusMuxOut = BusMuxin_R3;
	else if(Select==4) BusMuxOut = BusMuxin_R4;
	else if(Select==5) BusMuxOut = BusMuxin_R5;
	else if(Select==6) BusMuxOut = BusMuxin_R6;
	else if(Select==7) BusMuxOut = BusMuxin_R7;
	else if(Select==8) BusMuxOut = BusMuxin_R8;
	else if(Select==9) BusMuxOut = BusMuxin_R9;
	else if(Select==10) BusMuxOut = BusMuxin_R10;
	else if(Select==11) BusMuxOut = BusMuxin_R11;
	else if(Select==12) BusMuxOut = BusMuxin_R12;
	else if(Select==13) BusMuxOut = BusMuxin_R13;
	else if(Select==14) BusMuxOut = BusMuxin_R14;
	else if(Select==15) BusMuxOut = BusMuxin_R15;
	else if(Select==16) BusMuxOut =BusMuxin_HIout;
	else if(Select==17) BusMuxOut =BusMuxin_LOout;
	else if(Select==18) BusMuxOut =BusMuxin_Zhighout;
	else if(Select==19) BusMuxOut =BusMuxin_Zlowout;
	else if(Select==20) BusMuxOut =BusMuxin_PCout;
	else if(Select==21) BusMuxOut =BusMuxin_MDRout;
	else if(Select==22) BusMuxOut =BusMuxin_In_Portout;
	else if(Select==23) BusMuxOut =BusMuxin_Cout;
	end
endmodule
	
	



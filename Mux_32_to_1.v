module Mux_32_to_1(output reg [31:0] BusMuxOut,input [4:0] Select ,input BusMuxin_R0,input BusMuxin_R1,input BusMuxin_R2,input BusMuxin_R3,input BusMuxin_R4,input BusMuxin_R5,input BusMuxin_R6,input BusMuxin_R7,input BusMuxin_R8,input BusMuxin_R9,input BusMuxin_R10,input BusMuxin_R11,input BusMuxin_R12,input BusMuxin_R13,input BusMuxin_R14,input BusMuxin_R15,input BusMuxin_HIout,input BusMuxin_LOout,input BusMuxin_Zhighout,input BusMuxin_Zlowout,input BusMuxin_PCout,input BusMuxin_MDRout,input BusMuxin_In_Portout,input BusMuxin_Cout,input BusMuxin_in24,input BusMuxin_in25,input BusMuxin_in26,input BusMuxin_in27,input BusMuxin_in28,input BusMuxin_in29,input BusMuxin_in30,input BusMuxin_in31);

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
	else if(Select==24) BusMuxOut =BusMuxin_in24;
	else if(Select==25) BusMuxOut =BusMuxin_in25;
	else if(Select==26) BusMuxOut =BusMuxin_in26;
	else if(Select==27) BusMuxOut =BusMuxin_in27;
	else if(Select==28) BusMuxOut =BusMuxin_in28;
	else if(Select==29) BusMuxOut =BusMuxin_in29;
	else if(Select==30) BusMuxOut =BusMuxin_in30;
	else if(Select==31) BusMuxOut =BusMuxin_in31;
	end
endmodule
	
	



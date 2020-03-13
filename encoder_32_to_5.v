module encoder_32_to_5(output reg [4:0] SelectOut, input R0out,input R1out,input R2out,input R3out,input R4out,input R5out,input R6out,input R7out,input R8out,input R9out,input R10out,input R11out,input R12out,input R13out,input R14out,input R15out,input HIout,input LOout,input Zhighout,input Zlowout,input PCout,input MDRout,input In_Portout,input Cout, input MARout);

always@(*)
	begin 
	if(R0out) SelectOut =0;
	else if(R1out) SelectOut =1;
	else if(R2out) SelectOut =2;
	else if(R3out) SelectOut =3;
	else if(R4out) SelectOut =4;
	else if(R5out) SelectOut =5;
	else if(R6out) SelectOut =6;
	else if(R7out) SelectOut =7;
	else if(R8out) SelectOut =8;
	else if(R9out) SelectOut =9;
	else if(R10out) SelectOut =10;
	else if(R11out) SelectOut =11;
	else if(R12out) SelectOut =12;
	else if(R13out) SelectOut =13;
	else if(R14out) SelectOut =14;
	else if(R15out) SelectOut =15;
	else if(HIout) SelectOut =16;
	else if(LOout) SelectOut =17;
	else if(Zhighout) SelectOut =18;
	else if(Zlowout) SelectOut =19;
	else if(PCout) SelectOut =20;
	else if(MDRout) SelectOut =21;
	else if(In_Portout) SelectOut =22;
	else if(Cout) SelectOut =23;
	
	end
endmodule


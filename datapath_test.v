`timescale 1ns/10ps module 
datapath_test;     
         
reg PCout, Zlowout, MDRout, R2out, R4out;     
reg MARin, Zin, PCin, MDRin, IRin, Yin,GRA,GRB,GRC;        
reg IncPC, Read; 
reg R5in, R2in, R4in;     
reg Clock;   
reg [3:0] control;
reg [31:0] Mdatain;


reg R0out, R1out, R3out, R5out, R6out, R7out, R8out, R9out,
	R10out, R11out, R12out, R13out, R14out, R15out,HIout, LOout,
	InPortout, OutPortout,Cout, Zhighout,
	R0in, R1in, R3in, R6in, R7in, R8in,
	R9in, R10in, R11in, R12in, R13in, R14in, R15in, HIin, LOin,
	Zhighin, Zlowin, InPortin, Cin, reset; 

wire [31:0] R0Val,R1Val,R2Val,R3Val,R4Val,R5Val,bus,MDRval,mux_data_out,YVal,IRval;
wire [63:0] ZVal,ALUVal_D,BAout,OutPortin;
wire [31:0] R6Val,R7Val,R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,R15Val;

parameter  Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, 
Reg_load2a = 4'b0011,Reg_load2b = 4'b0100, Reg_load3a = 4'b0101,
 Reg_load3b = 4'b0110, T0 = 4'b0111, T1 = 4'b1000, T2 = 4'b1001,
 T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100;     
 reg  [3:0] Present_state = Default; 
 
dataPath DUT(PCout, Zlowout, MDRout, MARin, Zin, PCin, MDRin, IRin, Yin, IncPC, Read, Clock, control, Mdatain
	,HIout, LOout,
	InPortout, OutPortout,Cout, Zhighout, HIin, LOin,
	Zhighin, Zlowin, InPortin, Cin, reset,
	R0Val,R1Val,R2Val,R3Val,R4Val,R5Val,R6Val,R7Val,R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,R15Val,IRval,bus,
	MDRval,mux_data_out,YVal,ZVal,ALUVal_D,BAout,OutPortin,Rin,Rout,GRA, GRB, GRC
);
 

// add test logic here 
initial      
begin        
	Clock = 0;        
	forever #20 Clock = ~ Clock; 
end 
/*
initial
begin
	reset <= 1;
	#5 reset <= 0;
	Mdatain <= 32'b101010;
	#20 Read <= 1;
	#5 MDRin <= 1;
	#5 MDRout <= 1;
	#20 R2in <= 1;
	#35 Read <= 0; 
	#5 MDRin <= 0;
	
end
*/
 
always @(posedge Clock) // finite state machine;
 begin  
 case (Present_state)   
 Default  : Present_state = Reg_load1a; 
 Reg_load1a : Present_state = Reg_load1b; 
 Reg_load1b : Present_state = Reg_load2a; 
 Reg_load2a : Present_state = Reg_load2b; 
 Reg_load2b : Present_state = Reg_load3a; 
 Reg_load3a : Present_state = Reg_load3b;  
 Reg_load3b : Present_state = T0;  
 T0  : Present_state = T1;  
 T1  : Present_state = T2;  
 T2  : Present_state = T3;  
 T3  : Present_state = T4;  
 T4  : Present_state = T5;           
	endcase    
 end                                                            
always @(Present_state) // do the required job in each stat

begin
 case (Present_state) // assert the required signals in each clock cycle
Default: begin
PCout <= 0; Zlowout <= 0; MDRout <= 0; // initialize the signals
 R2out <= 0; R4out <= 0; MARin <= 0; Zin <= 0;
 PCin <=0; MDRin <= 0; IRin <= 0; Yin <= 0;
 IncPC <= 0; Read <= 0;   control <= 0;
 R5in <= 0; R2in <= 0; R4in <= 0; Mdatain <= 32'b0;
end
Reg_load1a: begin
Mdatain <= 32'b101;
Read = 0; MDRin = 0; // the first zero is there for completeness
#10 Read <= 1; MDRin <= 1;
#25 Read <= 0; MDRin <= 0;
end
 Reg_load1b: begin
 #10 MDRout <= 1; R2in <= 1;//55
 #25 MDRout <= 0; R2in <= 0; // initialize R2 with the value $22

end
Reg_load2a: begin
Mdatain <= 32'b101;
#40 Read <= 1; MDRin <= 1;
//#15 Read <= 0; MDRin <= 0;
end
 Reg_load2b: begin
 #10 MDRout <= 1; R4in <= 1;//105
 #15 MDRout <= 0; R4in <= 0; // initialize R4 with the value $24
 #15 Read <= 0; MDRin <= 0;
end
Reg_load3a: begin
Mdatain <= 32'b0010;
#10 Read <= 1; MDRin <= 1;
//#15 Read <= 0; MDRin <= 0;
end
 Reg_load3b: begin
 #10 MDRout <= 1; R5in <= 1; //155
 #15 MDRout <= 0; R5in <= 0; // initialize R5 with the value $26
 #15 Read <= 0; MDRin <= 0;
end



T0: begin // see if you need to de-assert these signals
PCout <= 1; IncPC <= 1; Zin <= 1;
end
T1: begin
PCout <= 0; IncPC <= 0;
Zlowout <= 1; Read <= 1; MDRin <= 1;
Mdatain <= 32'b0010; // opcode for “and R5, R2, R4”
end
T2: begin
MDRout <= 1; IRin <= 1;
end

T3: begin
R2out <= 1; Yin <= 1;
#10 R2out <= 0; Yin <= 0;
end
T4: begin
R4out <= 1; control <=0; Zin <= 1;

end
T5: begin
R4out<=0;
Zlowout <= 1; R5in <= 9;
#10 Zlowout <= 0; R5in <= 0;

	end
   endcase
  end 
endmodule

module datapath_ldi2_tb();


	parameter Default = 5'd0, PC_load1a = 5'd1, PC_load1b = 5'd2,
	L_T0 = 5'd3, L_T1 = 5'd4, L_T2 = 5'd5, L_T3 = 5'd6, L_T4 = 5'd7, 
	L_T5 = 5'd8, L_T6 = 5'd9, PC_load1c = 5'd10, PC_load1d = 5'd11,
	T0 = 5'd12, T1 = 5'd13, T2 = 5'd14, T3 = 5'd15, T4 = 5'd16, T5 = 5'd17, T6 = 5'd18;
	
	
   reg PCout,Zlowout, MDRout, MARin,Zin,PCin,MDRin, read, write,IRin,Yin,IncPc,clk;
	reg [1:0] mdr_read;
	reg [3:0] control;
	reg HIout, LOout,InPortout, OutPortout,Cout, Zhighout, 
	HIin, LOin, Zhighin, Zlowin, InPortin, Cin, reset,
   BAout,OutPortin,Rin,Rout,GRA, GRB, GRC;
	reg [31:0] Immediate;
	
	
	//demonstration ports
	wire [31:0] R0Val,R1Val,R2Val,R3Val,R4Val,R5Val,R6Val,
	R7Val,R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,
	R15Val,IRval,bus,MDRval,mux_data_out,YVal,R0TempOut,
	C_sign_extended,InPort_D, OutPort_D, PCVal,mdatain;
	wire [31:0]  ZVal1,ZVal2,ALUVal_D1,ALUVal_D2;
	wire [15:0] Rin_Select, Rout_Select; 
	wire [31:0] MAR_D;
	dataPath dp(PCout,Zlowout, MDRout, MARin,Zin,PCin,MDRin, read, write,
	IRin,Yin,IncPc,clk,mdr_read, control,HIout, LOout,InPortout, OutPortout,
	Cout, Zhighout,HIin, LOin, Zhighin, Zlowin, InPortin,reset,
   BAout,OutPortin,Rin,Rout,GRA, GRB, GRC,Immediate,R0Val,R1Val,R2Val,R3Val,
	R4Val,R5Val,R6Val,R7Val,R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,
	R15Val,IRval,bus,MDRval,mux_data_out,YVal,R0TempOut,
	C_sign_extended,InPort_D, OutPort_D, PCVal,mdatain,
	ZVal1,ZVal2,ALUVal_D1,ALUVal_D2,Rin_Select, Rout_Select, MAR_D);
	 
	 
	 
	 
	reg [4:0] Present_state = Default;

	 
	initial
		begin
			clk = 0;
			forever #10 clk = ~clk;
		end
	
	always @(negedge clk) // finite state machine; if clock rising-edge
		begin
			case (Present_state)
			Default : Present_state <= PC_load1a;
				PC_load1a : Present_state <= PC_load1b;
				PC_load1b : Present_state <= L_T0;
				
				L_T0 : Present_state <= L_T1;
				L_T1 : Present_state <= L_T2;
				L_T2 : Present_state <= L_T3;
				L_T3 : Present_state <= L_T4;
				L_T4 : Present_state <= L_T5;
				L_T5 : Present_state <= L_T6;
				L_T6 : Present_state <= PC_load1c;
				
				PC_load1c : Present_state <= PC_load1d;
				PC_load1d : Present_state <= T0;
				
				
				T0 : Present_state <= T1;
				T1 : Present_state <= T2;
				T2 : Present_state <= T3;
				T3 : Present_state <= T4;
				T4 : Present_state <= T5;
				T5 : Present_state <= T6;


			endcase
	 end 
	 
	 
	 always @(Present_state) // do the required job in each state
	begin
		//ldi r0, 35(r1), first 7 instructions are used to perform a ldi r1, 5
		case (Present_state) // assert the required signals in each clock cycle
			Default: begin
				PCout <= 0; Zlowout <= 0; MARin <= 0; Zlowin <= 0; IRin <= 0;
				MDRout <= 0; MDRin <= 0; mdr_read <= 2'b00; PCin <= 0; IncPc <= 0; 
				Yin <= 0; control <= 4'b0;
				end
			PC_load1a: begin //0
				Immediate <= 32'd1;
				mdr_read <= 2'b10; MDRin <= 1;
				end
			PC_load1b: begin //20
				MDRin <= 0;
				MDRout <= 1; PCin <=1;
			end
			L_T0: begin
				read <= 0; write <= 0;
				PCout <= 1; MARin <= 1; IncPc <= 1; Zlowin <= 1;
			end
			L_T1: begin
				PCout <= 0; IncPc <= 0;
				Zlowout <= 1; PCin <= 1;
				read <= 1; write <= 0;
				mdr_read <= 2'b01; MDRin <= 1;
			end
			L_T2: begin
				read <= 0; MDRin <= 0;
				Zlowout <= 0; PCin <= 0; //reset
				IRin <= 1; MDRout <= 1;   
			end
			L_T3: begin
				IRin <= 0; MDRout <= 0;
				GRB <= 1; GRA <= 0; GRC <= 0; BAout <= 1; Yin <= 1;
			end
			L_T4: begin
				MDRout <= 0; MDRin <= 0; IRin <= 0;
				GRB <= 0; BAout <= 0; Yin <= 0;
				Cout <= 1; control <= 4'd2; Zlowin <= 1;
			end
			L_T5: begin
				Cout <= 0; Zlowin <= 0;
				Zlowout <= 1;
			end
			L_T6: begin
				Zlowout <= 0;
				GRA <= 1; Rin <=1;
			end
			PC_load1c: begin //0
				GRA <= 0; Rin <=0;
				Immediate <= 32'd2;
				mdr_read <= 2'b10; MDRin <= 1;
				end
			PC_load1d: begin //20
				MDRin <= 0;
				MDRout <= 1; PCin <=1;
			end
			T0: begin
				read <= 0; write <= 0;
				PCout <= 1; MARin <= 1; IncPc <= 1; Zlowin <= 1;
			end
			T1: begin
				PCout <= 0; IncPc <= 0;
				Zlowout <= 1; PCin <= 1;
				read <= 1; write <= 0;
				mdr_read <= 2'b01; MDRin <= 1;
			end
			T2: begin
				read <= 0; MDRin <= 0;
				Zlowout <= 0; PCin <= 0; //reset
				IRin <= 1; MDRout <= 1;   
			end
			T3: begin
				IRin <= 0; MDRout <= 0;
				GRB <= 1; GRA <= 0; GRC <= 0; BAout <= 1; Yin <= 1;
			end
			T4: begin
				GRB <= 0; BAout <= 0; Yin <= 0;
				 Cout <= 1; control <= 4'd2; Zlowin <= 1;
			end
			
			T5: begin
				Cout <= 0; Zlowin <= 0;
				Zlowout <= 1;
			end
			T6: begin
				Zlowout <= 0;
				GRA <= 1; Rin <=1;
			end
			
			
		endcase
		end
	endmodule
	 

		
	
	 
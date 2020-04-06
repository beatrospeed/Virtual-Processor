module datapath_ALU_tb();

	
	parameter Default = 5'd0, PC_load1a = 5'd1, PC_load1b = 5'd2,
	PT0 = 5'd3, PT1 = 5'd4, PT2 = 5'd5, PT3 = 5'd6, 
	PT4 = 5'd7, PT5 = 5'd8, PT6 = 5'd9, PC_load1c = 5'd10, PC_load1d = 5'd11, 
	T0 = 5'd12, T1 = 5'd13, T2 = 5'd14, T3 = 5'd15, T4 = 5'd16, T5 = 5'd17, T6 = 5'd18;
	
	reg PCout,Zlowout, MDRout, MARin,Zin,PCin,MDRin, read, write,IRin,Yin,IncPc,clk;
	reg [1:0] mdr_read;
	reg [3:0] control;
	reg HIout, LOout,InPortout, OutPortout,Cout, Zhighout, 
	HIin, LOin, Zhighin, Zlowin, InPortin, Cin, reset,
   BAout,OutPortin,Rin,Rout,GRA, GRB, GRC;
	reg [31:0] Immediate;
	reg [31:0] InportData;
	reg CONin; 
	
	//demonstration ports
	wire [31:0] R0Val,R1Val,R2Val,R3Val,R4Val,R5Val,R6Val,
	R7Val,R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,
	R15Val,IRval,bus,MDRval,mux_data_out,YVal,R0TempOut,
	C_sign_extended,InPort_D, OutPort_D, PCVal,mdatain;
	wire [31:0]  ZVal1,ZVal2,ALUVal_D1,ALUVal_D2;
	wire [15:0] Rin_Select, Rout_Select; 
	wire [31:0] MAR_D;
	wire  Branch;
	
dataPath dp(CONin,InportData,PCout,Zlowout, MDRout, MARin,Zin,PCin,MDRin, read, write,
	IRin,Yin,IncPc,clk,mdr_read, control,HIout, LOout,InPortout, OutPortout,
	Cout, Zhighout,HIin, LOin, Zhighin, Zlowin, InPortin,reset,
   BAout,OutPortin,Rin,Rout,GRA, GRB, GRC,Immediate,R0Val,R1Val,R2Val,R3Val,
	R4Val,R5Val,R6Val,R7Val,R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,
	R15Val,IRval,bus,MDRval,mux_data_out,YVal,R0TempOut,
	C_sign_extended,InPort_D, OutPort_D, PCVal,mdatain,
	ZVal1,ZVal2,ALUVal_D1,ALUVal_D2,Rin_Select, Rout_Select, MAR_D, Branch);
	 
	 
	 
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
				PC_load1b : Present_state <= PT0;
				
				PT0 : Present_state <= PT1;
				PT1 : Present_state <= PT2;
				PT2 : Present_state <= PT3;
				PT3 : Present_state <= PT4;
				PT4 : Present_state <= PT5;
				PT5 : Present_state <= PT6;
				PT6 : Present_state <= PC_load1c;
				
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
	 
	 always @(Present_state) 
	begin
		
		case (Present_state) 
		
			Default: begin
				PCout <= 0; Zlowout <= 0; MARin <= 0; Zlowin <= 0; IRin <= 0;
				MDRout <= 0; MDRin <= 0; mdr_read <= 2'b00; PCin <= 0; IncPc <= 0; 
				Yin <= 0; control <= 4'b0;
				end
			
			PC_load1a: begin 
				Immediate <= 32'd6;
				mdr_read <= 2'b10; MDRin <= 1;
				end
			PC_load1b: begin 
				MDRin <= 0;
				MDRout <= 1; PCin <=1;
			end
			
			PT0: begin
				read <= 0; write <= 0;
				PCout <= 1; MARin <= 1; IncPc <= 1; Zlowin <= 1;
			end
			PT1: begin
				PCout <= 0; IncPc <= 0;
				Zlowout <= 1; PCin <= 1;
				read <= 1; write <= 0;
				mdr_read <= 2'b01; MDRin <= 1;
			end
			PT2: begin
				read <= 0; MDRin <= 0;
				Zlowout <= 0; PCin <= 0; 
				IRin <= 1; MDRout <= 1;   
			end
			
			PT3: begin
				IRin <= 0; MDRout <= 0;
				GRB <= 1; GRA <= 0; GRC <= 0; BAout <= 1; Yin <= 1;
			end
			PT4: begin
				GRB <= 0; BAout <= 0; Yin <= 0;
				 Cout <= 1; control <= 4'd2; Zlowin <= 1;
			end
			
			PT5: begin
				Cout <= 0; Zlowin <= 0;
				Zlowout <= 1;
			end
			PT6: begin
				Zlowout <= 0;
				GRA <= 1; Rin <=1;
			end
			
			PC_load1c: begin 
				GRA <= 0; Rin <=0;
				Immediate <= 32'd7;
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
				Zlowout <= 0; PCin <= 0; 
				IRin <= 1; MDRout <= 1;   
			end
			T3: begin
				IRin <= 0; MDRout <= 0;
				GRB <= 1; GRA <= 0; GRC <= 0; Rout <= 1; Yin <= 1;
			end
			T4: begin
				GRB <= 0; Rout <= 0; Yin <= 0;
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

			//add signal = 8, -5 c = 1111111111111111011
			//and control = 1, 26 c = 0000000000000011010
			//or control = 2, 26 c = 0000000000000011010
		endcase
		end
	endmodule
	 

		
	
module datapathJAL_tb();
	parameter Default = 5'd0, PC_load1a = 5'd1, PC_load1b = 5'd2, PRET0 = 5'd3, PRET1 = 5'd4, 
	PRET2 = 5'd5, PRET3 = 5'd6, PRET4 = 5'd7, PRET5 = 5'd8, PRET6 = 5'd9, PC_load1c = 5'd10, PC_load1d = 5'd11,
	T0 = 5'd12, T1 = 5'd13, T2 = 5'd14, T3 = 5'd15, T4 = 5'd16; 
	
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
				PC_load1b : Present_state <= PRET0;

				PRET0 : Present_state <= PRET1;
				PRET1 : Present_state <= PRET2;
				PRET2 : Present_state <= PRET3;
				PRET3 : Present_state <= PRET4;
				PRET4 : Present_state <= PRET5;
				PRET5 : Present_state <= PRET6;
				PRET6 : Present_state <= PC_load1c;
				
				PC_load1c : Present_state <= PC_load1d;
				PC_load1d : Present_state <= T0;
				
				T0 : Present_state <= T1;
				T1 : Present_state <= T2;
				T2 : Present_state <= T3;
				T3 : Present_state <= T4;

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
				Immediate <= 32'd11;
				mdr_read <= 2'b10; MDRin <= 1;
				end
			PC_load1b: begin 
				MDRin <= 0;
				MDRout <= 1; PCin <=1;
			end
			PRET0: begin
				read <= 0; write <= 0;
				PCout <= 1; MARin <= 1; IncPc <= 1; Zlowin <= 1;
			end
			PRET1: begin
				PCout <= 0; IncPc <= 0;
				Zlowout <= 1; PCin <= 1;
				read <= 1; write <= 0;
				mdr_read <= 2'b01; MDRin <= 1;
			end
			PRET2: begin
				read <= 0; MDRin <= 0;
				Zlowout <= 0; PCin <= 0; 
				IRin <= 1; MDRout <= 1;   
			end
			PRET3: begin
				IRin <= 0; MDRout <= 0;
				GRB <= 1; GRA <= 0; GRC <= 0; BAout <= 1; Yin <= 1;
			end
			PRET4: begin
				GRB <= 0; BAout <= 0; Yin <= 0;
				Cout <= 1; control <= 4'd2; Zlowin <= 1;
			end
			
			PRET5: begin
				Cout <= 0; Zlowin <= 0;
				Zlowout <= 1;
			end
			PRET6: begin
				Zlowout <= 0;
				GRA <= 1; Rin <=1;
			end
			
			PC_load1c: begin 
				GRA <= 0; Rin <=0;
				Immediate <= 32'd12;
				mdr_read <= 2'b10; MDRin <= 1;
				end
			PC_load1d: begin 
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
				GRB <= 1; PCout <= 1; Rin <= 1;
			end
			
			T4: begin
				GRB <= 0; PCout <= 0; Rin <= 0;
				GRA <= 1; Rout <= 1; PCin <= 1;
			end
			
			
		endcase
		end
	endmodule
	 

		
	
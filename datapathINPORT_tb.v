module datapathINPORT_tb();
	parameter Default = 5'd0, IN_load = 5'd1, PC_load1a = 5'd2, PC_load1b = 5'd3,
	T0 = 5'd4, T1 = 5'd5, T2 = 5'd6, T3 = 5'd7;
	
	reg PCout,Zlowout, MDRout, MARin,Zin,PCin,MDRin, read, write,IRin,Yin,IncPc,clk;
	reg [1:0] mdr_read;
	reg [3:0] control;
	reg HIout, LOout,InPortout, OutPortout,Cout, Zhighout, 
	HIin, LOin, Zhighin, Zlowin, InPortin, Cin, reset,
   BAout,OutPortin,Rin,Rout,GRA, GRB, GRC;
	reg [31:0] Immediate;
	reg [31:0] InportData;
	reg CONin; 
	
	
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
	
	always @(negedge clk)
		begin
			case (Present_state)
				Default : Present_state <= IN_load;
				IN_load : Present_state <= PC_load1a;
				
				PC_load1a : Present_state <= PC_load1b;
				PC_load1b : Present_state <= T0;

				T0 : Present_state <= T1;
				T1 : Present_state <= T2;
				T2 : Present_state <= T3;

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
			IN_load: begin 
				InPortin <= 1; 
				InportData <= 32'd16;
				end
			PC_load1a: begin 
				InPortin <= 0;
				Immediate <= 32'd15;
				mdr_read <= 2'b10;
				MDRin <= 1;
				end
			PC_load1b: begin 
				MDRin <= 0;
				MDRout <= 1; PCin <=1;
			end
			T0: begin
				read <= 0; write <= 0;
				PCout <= 1; MARin <= 1; 
				IncPc <= 1; Zlowin <= 1;
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
				GRA <= 1; Rin <= 1;
				InPortout <= 1;
			end
			
			
		endcase
		end
	endmodule
	 

		
	
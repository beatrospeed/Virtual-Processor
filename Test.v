module datapath_tb();
	input R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, Yin,
   Zin, HIin, LOin, InPortin, OutPortin, MARin, MDRin, IRin, PCin,
	

	//bus encoder inputs
	output BusMuxin_R0, BusMuxin_R1, BusMuxin_R2,
	 BusMuxin_R3, BusMuxin_R4, BusMuxin_R5,
	 BusMuxin_R6, BusMuxin_R7, BusMuxin_R8,
	 BusMuxin_R9, BusMuxin_R10, BusMuxin_R11,
	 BusMuxin_R12, BusMuxin_R13, BusMuxin_R14,
	 BusMuxin_R15, BusMuxin_HIout, BusMuxin_LOout,
	 BusMuxin_Zhighout, BusMuxin_Zlowout, BusMuxin_PCout,
	 BusMuxin_MDRout, BusMuxin_In_Portout, BusMuxin_Cin,
	 BusMuxin_in24, BusMuxin_in25, BusMuxin_in26,
	 BusMuxin_in27, BusMuxin_in28, BusMuxin_in29,
	 BusMuxin_in30, BusMuxin_in31, Y_in, Z_in, 

	 output [31:0] R0Val,R1Val,R2Val,R3Val,R4Val,R5Val,R6Val,R7Val,R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,R15Val,

	 input load, //load enable for mdr
	 input clk,
	 input reset, 
	 input [31:0] Mdata_in, 
	 input [3:0] control, 
	 input ADD, SUB, MUL, DIV, SHR, SHL, ROR, ROL, AND, OR, NEG, NOT, IncPc,
	 output [31:0] Mdatain,
	 output [63:0] ZVal,
	 output wire [31:0] bus,IRval, MDRval,HIval, LOval
	
	Datapath DUT(
	input R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, Yin,
   Zin, HIin, LOin, InPortin, OutPortin, MARin, MDRin, IRin, PCin,
	

	//bus encoder inputs
	output BusMuxin_R0, BusMuxin_R1, BusMuxin_R2,
	 BusMuxin_R3, BusMuxin_R4, BusMuxin_R5,
	 BusMuxin_R6, BusMuxin_R7, BusMuxin_R8,
	 BusMuxin_R9, BusMuxin_R10, BusMuxin_R11,
	 BusMuxin_R12, BusMuxin_R13, BusMuxin_R14,
	 BusMuxin_R15, BusMuxin_HIout, BusMuxin_LOout,
	 BusMuxin_Zhighout, BusMuxin_Zlowout, BusMuxin_PCout,
	 BusMuxin_MDRout, BusMuxin_In_Portout, BusMuxin_Cin,
	 BusMuxin_in24, BusMuxin_in25, BusMuxin_in26,
	 BusMuxin_in27, BusMuxin_in28, BusMuxin_in29,
	 BusMuxin_in30, BusMuxin_in31, Y_in, Z_in, 

	 output [31:0] R0Val,R1Val,R2Val,R3Val,R4Val,R5Val,R6Val,R7Val,R8Val,R9Val,R10Val,R11Val,R12Val,R13Val,R14Val,R15Val,

	 input load, //load enable for mdr
	 input clk,
	 input reset, 
	 input [31:0] Mdata_in, 
	 input [3:0] control, 
	 input ADD, SUB, MUL, DIV, SHR, SHL, ROR, ROL, AND, OR, NEG, NOT, IncPc,
	 output [31:0] Mdatain,
	 output [63:0] ZVal,
	 output wire [31:0] bus,IRval, MDRval,HIval, LOval
	
	);
	
	
	parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
	Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111,
	T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6 = 4'b1111, PC_load1a = 4'b1101, PC_load1b = 4'b1110;
	
	reg [3:0] Present_state = Default;	


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
			PC_load1b : Present_state <= Reg_load1a;
			Reg_load1a : Present_state <= Reg_load1b;
			Reg_load1b : Present_state <= Reg_load2a;
			Reg_load2a : Present_state <= Reg_load2b;
			Reg_load2b : Present_state <= Reg_load3a;
			Reg_load3a : Present_state <= Reg_load3b;
			Reg_load3b : Present_state <= T0;
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
		case (Present_state) // assert the required signals in each clock cycle
			Default: begin
				BusMuxin_PCout <= 0; BusMuxin_Zlowout <= 0; MARin <= 0; Zin <= 0; IRin <= 0;
				BusMuxin_R2 <= 0; BusMuxin_R4 <= 0; BusMuxin_MDRout <= 0; BusMuxin_MDRout <= 0; MDRin <= 0; 
				R5in <= 0; R2in <= 0; R4in <= 0; PCin <= 0; IncPc <= 0; 
				y_in <= 0; control <= 4'b0; mdr_datain <= 32'h00000000;
				end
			PC_load1a: begin //0
				mdr_datain <= 32'b0;
				mdr_read = 0; BusMuxin_MDRout = 0;
				#5 BusMuxin_MDRout <= 1; mdr_read <= 1;
				#10 mdr_read <= 0; BusMuxin_MDRout <= 0;
				end
			PC_load1b: begin //20
				#5 mdr_out <= 1; PCin <=1;
				#10 mdr_out <= 0; PCin <= 0;
				end
			Reg_load1a: begin //0
				mdr_datain <= 32'd91;
				#5 BusMuxin_MDRout <= 1; mdr_read <= 1;
				#10 mdr_read <= 0; BusMuxin_MDRout <= 0;
				end
			Reg_load1b: begin //20
				#5 mdr_out <= 1; R2in <=1;
				#10 mdr_out <= 0; R2in <= 0;
				end
			Reg_load2a: begin //40
				mdr_datain <= 32'd2;
				#5 BusMuxin_MDRout <= 1; mdr_read <= 1;
				#10 mdr_read <= 0; BusMuxin_MDRout <= 0;
				end
			Reg_load2b: begin //60
				#5 mdr_out <= 1; R4in <=1;
				#10 mdr_out <= 0; R4in <= 0;
				end
			Reg_load3a: begin //80
				mdr_datain <= 32'd91;
				#5 BusMuxin_MDRout <= 1; mdr_read <= 1;
				#10 mdr_read <= 0; BusMuxin_MDRout <= 0;
				end
			Reg_load3b: begin //100
				#5 mdr_out <= 1; R5in <=1;
				#10 mdr_out <= 0; R5in <= 0;
				end
			T0: begin
				pc_out <= 1; mar_in <= 1; IncP <= 1; zlo_in <= 1;
			end
			T1: begin
				pc_out <= 0; IncP <= 0;
				zlo_out <= 1; PCin <= 1;
				mdr_read <= 1; BusMuxin_MDRout <= 1;
				mdr_datain <= 32'h4A920000;
			end
			T2: begin
				zlo_out <= 0; PCin <= 0; //reset
				ir_in <= 1; mdr_out <= 1;   
			end
			T3: begin
			    mdr_out <= 0; ir_in <= 0; //reset
				 BusMuxin_R2 <= 1; y_in <= 1;
			end
			T4: begin
				y_in <= 0; BusMuxin_R2 <= 0; //reset
				BusMuxin_R4 <= 1; zlo_in <= 1; control <= 4'd9; 
			end
			
			T5: begin
				zlo_in <= 0;
				BusMuxin_R4 <= 0; zlo_out <= 1; R5in <= 1;
			end
			T6: begin
				zlo_out <= 0; R5in <= 0;
				end
				
			//and control = 1
			//or control = 2
			//shift left control = 4
			//shift right control = 5
			//rotate right control = 6
			//rotate left control = 7
			//add control = 8
			//sub control = 9
			
		endcase
		end
 
endmodule


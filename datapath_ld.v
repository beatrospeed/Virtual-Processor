`timescale 1ns/10ps

module datapath_tb2();
	reg clk;
	reg reset;
	reg mdr_read;
	reg r0_in, r1_in, r2_in, r3_in, r4_in, r5_in, r6_in, r7_in, r8_in, r9_in, r10_in, r11_in, r12_in, r13_in, r14_in, r15_in,
	mdr_in, hi_in, lo_in, zhigh_in, zlo_in, pc_in, inport_in, c_sign_extended_in, inc_pc, y_in, ir_in, mar_in;
	reg r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, r8_out, r9_out, r10_out, r11_out, r12_out, r13_out, r14_out, r15_out,
	hi_out, lo_out, zhigh_out, zlo_out, pc_out, mdr_out, inport_out, c_sign_extended_out;
	
	wire [31:0] zhigh_d, zlow_d;
	
	parameter Default = 5'b00000, Reg_load1a = 5'b00001, Reg_load1b = 5'b00010, Reg_load2a = 5'b00011,
	Reg_load2b = 5'b00100, Reg_load3a = 5'b00101, Reg_load3b = 5'b00110, T0 = 5'b00111,
	T1 = 5'b01000, T2 = 5'b01001, T3 = 5'b01010, T4 = 5'b01011, T5 = 5'b01100, T6 = 5'b01111, T7 = 5'b10000, 
	PC_load1a = 5'b01101, PC_load1b = 5'b1110;
	
	reg [4:0] Present_state = Default;
	reg [31:0] mdr_datain;
	reg [3:0] control;
	
	wire [4:0] code;
	wire [31:0] r0_q, r1_q, r2_q, r3_q, r4_q, r5_q, r6_q, r7_q, r8_q, r9_q, r10_q, r11_q, r12_q, r13_q, r14_q, r15_q, hi, lo, zhigh, zlo, pc, mdr, in_port, c_sign_extended, y_out, ir_q, mar_q;
	wire [31:0] out;
	

	
	encoder_32_to_5 e(code, clk, r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, r8_out, r9_out, r10_out, r11_out, r12_out, r13_out, r14_out, r15_out,
	hi_out, lo_out, zhigh_out, zlo_out, pc_out, mdr_out, inport_out, c_sign_extended);
	
	Mux_32_to_1 m(out, r0_q, r1_q, r2_q, r3_q, r4_q, r5_q, r6_q, r7_q, r8_q, r9_q, r10_q, r11_q, r12_q, r13_q, r14_q, r15_q, hi, lo, zhigh, zlo, pc, mdr, in_port, c_sign_extended,
	code);
	
	mdr_reg mr(mdr, out, mdr_datain, mdr_read, reset, clk, mdr_in);
	
	Reg32 r0(out, clk, reset, r0_in, r0_q);
	Reg32 r1(out, clk, reset, r1_in, r1_q);
	Reg32 r2(out, clk, reset, r2_in, r2_q);
	Reg32 r3(out, clk, reset, r3_in, r3_q);
	Reg32 r4(out, clk, reset, r4_in, r4_q);
	Reg32 r5(out, clk, reset, r5_in, r5_q);
	Reg32 r6(out, clk, reset, r6_in, r6_q);
	Reg32 r7(out, clk, reset, r7_in, r7_q);
	Reg32 r8(out, clk, reset, r8_in, r8_q);
	Reg32 r9(out, clk, reset, r9_in, r9_q);
	Reg32 r10(out, clk, reset, r10_in, r10_q);
	Reg32 r11(out, clk, reset, r11_in, r11_q);
	Reg32 r12(out, clk, reset, r12_in, r12_q);
	Reg32 r13(out, clk, reset, r13_in, r13_q);
	Reg32 r14(out, clk, reset, r14_in, r14_q);
	Reg32 r15(out, clk, reset, r15_in, r15_q);
	
	Reg32 lor(out, clk, reset, lo_in, lo);
	Reg32 hir(out, clk, reset, hi_in, hi);
	
	Reg32 marr(out, clk, reset, mar_in, mar_q);
	Reg32 irr(out, clk, reset, ir_in, ir_q);
	
	Reg32 y(out, clk, reset, y_in, y_out);
	
	Reg32 zhir(zhigh_d, clk, reset, zhigh_in, zhigh);
	Reg32 zlor(zlow_d, clk, reset, zlo_in, zlo);

	
	Reg32 pcr(out, clk, reset, pc_in, pc);
	

	alu al(zhigh_d, zlow_d, y_out, out, control, inc_pc, clk);


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
			T6 : Present_state <= T7;

		endcase
 end

 
always @(Present_state) // do the required job in each state
	begin
		case (Present_state) // assert the required signals in each clock cycle
			Default: begin
				pc_out <= 0; zlo_out <= 0; mar_in <= 0; zlo_in <= 0; zhigh_in <= 0; zhigh_out <= 0; ir_in <= 0;
				r2_out <= 0; r4_out <= 0; mdr_out <= 0; mdr_in <= 0; mdr_read <= 0; 
				r5_in <= 0; r2_in <= 0; r4_in <= 0; pc_in <= 0; inc_pc <= 0; 
				y_in <= 0; control <= 4'b0; mdr_datain <= 32'h00000000;
				end
			PC_load1a: begin //0
				mdr_datain <= 32'b0;
				mdr_read = 0; mdr_in = 0;
				#5 mdr_in <= 1; mdr_read <= 1;
				#10 mdr_read <= 0; mdr_in <= 0;
				end
			PC_load1b: begin //20
				#5 mdr_out <= 1; pc_in <=1;
				#10 mdr_out <= 0; pc_in <= 0;
				end
			Reg_load1a: begin //0
				mdr_datain <= 32'd54;
				#5 mdr_in <= 1; mdr_read <= 1;
				#10 mdr_read <= 0; mdr_in <= 0;
				end
			Reg_load1b: begin //20
				#5 mdr_out <= 1; r2_in <=1;
				#10 mdr_out <= 0; r2_in <= 0;
				end
			Reg_load2a: begin //40
				mdr_datain <= 32'd91;
				#5 mdr_in <= 1; mdr_read <= 1;
				#10 mdr_read <= 0; mdr_in <= 0;
				end
			Reg_load2b: begin //60
				#5 mdr_out <= 1; r4_in <=1;
				#10 mdr_out <= 0; r4_in <= 0;
				end
			Reg_load3a: begin //80
				mdr_datain <= 32'd91;
				#5 mdr_in <= 1; mdr_read <= 1;
				#10 mdr_read <= 0; mdr_in <= 0;
				end
			Reg_load3b: begin //100
				#5 mdr_out <= 1; r5_in <=1;
				#10 mdr_out <= 0; r5_in <= 0;
				end
			T0: begin
				pc_out <= 1; mar_in <= 1; inc_pc <= 1; zlo_in <= 1;
			end
			T1: begin
				pc_out <= 0; inc_pc <= 0;
				zlo_out <= 1; pc_in <= 1;
				mdr_read <= 1; mdr_in <= 1;
				mdr_datain <= 32'h4A920000;
			end
			T2: begin
				zlo_out <= 0; pc_in <= 0; //reset
				ir_in <= 1; mdr_out <= 1;   
			end
			T3: begin
			    mdr_out <= 0; ir_in <= 0; //reset
				 r2_out <= 1; y_in <= 1;
			end
			T4: begin
				y_in <= 0; r2_out <= 0; //reset
				r4_out <= 1; zlo_in <= 1; zhigh_in <= 1; control <= 4'd1; 
			end
			T5: begin
				r4_out <= 0; zlo_in <= 0; zhigh_in <= 0;
				zlo_out <= 1; lo_in <= 1;
			end
			T6: begin
				zlo_out <= 0; lo_in <= 0;
				zhigh_out <= 1; hi_in <= 1;
				end
			T7: begin
				zhigh_out <= 0; hi_in <= 0;
				end
				
			
			
		endcase
		end
 
endmodule


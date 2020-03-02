`timescale 1ns/10ps

module dataPath(); 

//encoder inputs 	
reg R0out, R1out, R2out, R3out, R4out,
 R5out, R6out, R7out, R8out, R9out,
 R10out, R11out, R12out, R13out, R14out,
 R15out, HIout, LOout, Zhighout, Zlowout,
 PCout, MDRout, In_Portout, Cout, in24,
 in25, in26, in27, in28, in29, in30,
 in31;

reg load; //load enable for mdr

reg clk; 
reg reset; 
reg [31:0] Mdata_in; 
reg [3:0] control; 
 


wire [31:0] zhigh_d, zlow_d; 
//Bus encoder inputs
 reg BusMuxin_R0, BusMuxin_R1, BusMuxin_R2,
 BusMuxin_R3, BusMuxin_R4, BusMuxin_R5,
 BusMuxin_R6, BusMuxin_R7, BusMuxin_R8,
 BusMuxin_R9, BusMuxin_R10, BusMuxin_R11,
 BusMuxin_R12, BusMuxin_R13, BusMuxin_R14,
 BusMuxin_R15, BusMuxin_HIout, BusMuxin_LOout,
 BusMuxin_Zhighout, BusMuxin_Zlowout, BusMuxin_PCout,
 BusMuxin_MDRout, BusMuxin_In_Portout, BusMuxin_Cin,
 BusMuxin_in24, BusMuxin_in25, BusMuxin_in26,
 BusMuxin_in27, BusMuxin_in28, BusMuxin_in29,
 BusMuxin_in30, BusMuxin_in31; 




parameter  Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010,
Reg_load2a = 4'b0011,Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, 
Reg_load3b = 4'b0110, T0 = 4'b0111,T1 = 4'b1000, T2 = 4'b1001,
T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100; 
 
reg  [4:0] Present_state = Default; 



endmodule 
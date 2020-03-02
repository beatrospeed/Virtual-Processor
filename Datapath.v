`timescale 1ns/10ps

module dataPath(); 

//encoder inputs 	
reg R0out,reg R1out,reg R2out,reg R3out,reg R4out,
reg R5out,reg R6out,reg R7out,reg R8out,reg R9out,
reg R10out,reg R11out,reg R12out,reg R13out,reg R14out,
reg R15out,reg HIout,reg LOout,reg Zhighout,reg Zlowout,
reg PCout,reg MDRout,reg In_Portout,reg Cout,reg in24,
reg in25,reg in26,reg in27,reg in28,reg in29,reg in30,
reg in31;

reg load; //load enable for mdr

reg clk; 
reg reset; 
reg [31:0] Mdata_in; 
reg [3:0] control; 

wire 


wire [31:0] zhigh_d, zlow_d; 
//Bus encoder inputs
reg BusMuxin_R0,reg BusMuxin_R1,reg BusMuxin_R2,
reg BusMuxin_R3,reg BusMuxin_R4,reg BusMuxin_R5,
reg BusMuxin_R6,reg BusMuxin_R7,reg BusMuxin_R8,
reg BusMuxin_R9,reg BusMuxin_R10,reg BusMuxin_R11,
reg BusMuxin_R12,reg BusMuxin_R13,reg BusMuxin_R14,
reg BusMuxin_R15,reg BusMuxin_HIout,reg BusMuxin_LOout,
reg BusMuxin_Zhighout,reg BusMuxin_Zlowout,reg BusMuxin_PCout,
reg BusMuxin_MDRout,reg BusMuxin_In_Portout,reg BusMuxin_Cin,
reg BusMuxin_in24,reg BusMuxin_in25,reg BusMuxin_in26,
reg BusMuxin_in27,reg BusMuxin_in28,reg BusMuxin_in29,
reg BusMuxin_in30,reg BusMuxin_in31; 




parameter  Default = 4’b0000, Reg_load1a = 4’b0001, Reg_load1b = 4’b0010,
Reg_load2a = 4’b0011,Reg_load2b = 4’b0100, Reg_load3a = 4’b0101, 
Reg_load3b = 4’b0110, T0 = 4’b0111,T1 = 4’b1000, T2 = 4’b1001,
T3 = 4’b1010, T4 = 4’b1011, T5 = 4’b1100; 
 
reg  [4:0] Present_state = Default; 



 
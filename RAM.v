

module RAM(
output reg [31:0] RAMout/* to MDR MDataIN*/,
input clock, 
input read,
input write,
input [31:0] data/*FROm MDR AKA Q*/,
input [31:0] Address/*From MAR*/);

reg [31:0] mem_array [511:0]; 
initial begin 
   //load immediate 1 instruction
	mem_array[0] = 32'b00000000100000000000000010000101; //ldi r1, $85
	
	//load immediate 2 instruction
	mem_array[1] = 32'b00000000100000000000000000000101; //ldi r1, 5
	mem_array[2] = 32'b00000000000010000000000000110101; //ldi r0, r1($35)
	
	//load 1 instruction
	mem_array[3] = 32'b00000000100000000000000010000101; //ld r1, $85
	mem_array[133] = 32'd16;
	
	//load 2 instruction
	mem_array[4] = 32'b00000000100000000000000001010101; //ldi r1, 85
	mem_array[5] = 32'b00000000000010000000000000110101; //ld r0, $35(r1)
	mem_array[138] = 32'd12;
	
	//store 1 instruction where r1 = 85 and stores r1 at address 90
	mem_array[18] = 32'b00000000100000000000000001010101;
	mem_array[19] = 32'b00000000100000000000000010010000; 
	mem_array[20] = 32'b00000000000000000000000010010000;
	
	//store 2 instruction where r1 = 85 and stores r1 at address 85 + 90 = 175
	mem_array[21] = 32'b00000000100000000000000001010101;
	mem_array[22] = 32'b00000000100010000000000010010000; 
	mem_array[23] = 32'b00000000000000000000000011100101;
	
	//alu instruction
	mem_array[6] = 32'b00000000100000000000000001010101; //ldi r1, 85
	//mem_array[7] = 32'b00000001000011111111111111111011; 	//FOR ADD
	mem_array[7] = 32'b00000001000010000000000000100110; //FOR OR, AND
	
	//branch instruction
	//For checking brzr
	//mem_array[8] = 32'b00000001000000000000000000000000; //takes branch
	mem_array[8] = 32'b00000001000000000000000000000001; //does not take branch
	mem_array[9] = 32'b00000001000000000000000000100011;
				
	//For checking brnz
	//mem_array[8] = 32'b00000001000000000000000000000001; //takes branch
	//mem_array[8] = 32'b00000001000000000000000000000000; //does not take branch
	//mem_array[9] = 32'b00000001000010000000000000100011;
				
	//For checking brpl
	//mem_array[8] = 32'b00000001000000000000000000000001; //takes branch
	//mem_array[8] = 32'b00000001000001000000000000000000; //does not take branch
	//mem_array[9] = 32'b00000001000100000000000000100011;
				
	//For checking brmi
	//mem_array[8] = 32'b00000001000001000000000000000000; //takes branch
	//mem_array[8] = 32'b00000001000000000000000000000001; //does not take branch
	//mem_array[9] = 32'b00000001000110000000000000100011;
	
	//jr instruction
	mem_array[10] = 32'b00000000100000000000000000010010;
	
	//jal instruction
	mem_array[11] = 32'b00000000100000000000000000010010;
	mem_array[12] = 32'b00000000111110000000000000000000;
	
	//mfhi instruction
	mem_array[13] = 32'b00000001000000000000000000000000;
	
	//mflo instruction
	mem_array[14] = 32'b00000001000000000000000000000000;

	//in instruction
	mem_array[15] = 32'b00000000100000000000000000000000;
	
	//out instruction
	mem_array[16] = 32'b00000000100000000000000000010010;
	mem_array[17] = 32'b00000000100000000000000000000000;
end 

always@(negedge clock) 
begin
   #5
	if(write == 1)
		mem_array[Address] <= data; 
		
	if(read == 1)
		RAMout <= mem_array[Address];
end
endmodule 
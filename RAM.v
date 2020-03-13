module RAM(
output reg [31:0] RAMout/* to MDR MDataIN*/,
input clock, 
input read,
input write,
input [31:0] data/*FROm MDR AKA Q*/,
input [8:0] Address/*From MAR*/);

reg [31:0] mem_array [0:512]; 

always@(posedge clock) 
begin
	if(write) begin
		mem_array[Address] <= data; 
		end
	else begin 
		RAMout <= mem_array[Address];
		end
	end
endmodule
module MD_Mux (output reg [31:0] Output, input [31:0] A, input [31:0] B, input Select);
	always @(Select, A, B)
	if(Select)
		begin
		Output <= A;
		end
	else
		begin
		Output <= B;
		end
endmodule 	
	
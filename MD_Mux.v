module MD_Mux (output reg Output, input [31:0] A, input [31:0] B, input Select);
	always @(Select, A, B)
	if(Select)
		begin
		assign Output = A;
		end
	else
		begin
		assign Output = B;
		end
endmodule 	
	
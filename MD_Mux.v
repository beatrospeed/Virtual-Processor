module MD_Mux (output reg [31:0] Output, input [31:0] A, input [31:0] B, input Select);
	always@(A,B,Select) begin
	if(Select == 0)
		begin
		Output <= A;
		end
	else
		begin
		Output <= B;
		end
	end
endmodule 
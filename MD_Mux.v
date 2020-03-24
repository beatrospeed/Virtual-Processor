module MD_Mux (output [31:0] Output, input [31:0] A, input [31:0] B, input [31:0] C,input [31:0] D,input[1:0] Select);
assign Output = (Select == 0) ? A :(Select == 1) ? B:(Select == 2) ? C :(Select == 3) ? D : 32'bx;
endmodule 
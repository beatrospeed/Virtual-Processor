module CONFF (
input [31:0] busContents, 
input [1:0]  IR_C2, 
input CONin, 
output reg q

); 

initial begin 
	if (CONin == "1") begin 
		case(IR_C2)
			00: 
			if(busContents == 0)begin 
				q <= 0;
			end
			else begin 
			q <= 1; 
			end 
			01: 
			if(busContents != 0)begin 
				q <= 1;
			end
			else begin 
			q <= 0; 
			end 
			11: 
			if(busContents[31] == 1)begin 
				q <= 1;
			end
			else begin 
			q <= 0; 
			end 
			endcase
	end
	else begin
		q <= 0; 
	end 
	end
endmodule	


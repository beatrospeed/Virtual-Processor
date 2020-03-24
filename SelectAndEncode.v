module SelectEncode (
output reg [15:0] RinOut, RoutOut,
output reg [31:0] c_sign_extended,
input [31:0] IRin, 
input Rin, Rout, BAout,GRA, GRB, GRC
);


reg [3:0] temp; 
	always@(*)
	begin
	
		c_sign_extended = { {14{IRin[18]}}, IRin[17:0]};
	
		
	
		if(GRA == 1)begin 
			temp [3:0] = IRin[26:23];
			end
		else if (GRB == 1)begin
			temp [3:0] = IRin[22:19];
			end
		else if (GRC == 1)begin 
			temp[3:0] = IRin[18:15]; 
		end

			
		
	if (Rin == 1)begin 
		case(temp)
		
			4'b0000 : RinOut <= 16'b0000000000000001; 
			4'b0001 : RinOut <= 16'b0000000000000010;
			4'b0010 : RinOut <= 16'b0000000000000100;
			4'b0011 : RinOut <= 16'b0000000000001000;
			4'b0100 : RinOut <= 16'b0000000000010000;
			4'b0101 : RinOut <= 16'b0000000000100000;
			4'b0110 : RinOut <= 16'b0000000001000000;
			4'b0111 : RinOut <= 16'b0000000010000000;
			4'b1000 : RinOut <= 16'b0000000100000000;
			4'b1001 : RinOut <= 16'b0000001000000000;
			4'b1010 : RinOut <= 16'b0000010000000000;
			4'b1011 : RinOut <= 16'b0000100000000000;
			4'b1100 : RinOut <= 16'b0001000000000000;
			4'b1101 : RinOut <= 16'b0010000000000000;
			4'b1110 : RinOut <= 16'b0100000000000000;
			4'b1111 : RinOut <= 16'b1000000000000000;
		endcase
		end
	else begin 
		RinOut <= 16'b0000000000000000; 
		end
		
	if (BAout == 1)begin 
		if(temp == 4'b0000)begin
			RoutOut = 16'b0000000000000001; 
			end 
	end 
	
	if (Rout == 1)begin 
		case(temp)
			4'b0000 : RoutOut <= 16'b0000000000000001; 
			4'b0001 : RoutOut <= 16'b0000000000000010;
			4'b0010 : RoutOut <= 16'b0000000000000100;
			4'b0011 : RoutOut <= 16'b0000000000001000;
			4'b0100 : RoutOut <= 16'b0000000000010000;
			4'b0101 : RoutOut <= 16'b0000000000100000;
			4'b0110 : RoutOut <= 16'b0000000001000000;
			4'b0111 : RoutOut <= 16'b0000000010000000;
			4'b1000 : RoutOut <= 16'b0000000100000000;
			4'b1001 : RoutOut <= 16'b0000001000000000;
			4'b1010 : RoutOut <= 16'b0000010000000000;
			4'b1011 : RoutOut <= 16'b0000100000000000;
			4'b1100 : RoutOut <= 16'b0001000000000000;
			4'b1101 : RoutOut <= 16'b0010000000000000;
			4'b1110 : RoutOut <= 16'b0100000000000000;
			4'b1111 : RoutOut <= 16'b1000000000000000;
			default :  RoutOut <= 16'b0000000000000000;
		endcase
	end
		else if (BAout == 0)begin 
				RoutOut <= 16'b0000000000000000; 
		end 
		
	end 
endmodule 
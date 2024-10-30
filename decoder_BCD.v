module decoder_BCD (

	input [3:0] A,
	output reg [6:0] S

);

always @(*)
begin
	case(A)
		4'h0: S [6:0] = 7'b0000001;
		4'h1: S [6:0] = 7'b1001111;
		4'h2: S [6:0] = 7'b0010010;
		4'h3: S [6:0] = 7'b0000110;
		4'h4: S [6:0] = 7'b1001100;
		4'h5: S [6:0] = 7'b0100100;
		4'h6: S [6:0] = 7'b0100000;
		4'h7: S [6:0] = 7'b0001111;
		4'h8: S [6:0] = 7'b0000000;
		4'h9: S [6:0] = 7'b0001100;
		default S = 7'b1111111;
	endcase
end

endmodule

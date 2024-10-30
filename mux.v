module mux (

	input [3:0]SE,
	input [3:0] sunits,
	input [3:0] stens,
	input [3:0] munits,
	input [3:0] mtens,
	output reg [3:0] out

);

always @(*)
begin
	if(SE==4'b0000)
		out = sunits;
	else if(SE==4'b0001)
		out = stens;
	else if(SE==4'b0010)
		out = munits;
	else if (SE==4'b0011)
		out = mtens;
	else 
		out=4'b0000;
end

endmodule

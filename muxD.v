module muxD (

	input SE,
	input [15:0] limite,
	input [15:0] num,
	output reg [15:0] out

);

always @(*)
begin
	if(SE)
		out = num;
	else 
		out=limite;
end

endmodule

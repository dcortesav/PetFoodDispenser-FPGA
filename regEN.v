module regEN #(parameter condition = 2'd0) (

	input clk,
	input [1:0] enable,
	input [3:0] number,
	output [3:0] regOut

);

reg [3:0] Q = 0;
wire [3:0] D;

always @(posedge clk)
begin
	if(enable == condition)
		Q <= D;
	else
		Q <= Q;
end

assign D = number;
assign regOut =Q;

endmodule

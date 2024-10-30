module counterNumber (

	input clk,
	input reset,
	input count,
	output [3:0] number

);

reg count_prev, reset_prev = 1;
reg [3:0] Q, counter = 2'b0;
wire [3:0] D;

always @(posedge clk)
begin
	Q <= D;
end

always @(posedge clk)
begin
	if(~reset & reset_prev)
		counter <= 4'b0;
	else if(~count & count_prev)
	begin
		if(counter < 4'd9)
			counter <= counter + 4'd1;
		else
			counter <= 4'b0;
	end
	count_prev <= count;
	reset_prev <= reset;
end

assign D = counter;
assign number = Q;

endmodule

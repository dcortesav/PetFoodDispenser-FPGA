module counterState (

	input clk,
	input count,
	output [1:0] control

);

reg count_prev = 1;
reg [1:0] Q, counter = 2'b0;
wire [1:0] D;

always @(posedge clk)
begin
	Q <= D;
end

always @(posedge clk)
begin
	if(~count & count_prev)
	begin
		if(counter < 2'd2)
			counter <= counter + 2'd1;
		else
			counter <= 2'b0;
	end
	count_prev <= count;
end

assign D = counter;
assign control = Q;

endmodule

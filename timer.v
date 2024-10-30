module timer #(parameter count = 25'd50000000) (

	input clk,
	input enable,
	input reset,
	output tick

);

reg D, Q; //Debo inicializar Q en 0?
reg [25:0] counter = 0;

always @(posedge clk)
begin
	if(reset)
		Q <= 1'b0;
	else
		Q <= D;
end

always @(posedge clk)
begin
	if(enable)
		if (counter < (count - 1))
			counter <= counter + 1;
		else
			counter <= 25'b0;
	else
		counter <= counter;
end

always @(*)
	D = (counter == (count - 1));

assign tick = Q;


endmodule

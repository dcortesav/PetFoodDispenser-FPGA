`timescale 1ns / 1ns

module mooreMachine_tb ();

localparam T = 20;

reg clk, sensor, modo, reset;
reg [15:0] cont;
wire [1:0] outs;

mooreMachine UUT (

	.clk(clk),
	.sensor(sensor),
	.modo(modo),
	.reset(reset),
	.cont(cont),
	.outs(outs)

);

always
begin
	clk = 1'b0;
	#(T/2);
	clk = 1'b1;
	#(T/2);
end

initial
begin
	reset = 1'b1;
	modo = 1'b0;
	cont = 16'b0;
	sensor = 1'b0;
	#(T)
	reset = 1'b0;
	#(T)
	modo = 1'b1;
	#(10*T)
	sensor = 1'b1;
	#(10*T)
	cont = 16'd1;
	#(10*T)
	cont = 16'd0;
	#(20*T)
	$stop;
end

endmodule

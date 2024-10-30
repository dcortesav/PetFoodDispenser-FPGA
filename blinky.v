module blinky(

	input clk,
	output out

);

reg [27:0] counter;

always @(posedge clk)
  counter <= counter + 1'b1;
assign out = (counter < 28'd134217728);

endmodule

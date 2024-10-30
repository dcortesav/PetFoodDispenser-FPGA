`timescale 1ns / 1ns

module Temporizador_tb ();

localparam T = 20;

reg clk, reset, init;
reg [7:0] limite;
wire [15:0] numero;

Temporizador UUT (

	.clk(clk),
	.reset(reset),
	.init(init),
	.limite(limite),
	.numero(numero)

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
	init = 1'b0;
	limite = 8'b01000110;
	#(T)
	reset = 1'b0;
	#(T)
	init = 1'b1;
	#(100*T)
	$stop;
end

endmodule

module Temporizador (

	input clk,
	input reset,
	input init,
	input [7:0]limite,
	output [15:0]numero

);

wire tick, done,done2,done3,ds,um,dm,up;
and(ds, tick, done);
and(um, ds, done2);
and(dm, um, done3);


wire [3:0] number_1, number_2,number_3, number_4;

//temporizador de los contadores
timer #(1) timer (.clk(clk), .reset(reset), .enable(init), .tick(tick));


//contadores
counters #(9) counter_1 (.clk(clk), .reset(reset), .enable(tick), .done(done), .binary_number(number_1));
counters #(5) counter_2 (.clk(clk), .reset(reset), .enable((ds)), .done(done2), .binary_number(number_2));
counter #(9) counter_3 (.clk(clk), .reset(reset), .enable((um)),.inicio(limite[3:0]), .done(done3), .binary_number(number_3));
counter #(9) counter_4 (.clk(clk), .reset(reset), .enable((dm)),.inicio(limite[7:4]), .done(up), .binary_number(number_4));



assign numero[3:0]=number_1;
assign numero[7:4]=number_2;
assign numero[11:8]=number_3;
assign numero[15:12]=number_4;

endmodule

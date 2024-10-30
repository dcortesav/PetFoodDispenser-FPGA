`timescale 1ns / 1ns

module memoria_tb ();

localparam T = 20;

reg clk, btn_state, btn_number;
wire enable;
wire [3:0] unitsR, decadesR;

memoria UUT (

	.clk(clk),
	.btn_state(btn_state),
	.btn_number(btn_number),
	.enable(enable),
	.unitsR(unitsR),
	.decadesR(decadesR)

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
	btn_state = 1'b1;
	btn_number = 1'b1;
	#(T)
	btn_number = 1'b0;
	#(5*T)
	btn_number = 1'b1;
	#(5*T)
	btn_number = 1'b0;
	#(5*T)
	btn_number = 1'b1;
	#(5*T)
	btn_number = 1'b0;
	#(5*T)
	btn_number = 1'b1;
	#(5*T)
	btn_state = 1'b1;
	btn_number = 1'b0;
	#(5*T)
	btn_state = 1'b0;
	btn_number = 1'b1;
	#(5*T)
	btn_number = 1'b0;
	#(5*T)
	btn_number = 1'b1;
	#(5*T)
	btn_number = 1'b0;
	#(5*T)
	btn_number = 1'b1;
	#(5*T)
	btn_number = 1'b0;
	#(5*T)
	btn_number = 1'b1;
	#(5*T)
	btn_number = 1'b0;
	#(5*T)
	btn_state = 1'b1;
	btn_number = 1'b1;
	#(5*T)
	btn_state = 1'b0;
	btn_number = 1'b0;
	#(5*T)
	btn_number = 1'b1;
	#(5*T)
	btn_number = 1'b0;
	#(5*T)
	btn_number = 1'b1;
	#(5*T)
	btn_state = 1'b1;
	btn_number = 1'b0;
	#(5*T)
	btn_number = 1'b1;
	#(5*T)
	btn_number = 1'b0;
	#(5*T)
	btn_number = 1'b1;
	btn_state = 1'b0;
	#(5*T)
	btn_number = 1'b0;
	#(5*T)
	btn_number = 1'b1;
	#(5*T)
	btn_number = 1'b0;
	btn_state = 1'b1;
	#(5*T)
	btn_number = 1'b1;
	btn_state = 1'b0;
	#(5*T)
	btn_number = 1'b0;
	#(5*T)
	btn_number = 1'b1;
	#(5*T)
	btn_number = 1'b0;
	#(5*T)
	btn_number = 1'b1;
	#(5*T)
	btn_number = 1'b0;
	#(T)
	$stop;
end

endmodule

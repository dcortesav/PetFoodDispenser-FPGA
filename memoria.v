module memoria (

	input clk,
	input btn_state,
	input btn_number,
	output enable,
	output [7:0]limite

);

wire [1:0] control;
wire [3:0] number;

counterState counter_st (.clk(clk), .count(btn_state), .control(control));

counterNumber counter_nb (.clk(clk), .reset(btn_state), .count(btn_number), .number(number));

regEN #(2'b0) regUnits (.clk(clk), .enable(control), .number(number), .regOut(limite[3:0]));

regEN #(2'b1) regDecades (.clk(clk), .enable(control), .number(number), .regOut(limite[7:4]));

assign enable = (control == 2'd2);

endmodule

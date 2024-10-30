module mooreMachine (

	input clk,sensor,modo,reset,
	input [15:0]cont,
	output reg[1:0]outs

);

reg [2:0] ps, ns;
localparam [2:0] ZERO = 3'b000, ONE= 3'b001, TWO= 3'b010, THREE=3'B011;

always @(posedge clk)
begin
	if(reset & modo)
		ps <= ZERO;
	else
		ps <= ns;
end

always @(*)
if (modo)
	begin
		case(ps)
			ZERO: 
			begin
				outs=2'b01;
				if(cont==16'b0)
					ns = ONE;
				else
					ns = ZERO;
			end
			ONE:
			begin
				outs=2'b01;
				if(cont==16'b0)
					ns = TWO;
				else
					ns = ONE;
			end
			
			TWO:
			begin
				outs=2'b00;
				if(sensor)
					ns =THREE;
				else
					ns = TWO;
			end
			
			THREE:
			begin
				outs=2'b10;
				if(cont>15'b0)
					ns =ZERO;
				else
					ns = THREE;
			end
			
			default:
			begin
				ns = ZERO;
			end
		endcase
	end 

endmodule

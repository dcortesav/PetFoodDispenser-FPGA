module counters #(parameter max = 9) (

input clk,
input reset,
input enable,
output reg done,
output [3:0] binary_number

);

reg [3:0] D, Q, counter=0;


always @(posedge clk)
begin
	if(reset)
		Q <= 4'b0;
	else
		Q <= D;
end

always @(posedge clk)
begin
	if(reset)
		counter <= 4'b0;
	else 
		begin
			if(enable)
					begin
						if(counter>0)
							counter <= counter - 1;
						else
							counter <= max;
					end
			else
				counter <= counter;
		end 
end

always @(*)
begin
	D = counter;
	done = (counter == 0);
end

assign binary_number = Q;

endmodule

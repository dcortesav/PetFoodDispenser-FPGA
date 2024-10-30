module counter #(parameter max = 4'b1001) (

input clk,
input reset,
input enable,
input [3:0]inicio,
output reg done,
output [3:0] binary_number

);

reg [3:0] D, Q, counter=4'b0;


always @(posedge clk)
begin
	if(reset)
		begin
			Q <= inicio;
		end
	else
		Q <= D;
end

always @(posedge clk)
begin
	if(reset)
		begin
			counter <= 4'b0;
		end
	else 
    begin
			if(counter<=inicio)
				begin
					if(enable)
							begin
								if((inicio-counter)>0)
									counter <= counter + 1;
								else
									counter <=max;
							end
					else
						counter <= counter;
				end 
			else 
				begin
					if(enable)
							begin
								if(counter>0)
									counter <= counter - 1;
							end
					else
						counter <= counter;
				end 
				
    end 
end

always @(*)
begin
	done = (D == 0);
	if (counter<=inicio)
		D = (inicio-counter);
	else
		D=counter;

	
end

assign binary_number = Q;

endmodule

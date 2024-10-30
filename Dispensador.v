module Dispensador(clk,reset,sensor,modo,ti,visual,leds,arduino);

	input clk,reset,sensor;
	input [1:0]ti;
	input modo;
	output[6:0]visual;
	output [12:0]leds;
	output [7:0]arduino;
	
	
	wire [15:0]num,limite,dv;
	wire [7:0]minutos;
	wire [3:0]number_1=dv[3:0],number_2=dv[7:4],number_3=dv[11:8],number_4=dv[15:12],SMux,SDiv;
	wire[1:0]control;
	wire activar,enableT2,tick2,up2;
	reg [3:0]out;
	
	// Memoria
	
		memoria mem (.clk(clk),.btn_state(ti[1]),.btn_number(ti[0]),.enable(activar),.limite(minutos));
		
	assign limite[15:8]=minutos;
	assign limite[7:0]=8'b00000000;
	and(Is,activar,modo);
	and(enable,Is,control[0]);
	or(rs,~reset,control[1],~activar);
	
	// Tiempo
		Temporizador temp(.clk(clk),.reset(rs),.init(enable),.limite(minutos),.numero(num));
		mooreMachine cerebro(.clk(clk),.sensor(~sensor),.modo(activar),.reset(~reset),.cont(num),.outs(control));
		
	// Selector de Dato
	
		muxD muxDato (.SE(activar), .limite(limite), .num(num),.out(dv));
	
	//temporizador del divisor de frecuencia para el display
		timer #(500) timer2 (.clk(clk), .reset(~reset), .enable(enableT2), .tick(tick2));
	//Divisor de frecuencia para señal de entrada al multiplexor y para prender los displays
		counterM #(3) divisorF (.clk(clk), .reset(~reset), .enable((tick2)), .done(up2), .binary_number(SDiv));
	//Multiplexor
		mux mux (.SE(SDiv), .sunits(number_1), .stens(number_2), .munits(number_3), .mtens(number_4), .out(SMux));
	//Decoder 7 segmentos
		decoder_BCD decoder (.A(SMux), .S(visual));

	//El display se prende con 0
	always@(*)
	begin
		if (~reset)
				out=4'b0000;
		else
			begin
				if (SDiv==4'b0000)
				
					out=4'b1110;
					
				else if (SDiv==4'b0001)
				
					out=4'b1101;
					
				else if (SDiv==4'b0010)
				
					out=4'b1011;
					
				else
				
					out=4'b0111;	
			end
	end
	
//Dejamos el enable del timer 2 en alto para que mantenga prendidos los displays siempre
	assign enableT2 = 1'b1;
	assign leds[3:0]=out;
	
	assign leds[4]=~activar;
	assign leds [12:9]=~dv[15:12];
	assign leds [8:5]=~dv[11:8];
	assign arduino= dv[15:8];
	
	

endmodule

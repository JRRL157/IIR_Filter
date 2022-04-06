//Implementação de um Filtro IIR com resposta ao impulso h[n] = sin(w0*n)u(n)

module IIR_Filter3(
	input clk,rst,
	output signed [15:0] y
);	
	
	reg signed [15:0] z1,z2,z3;
	wire signed [15:0] r1,r2,ze,z0;
	
	always @(posedge clk or posedge rst)
	begin
		if(rst == 1)
		begin
			z1 <= 16'd0;
			z2 <= 16'd0;
			z3 <= 16'd32;
		end
		else
		begin
			z2 <= r1;
			z3 <= z2;
		end
	end
		
		
	assign r1 = r2 + z0;
	
	assign z0 = (z1 >>> 8) + (z1 >>> 3);
	
	assign ze = (z2 <<< 1) - (z2 >>> 6);
	
	assign r2 = ze - z3;
	
	assign y = r1;
	
endmodule

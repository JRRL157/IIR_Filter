module IIR_Filter_tb;

reg clk,rst;

IIR_Filter3 filtro(.clk(clk),.rst(rst));

initial
	begin
		clk = 0;
		forever #10 clk = ~clk;
	end
initial
	begin
	
	
	rst = 0;	
	
	#10 rst = 1;	
	#10 rst = 0;
	
	#10 rst = 1;
	
	#10 rst = 0;
	
	
	end
endmodule

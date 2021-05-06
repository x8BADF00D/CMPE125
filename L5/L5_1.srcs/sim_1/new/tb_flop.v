`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2020 05:27:09 PM
// Design Name: 
// Module Name: tb_flop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_flop;
reg [3:0] in_a;
reg [3:0] in_b;
reg clk;
reg rst;
wire [7:0] tb_out;

integer error;
integer i;
integer n;

mult DUT (in_a, in_b, clk, rst, tb_out);

initial begin
	error = 0;

	for (i = 0; i < 16; i = i + 1)
		begin
		for (n = 0; n < 16; n = n + 1)
			begin
				in_a = i;
				in_b = n; #3;
				if(tb_out != in_a * in_b)
					begin
						$display("multiplication error");
						error = error + 1;
					end
			end
		end
	$display("Simulation Finished with %d errors", error);
end
endmodule

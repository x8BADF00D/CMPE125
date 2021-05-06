`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 01:05:45 PM
// Design Name: 
// Module Name: tb_CLA
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


module tb_CLA;
    
reg [3:0] in_a;
reg [3:0] in_b;
reg in_c;
wire [3:0] tb_out;
wire out_c;

integer error;
integer i;
integer j;
integer n;

CLA DUT (in_a, in_b, in_c, tb_out, out_c, x, z);

initial begin
	error = 0;
for (j = 0; j < 2; j = j + 1)
begin
in_c = j;
	for (i = 0; i < 16; i = i + 1)
		begin
		in_a = i;
		for (n = 0; n < 16; n = n + 1)
			begin
                in_b = n; #5;
				if(tb_out != in_a + in_b && tb_out != ((in_a + in_b) - 15) && in_c == 0)
				begin
                   $display("addition error. TbOut: %d, in_a: %d, in_b: %d, in_c: %d", tb_out, in_a, in_b, in_c);
                   error = error + 1;
                end
				if((tb_out - 1) != in_a + in_b && tb_out != ((in_a + in_b) - 15) && in_c == 1)
				begin
                   $display("addition error. TbOut: %d, in_a: %d, in_b: %d, in_c: %d", tb_out, in_a, in_b, in_c);
                   error = error + 1;
                end
				if(in_a + in_b > 15 && out_c != 1)
					begin
						$display("carry out error");
						error = error + 1;
					end
			end
		end
end
	$display("Simulation Finished. Error count: %d", error);
end
endmodule

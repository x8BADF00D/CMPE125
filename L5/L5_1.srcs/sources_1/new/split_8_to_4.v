`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 03:59:52 PM
// Design Name: 
// Module Name: split_8_to_4
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


module split_8_to_4(a, b, a_least, a_most, b_least, b_most);

input [7:0] a;
input [7:0] b;
output reg [3:0] a_least;
output reg [3:0] a_most;
output reg [3:0] b_least;
output reg [3:0] b_most;

integer i;

always @ (*)
begin
	for(i = 0; i < 8; i = i + 1)
	begin
		if(i < 4)
		begin
			a_least[i] = a[i];
			b_least[i] = b[i];
		end
		else
		begin
			a_most[i - 4] = a[i];
			b_most[i - 4] = b[i];
		end
	end
end
endmodule
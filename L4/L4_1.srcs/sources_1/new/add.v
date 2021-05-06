`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2020 10:29:08 PM
// Design Name: 
// Module Name: add
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


module add(a, b, y, c);
input [3:0] a;
input [3:0] b;
output reg [3:0] y;
output reg c;

always @ (*)
begin
    c = 0;
    y = a + b;
    if (a + b > 15) c = 1;
end
endmodule

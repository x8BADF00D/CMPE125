`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2020 05:36:31 PM
// Design Name: 
// Module Name: if_priority_enc
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


module if_priority_enc(a, y, valid);
input [7:0] a;
output reg [2:0] y;
output reg valid;

always @ (a)
begin
    valid = 1;
    if(a[7])      y = 7;
    else if(a[6]) y = 6;
    else if(a[5]) y = 5;
    else if(a[4]) y = 4;
    else if(a[3]) y = 3;
    else if(a[2]) y = 2;
    else if(a[1]) y = 1;
    else if(a[0]) y = 0;
    else 
        begin
            valid = 0;
            y = 0;
        end
end
endmodule

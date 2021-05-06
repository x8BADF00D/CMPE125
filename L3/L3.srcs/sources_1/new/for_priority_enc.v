`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2020 05:36:31 PM
// Design Name: 
// Module Name: for_priority_enc
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


module for_priority_enc(a, y, valid);
input [7:0] a;
output reg [2:0] y;
output reg valid;

integer i;

always @ (a)
begin
    valid = 0;
    y = 0;

    for(i = 0; i < 8; i = i + 1)
        if(a[i])
            begin
                y = i;
                valid = 1;
            end
end
endmodule

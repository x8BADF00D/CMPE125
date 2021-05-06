`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2020 01:50:22 PM
// Design Name: 
// Module Name: ud_cnt_4
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


module UD_CNT_4 (D, LD, UD, CE, CLK, RST_, count);

input [3:0] D;
input LD, UD, CE, CLK, RST_;
reg [3:0] Q;
output reg count;

always @ (posedge CLK, negedge RST_)
begin
    if (!RST_) Q = 4'b0;
    else if (CE)
        begin
            if (LD)         Q = D;
            else if (UD)    Q = Q + 4'b0001;
            else            Q = Q - 4'b0001;
        end
    else Q = Q;
    count = (Q == 0) ? 0 : 1;
end
//assign count = (Q == 0) ? 0 : 1;
endmodule
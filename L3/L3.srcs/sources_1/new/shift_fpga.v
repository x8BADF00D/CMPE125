`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2020 03:48:36 PM
// Design Name: 
// Module Name: shift_fpga
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


module shift_fpga(input [2:0] switch, input [6:3] switch, output [3:0] LED);
    r_shift_rot(switch[2:0], switch [6:3], LED [3:0]);
endmodule

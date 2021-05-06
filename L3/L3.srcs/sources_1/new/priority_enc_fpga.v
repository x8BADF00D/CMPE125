`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 01:51:14 PM
// Design Name: 
// Module Name: priority_enc_fpga
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


module priority_enc_fpga(input [7:0] switch, output [2:0] LED, output valid);
    if_priority_enc(switch[7:0], LED[2:0], valid);
endmodule

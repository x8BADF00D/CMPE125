`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2020 02:56:56 PM
// Design Name: 
// Module Name: flop
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


module flop #(parameter WIDTH = 8) 
    (
    input clk, rst,
    input [WIDTH - 1:0] d,
    output reg [WIDTH - 1:0] q
    );
    
    always @ (posedge clk, posedge rst)
    begin
        if (rst) q <= 0;
        else     q <= d;
    end
endmodule

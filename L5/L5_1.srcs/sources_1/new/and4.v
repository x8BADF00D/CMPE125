`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 02:23:25 PM
// Design Name: 
// Module Name: and4
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


module and4(a [3:0], b[3:0], pp0 [7:0], pp1 [7:0], pp2 [7:0], pp3 [7:0]);
    input [3:0] a; 
    input [3:0] b; 
    output reg [7:0] pp0;
    output reg [7:0] pp1;
    output reg [7:0] pp2;
    output reg [7:0] pp3;
    
    integer i;
    
    always @ (*) begin
    
    pp0 = 8'b00000000;
    pp1 = 8'b00000000;
    pp2 = 8'b00000000;
    pp3 = 8'b00000000; 
    for (i = 0; i < 4; i = i + 1)
        begin
            pp0[i] = b[0] & a[i];
        end
    pp0 = pp0;
    
    for (i = 0; i < 4; i = i + 1)
        begin
            pp1[i] = b[1] & a[i];
        end
    pp1 = pp1 << 1;
    
    for (i = 0; i < 4; i = i + 1)
        begin
            pp2[i] = b[2] & a[i];
        end
    pp2 = pp2 << 2;
    
    for (i = 0; i < 4; i = i + 1)
        begin
            pp3[i] = b[3] & a[i];
        end
    pp3 = pp3 << 3;
    
    end
endmodule

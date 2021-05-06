`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2020 11:49:07 AM
// Design Name: 
// Module Name: regfile2
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


module regfile2(
    input clk,
    input we1, we2,
    input [4:0] wa1, wa2, ra1, ra2,
    input [31:0] wd1, wd2,
    output [31:0] rd1, rd2
    );
    
    reg [31:0] rf [31:0];
    
    always @ (posedge clk)
    begin
        if (we1) begin
            rf[wa1] <= wd1;
        end
        if (we2 && wa1 != wa2)
            begin
                rf[wa2] <= wd2;
            end
    end
    
    assign rd1 = (ra1 !=0) ? rf[ra1] : 0;
    assign rd2 = (ra2 !=0) ? rf[ra2] : 0;
    
endmodule

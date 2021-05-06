`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2020 03:39:26 PM
// Design Name: 
// Module Name: priority_enc
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


module priority_enc(a, y, valid);
    input  [7:0] a;
    output reg [2:0] y;
    output reg valid;

always @ (a) 
begin
   valid = 1;
   casez(a)
        8'b1???????: y = 7;
        8'b01??????: y = 6;
        8'b001?????: y = 5;
        8'b0001????: y = 4;
        8'b00001???: y = 3;
        8'b000001??: y = 2;
        8'b0000001?: y = 1;
        8'b00000001: y = 0;
        default: 
            begin
                valid = 0;
                y = 0;
            end
    endcase
end
endmodule

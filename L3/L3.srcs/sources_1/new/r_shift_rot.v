`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2020 07:35:02 PM
// Design Name: 
// Module Name: r_shift_rot
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


module r_shift_rot(ctrl, a, y);
input [2:0] ctrl;
input [3:0] a;
output reg [3:0] y;

reg i;
reg i2;
reg i3;

integer n;

always @ (a)
begin
    casez (ctrl)
        3'b000: y = a;
        3'b001: y = a >> 1;
        3'b010: y = a >> 2;
        3'b011: y = a >> 3;
        3'b100: y = a >> 4;
        3'b101: 
            begin
                i = a[0];
                y = (a >> 1) + {i, 3'b0};
            end
        3'b110: 
            begin
                    i = a[0];
                    i2 = a[1];
                    y = (a >> 2) + {i2, 3'b0} + {i, 2'b0};
            end
        3'b111: 
            begin
                    i = a[0];
                    i2 = a[1];
                    i3 = a[2];
                    y = (a >> 3) + {i3, 3'b0} + {i2, 2'b0} + {i, 1'b0};
            end
        default: y = 0;
    endcase
end
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2020 02:52:54 PM
// Design Name: 
// Module Name: alu
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


module alu(m, s1, s0, a, b, y, z, o);
input m;
input s1;
input s0;
input [3:0] a;
input [3:0] b;
output reg [3:0] y;
output reg z;
output reg o;

always @ (*)
begin
    z = 0;
    o = 0;
    casez(m)
        1: begin 
        casez({s1, s0})
            0 :begin //~A bitwise negation
                y = ~a;
                if(y == 0) z = 1;
            end
            1: begin //and
                y = a & b;
                if(a & b == 0) z = 1; 
            end
            2: begin //bitwise XOR
                y = a ^ b;
                if(a == b) z = 1;
            end
            3: begin //bitwise OR
                y = a | b;
                if(a == 0 && b == 0) z = 1;
            end
        endcase        
        end
        1: begin 
        casez({s1, s0})
            0:begin //decrement A - 1
                y = a - 1;
                if(a == 1) z = 1;
            end
            1: begin //add A + B
                y = a + b;
                if(y == 0) z = 1;
                if(y < a && y < b) o = 1;
            end
            2: begin //sub A - B
                y = a - b;
                if(a == b) z = 1;
            end
            3: begin //increment A + 1
                y = a + 1;
                if(a == 15) o = 1;
            end
        endcase
        end
        default: $display("invalid input");
    endcase
end
endmodule

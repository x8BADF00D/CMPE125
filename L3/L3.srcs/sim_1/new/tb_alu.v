`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2020 03:21:14 PM
// Design Name: 
// Module Name: tb_alu
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


module tb_alu();

reg [3:0] in_a;
reg [3:0] in_b;
reg in_s1;
reg in_s0;
reg in_m;
wire [3:0] tb_out;
wire zero;
wire ov;
integer error = 0;

alu DUT_ALU (in_m, in_s1, in_s0, in_a, in_b, tb_out, zero, ov);

initial begin
    in_m = 0;
    in_s1 = 0;
    in_s0 = 0;


    // assign arbitrary values for a and b
    in_a = 4'b1010;
    in_b = 4'b0111;

    // negation
    if(~in_a != tb_out)
    begin
        $display("negation error");
        error = error + 1;
    end
    if(~in_a == 0 && zero == 0) 
    begin
        $display("zero flag error in negation");
        error = error + 1;
    end
    if(ov == 1)
    begin
        $display("overflow flag error in negation");
        error = error + 1;
    end

    in_s0 = 1;
    //AND
    if(in_a & in_b != tb_out)
    begin
        $display("AND error");
        error = error + 1;
    end
    if(in_a & in_b == 0 && zero == 0)
    begin
        $display("zero flag error in AND");
        error = error + 1;
    end
    if(ov == 1)
    begin
        $display("overflow flag error in negation");
        error = error + 1;
    end

    in_s1 = 1;
    //OR
    if(in_a | in_b != tb_out)
    begin
        $display("OR error");
        error = error + 1;
    end
    if(in_a == 0 && in_b == 0 && zero == 0)
    begin
        $display("zero flag error in OR");
        error = error + 1;
    end
    if(ov == 1)
    begin
        $display("overflow flag error in OR");
        error = error + 1;
    end

    in_s0 = 0;
    //XOR
    if(in_a ^ in_b != tb_out)
    begin
        $display("XOR error");
        error = error + 1;
    end
    if(in_a == in_b && zero == 0)
    begin
        $display("zero flag error in XOR");
        error = error + 1;
    end
    if(ov == 1)
    begin
        $display("overflow flag error in XOR");
        error = error + 1;
    end

    in_m = 1;
    //sub
    if(in_a - in_b != tb_out)
    begin
        $display("sub error");
        error = error + 1;
    end
    if(in_a - in_b == 0 && zero == 0)
    begin
        $display("zero flag error in sub");
        error = error + 1;
    end
    if(ov == 1)
    begin
        $display("overflow flag error in sub");
        error = error + 1;
    end


    in_s0 = 1;
    //increment
    if(in_a + 1 != tb_out)
    begin
        $display("increment error");
        error = error + 1;
    end
    if(zero == 1)
    begin
        $display("zero flag error in increment");
        error = error + 1;
    end
    if(in_a == 15 && ov == 0)
    begin
        $display("overflow flag error in increment");
        error = error + 1;
    end


    in_s1 = 0;
    // addition
    if(in_a + in_b != tb_out)
    begin
        $display("addition error");
        error = error + 1;
    end
    if(in_a == 0 && in_b == 0 && zero == 0)
    begin
        $display("zero flag error in addition");
        error = error + 1;
    end
    if(in_a + in_b > 15 && ov == 0)
    begin
        $display("overflow flag error in addition");
        error = error + 1;
    end


    in_s0 = 0;
    // decrement
    if(in_a - 1 != tb_out)
    begin
        $display("decrement error");
        error = error + 1;
    end
    if(in_a == 1 && zero == 0)
    begin
        $display("zero flag error in decrement");
        error = error + 1;
    end
    if(ov == 1)
    begin
        $display("overflow flag error in decrement");
        error = error + 1;
    end
    end
endmodule

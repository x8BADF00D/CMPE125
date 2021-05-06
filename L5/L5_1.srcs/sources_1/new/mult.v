`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 02:04:45 PM
// Design Name: 
// Module Name: mult
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


module mult(A [3:0], B [3:0], clk, rst, Yout [7:0]);
input [3:0] A;
input [3:0] B;
input clk;
input rst;
output [7:0] Yout;

wire carry_in;
wire carry_out;

wire A_and; //for input flop
wire B_and; //for input flop
wire add_3; //for intermediate flop
wire add_2; //for intermediate flop
wire add_1; //for intermediate flop
wire add_0; //for intermediate flop

assign carry_in = 0;

wire [7:0] s0;
wire [7:0] s1;
wire [7:0] s2;
wire [7:0] s3;

wire [3:0] al1;
wire [3:0] bl1;
wire [3:0] ah1;
wire [3:0] bh1;

wire [3:0] al2;
wire [3:0] bl2;
wire [3:0] ah2;
wire [3:0] bh2;

wire car0;
wire car1;

wire [3:0] sum0a;
wire [3:0] sum0b;
wire [3:0] sum1a;
wire [3:0] sum1b;
wire carry_1b;

wire [3:0] out_l;
wire [3:0] out_h;

wire [7:0] final;
wire [7:0] q;

//and4 and_in(a, b, s0, s1, s2, s3);

//always @ (*) begin

flop #4 flop_a0(   //holds the a input
    .rst    (rst),
    .clk    (clk),
    .d      (A),
    .q      (A_and)
);

flop #4 flop_a1(   //holds the b input
    .rst    (rst),
    .clk    (clk),
    .d      (B),
    .q      (B_and)
);

and4 and_in(
    .a      (A_and), //A
    .b      (B_and), //B
    .pp0    (s0),
    .pp1    (s1),
    .pp2    (s2),
    .pp3    (s3)
);

split_8_to_4 split_a (
    .a      (s0),
    .b      (s1),
    .a_least(al1),      //s0 low
    .a_most (ah1),      //s0 high
    .b_least(bl1),      //s1 low
    .b_most (bh1)       //s1 high
);

split_8_to_4 split_b (
    .a      (s2),
    .b      (s3),
    .a_least(al2),      //s2 low
    .a_most (ah2),      //s2 high
    .b_least(bl2),      //s3 low
    .b_most (bh2)       //s3 high
);

adder4 add0 ( //lower 4 of pp0 & pp1
    .a0     (al1),
    .b0     (bl1),
    .c_in   (carry_in),
    .c_out  (car0),
    .y      (add_0)     //sum0a
);

adder4 add1 ( //upper 4 of pp0 & pp1
    .a0     (ah1),
    .b0     (bh1),
    .c_in   (car0),
    .c_out  (carry_out),
    .y      (add_1)     //sum0b
);

adder4 add2 ( //lower 4 of pp2 & pp3
    .a0     (al2),
    .b0     (bl2),
    .c_in   (carry_in),
    .c_out  (car1),
    .y      (add_2)     //sum1a
);

adder4 add3 ( //upper 4 of pp2 & pp3
    .a0     (ah2),
    .b0     (bh2),
    .c_in   (car1),
    .c_out  (carry_out),
    .y      (add_3)     //sum1b
);

flop #4 flop_b0(   //routes to add4 a/src: add0
    .rst    (rst),
    .clk    (clk),
    .d      (add_0),         //add0
    .q      (sum0a)          //add4
);

flop #4 flop_b1(   //routes to add4 b/src: add2
    .rst    (rst),
    .clk    (clk),
    .d      (add_2),         //add2
    .q      (sum1a)          //add4
);

flop #4 flop_b2(   //routes to add5 a/src: add1
    .rst    (rst),
    .clk    (clk),
    .d      (add_1),         //add1
    .q      (sum0b)          //add5
);

flop #4 flop_b3(   //routes to add5 b/src: add3
    .rst    (rst),
    .clk    (clk),
    .d      (add_3),         //add3
    .q      (sum1b)          //add5
);

adder4 add4 ( //add0 & add2 (lowers)
    .a0     (sum0a),    //add0
    .b0     (sum1a),    //add2
    .c_in   (carry_in),
    .c_out  (carry_1b),
    .y      (out_l)
);

adder4 add5 ( //add1 & add3
    .a0     (sum0b),    //add1
    .b0     (sum1b),    //add3
    .c_in   (carry_1b),
    .c_out  (carry_out),
    .y      (out_h)
);

merge m (
    .lower  (out_l),    //lowbits
    .upper  (out_h),    //highbits
    .y      (final)     //passed to flop_c to store output
);

flop flop_c(   //holds the output
    .rst    (rst),
    .clk    (clk),
    .d      (final),
    .q      (q)         //send to output of program
);

assign Yout = q;     //final output of module
//end
endmodule

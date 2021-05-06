`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2020 03:46:14 PM
// Design Name: 
// Module Name: dp
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


module dp(
input       clk, rst,
input [3:0] d_a, d_b,
input       mux_1s, mux_2s, mux_3s,
input       r_ld, r_sl, r_sr,
input       x_ld, x_sl, x_sr, x_rin,
input       y_ld, y_sl, y_sr,
input [3:0] ud_d,
input       ud_ld, ud_ud, ud_ce, ud_rst,
output wire          cmp, count,
output wire [3:0]    d_q,
output wire [4:0]    rem
    );
    
    wire [3:0] sub_c;
    wire [4:0] r_d, r_q;  //remainder register wires
    wire [3:0] x_q;       //x register wire
    wire [3:0] y_q;       //y register wire
    
    mux2 #5 mux_1 (
    .sel    (mux_1s),
    .in0    (5'b0),
    .in1    ({0,sub_c}),
    .out    (r_d)
    );
    
    mux2 #5 mux_2 (
    .sel    (mux_2s),
    .in0    (5'b0),
    .in1    (r_q),
    .out    (rem)
    );
    
    mux2 mux_3 (
    .sel    (mux_3s),
    .in0    (4'b0),
    .in1    (x_q),
    .out    (d_q)
    );
    
    comparator comp1 (
    .a      (r_q),
    .b      (y_q),
    .lt      (cmp)
    );
    
    sub sub1(
    .a      (r_q),
    .b      (y_q),
    .c      (sub_c)
    );
    
    UD_CNT_4 ud1 (
    .D      (ud_d),
    .LD     (ud_ld),
    .UD     (ud_ud),
    .CE     (ud_ce),
    .CLK    (clk),
    .RST_    (ud_rst),
    .count      (count)
    );
    
    ShftReg #5 reg_r (
    .CLK        (clk),
    .RST        (rst),
    .SL         (r_sl),
    .SR         (r_sr),
    .LD         (r_ld),
    .LeftIn     (),
    .RightIn    (x_q[3]),
    .D          (r_d),
    .Q          (r_q)
    );
    
    ShftReg reg_x (
    .CLK        (clk),
    .RST        (rst),
    .SL         (x_sl),
    .SR         (x_sr),
    .LD         (x_ld),
    .LeftIn     (),
    .RightIn    (x_rin),
    .D          (d_a),
    .Q          (x_q)
    );
    
    ShftReg reg_y (
    .CLK        (clk),
    .RST        (rst),
    .SL         (y_sl),
    .SR         (y_sr),
    .LD         (y_ld),
    .LeftIn     (),
    .RightIn    (),
    .D          (d_b),
    .Q          (y_q)
    );
    
endmodule

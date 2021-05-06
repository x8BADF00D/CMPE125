`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 04:03:42 PM
// Design Name: 
// Module Name: CLA_fpga
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


module CLA_fpga(
    input wire clk100MHz,
    input wire [3:0] SW,
    input wire [15:12] SW2,
    input wire BTNC,
    input wire rst,
    output wire [3:0] LEDSEL,
    output wire [7:0] LEDOUT,
    output wire [3:0] LED1,
    output wire [15:12] LED2
    );

    supply1 [7:0] vcc;
    
    wire DONT_USE;
    wire DONT_USE2;
    wire DONT_USE3;
    wire clk_5KHz;
    
    wire [3:0] i;
    wire [7:0] vote;
    wire [7:0] vote2;
    wire [7:0] vote3;
    wire i2;
    wire carry;
    
    CLA VTR (
    .a      (SW2),
    .b      (SW),
    .c0     (BTNC),
    .y      (DONT_USE3),
    .cout   (DONT_USE2),
    .y3     (i),
    .y4     (i2),
    .cr     (carry)
    );
    
    clk_gen CLK (
    .clk100MHz (clk100MHz),
    .rst (rst),
    .clk_4sec (DONT_USE),
    .clk_5KHz (clk_5KHz)
    );
    
    bcd_to_7seg BCD (
        .BCD        (i),
        .s          (vote)
    );
    
    bcd_to_7seg BCD2 (
        .BCD        (i2),
        .s          (vote2)
    );
    
    bcd_to_7seg BCD3 (
        .BCD        (carry),
        .s          (vote3)
    );

    led_mux LED (
        .clk        (clk_5KHz), 
        .rst        (rst),
        .LED3       (vote3),
        .LED2       (vcc),
        .LED1       (vote2),
        .LED0       (vote),
        .LEDSEL     (LEDSEL),
        .LEDOUT     (LEDOUT)
    );
    
endmodule

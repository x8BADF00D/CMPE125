`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2020 04:43:20 PM
// Design Name: 
// Module Name: adder_fpga
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


module adder_fpga(
	input wire clk100MHz,
	input wire [3:0] in_1,
	input wire [15:12] in_2,
	input wire btn_rst,
	input wire btn_clk,
	input wire rst,
	output wire [3:0] led_in_1,
	output wire [15:12] led_in_2,
	output wire [11:4] led_out
	);

	wire clk_5KHz;
	wire DONT_USE;

	mult mult (
	.A 		(in_1),
	.B 		(in_2),
	.Yout 	(led_out)
	);

	clk_gen CLK (
	.clk100MHz		(clk100MHz),
	.rst 			(rst),
	.clk_4sec 		(DONT_USE),
	.clk_5KHz 		(clk_5KHz)
	);

	button_debouncer debouncer (
	.clock					(),
	.button 				(btn_clk),
	.debounced_button       ()
	);



`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2020 02:44:39 PM
// Design Name: 
// Module Name: sys
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


module sys(
input       clk, go, rst,
input [3:0] d_a, d_b,
output [3:0] d_q, rem,
output done, err
    );
    
    wire mx1, mx2, mx3;
    wire rld, rsl, rsr, xrin;
    wire xld, xsl, xsr;
    wire yld, ysl, ysr;
    wire udd, udld, udud, udce, udrst;      //
    wire cmp, count;
    wire DONT_USE;
    
    dp dp1 (
    .clk            (clk),
    .d_a            (d_a),
    .d_b            (d_b),
    .mux_1s         (mx1),
    .mux_2s         (mx2),
    .mux_3s         (mx3),
    .r_ld           (rld),
    .r_sl           (rsl),
    .r_sr           (rsr),
    .x_ld           (xld),
    .x_sl           (xsl),
    .x_sr           (xsr),
    .x_rin          (xrin),
    .y_ld           (yld),
    .y_sl           (ysl),
    .y_sr           (ysr),
    .ud_d           (udd),
    .ud_ld          (udld),
    .ud_ud          (udud),
    .ud_ce          (udce),
    .ud_rst         (udrst),    //
    .cmp            (cmp),
    .count          (count),
    .d_q            (d_q),
    .rem            (rem)
    );
    
    CU CU1 (
    .go             (go),
    .rst            (rst),
    .clk            (clk),
    .comp           (cmp),
    .count          (count),
    .Done           (done),
    .cu_s1_m1       (mx1),
    .cu_s1_r        (mx2),
    .cu_s1_x        (mx3),
    .cu_SL_r        (rsl),
    .cu_SR_r        (rsr),
    .cu_LD_r        (rld),
    .cu_SL_x        (xsl),
    .cu_SR_x        (xsr),
    .cu_LD_x        (xld),
    .cu_SL_y        (ysl),
    .cu_SR_y        (ysr),
    .cu_LD_y        (yld),
    .cu_LD_count    (udld),
    .cu_UD_count    (udud),
    .cu_CE_count    (udce),
    .cs             (DONT_USE),
    .Err            (err)           //
    );
    
endmodule

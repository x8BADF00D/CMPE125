`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2020 04:52:47 PM
// Design Name: 
// Module Name: tb_dp
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


module tb_dp;

reg         tb_clk, tb_rst;
reg [3:0]   tb_ud_d, tb_d_a, tb_d_b;
reg         tb_mux_1s, tb_mux_2s, tb_mux_3s;
reg         tb_r_ld, tb_r_sl, tb_r_sr;
reg         tb_x_ld, tb_x_sl, tb_x_sr, tb_x_rin;
reg         tb_y_ld, tb_y_sl, tb_y_sr;
reg         tb_ud_ld, tb_ud_ud, tb_ud_ce, tb_ud_rst;
wire         tb_cmp, tb_count;
wire [3:0]   tb_d_q;
wire [4:0]   tb_rem;

integer state = 0;

dp DUT (tb_clk, tb_rst, tb_d_a, tb_d_b, tb_mux_1s, tb_mux_2s, tb_mux_3s,
        tb_r_ld, tb_r_sl, tb_r_sr, 
        tb_x_ld, tb_x_sl, tb_x_sr, tb_x_rin, 
        tb_y_ld, tb_y_sl, tb_y_sr,
        tb_ud_d, tb_ud_ld, tb_ud_ud, tb_ud_ce, tb_ud_rst,
        tb_cmp, tb_count, tb_d_q, tb_rem);
        
initial begin
        tb_clk      = 0;
        tb_ud_ud    = 0;
        tb_ud_ce    = 0;
        tb_ud_ld    = 0;
        tb_ud_rst   = 1;
        tb_ud_d     = 4;
        tick;
        
        tb_clk      = 0;
        tb_ud_rst   = 0;
        tb_ud_d     = 4;
        tick;
        
        tb_d_a      = 12;
        tb_d_b      = 4;
        tb_mux_1s   = 0;
        tb_mux_2s   = 0;
        tb_mux_3s   = 0;
        tb_r_ld     = 1;
        tb_x_ld     = 1;
        tb_y_ld     = 1;
        tb_r_sl     = 0;
        tb_x_sl     = 0;
        tb_y_sl     = 0;
        tb_r_sr     = 0;
        tb_x_sr     = 0;
        tb_y_sr     = 0;
        tb_rst      = 0;
        tb_x_rin    = 0;    //x right in is 0
        
        tb_ud_ld    = 1;
        tb_ud_ud    = 0;    //0 should be decrement mode
        tb_ud_ce    = 1;
        tb_ud_rst   = 1;    //active low reset
        state = 1;
        tick;               //load process, State 1
        
        tb_r_ld     = 0;    //
        tb_x_ld     = 0;    //
        tb_y_ld     = 0;    //
        tb_r_sl     = 1;    //
        tb_x_sl     = 1;    //
        tb_ud_ld    = 0;    //
        tb_ud_ce    = 0;    //
        state = 2;
        tick;               //Shift left, State 2
        
//        tb_ud_ce    = 1;
//        tb_r_sl     = 0;
//        tb_x_sl     = 0;
//        tick;
        while (tb_count)
            begin
                tb_ud_ce    = 1;
                tb_r_sl     = 0;
                tb_x_sl     = 0;
                if (tb_cmp) //State 5
                    begin
                        //r sl, r in x3
                        //x sl, r in 0
                        state = 5;
                        tick;
                        tb_ud_ce    = 0;
                        tb_r_sl     = 1;
                        tb_x_sl     = 1;
                        tb_x_rin    = 0;   //x right input
                        
                    end
                else        //State 4
                    begin
                        //r sl, r in x3
                        //x sl, r in 1
                        tb_mux_1s   = 1;
                        tb_r_ld     = 1;
                        state = 4;
                        tick;
                        tb_r_ld     = 0;
                        tb_ud_ce    = 0;
                        tb_r_sl     = 1;
                        tb_x_sl     = 1;
                        tb_x_rin    = 1;   //x right input
                        
                    end
                state = 3;
                tick;       //State 3/4/5 loop
                
            end
        
        
        tb_x_rin    = 0;   //x right input
        tb_r_sl     = 0;
        tb_x_sl     = 0;
        tb_y_sl     = 0;
        tb_r_sr     = 1;    //
        tb_ud_ce    = 0;
        state = 6;
        tick;               //State 6
        
        tb_r_sr     = 0;
        tb_mux_2s   = 1;    //
        tb_mux_3s   = 1;    //
        state = 7;
        tick;               //State 7, output
        
        
    end  
    
task tick;
    begin
        tb_clk = 0; #3;
        tb_clk = 1; #3;
    end
    endtask
      
endmodule

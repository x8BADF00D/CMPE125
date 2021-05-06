`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2020 12:21:16 PM
// Design Name: 
// Module Name: tb_reg
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


module tb_reg;

reg clk_in;
reg         we1_in,     we2_in;     //write enable
reg [4:0]   in_wa1,     in_wa2;     //write address
reg [4:0]   in_ra1,     in_ra2;     //read address
reg [31:0]  in_d1,      in_d2;      //inputs
wire [31:0] out1,       out2;       //outputs
reg [31:0] rf_tb [31:0];

integer error = 0;
integer i = 0;

regfile2 DUT (  clk_in, 
                we1_in,  we2_in, 
                in_wa1,  in_wa2, 
                in_ra1,  in_ra2, 
                in_d1,   in_d2, 
                out1,    out2);

initial begin
    clk_in = 0;
    we1_in = 0;
    we2_in = 0;
    in_wa1 = 0;
    in_wa2 = 0;
    in_ra1 = 0;
    in_ra2 = 0;
    in_d1 = 0;
    in_d2 = 0;

//write port 1
    for (i = 0; i < 32; i = i + 1)
    begin
        we1_in = 1;
        in_wa1 = i;
        in_d1 = i + 5;
        rf_tb [in_wa1] = (in_wa1 != 0) ? in_d1 : 0;
        clk_in = 1; #3;
        clk_in = 0; #3;
        we1_in = 0;
    end
//read port 1    
    for (i = 0; i < 32; i = i + 1)
    begin
        in_ra1 = i;
        clk_in = 1; #3;
        clk_in = 0; #3;
        if (out1 != rf_tb[in_ra1]) 
        begin
            $display("Error");
            error = error + 1;
        end
    end
//write port 2
    for (i = 0; i < 32; i = i + 1)
    begin
        we2_in = 1;
        in_wa2 = i;
        in_d2 = i + 5;
        rf_tb [in_wa2] = (in_wa2 != 0) ? in_d2 : 0;
        clk_in = 1; #3;
        clk_in = 0; #3;
        we2_in = 0;
    end
//read port 2    
    for (i = 0; i < 32; i = i + 1)
    begin
        in_ra2 = i;
        clk_in = 1; #3;
        clk_in = 0; #3;
        if (out2 != rf_tb[in_ra2]) 
        begin
            $display("Error");
            error = error + 1;
        end
    end
    
//reading the location
    in_ra1 = 3;
    in_ra2 = 3;
    clk_in = 1; #3;
    clk_in = 0; #3;
    if (out1 != rf_tb[in_ra1]) 
    begin
        $display("Error simultaneous");
        error = error + 1;
    end
    $display("Out1: %d", out1);
    $display("Out2: %d", out2);
end    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2020 01:50:21 PM
// Design Name: 
// Module Name: tb_shift
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


module tb_shift;

reg [2:0] in_ctrl;
reg [3:0] in_data;
wire [3:0] tb_out;
integer n;
integer j;
integer error;

reg i;
reg i2;
reg i3;

r_shift_rot DUT_SHIFT (in_ctrl, in_data, tb_out);

initial begin
    error = 0;
    
    for (n = 0; n < 8; n = n + 1)
        begin
            in_data = $urandom%31;
            in_ctrl = n; #5;
            casez(in_ctrl)
                0: if(in_data != tb_out)
                begin
                    $display("case 0 failed!");
                    error = error + 1;
                end
                1: if(in_data >> 1 != tb_out)
                begin
                    $display("case 1 failed!");
                    error = error + 1;
                end
                2: if(in_data >> 2 != tb_out)
                begin
                    $display("case 2 failed!");
                    error = error + 1;
                end
                3: if(in_data >> 3 != tb_out)
                begin
                    $display("case 3 failed!");
                    error = error + 1;
                end
                4: if(in_data >> 4 != tb_out)
                begin
                    $display("case 4 failed!");
                    error = error + 1;
                end
                5: begin
                    i = in_data[0];
                    in_data = (in_data >> 1) + {i, 3'b0};
                    if(in_data != tb_out)
                    begin
                    $display("case 5 failed!");
                    error = error + 1;
                    end
                end
                6: begin
                    
                        i = in_data[0];
                        i2 = in_data[1];
                        in_data = (in_data >> 2) + {i2, 3'b0} + {i, 2'b0};
                    //y = (a >> 2) + {i2, 3'b0} + {i, 2'b0};
                    if(in_data != tb_out)
                    begin
                    $display("case 6 failed!");
                    error = error + 1;
                    end
                end
                7: begin
                    
                        i = in_data[0];
                        in_data = (in_data >> 3) + {i3, 3'b0} + {i2, 2'b0} + {i, 1'b0};
                    //y = (a >> 3) + {i3, 3'b0} + {i2, 2'b0} + {i, 1'b0};
                    if(in_data != tb_out)
                    begin
                    $display("case 7 failed!");
                    error = error + 1;
                    end
                end
                default: $display("invalid input!");
            endcase
        end
    $display("Simulation Finished. Error count: %d", error);
    $finish;
end
endmodule

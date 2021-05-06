module FIFO(D_in, D_out, empty, full , clk, rst, wnr, enable);

	parameter bus_width = 4;
	parameter addr_width = 3;
	parameter fifo_depth = 8;

	input clk;
	input rst;
	input wnr;
	input enable;
	input [bus_width-1:0] D_in;
	output reg [bus_width-1:0] D_out;
	output reg full;
	output reg empty;

	reg [addr_width:0] r_ptr, w_ptr;
	reg [bus_width-1:0] mem[fifo_depth-1:0];
    
    integer count;
always @ (posedge clk, posedge rst)
begin
//    full = 0;
//    empty = 1;
	if(rst)
		begin
			r_ptr = 0; w_ptr = 0; D_out = 0; full = 0; empty = 1; count = 0;
		end
	else if(!enable)
		begin
			D_out = 'bz;
		end
	else if(!wnr && !empty && count > 0)		// reading
		begin
			D_out = mem[r_ptr[addr_width-1:0]];
			r_ptr = r_ptr + 1;
			count = count - 1;
			full = 0;
			if(count == 0)
			begin
			     empty = 1;
			end
		end
	else if(wnr && !full && count < 8)		// writing
		begin
			mem[w_ptr[addr_width-1:0]] = D_in;
			w_ptr = w_ptr + 1;
			count = count + 1;
			empty = 0;
			if(count == 8)
			begin
			     full = 1;
			end
		end
		
end
endmodule
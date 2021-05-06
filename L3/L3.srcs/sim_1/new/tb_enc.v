module tb_encoder;
	reg [7:0] 	in_tb;
	wire		valid_if, valid_case, valid_for;
	wire [2:0]	out_if, out_case, out_for;
	integer n;

	if_priority_enc 		   DUT_IF 		(in_tb, out_if, valid_if);
	priority_enc	      	   DUT_CASE	(in_tb, out_case, valid_case);
	for_priority_enc #(8,3)    DUT_FOR 	(in_tb, out_for, valid_for);
	initial begin
		for (n = 256; n > 0; n = n - 1)
		begin
			in_tb = n; #3;
			if (!in_tb[out_if])			$display("Encoder If Failed");
			if (!in_tb[out_case])		$display("Encoder Case Failed");
			if (!in_tb[out_for])		$display("Encoder For Failed");
			if (in_tb && !valid_if)		$display("Valid If Failed");
			if (in_tb && !valid_case)	$display("Valid Case Failed");
			if (in_tb && !valid_for)	$display("Valid For Failed");
		end
		$display("Simulation Finished");
		$finish;
	end
endmodule
`timescale 1ns / 1ps                        // Compiler/Simulation directive

module Comparator(input A, B, output A_gt_B, A_et_B, A_lt_B);

// assign statement
assign A_gt_B = (A > B);
assign A_lt_B = (A < B);
assign A_et_B = (A == B);

// end module
endmodule


module TB();

// reg and wire
reg A, B;
wire A_gt_B, A_et_B, A_lt_B;

// procedural statement (initial construct)
initial
begin
    #00 A=0; B=0;
    #10 A=0; B=1;
    #10 A=1; B=0;
    #10 A=1; B=1;
    #10 $stop;
end

// module instantiation
Comparator C1(A, B, A_gt_B, A_et_B, A_lt_B);

// end module
endmodule
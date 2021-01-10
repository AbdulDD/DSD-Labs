// Gate level Modeling (Primitive Construct)

`timescale 1ns / 1ps                        // Compiler/simulation directive

// Module start
module Onebitcomparator(A, B, A_gt_B, A_lt_B, A_eq_B);

// inputs and outputs
input A, B;
output A_gt_B, A_lt_B, A_eq_B;

wire A0, B0;

// Logic (Gate level Modeling)
not(A0, A);
not(B0, B);
and(A_gt_B, A, B0);
xnor(A_eq_B, A, B);
and(A_lt_B, A0, B);

// endmodule
endmodule

module TB();

reg A, B;
wire A_gt_B, A_lt_B, A_eq_B;

// initial construct
initial
begin
    #00 A=0; B=0;
    #10 A=1; B=0;
    #10 A=0; B=1;
    #10 A=1; B=1;
    #10 $stop;
end

// module instantiation
Onebitcomparator OBC1(A, B, A_gt_B, A_lt_B, A_eq_B);

endmodule

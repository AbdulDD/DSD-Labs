`timescale 1ns / 1ps // Compiler/Simulator Directive
// start module
module DecadeCounterlab(Clk, R, Carry, O);
// input and output decleration
input Clk, R;
output [7:0] O;
output Carry;
// reg and wire decleration
wire [3:0] Q;
wire [3:0] InQ;
//logic
// module instantiation (D_FF)
DFlipflop DFF1(Clk, R, InQ[3], Q[0], InQ[0]);
DFlipflop DFF2(Clk, R, Q[0], Q[1], InQ[1]);
DFlipflop DFF3(Clk, R, Q[1], Q[2], InQ[2]);
DFlipflop DFF4(Clk, R, Q[2], Q[3], InQ[3]);
// primitive instantiation for outputs
and(O[0], InQ[0], InQ[3]);
and(O[1], InQ[1], Q[0]);
and(O[2], InQ[2], Q[1]);
and(O[3], InQ[3], Q[2]);
and(O[4], Q[0], Q[3]);
and(O[5], Q[1], InQ[0]);
and(O[6], Q[2], InQ[1]);
and(O[7], Q[3], InQ[2]);
not(Carry, Q[3]);
// end module
endmodule



module TB();
// reg and wire decleration
reg Clk, R;
wire [7:0] O;
wire Carry;
//logic
// initial conditions
initial
begin
Clk =0;
R=0;
end
// clk generation
always
#5 Clk = ~Clk;
// logic
initial
begin
@(negedge Clk) R=1;
@(negedge Clk) R=0;
@(negedge Clk)
@(negedge Clk)
@(negedge Clk)
@(negedge Clk)
@(negedge Clk)
@(negedge Clk)
repeat (9) @(negedge Clk)
@(negedge Clk) R=1;
$finish;
end
// module instantiation
DecadeCounterlab DC1(Clk, R, Carry, O);
// end module
endmodule
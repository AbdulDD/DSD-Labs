`timescale 1ns / 1ps

module Flipflop(Clk, S, R, Reset, Q, InQ);

input Clk, S, R, Reset;
output reg Q , InQ;

always @(posedge Clk)
begin
if (Reset)
begin
    Q <=0;
    assign InQ = ~Q;
    end
    else 
    case({S,R})
    0: begin Q<=Q;  InQ = ~Q; end
    1: begin Q<=0;  InQ = ~Q;  end
    2: begin Q<=1;  InQ = ~Q; end
    3: begin Q<=1'bx; InQ =1'bx; end
    endcase
end

endmodule






//module TB();

//// decleration of reg and wire
//reg Clk, S, R, MR;
//wire Q , InQ;

////logic

//initial
//begin
//    Clk =0;
//    MR =0;
//end
//always
//# 10 Clk = ~Clk;

//initial
//begin
    
//    @ (negedge Clk) {S, R} = 0;
//    @ (negedge Clk) {S, R} = 2;
//    @ (negedge Clk) {S, R} = 1;
//    @ (negedge Clk) {S, R} = 1;
//    @ (negedge Clk) {S, R} = 0;
//    @ (negedge Clk) {S, R} = 2;
//    @ (negedge Clk) {S, R} = 3;
//    @ (negedge Clk) {S, R} = 1; MR=1;
//    @ (negedge Clk) {S, R} = 0;
//    @ (negedge Clk) {S, R} = 2;
//    @ (negedge Clk) {S, R} = 3;
//    @ (negedge Clk)
    
//    $finish;
//end

//// module instantiation
//SRFlipflop SRFF1(Clk, S, R, MR, Q, InQ);

//endmodule

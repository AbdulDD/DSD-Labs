`timescale 1ns / 1ps
module TLModule(J, K, Clk, Q);

input J, K, Clk;
output Q;


Blinky_1Hz B1(Clk, clock_out);
JK_Flipflop JKFF1(J, K, clock_out, Q);
 
endmodule

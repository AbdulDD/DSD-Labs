`timescale 1ns / 1ps

module Universal_shift_register(Clk, R, J, K, A, Q );

// Input & output decleration
input Clk,  R, J, K;
input [3:0] A;
output [3:0] Q;


// Current state logic
always@ (posedge Clk, R)
    if(R)
    Q[3:0] <= 0;
    else
    

endmodule

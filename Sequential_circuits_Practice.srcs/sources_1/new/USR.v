`timescale 1ns / 1ps

module UniversalShiftRegister(Clock, J, K, Reset, InvQ, PI, PE, Q);


input Clock, J, K, PE, Reset;
input [3:0]PI;
output [3:0]Q;
output [3:0]InvQ;

wire [8:0] A;
wire [3:0] NOR;
wire [5:0] N;

not(N[0], PE);
not(N[1], N[0]);

and(A[0], J, N[1], InvQ[0]);
and(A[1], K, N[1], Q[0]);
and(A[2], N[0], PI[0]);
nor(NOR[0], A[0], A[1], A[2]);

and(A[3], N[1], Q[0]);
and(A[4], N[0], PI[1]);
nor(NOR[1], A[3], A[4]);

and(A[5], N[1], Q[1]);
and(A[6], N[0], PI[2]);
nor(NOR[2], A[5], A[6]);

and(A[7], N[1], Q[2]);
and(A[8], N[0], PI[3]);
nor(NOR[3], A[7], A[8]);

not(N[2], NOR[0]);
not(N[3], NOR[1]);
not(N[4], NOR[2]);
not(N[5], NOR[3]);

SRFlipflop ff0(Clock, N[2], NOR[0], Reset, Q[0], InvQ[0]);
SRFlipflop ff1(Clock, N[3], NOR[1], Reset, Q[1], InvQ[1]);
SRFlipflop ff2(Clock, N[4], NOR[2], Reset, Q[2], InvQ[2]);
SRFlipflop ff3(Clock, N[5], NOR[3], Reset, Q[3], InvQ[3]);

endmodule






module TB();

reg Clock, J, K, PE, Reset;
reg [3:0]PI;
wire [3:0]Q;
wire [3:0]InvQ;

initial
Clock = 0;

always
#5 Clock = ~Clock;

initial
begin
      @(negedge Clock) PE=0;
      @(negedge Clock)  PI = 9; 
      repeat(2) @(negedge Clock) PI = 4;  
      @(negedge Clock)  PE=1; {J,K}= 3;
      @(negedge Clock)    {J,K}= 2;
      @(negedge Clock)    
      @(negedge Clock)   
      @(negedge Clock)  
    
    $finish;
end

UniversalShiftRegister inst1(Clock, J, K, Reset, InvQ, PI, PE, Q);

endmodule
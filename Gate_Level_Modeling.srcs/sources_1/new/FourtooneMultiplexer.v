`timescale 1ns / 1ps                // Compiler/simulation directive

module FourtooneMultiplexer(S0, S1, D0, D1, D2, D3, Y);

// inputs and outputs
input S0, S1, D0, D1, D2, D3;
output Y;

wire S0not, S1not, and0, and1, and2, and3;

// logic (gate level modling)
not(S0not, S0);
not(S1not, S1);

and(and0, S0not, S1not, D0);
and(and1, S0not, S1, D1);
and(and2, S0, S1not, D2);
and(and3, S0, S1, D3);
or(Y, and0, and1, and2, and3);

endmodule





/*
module TB();

// reg and wire
reg S0, S1, D0, D1, D2, D3;
wire Y;

// initial construct
initial
begin
    #00 S0=0; S1=0; D3=0; D2=0; D1=0; D0=1; 
    #10 S0=0; S1=1; D3=0; D2=0; D1=1; D0=0;
    #10 S0=1; S1=0; D3=0; D2=1; D1=0; D0=0;
    #10 S0=1; S1=1; D3=1; D2=0; D1=0; D0=0;
    #10 $stop;                  // System task  
end

// instantiation statemnet
FourtooneMultiplexer FM1(S0, S1, D0, D1, D2, D3, Y);

endmodule
*/

`timescale 1ns / 1ps                    // Compiler/simulation Directive

module FourtoOneMultiplexer(input S1, S0, [3:0] D, output Y);

// Conditional operator
assign Y = (S0 ? (S1 ? (D[3]):(D[1])):(S1 ? (D[2]):(D[0])));

endmodule



module TB();

// reg and wire
reg S1, S0;
reg [3:0]D;                 // D[3:0] is not acceptable
wire Y;

// Procedural statement (initial construct)
initial
begin
    #00 S1=0; S0=0; D[3]=0; D[2]=0; D[1]=0; D[0]=1;
    #10 S1=0; S0=1; D[3]=0; D[2]=0; D[1]=1; D[0]=0;
    #10 S1=1; S0=0; D[3]=0; D[2]=1; D[1]=0; D[0]=0;
    #10 S1=1; S0=1; D[3]=1; D[2]=0; D[1]=0; D[0]=0;
    #10 $stop;                  // System task
end

// module instantiation
FourtoOneMultiplexer FOM1(S1, S0, D[3:0], Y);           // [3:0] D is not acceptable

endmodule
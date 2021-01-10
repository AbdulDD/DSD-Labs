`timescale 1ns / 1ps                // Compiler/simulation directive

module SixteentooneMultiplexer(S0, S1, D0, D1, D2, D3, Y);

//inputs and outputs
input [3:0] D0, D1, D2, D3;
input [1:0] S0, S1;
output Y;

wire [3:0] Out;


// logic (instantiation statement)
FourtooneMultiplexer FM1(S0[1], S1[0], D0[0], D1[0], D2[0], D3[0], Out[0]);
FourtooneMultiplexer FM2(S0[1], S1[0], D0[1], D1[1], D2[1], D3[1], Out[1]);
FourtooneMultiplexer FM3(S0[1], S1[0], D0[2], D1[2], D2[2], D3[2], Out[2]);
FourtooneMultiplexer FM4(S0[1], S1[0], D0[3], D1[3], D2[3], D3[3], Out[3]);
FourtooneMultiplexer FM5(S0[1], S1[0], Out[0], Out[1], Out[2], Out[3], Y);

endmodule



// Testbench
module TB();

// reg and wire
reg [3:0] D0, D1, D2, D3;
reg [1:0] S0, S1;
wire Y;


// initial construct
initial
begin
    #00 S1[1]=0; S1[0]=0; S0[1]=0; S0[0]=0; D3[3:0]=0; D2[3:0]=0; D1[3:0]=0; D0[3:1]=0; D0[0]=1;
    #10 S1[1]=0; S1[0]=0; S0[1]=0; S0[0]=1; D3[3:0]=0; D2[3:0]=0; D1[3:0]=0; D0[3:2]=0; D0[0]=0; D0[1]=1;
    #10 S1[1]=0; S1[0]=0; S0[1]=1; S0[0]=0; D3[3:0]=0; D2[3:0]=0; D1[3:0]=0; D0[1:0]=0; D0[3]=0; D0[2]=1;
    #10 S1[1]=0; S1[0]=0; S0[1]=1; S0[0]=1; D3[3:0]=0; D2[3:0]=0; D1[3:0]=0; D0[2:0]=0; D0[3]=1;
    
   
    #10 S1[1]=1; S1[0]=0; S0[1]=0; S0[0]=0; D3[3:0]=0; D2[3:0]=0; D1[3:1]=0; D0[3:1]=0; D1[0]=1;
    #10 S1[1]=1; S1[0]=0; S0[1]=0; S0[0]=1; D3[3:0]=0; D2[3:0]=0; D1[3:2]=0; D0[2:0]=0; D1[0]=0; D1[1]=1;
    #10 S1[1]=1; S1[0]=0; S0[1]=1; S0[0]=0; D3[3:1]=0; D2[3:0]=0; D1[1:0]=0; D0[3:0]=0; D1[3]=0; D1[2]=1;
    #10 S1[1]=1; S1[0]=0; S0[1]=1; S0[0]=1; D3[2:0]=0; D2[3:0]=0; D1[2:0]=0; D0[3:0]=0; D1[3]=1;
        
    #10 S1[1]=0; S1[0]=1; S0[1]=0; S0[0]=0; D3[3:0]=0; D2[3:1]=0; D1[3:0]=0; D0[3:1]=0; D2[0]=1;
    #10 S1[1]=0; S1[0]=1; S0[1]=0; S0[0]=1; D3[3:0]=0; D2[3:2]=0; D1[3:0]=0; D0[2:0]=0; D2[0]=0; D2[1]=1;
    #10 S1[1]=0; S1[0]=1; S0[1]=1; S0[0]=0; D3[3:1]=0; D2[1:0]=0; D1[3:0]=0; D0[3:0]=0; D2[3]=0; D2[2]=1;
    #10 S1[1]=0; S1[0]=1; S0[1]=1; S0[0]=1; D3[2:0]=0; D2[2:0]=0; D1[3:0]=0; D0[3:0]=0; D2[3]=1;
 
    #10 S1[1]=1; S1[0]=1; S0[1]=0; S0[0]=0; D3[3:1]=0; D2[3:0]=0; D1[3:0]=0; D0[3:1]=0; D3[0]=1;
    #10 S1[1]=1; S1[0]=1; S0[1]=0; S0[0]=1; D3[3:2]=0; D2[3:0]=0; D1[3:0]=0; D0[2:0]=0; D3[0]=0; D3[1]=1;
    #10 S1[1]=1; S1[0]=1; S0[1]=1; S0[0]=0; D3[1:0]=0; D2[3:0]=0; D1[3:0]=0; D0[3:0]=0; D3[3]=0; D3[2]=1;
    #10 S1[1]=1; S1[0]=1; S0[1]=1; S0[0]=1; D3[2:0]=0; D2[3:0]=0; D1[3:0]=0; D0[3:0]=0; D3[3]=1;
    #10 $stop;                                   // System task

end

// instantiation statement
SixteentooneMultiplexer SM1(S0, S1, D0, D1, D2, D3, Y);

endmodule
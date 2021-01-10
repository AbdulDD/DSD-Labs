// Gate level Modeling
`timescale 1ns / 1ps                    // compiler/simulation directive

module OnetoFourMultiplexer(input S0, S1, D, output [3:0]Y);

wire S0not, S1not;

// logic (primitive construct)
not(S0not, S0);
not(S1not, S1);
and(Y[0], S1not, S0not, D);
and(Y[1], S1not, S0, D);
and(Y[2], S1, S0not, D);
and(Y[3], S1, S0, D);
 
//end module
endmodule


module TB();

//reg and wire
reg S0, S1, D;
wire [3:0]Y;

// Procedural statement (initial construct)
initial
begin
    #00 S1=0; S0=0; D=1;
    #10 S1=0; S0=1; D=1;
    #10 S1=1; S0=0; D=1;
    #10 S1=1; S0=1; D=1;
    #10 $stop;
end

// module instantiation
OnetoFourMultiplexer OFM1(S0, S1, D, Y[3:0]);

//end module
endmodule

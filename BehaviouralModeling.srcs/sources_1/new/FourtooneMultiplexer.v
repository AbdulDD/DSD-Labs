`timescale 1ns / 1ps                    // Compiler/Simulation directive

//Start module              // In behavioural modeling Output must be reg
module FourtooneMultiplexer(input [1:0]S, [3:0]D, output reg Y);

// procedural statement (Always construct)
always @ (*)
begin
    if (S == 2'b00)
        Y= D[0];
    else if (S == 2'b01)
        Y= D[1];
    else if (S == 2'b10)
        Y= D[2];
    else if (S == 2'b11)
        Y= D[3];
end

// end module
endmodule





module TB();

// reg and wire
reg [1:0]S;
reg [3:0]D;
wire Y;

// procedural statement (initial construct)
initial
begin
    #00 S= 2'b00; D= 4'b0001;
    #10 S= 2'b01; D= 4'b0010;
    #10 S= 2'b10; D= 4'b0100;
    #10 S= 2'b11; D= 4'b1000;
    #10 $stop;
end

// module instantiation
FourtooneMultiplexer FOM1(S[1:0], D[3:0], Y);

// end module
endmodule
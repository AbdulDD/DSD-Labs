`timescale 1ns / 1ps        // Compiler/simulation directive

module Fourbit_adder(Carry, Sum, Cin,  A, B);

// inputs and outputs
input [3:0] A, B;
input Cin;
output [3:0] Sum;
output Carry;

wire C0, C1, C2;

// Instantiation statement
FA_using_HA FA1(C0, Sum[0], Cin, A[0], B[0]);
FA_using_HA FA2(C1, Sum[1], C0, A[1], B[1]);
FA_using_HA FA3(C2, Sum[2], C1, A[2], B[2]);
FA_using_HA FA4(Carry, Sum[3], C2, A[3], B[3]);

endmodule


/*
// Testbench
module TB();

// reg and wires
reg [3:0] A, B;
reg Cin;
wire [3:0] Sum;
wire Carry;

// Initial construct
initial
begin

    #00 A=7; B=10; Cin=0;
    #10 A=7; B=15; Cin=0;
    #10 A=8; B=6; Cin=0;
    #10 A=9; B=12; Cin=0;
    #10 A=10; B=13; Cin=0;
    #10 A=15; B=10; Cin=0;
    #10 $stop;
end

// instantiation module
Fourbit_adder FBA1(Carry, Sum, Cin,  A, B);

endmodule
*/
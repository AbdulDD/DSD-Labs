`timescale 1ns / 1ps            // Compiler/simulator directive

module Sixteenbit_adder(Carry, Sum, Cin, A, B);

// inputs and outputs
input [15:0] A, B;
input Cin;
output [15:0] Sum;
output Carry;

wire C0, C1, C2;

// Instantiation statement
Fourbit_adder FBA1(C0, Sum[3:0], Cin,  A[3:0], B[3:0]);
Fourbit_adder FBA2(C1, Sum[7:4], C0,  A[7:4], B[7:4]);
Fourbit_adder FBA3(C2, Sum[11:8], C1,  A[11:8], B[11:8]);
Fourbit_adder FBA4(Carry, Sum[15:12], C2,  A[15:12], B[15:12]);

endmodule

/*


// testbench
module TB();

// reg and wire
reg [15:0] A, B;
reg Cin;
wire [15:0] Sum;
wire Carry;

// initial construct
initial
begin
    #00 A = 1000; B = 1500; Cin = 0;
    #10 A = 2000; B = 1500; Cin = 0;
    #10 A = 3000; B = 1500; Cin = 0;
    #10 A = 4000; B = 1500; Cin = 0;
    #10 $stop;
end

// insantiation statement
Sixteenbit_adder SixteenBA1(Carry, Sum, Cin, A, B);

endmodule

*/
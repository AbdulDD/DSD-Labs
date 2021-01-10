`timescale 1ns / 1ps

module CarryLAAdder(A, B, Cin, Sum, Carry);

// input and output decleration
input [3:0] A, B;
input Cin;
output [3:0] Sum;
output Carry;

// reg and wire decleration 
wire [3:0] P, G;
wire [4:0] C;

// First Block (Logic)
assign P= A^B;      // P is "xor" of A and B
assign G = A&B;      // G is "and" of A and B
 
 
// Second Block Logic (Logic drived from equations)
assign C[0] = Cin;
assign C[1] = G[0] | (P[0] & Cin);
assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | 
                                                            (P[3] & P[2] & P[1] & P[0] & Cin);

// 3rdd Block logic
assign Sum = P ^ C[3:0];
assign Carry = C[4];

// end module
endmodule




//// test bench
//module TB();

//// reg and wire decleration
//reg [3:0] A, B;
//reg Cin;
//wire [3:0] Sum;
//wire Carry;

//// logic

//initial
//begin
    
//    #00 A=10; B=10; Cin=0;
//    #10 A=3; B=9; Cin=0;
//    #10 A=12; B=12; Cin=0;
//    #10 A=7; B=4; Cin=0;
//    #10 $stop;
//end

//// module instantiation
//CarryLAAdder CLAA1(A, B, Cin, Sum, Carry);

//// end module
//endmodule
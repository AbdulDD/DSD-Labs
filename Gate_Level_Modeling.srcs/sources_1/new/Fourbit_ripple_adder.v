`timescale 1ns / 1ps

module Fourbit_ripple_adder(A, B, Cin, Carry, Sum);

// input and output decleration
input [3:0] A;
input [3:0] B;
input Cin;
output [3:0] Sum;
output Carry;

// wire decleration
wire [2:0] C;

// logic (module instantiaiton)
FA_using_HA FA1(C[0], Sum[0], Cin, A[0], B[0]);
FA_using_HA FA2(C[1], Sum[1], C[0], A[1], B[1]);
FA_using_HA FA3(C[2], Sum[2], C[1], A[2], B[2]);
FA_using_HA FA4(Carry, Sum[3], C[2], A[3], B[3]);

// end module
endmodule



//module TB();

//reg [3:0] A, B;
//reg Cin;
//wire Carry;
//wire [3:0] Sum;

//// Initial construct
//initial
//begin
    
//        #00 Cin=0; A=10; B=10;               // #00 shows time. it means this condition will run at 0 sec.
//        #10 Cin=0; A=14; B=14;               // this condition will run at 10 sec.
//        #10 Cin=0; A=4; B=4;               // this condition will run at 20 sec.
//        #10 Cin=1; A=0; B=1;               // this condition will run at 30 sec.
//        #10 $stop;

//end

//// Instantiation
//Fourbit_ripple_adder FBRCA1(A, B, Cin, Carry, Sum);

//endmodule



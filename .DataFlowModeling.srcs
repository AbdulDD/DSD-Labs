`timescale 1ns / 1ps                // Compiler/simulation directive

module Half_adder(input A, B, output Sum, Carry);

// assign statement
assign Carry = (A & B);
assign Sum = (A ^ B);

// end module
endmodule

/*
module TB();

// reg and wire
reg A, B;
wire Sum, Carry;

// procedural statement (initial construct)
initial
begin
    #00 A=0; B=0;
    #10 A=0; B=1;
    #10 A=1; B=0;
    #10 A=1; B=1;
    #10 $stop;
    
end

// module instantiation
Half_adder HA1(A, B, Sum, Carry);

// end module
endmodule
*/

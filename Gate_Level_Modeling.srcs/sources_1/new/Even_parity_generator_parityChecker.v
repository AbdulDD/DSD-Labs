// Gate level Modeling
`timescale 1ns / 1ps                // compiler/simulation directive      

module Even_parity_generator_parityChecker(input A, B, C, D, output EP);

wire O1, O2;
// Logic (Primitive instantiation)
xor(O1, A, B);
xor(O2, C, D);
xor(EP, O1, O2);

// endmodule
endmodule

module TB();

// reg and wire
reg A, B, C, D;
wire EP;

// Procedural statement (initial construct)
initial
begin
    #00 A=0; B=0; C=0; D=0;
    #10 A=0; B=0; C=0; D=1;
    #10 A=0; B=0; C=1; D=0;
    #10 A=0; B=0; C=1; D=1;
    #10 A=0; B=1; C=0; D=0;
    #10 A=0; B=1; C=0; D=1;
    #10 A=0; B=1; C=1; D=0;
    #10 A=0; B=1; C=1; D=1;
    #10 A=1; B=0; C=0; D=0;
    #10 $stop;                      // System directive
end

// Module instantiation
Even_parity_generator_parityChecker EP1(A, B, C, D, EP);

//endmodule
endmodule
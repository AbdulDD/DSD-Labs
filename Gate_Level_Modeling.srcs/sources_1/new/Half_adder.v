`timescale 1ns / 1ps                            // Compilation/Simulation directive

module Half_adder(Carry, Sum, A, B);

// input and output decleration
// By defualt inputs and outputs are wires.
input A, B;
output Carry, Sum;

// Developing Logic
xor(Sum, A, B);
and(Carry, A, B);

// endmodule
endmodule
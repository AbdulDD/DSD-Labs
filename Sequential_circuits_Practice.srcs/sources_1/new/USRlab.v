`timescale 1ns / 1ps

module USRlab(Clk, J, K, PE, PO);

// input and output decleration
input Clk, J, K, PE;
output [3:0]PO;
wire [4:0]andgate;
// logic (Primitive statement)
and(andgate[0], PE, J, PO[0]);
and(andgate[0], PE, J, PO[0]);


endmodule






// PE = high serial in   PE = low parrallel in
`timescale 1ns / 1ps            // Compiler/Simulator Directive

// Module start
module FIR_Filter(Clk, In, Out);

//decleration of input and output 
input Clk;
input [15:0] In; 
output reg [15:0] Out;

//Decleration of reg and wire. 
wire [15:0] b0, b1, b2, b3;                    // 3rd order MAF has 4 co-efficents
wire [15:0] MUL0, MUL1, MUL2, MUL3, Add;   
wire [15:0] Q1,Q2,Q3;                          // output for DFF
reg reset;

//filter coefficient for moving average filter
assign b0 = 16'b0000000000100000;
assign b1 = 16'b0000000000100000;
assign b2 = 16'b0000000000100000;
assign b3 = 16'b0000000000100000;

//Module instantiation (D-FF) 
DFF dff1 (Clk, 1'b0, In, Q1);
DFF dff2 (Clk, 1'b0, Q1, Q2);
DFF dff3 (Clk, 1'b0, Q2, Q3);

//Multiplications of co-efficents
assign MUL0 = b0*In;
assign MUL1 = b1*Q1;
assign MUL2 = b2*Q2;
assign MUL3 = b3*Q3;

//Addition operation for getting result
assign Add = MUL0 + MUL1 + MUL2 + MUL3;

// giving add_out to Out
always@ (posedge Clk)
Out <= Add;

// end module
endmodule


// D-FF module

module DFF(clk, reset, D, Q);

// Input and output decleration
input clk, reset;
input [15:0] D;
output reg [15:0] Q;

// (logic)
always@(posedge clk, posedge reset)
begin
    if (reset)
    Q <= 0;
    else
    Q <= D;
end

// end module
endmodule



// Test bench
module TB();

parameter address = 5;

// reg and wire decleration 
reg Clk;
reg [15:0] In; 
wire [15:0] Out;

reg [address-1:0] addr;
reg [15:0] ram [0:63];

// Clk generation
initial
Clk = 0;

always
#5 Clk =~Clk;

// Generate RAM Addresses
initial
addr=0;
always
#10 addr = addr+1;

// Read data file and assign data to memory
initial begin
$readmemb("H:/MATLAB/Noised.data",ram);
end
// Assign memory data to the Input of the filter
always @(posedge Clk)
begin
In <= ram[addr];
end
// Instantiate the UDP
FIR_Filter inst1(Clk, In, Out);
endmodule
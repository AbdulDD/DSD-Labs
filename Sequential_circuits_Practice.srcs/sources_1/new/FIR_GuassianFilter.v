`timescale 1ns / 1ps

module FIR_Guassian_LowPass_Filter(data_out, data_in, clk, reset);
// Filter order and wordsize
parameter order = 8;
parameter wordsize = 16;
// Filter coefficients
parameter b0 = 3;
parameter b1 = 11;
parameter b2 = 29;
parameter b3 = 53;
parameter b4 = 64;
parameter b5 = 53;
parameter b6 = 29;
parameter b7 = 11;
parameter b8 = 3;
// ports and memory
input [wordsize-1:0] data_in;
output [wordsize-1:0] data_out;
input clk, reset;
reg [wordsize-1:0] samples [1:order];
integer k;
// Difference Equation
assign data_out = b0*data_in +
b1*samples[1]+
b2*samples[2]+
b3*samples[3]+
b4*samples[4]+
b5*samples[5]+
b6*samples[6]+
b7*samples[7]+
b8*samples[8];
// Synchronization, reset and shifting

always@(posedge clk)
begin
if (reset) begin
for(k=1; k<=order; k=k+1)
samples[k] <= 0;
end
else begin
samples[1] <= data_in;
for(k=2; k<=order; k=k+1)
samples[k] <= samples[k-1];
end
end
endmodule





module FIR_Guassian_LowPass_Filter_tb;
parameter N = 16;
parameter address = 5;
// Inputs
reg Clk, reset;
reg [address-1:0] addr;
reg [N-1:0] Xin;
reg [N-1:0] ram [0:31];
// Outputs
wire [N-1:0] Yout;
FIR_Guassian_LowPass_Filter inst0(.data_out(Yout), .data_in(Xin), .clk(Clk), .reset(reset));
//Generate a clock with 10 ns clock period.
initial
Clk = 0;
always
#5 Clk =~Clk;
// Generate RAM Addresses
initial
addr=0;
always
#10 addr = addr+1;
// generate reset signal
initial
begin
reset = 0;
@( negedge Clk);
reset = 1;
@( negedge Clk);
reset = 0;
end
// amend the file link accodingly
initial
begin
$readmemb("H:/MATLAB/Data.data", ram);
end
endmodule
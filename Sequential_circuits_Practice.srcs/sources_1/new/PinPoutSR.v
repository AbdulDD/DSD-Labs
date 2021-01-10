`timescale 1ns / 1ps

module PinPoutSR(Clk, R, PI, PO);

input Clk, R;
input [3:0]PI;
output reg [3:0]PO;

always@(posedge Clk, R)
begin
    
    if (R)
    PO <= 0;
    else
    PO <= PI;
    
end


endmodule



/*
module TB;


reg Clk, R;
reg [3:0]PI;
wire [3:0]PO;

initial
begin
PI = 0;
Clk = 0;
end


always
#10 Clk = ~Clk;

initial
begin
    R=1;
    @(negedge Clk) R=0; 
    @(negedge Clk)  PI = 4'b1011;
    repeat(4) @(negedge Clk) PI = 4'b1111;
    
    $finish;
end

PinPoutSR SR1(Clk, R, PI, PO);

endmodule
*/

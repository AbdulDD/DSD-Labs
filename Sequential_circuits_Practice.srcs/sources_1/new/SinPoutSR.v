`timescale 1ns / 1ps

module SinPoutSR(Clk, R, SI, PO);

input Clk, R;
input SI;
output [3:0]PO;
reg [3:0]reg_state;

always@(posedge Clk, R)
begin
    
    if (R)
    reg_state <= 0;
    else
    reg_state[0] <= SI;
    reg_state[1] <= reg_state[0];
    reg_state[2] <= reg_state[1];
    reg_state[3] <= reg_state[2];
    
end

assign PO = reg_state;

endmodule



/*
module SinPoutSRTB;

reg Clk, R;
reg SI;
wire [3:0]PO;

initial

Clk = 0;


always
#10 Clk = ~Clk;

initial
begin
    R=1;
    @(negedge Clk) R=0; SI=1;
    @(negedge Clk) SI=0;
    @(negedge Clk) SI=1;
    @(negedge Clk) SI=0;
    @(negedge Clk) 
    
    $finish;
end

SinPoutSR SR1(Clk, R, SI, PO);

endmodule
*/
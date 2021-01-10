`timescale 1ns / 1ps                // Compiler /simulation directive

module JK_Flipflop(J, K, Clk, R, S, PI, PO, Q);

input J, K, Clk, R, S;
input [3:0]PI;
output reg Q;
output [3:0]PO;

// procedural statement (always construct)

always @(posedge Clk, posedge R)
begin
    if (R == 0)
    case ({J,K})
        2'b00 : begin Q <= Q; end
        2'b01 : begin Q <= 0; end
        2'b10 : begin Q <= 1; end
        2'b11 : begin Q <= ~Q; end
        
        endcase
    
    else
    Q <=0;
end

USRIC IC1(Clk, R, J, K, PI, S, PO, Q);

// end module
endmodule


module TB();

reg J, K, Clk, R, S;
reg [3:0]PI; 
wire Q;
wire [3:0]PO;


//Clk gneration
initial
begin
Clk=0;
R=0;
end

always 
#10 Clk =~Clk;
// procedural statement (initial construct)
initial
begin
    
    @(negedge Clk) {J,K}= 2'b10; S=1;
    @(negedge Clk) {J,K}= 2'b00; 
    @(negedge Clk) {J,K}= 2'b01;
    @(negedge Clk) {J,K}= 2'b10; 
    @(negedge Clk) {J,K}= 2'b10;  R=0; 
    @(negedge Clk) {J,K}= 2'b11;  R=0;
    @(negedge Clk) {J,K}= 2'b10;
    
    
    @(negedge Clk) S=0;
    @(negedge Clk) PI = 4'b1011;
    @(negedge Clk)
    
    #10 $finish;              // System directive 
end

// module instantiation
JK_Flipflop FF1(J, K, Clk, R, S, PI, PO, Q);

// end module
endmodule

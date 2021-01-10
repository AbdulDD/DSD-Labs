`timescale 1ns / 1ps                // Compiler /simulation directive

module JK_Flipflop(Clk, R, J, K, PI, S, PO, Q);

input J, K, Clk, R, S;
input [3:0]PI;
output [3:0]PO;
output reg Q;

// procedural statement (always construct)

always @(posedge Clk, R)
begin
    case ({J,K})
    2'b00 : begin Q = Q; end
    2'b01 : begin Q = 0; end
    2'b10 : begin Q = 1; end
    2'b11 : begin Q = ~Q; end
    
    endcase
end

//USRIC USRIC1(Clk, R, J, K, PI, S, PO, Q);
// end module
endmodule


module TB();

reg Clk, R, J, K, S;
reg [3:0]PI;
wire Q;
wire [3:0]PO;

// procedural statement (initial construct)
initial
begin

PI = 0;
Clk = 0;

end

always
#10 Clk = ~Clk;

// logic Procedural statement (initial construct)
initial
begin

    // logic for parrallel in parrallel out
    /*
    R=1;
    @(negedge Clk) R=0; S=0;
    @(negedge Clk)  PI[3:0] = 3; // {J,K}= 2'b11;
    repeat(2) @(negedge Clk) PI = 4'b1111;
    */
    // logic for serial in parrallel out
    R=1;
    @(negedge Clk) R=0; 
    @(negedge Clk) S=1; {J,K}= 2'b01;  
    @(negedge Clk) 
    @(negedge Clk) {J,K}= 2'b11;
    @(negedge Clk) 
    @(negedge Clk) 
    @(negedge Clk)
    @(negedge Clk)
    
    $finish;                                    // system directive
end
// module instantiation
JK_Flipflop FF1(J, K, Clk, R, S, PI, PO, Q);

// end module
endmodule

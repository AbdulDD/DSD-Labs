`timescale 1ns / 1ps                // Compiler /simulation directive

module JK_Flipflop(input J, K, Clk, output reg Q);

// procedural statement (always construct)

always @(posedge Clk)
begin
    case ({J,K})
    2'b00 : begin Q = Q; end
    2'b01 : begin Q = 0; end
    2'b10 : begin Q = 1; end
    2'b11 : begin Q = ~Q; end
    
    endcase
end

// end module
endmodule

/*
module TB();

reg J, K, Clk;
wire Q;

// procedural statement (initial construct)
initial
begin
    #00 {J,K}= 2'b00;   Clk= 1'b1;
    #10 {J,K}= 2'b01;   Clk= 1'b0;
    #10 {J,K}= 2'b10;   Clk= 1'b1;
    #10 {J,K}= 2'b11;   Clk= 1'b1;
    #10 $stop;              // System directive 
end

// module instantiation
JK_Flipflop FF1(J, K, Clk, Q);

// end module
endmodule
*/
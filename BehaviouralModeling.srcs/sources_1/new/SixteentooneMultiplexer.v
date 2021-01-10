`timescale 1ns / 1ps            // Compilation/simulation directive

// module start
//NOTE: In behavioural modeling output is always reg
module SixteentooneMultiplexer(input [3:0]S, [15:0]D, output reg Y);

// Procedural statement (always construct)

always @(*)
begin
    
    case (S)
    
    0 : Y = D[0];
    1 : Y = D[1];
    2 : Y = D[2];
    3 : Y = D[3];
    4 : Y = D[4];
    5 : Y = D[5];
    6 : Y = D[6];
    7 : Y = D[7];
    8 : Y = D[8];
    9 : Y = D[9];
    10 : Y = D[10];
    11 : Y = D[11];
    12 : Y = D[12];
    13 : Y = D[13];
    14 : Y = D[14];
    15 : Y = D[15];
    default : Y = 1'bz;
    
    endcase
end

endmodule





// Test bench
module TB();

//reg and wire
reg [3:0] S;
reg [15:0] D;
wire Y;

// Procedural statement (initial constrct)
initial
begin
    #00 S= 4'b0000; D= 15'b0000_0000_0000_0001;
    #10 S= 4'b0001; D= 15'b0000_0000_0000_0010;
    #10 S= 4'b0010; D= 15'b0000_0000_0000_0100;
    #10 S= 4'b0011; D= 15'b0000_0000_0000_1000;
    #10 S= 4'b0100; D= 15'b0000_0000_0001_0000;
    #10 S= 4'b0101; D= 15'b0000_0000_0010_0000;
    #10 S= 4'b0110; D= 15'b0000_0000_0100_0000;
    #10 S= 4'b0111; D= 15'b0000_0000_1000_0000;
    #10 S= 4'b1000; D= 15'b0000_0001_0000_0000;
    #10 S= 4'b1001; D= 15'b0000_0010_0000_0000;
    #10 S= 4'b1010; D= 15'b0000_0100_0000_0000;
    #10 S= 4'b1011; D= 15'b0000_1000_0000_0000;
    #10 S= 4'b1100; D= 15'b0001_0000_0000_0000;
    #10 S= 4'b1101; D= 15'b0010_0000_0000_0000;
    #10 S= 4'b1110; D= 15'b0100_0000_0000_0000;
    #10 S= 4'b1111; D= 15'b1000_0000_0000_0000;
    #10 $stop;
    
end

// module instantiation
SixteentooneMultiplexer SOM1(S, D, Y);

// end module
endmodule
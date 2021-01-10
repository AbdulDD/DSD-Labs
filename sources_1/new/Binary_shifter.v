`timescale 1ns / 1ps                //  Compiler/simulation directive

module Binary_shifter(input [3:0] D, output [3:0] S0, S1, S2, S3);

//assign statement
assign S0 = D << 1;
assign S1 = D << 2;
assign S2 = D << 3;
assign S3 = D << 4;

// end module
endmodule


module TB();

// reg and wire
reg [3:0] D; 
wire [3:0] S0, S1, S2, S3;

// procedural statement (initial construct)
initial
begin
    #00 D = 4'b0001;
    #10 $stop;
end

// module instantiation
Binary_shifter BS1(D, S0, S1, S2, S3);

// end module
endmodule
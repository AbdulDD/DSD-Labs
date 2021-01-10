`timescale 1ns / 1ps                    // Compiler/Simulation Directive

module FourbitComparator(input [3:0] A, [3:0] B, output A_gt_B, A_et_B, A_lt_B);

// assign statement
assign A_gt_B = (A > B);
assign A_lt_B = (A < B);
assign A_et_B = (A == B);

// end module
endmodule


module TB();

// reg and wire
reg [3:0] A, B;
wire A_gt_B, A_et_B, A_lt_B;

// procedural statement (initial construct)
initial
begin
    #00 A=4'b0000; B=4'b0000;
    #10 A=4'b0100; B=4'b0001;
    #10 A=4'b1000; B=4'b0011;
    #10 A=4'b0001; B=4'b1100;
    #10 A=4'b0110; B=4'b1101;
    #10 A=4'b1000; B=4'b0011;
    #10 A=4'b1101; B=4'b00011;
    #10 $stop;
end

// module instantiation
FourbitComparator C1(A, B, A_gt_B, A_et_B, A_lt_B);

// end module
endmodule
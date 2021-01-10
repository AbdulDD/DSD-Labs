`timescale 1ns / 1ps                // Compiler/simulation directive

// Start module
module Comparator(input A, B, output reg A_gt_B, A_et_B, A_lt_B);

// Prosedural statement (Always construct)
// Method 1 by if else
/*
always @ (*)
begin
    if ((A==0 && B==0) || (A==1 && B==1))
        begin 
        A_et_B = 1; A_gt_B = 0; A_lt_B = 0;
        end
    else if (A==1 && B==0)
        begin
        A_et_B = 0; A_gt_B = 1; A_lt_B = 0;
        end
    else if (A==0 && B==1)
        begin
        A_et_B = 0; A_gt_B = 0; A_lt_B = 1;
        end
end
*/


// Method 2 by case structure
always @ (*)
begin
    case ({A,B})
    2'b00 : begin A_et_B = 1; A_gt_B = 0; A_lt_B = 0; end
    2'b01 : begin A_et_B = 0; A_gt_B = 0; A_lt_B = 1; end
    2'b10 : begin A_et_B = 0; A_gt_B = 1; A_lt_B = 0; end
    2'b11 : begin A_et_B = 1; A_gt_B = 0; A_lt_B = 0; end
    default : A_et_B=0;
    endcase
end

// end module
endmodule


module TB();

// reg and wire
reg A, B;
wire A_gt_B, A_et_B, A_lt_B;

// Procedural statement (initial statement)
initial
begin
    #00 A=0; B=0;
    #10 A=0; B=1;
    #10 A=1; B=0;
    #10 A=1; B=1;
    #10 $stop; 
end

// module instantiation
Comparator C1(A, B, A_gt_B, A_et_B, A_lt_B);

// end module
endmodule
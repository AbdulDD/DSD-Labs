`timescale 1ns / 1ps                        // compler/simulator directive

// start module
module Sequence_detecter_MealySM(Clk, R, In, Out);

// input and output decleration
input Clk, R, In;
output reg Out;

// Internal registers
reg [1:0] Current_State, Next_State;

// logic
// Current state logic
always @(posedge Clk, posedge R)
begin
    if (R)
        Current_State<=0;
    else
        Current_State<=Next_State;
end


// Output logic
always @ (Current_State, In)
begin
    if(R)
        Out = 0;
    else if(Current_State == 2'b10 && In == 1'b1)
        Out = 1;
    else 
        Out = 0;
end


// Next state logic
always @(Current_State, In)
begin
    Next_State=0;
    case(Current_State)
        2'b00:
            if(In) 
                Next_State = 2'b01;
            else 
                Next_State = 2'b00;
        
        2'b01:
            if(In) 
                Next_State = 2'b10;
            else 
                Next_State = 2'b00;

        2'b10:
            if(In) 
                Next_State = 2'b00;
            else 
                Next_State = 2'b00;
    endcase
end

// end module
endmodule



//// test bench
//module TB();

//// reg and wire decleration
//reg Clk, R, In;
//wire Out;

////clk generation
//initial
//Clk=0;

//always
//#5 Clk = ~Clk;

//// procedural statements
//initial
//begin
    
//    R=1;
//    @ (negedge Clk) R=1;
//    @ (negedge Clk) R=0;
//    @ (negedge Clk) In=1;
//    @ (negedge Clk) In=1;
//    repeat (6) @ (negedge Clk) In=0;
//    repeat (5) @ (negedge Clk) In=1;
//    repeat (2) @ (negedge Clk) In=0;
//    repeat (2) @ (negedge Clk) In=1;
//    @ (negedge Clk) In=1; R=1;
    
//    $finish;
//end

//// Module instantiation
//Sequence_detecter_MealySM MSM1(Clk, R, In, Out);

//// end module
//endmodule
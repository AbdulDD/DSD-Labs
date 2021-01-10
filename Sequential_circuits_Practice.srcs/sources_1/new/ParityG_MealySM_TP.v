`timescale 1ns / 1ps                        // Complier/simulator Directive

//Start Module 
module ParityG_MealySM_TP(Clk, R, In, ParityB);

// Input and output decleration
input Clk, R, In;
output reg ParityB;

// Internal registers
reg Current_State, Next_State;

// Logic (Mealy SM (3 Process))

// Current state logic (Always Construct)
always @ (posedge Clk, posedge R)
begin
    
    if(R)
    Current_State <= 0;
    else 
    Current_State <= Next_State;
    
end


// Output logic (always construct)
always @ (Current_State, In)
//always @ (Current_State)
begin
    
    case (Current_State)
        0 : 
        begin
            if (In)
            ParityB = 1;
            else
            ParityB = 0;
        end
        1 :
        begin
            if (In)
            ParityB = 0;
            else
            ParityB = 1;
        end
    endcase
    
end


// Next state logic
always @ (Current_State, In)
begin
    
    Next_State = 0;
    case(Current_State)
        0: 
        begin
            if (In)
            Next_State = 1;
        end
        1 :
        begin
            if (!In)
            Next_State = 1;
        end
    endcase
end

// End module
endmodule





// start Testbench
module TB();

// reg and wire decleration
reg Clk, R, In;
wire ParityB;

// Clk generation
initial
Clk=0;

always
#5 Clk = ~Clk;

// procedural statements
initial
begin
    
    R=1;
    @ (negedge Clk) R=0; In=0;
    @ (negedge Clk) In=1;
    @ (negedge Clk) In=0;
    @ (negedge Clk) In=0;
    @ (negedge Clk) In=1;
    repeat (2) @ (negedge Clk)
    
    $finish;
end

// Module instantiation
ParityG_MealySM_TP MSM1(Clk, R, In, ParityB);

// end module
endmodule
`timescale 1ns / 1ps                        // Compiler/Simulator Directive

// StartModule
module ParityC_MooreSM(Clk, R, In, ParityB);

// Input and output decleration
input Clk, R, In;
output reg ParityB;

// internal registers
reg Current_State, Next_State;

// Logic: Moore SM

//Current State logic (Sequencial logic)
always @ (posedge Clk, posedge R)
begin
    
    if (R)
    Current_State <=0;
    else
    Current_State <= Next_State;
end


//Output logic (Combinational logic)
always @ (Current_State)
begin
    ParityB=0;
    case(Current_State)
        0: ParityB=0;
        1: ParityB=1;
    endcase
end


// Next State logic (Combintional logic)
always @ (Current_State, In)
begin
    
    Next_State=0;
    case(Current_State)
        0:
        begin
            if (In)
            Next_State = 1;
        end
        1:
        begin
            if (!In)
            Next_State = 1;
        end
    endcase
end

// module end
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
    @ (negedge Clk) In=1;
    @ (negedge Clk) In=0;
    @ (negedge Clk) In=0;
    @ (negedge Clk) In=1;
    repeat (2) @ (negedge Clk)
    
    $finish;
end

// Module instantiation
ParityC_MooreSM MSM1(Clk, R, In, ParityB);

// end module
endmodule
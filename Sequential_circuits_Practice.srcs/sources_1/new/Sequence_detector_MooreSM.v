//TASK:
//Design a sequence detector implementing a Moore state machine using three always blocks.
//The Moore state machine has two inputs (ain[1:0]) and one output (yout).
//The output yout begins as 0 and remains a constant value unless one of the following input sequences occurs:
//(i) The input sequence ain[1:0] = 01, 00 causes the output to become 0
//(ii) The input sequence ain[1:0] = 11, 00 causes the output to become 1
//(iii) The input sequence ain[1:0] = 10, 00 causes the output to toggle.
//Develop a testbench (similar to the waveform shown below) and verify the model through a behavioral simulation.
//Use SW15 as the clock input, SW1- SW0 as the ain[1:0] input, the BTNU button as reset input to the circuit, and LED0 
//as the yout output. Go through the design flow, generate the bitstream, and download it into the Nexys4 DDR board.
//Verify the functionality.


`timescale 1ns / 1ps                    // Compiler/simulator directive

// Module Start
module Sequence_detector_MooreSM(Clk, R, In, Out);

// input and output decleration
input Clk, R;
input [1:0] In;
output reg Out;

// parameter (States)
parameter S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6;

// Intenal registers
reg Current_State, Next_State;

// Logic

// Current state logic (sequencial logic)
always @ (posedge Clk, posedge R)
begin
    
    if (R)
    Current_State <=0;
    else
    Current_State <= Next_State;
end


// Output logic (Combinaitonal circuit)
always @ (Current_State)
begin
        Out=0;
    case (Current_State)
        S0: Out=0;
        S1: Out=0;
        S2: Out=0;
        S3: Out=0;
        S4: Out=1;
        S5: Out=0;
        S6: Out=~Out;
        
//        //default Out=0;
    endcase
    
//    assign Out = (Current_State == 2'b10) ? 0 : ( (Current_State == 5) ? 1 : ( (Current_State == 6) ? (~Out) : (Out) ) );
    
end


// Next state logic
always @ (Current_State, In)
begin
    
        Next_State=S0;
    case (Current_State)
        S0:
        begin
            case (In)
                2'b00 : Next_State=S0;
                2'b01 : Next_State=S1;
                2'b10 : Next_State=S5;
                2'b11 : Next_State=S3;
            endcase
        end
        S1:
        begin
            case (In)
                2'b00 : Next_State=S2;
                2'b01 : Next_State=S1;
                2'b10 : Next_State=S5;
                2'b11 : Next_State=S3;
            endcase
        end
        S2:
        begin
            case (In)
                2'b00 : Next_State=S0;
                2'b01 : Next_State=S1;
                2'b10 : Next_State=S5;
                2'b11 : Next_State=S3;
            endcase
        end
        S3:
        begin
            case (In)
                2'b00 : Next_State=S4;
                2'b01 : Next_State=S1;
                2'b10 : Next_State=S5;
                2'b11 : Next_State=S3;
            endcase
        end
        S4:
        begin
            case (In)
                2'b00 : Next_State=S0;
                2'b01 : Next_State=S1;
                2'b10 : Next_State=S5;
                2'b11 : Next_State=S3;
            endcase
        end
        S5:
        begin
            case (In)
                2'b00 : Next_State=S6;
                2'b01 : Next_State=S1;
                2'b10 : Next_State=S5;
                2'b11 : Next_State=S3;
            endcase
        end
        S6:
        begin
            case (In)
                2'b00 : Next_State=S0;
                2'b01 : Next_State=S1;
                2'b10 : Next_State=S5;
                2'b11 : Next_State=S3;
            endcase
        end
    endcase
end
// End Module
endmodule







// start Testbench
module TB();

// reg and wire decleration
reg Clk, R;
reg [1:0] In;
wire Out;

// Clk generation
initial
Clk=0;

always
#5 Clk = ~Clk;

// procedural statements
initial
begin
    
    R=1;
    @ (negedge Clk) R=0;
    @ (negedge Clk) In=2'b10;
    @ (negedge Clk) In=2'b00;
    repeat (2) @ (negedge Clk)
    @ (negedge Clk) In=2'b11;
    @ (negedge Clk) In=2'b01;
    @ (negedge Clk) In=2'b00;
    @ (negedge Clk) In=2'b11;
    @ (negedge Clk) In=2'b00;
    @ (negedge Clk) In=2'b11;
    @ (negedge Clk) In=2'b00;
    repeat (2) @ (negedge Clk)
    
    $finish;
end

// Module instantiation
Sequence_detector_MooreSM MSM1(Clk, R, In, Out);

// end module
endmodule
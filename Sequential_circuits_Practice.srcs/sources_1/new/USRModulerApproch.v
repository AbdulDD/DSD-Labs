
`timescale 1ns / 1ps

module USRModulerApproach(Clk, R, S, PI, SI, PO);   // Module start

// decleration of input & outputs
input Clk, R, SI, S;
input [3:0] PI;
output reg [3:0] PO;
reg [3:0]reg_state;

// Logic Prosedural assignment (always construct)
always@ (posedge Clk, posedge R)
begin
    
    if (R)                                          // Checking Reset
    PO <= 0;
    else if (S == 0)                                // Chcking Shift/control input
            begin
         
            // parrallel in parrallel out logic
            PO <= PI;                                  
            end
         
         else
            begin
         
            // srial in parrallel out logic
            reg_state[0] <= SI;                        
            reg_state[1] <= reg_state[0];
            reg_state[2] <= reg_state[1];
            reg_state[3] <= reg_state[2];
         
            PO = reg_state;
            end
end

// end module
endmodule


/*
module TB;          // Module start

// decleration of REG and WIRE
reg Clk, R, S;
reg [3:0]PI;
reg SI;
wire [3:0]PO;

// setting initial conditions
initial
begin
PI = 0;

SI = 0;
Clk = 0;
end

// Cllk generation
always
#10 Clk = ~Clk;


// logic Procedural statement (initial construct)
initial
begin

    // logic for parrallel in parrallel out
    R=1;
    @(negedge Clk) R=0; S=0;
    @(negedge Clk)  PI = 4'b1011;
    repeat(2) @(negedge Clk) PI = 4'b1111;
    
    // logic for serial in parrallel out
    R=1;
    @(negedge Clk) R=0; S=1; SI=1;
    @(negedge Clk) SI=0;
    @(negedge Clk) SI=1;
    @(negedge Clk) SI=0;
    @(negedge Clk) 
    @(negedge Clk) 
    
    $finish;                                    // system directive
end

// module instantiation
USRModulerApproach USRMA1(Clk, R, S, PI, SI, PO);

endmodule

*/

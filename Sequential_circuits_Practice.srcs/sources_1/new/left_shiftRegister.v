// Synchronus 4-bit left shift register

`timescale 1ns / 1ps                                                // Simulation/compiler directive

module left_shiftRegister(input Clk, R, Din, output reg Dout);


// reg generation
reg [2:0]Q;

// logic
always@ (posedge Clk, R)
begin
    if (R)
    {Q[2:0], Dout} <= {0};
    else
    {Dout, Q[2:0]} <= {Q[2:0], Din};
    
end

endmodule



module TB;

// decleration of reg & wire
reg Clk, R, Din; 
wire Dout;

// Initial condition
initial
Clk=0;

// clk generation
always
#10 Clk = ~ Clk;

initial
begin
    
    // all Reg are reset
    R=1; Din=1;
    @(negedge Clk) R=0;
    
    // inputs applied
    @(negedge Clk) Din=1;
    @(negedge Clk) Din=0;
    repeat(4) @(negedge Clk) 
    
    $finish;
    
end


// module instantiation
 left_shiftRegister LSR1(Clk, R, Din, Dout);



endmodule




`timescale 1ns / 1ps                            // Compilation/Simulation directive

module Half_adder_testbench();

// Defining reg and wire
reg A, B;
wire Carry, Sum;

// Signal generation
// initial construct
initial 
begin

    #00 A=0; B=0;               // #00 shows time. it means this condition will run at 0 sec.
    #10 A=0; B=1;               // this condition will run at 10 sec.
    #10 A=1; B=0;               // this condition will run at 20 sec.
    #10 A=1; B=1;               // this condition will run at 30 sec.
    #10 $stop;
    
end

// Instantiation statement: this statement is used to call some sub design or design 
//in other design or testbench
// Syntex: modulename referencename (arguments);
Half_adder HA1(Carry, Sum, A, B);

// end module
endmodule

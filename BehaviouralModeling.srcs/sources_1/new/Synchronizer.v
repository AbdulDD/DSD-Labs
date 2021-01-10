`timescale 1ns / 1ps                            // Compiler/simulation directive

module Synchronizer(input Asynchronizedclk, Embeddedclk, output reg Synchronizedclk);

// Procedural statement (Always construct)
always @(negedge Embeddedclk)
begin
    if (Asynchronizedclk == 0)
        begin Synchronizedclk <= 0; end
    else if (Asynchronizedclk == 1)
        begin Synchronizedclk <= 1; end
end

// end module
endmodule


module TB();

reg Asynchronizedclk, Embeddedclk;
wire Synchronizedclk;

// procedural statement (initial construct)
initial
begin
    #00 Asynchronizedclk = 1; Embeddedclk=0;
    #10 Asynchronizedclk = 1; Embeddedclk=1;
    #10 Asynchronizedclk = 1; Embeddedclk=0;
    #10 Asynchronizedclk = 1; Embeddedclk=1;
    #10 Asynchronizedclk = 1; Embeddedclk=0;
    #10 Asynchronizedclk = 0; Embeddedclk=1;
    #10 Asynchronizedclk = 0; Embeddedclk=0;
    #10 Asynchronizedclk = 1; Embeddedclk=1;
    #10 $stop;
    
    
end

// module instantiation
Synchronizer S1(Asynchronizedclk, Embeddedclk, Synchronizedclk);
endmodule
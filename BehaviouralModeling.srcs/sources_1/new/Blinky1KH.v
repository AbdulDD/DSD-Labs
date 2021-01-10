`timescale 1ns / 1ps


module Blinky_1Hz(Clk, clock_out);
 input Clk; // System clock
 output clock_out; // Low-frequency clock
 reg [31:0] counter_out; // register for storing values
 reg clock_out; // register buffer for output port

 initial begin
    counter_out<=32'h00000000; // 0 in Hexadecimal format
    clock_out<=0;
 end
 
 //this always block runs on the fast 100MHz clock
 always @(posedge Clk)
 begin
    counter_out<=counter_out + 32'h00000001; // Adding one at every clock pulse
    if (counter_out>32'h5F5E100) // If count value reaches to 100000000 = 10^8
    begin
        counter_out<=32'h00000000; // reset the counter
        clock_out <= ~clock_out; // and invert the clock pulse level
    end
 end
 

endmodule

// Gate level Hirarical modeling

`timescale 1ns / 1ps                            // Compilation/Simulation directive

module FA_using_HA(Carry, Sum, Cin, A, B);

// declearing inputs and outputs
input A, B, Cin;
output Carry, Sum;

wire S1, C1, C2;

// logic (instantiation statemnet)
Half_adder HA1(C1, S1, A, B);
Half_adder HA2(C2, Sum, S1, Cin);
or(Carry, C1, C2);

endmodule



/*
module TB();

reg A, B, Cin;
wire Carry, Sum;

// Initial construct
initial
begin
    
        #00 Cin=0; A=0; B=0;               // #00 shows time. it means this condition will run at 0 sec.
        #10 Cin=1; A=1; B=1;               // this condition will run at 10 sec.
        #10 Cin=0; A=1; B=0;               // this condition will run at 20 sec.
        #10 Cin=1; A=0; B=1;               // this condition will run at 30 sec.
        #10 $stop;

end

// Instantiation
FA_using_HA FA1(Carry, Sum, A, B, Cin);

endmodule
*/

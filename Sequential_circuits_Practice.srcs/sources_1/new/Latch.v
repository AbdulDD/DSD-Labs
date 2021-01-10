// latch design using gate level modelling

`timescale 1ns / 1ps                            // Compiler/simulation directive

module Latch(input S, R, output Q, Qbar);

nor(Q, S, Qbar);
nor(Qbar, R, Q);

endmodule


module TB();

reg S, R;
wire Q, Qbar;

// logic (procedural assingment)
initial
begin
    
    # 00 S=0; R=0;
    # 10 S=0; R=1;
    # 10 S=1; R=0;
    # 10 S=1; R=1;
    # 10 $stop;
end

// module instantiation
Latch L1(S, R, Q, Qbar);

endmodule
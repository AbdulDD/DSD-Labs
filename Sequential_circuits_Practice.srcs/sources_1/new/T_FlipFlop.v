`timescale 1ns / 1ps

module T_FlipFlop(Clk, R, T, Q);

// input and output decleration
input Clk, R, T;
output reg Q;

// logic
always @(posedge Clk, posedge R)
begin
    if (R)
        Q<=0;
    else
        if (T)
            Q<= ~Q;
        else
            Q<= Q;
end

endmodule


//module TB();

//// reg and wire decleration
//reg Clk, R, T;
//wire Q;

//// clk initial condition
//initial
//Clk =0;

//// Clk generation
//always
//#5 Clk = ~Clk;

//// logic
//initial
//begin
//    R=1;
//    @ (negedge Clk) R=0;
//    @ (negedge Clk) T=0;
//    @ (negedge Clk) T=1;
//    @ (negedge Clk) T=1;
//    @ (negedge Clk) T=0;
//    $finish;
//end

////module instantiation
//T_FlipFlop TFF1(Clk, R, T, Q);

//endmodule
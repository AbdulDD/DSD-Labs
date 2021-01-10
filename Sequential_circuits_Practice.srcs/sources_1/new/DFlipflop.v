`timescale 1ns / 1ps

module DFlipflop(Clk, R, D, Q, IQ);

// input and output decleration
input Clk, R, D;
output reg Q, IQ;

//logic
always@ (posedge Clk, posedge R)
begin

    if (R)
        begin
        Q <=0;
        assign IQ = ~Q;
        end
    else
        begin
        Q <=D;
        assign IQ = ~Q;
        end

    /*
    Q = (R) ? (0):(D);
    InQ <= ~Q;
    */
end 
    

endmodule
















//module TB;


//reg Clk, D, R;
//wire Q, InQ;

//initial
//begin
//    Clk=0;
//    R=0;
//    D=0;
//end  
//    always
//    #10 Clk = ~Clk;


//initial
//begin
    
    
//    @(negedge Clk); D=1;
//    @(negedge Clk); D=0;
//    @(negedge Clk); D=1;
//    @(negedge Clk); D=1;
//    @(negedge Clk); R=1;
//    repeat(2) @(negedge Clk);   // cpmpiler directive
//    D=1;

//    $finish;            // system directive
   
//end

//// module instantiation
//DFlipflop DFF1(Clk, R, D, Q, InQ);

//endmodule



`timescale 1ns / 1ps

module Para_shift_register(Clk, reset, S_In, S_Out);



input Clk, reset, S_In;
output reg S_Out;

// Internal registers 
 reg [2:0] q;

always@(posedge Clk, posedge reset)
begin
    if (reset) 
    {S_Out, q[2:0]} <= 0;
//    begin
//        q [0] <= 0;     
//        q [1] <= 0;
//        q [2] <= 0;
//        S_Out <= 0; end
    else 
    {S_Out, q[2:0]} <= {q[2:0],S_In};
//    begin
//        q [0] <= S_In; 
//        q [1] <= q[0];
//        q [2] <= q[1];
//        S_Out <= q[2]; end
    
end 

endmodule



module TB;


reg Clk, reset, S_In;
wire S_Out;


Para_shift_register inst0(Clk, reset, S_In, S_Out);

initial
Clk=0;
always
#10 Clk = ~ Clk;

initial
begin
    reset = 1; S_In = 1;
    @(negedge Clk); reset = 0;
    
    @(negedge Clk); S_In = 1;
    @(negedge Clk); S_In = 0;

    repeat(4) @(negedge Clk);
    
    $finish;
      
end 

endmodule 
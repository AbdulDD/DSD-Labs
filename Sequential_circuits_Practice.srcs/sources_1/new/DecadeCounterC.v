`timescale 1ns / 1ps

module DecadeCounterC(Clk, R, En, Q);

input Clk, R, En;
output reg [9:0]Q;

//logic
always @(posedge Clk, R)
begin

    if(R)
    Q <=0;
    else if (En)
        begin
        Q[0] <=1;
        Q<= 9'b0000000010;
        Q[2]<=Q[1];
        Q[3]<=Q[2];
        Q[4]<=Q[3];
        Q[5]<=Q[4];
        Q[6]<=Q[5];
        Q[7]<=Q[6];
        Q[8]<=Q[7];
        Q[9]<=Q[8];
        end
         else
         Q<=0;

end

endmodule

module TB;

reg Clk, R, En;
wire [9:0]Q;

//logic
initial
Clk=0;


always
#10 Clk = ~Clk;

initial
begin
    R=1;
    @(negedge Clk) En=1; R=0;
    @(negedge Clk) En=1;
    @(negedge Clk)
    @(negedge Clk)
    @(negedge Clk)
    @(negedge Clk)
    @(negedge Clk) En=0;
    @(negedge Clk)
    @(negedge Clk)
    @(negedge Clk)
    
    $finish;
end
   // $monitor(Clk, R, En, Q);
    
DecadeCounterC C1(Clk, R, En, Q);

endmodule
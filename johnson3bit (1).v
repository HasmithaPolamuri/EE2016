module johnson3bit(Seven_Seg, in_clk, rst, digit,q);
    input in_clk, rst;
    output [7:0] Seven_Seg;
    output [3:0] digit;
    output q;    
    wire [2:0] q;
    wire out_clk;    
    clk_divider c0(in_clk,rst,out_clk);    
    decoder dec0(q,Seven_Seg);
    assign digit = 4'b0001;
    assign cntr = q;
    

dflipflop d2(q[2],~q[0],out_clk,rst);
dflipflop d1(q[1],q[2],out_clk,rst);
dflipflop d0(q[0],q[1],out_clk,rst);
    
endmodule
module clk_divider (input inClk, output reg outClk);
  reg [31:0] clockCount;
  parameter DIVISION_FACTOR = 5;
  initial 
  begin
  
    outClk = 1'b0;
    clockCount= 2'b0;
    end  
    
  always @( posedge inClk) begin
    
      clockCount <= clockCount + 1'b1;

      if (clockCount == DIVISION_FACTOR - 1) begin
        outClk <= ~outClk;
        
        clockCount <= 2'b0;
      
    end
  end
endmodule
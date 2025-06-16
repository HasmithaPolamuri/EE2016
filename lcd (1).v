`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 02:24:50 PM
// Design Name: 
// Module Name: lcd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lcd(in_Clk, lcd_rs, lcd_e, data);
    input in_Clk;
    output reg [7:0] data;
    output reg lcd_rs;
    output lcd_e;
    wire [7:0] command [0:4];
    reg [31:0] count=0;
    wire out_Clk;
    assign command [0] = 8'h38; // control signal to display on two lines
    assign command [1] = 8'h0C; // keep display on but cursor off
    assign command [2] = 8'h06; // increment the cursor
    assign command [3] = 8'h01; // clear the display
    assign command [4] = 8'hC0; // choose the second line
    clk_divider c0 (in_Clk,out_Clk);
    assign lcd_e = out_Clk;
    always@(posedge lcd_e) begin
        count = count+1;
        case(count)
            1: begin lcd_rs = 0; data = command[0]; end // fill in suitably
            2: begin lcd_rs = 0; data = command[1]; end
            3: begin lcd_rs = 0; data = command[2]; end
            4: begin lcd_rs = 0; data = command[3]; end
            5: begin lcd_rs = 0; data = command[4]; end
            6: begin lcd_rs = 1; data = 8'h31; end // fill in hex corresp to ASCII for 1
            7: begin lcd_rs = 1; data = 8'h32;end // 2
            8: begin lcd_rs = 1; data = 8'h33; end // 3
            9: begin lcd_rs = 1; data = 8'h34; end // 4
            10: begin lcd_rs = 1; data = 8'h35; end
            11: begin lcd_rs = 1; data = 8'h36; end
            12: begin lcd_rs = 1; data = 8'h37; end
            13: begin lcd_rs = 1; data = 8'h38; end
            14: begin lcd_rs = 1; data = 8'h39; end
            15: begin lcd_rs = 1; data = 8'h41; end
            16: begin lcd_rs = 1; data = 8'h42; end
            17: begin lcd_rs = 1; data = 8'h43; end
            18: begin lcd_rs = 1; data = 8'h44; end
            19: begin lcd_rs = 1; data = 8'h45; end // E
            20: begin lcd_rs = 1; data = 8'h46; end // F
            21: begin lcd_rs = 1; data = 8'h47; end // hex corresp to ASCII for G
            default: begin lcd_rs = 0; data = 8'h01; end
        // fill in hex value to return cursor to initial position
        endcase
    end
endmodule

module clk_divider (inClk,outClk);
    input inClk;
    
    output outClk;
    reg outClk = 1'b0;
    reg[25:0]clockCount = 25'd0 ;
    // declare a vector (of type reg) called clockCount of appropriate size
    always @(posedge inClk)
        begin
      
        
        // increment clockCount
        clockCount =clockCount +1;
        // determine an appropriate value v (by hand) and
        // check if clockCount has reached v
        if ( clockCount ==25'd25000000)
            begin
            clockCount = 0;
            outClk = ~ outClk ;
            end
        // to reset and negate outClk
        end
endmodule

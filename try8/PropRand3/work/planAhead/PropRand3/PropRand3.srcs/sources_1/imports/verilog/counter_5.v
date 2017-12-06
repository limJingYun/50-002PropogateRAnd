/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SIZE = 1
     DIV = 23
     TOP = 0
     UP = 1
*/
module counter_5 (
    input clk,
    input rst,
    output reg [0:0] value
  );
  
  localparam SIZE = 1'h1;
  localparam DIV = 5'h17;
  localparam TOP = 1'h0;
  localparam UP = 1'h1;
  
  
  reg [23:0] M_ctr_d, M_ctr_q = 1'h0;
  
  localparam MAX_VALUE = 24'h7fffff;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    value = M_ctr_q[23+0-:1];
    if (1'h1) begin
      M_ctr_d = M_ctr_q + 1'h1;
      if (1'h0 && M_ctr_q == 24'h7fffff) begin
        M_ctr_d = 1'h0;
      end
    end else begin
      M_ctr_d = M_ctr_q - 1'h1;
      if (1'h0 && M_ctr_q == 1'h0) begin
        M_ctr_d = 24'h7fffff;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
    end
  end
  
endmodule

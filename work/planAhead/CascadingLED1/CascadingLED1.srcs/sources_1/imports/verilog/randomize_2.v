/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module randomize_2 (
    input clk,
    input rst,
    input [1:0] rowNum,
    output reg [2:0] num
  );
  
  
  
  reg [31:0] M_seed_d, M_seed_q = 1'h0;
  localparam GENERATE_state = 1'd0;
  localparam REST_state = 1'd1;
  
  reg M_state_d, M_state_q = GENERATE_state;
  wire [32-1:0] M_pn_gen_num;
  reg [1-1:0] M_pn_gen_rst;
  reg [1-1:0] M_pn_gen_next;
  reg [32-1:0] M_pn_gen_seed;
  pn_gen_4 pn_gen (
    .clk(clk),
    .rst(M_pn_gen_rst),
    .next(M_pn_gen_next),
    .seed(M_pn_gen_seed),
    .num(M_pn_gen_num)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_seed_d = M_seed_q;
    
    M_pn_gen_seed = M_seed_q;
    M_pn_gen_next = 1'h1;
    num = M_pn_gen_num[0+2-:3];
    M_pn_gen_rst = rst;
    
    case (M_state_q)
      GENERATE_state: begin
        if (rowNum == 2'h3) begin
          M_pn_gen_next = 1'h1;
          M_state_d = REST_state;
          M_pn_gen_rst = 1'h1;
        end
      end
      REST_state: begin
        M_pn_gen_next = 1'h0;
        M_seed_d = M_seed_q + 1'h1;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_seed_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_seed_q <= M_seed_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg high1,
    output reg high2,
    output reg high3,
    output reg low1,
    output reg low2,
    output reg low3
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_slowclk_value;
  counter_2 slowclk (
    .clk(clk),
    .rst(rst),
    .value(M_slowclk_value)
  );
  
  wire [2-1:0] M_mypropogater_rowLit;
  wire [3-1:0] M_mypropogater_numOut;
  wire [1-1:0] M_mypropogater_row1;
  wire [1-1:0] M_mypropogater_row2;
  wire [1-1:0] M_mypropogater_row3;
  reg [3-1:0] M_mypropogater_num;
  propogate_3 mypropogater (
    .clk(M_slowclk_value),
    .rst(rst),
    .num(M_mypropogater_num),
    .rowLit(M_mypropogater_rowLit),
    .numOut(M_mypropogater_numOut),
    .row1(M_mypropogater_row1),
    .row2(M_mypropogater_row2),
    .row3(M_mypropogater_row3)
  );
  wire [3-1:0] M_myreg_out;
  reg [1-1:0] M_myreg_en;
  reg [3-1:0] M_myreg_data;
  register_4 myreg (
    .clk(M_slowclk_value),
    .rst(rst),
    .en(M_myreg_en),
    .data(M_myreg_data),
    .out(M_myreg_out)
  );
  reg [31:0] M_seed_d, M_seed_q = 32'h00000001;
  wire [32-1:0] M_pn_gen_num;
  reg [1-1:0] M_pn_gen_rst;
  reg [1-1:0] M_pn_gen_next;
  reg [32-1:0] M_pn_gen_seed;
  pn_gen_5 pn_gen (
    .clk(M_slowclk_value),
    .rst(M_pn_gen_rst),
    .next(M_pn_gen_next),
    .seed(M_pn_gen_seed),
    .num(M_pn_gen_num)
  );
  
  always @* begin
    M_seed_d = M_seed_q;
    
    M_seed_d = M_seed_q + 1'h1;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    led = M_pn_gen_num[0+2-:3];
    M_myreg_data = M_pn_gen_num[0+2-:3];
    M_mypropogater_num = M_myreg_out;
    M_pn_gen_seed = M_seed_q;
    M_pn_gen_next = 1'h0;
    M_pn_gen_rst = rst;
    high1 = M_mypropogater_row1;
    high2 = M_mypropogater_row2;
    high3 = M_mypropogater_row3;
    low1 = M_mypropogater_numOut[0+0-:1];
    low2 = M_mypropogater_numOut[1+0-:1];
    low3 = M_mypropogater_numOut[2+0-:1];
    if (M_mypropogater_rowLit == 2'h0) begin
      M_pn_gen_next = 1'h1;
      M_myreg_en = 1'h1;
      M_pn_gen_rst = 1'h1;
    end else begin
      M_pn_gen_next = 1'h0;
      M_myreg_en = 1'h0;
    end
  end
  
  always @(posedge M_slowclk_value) begin
    if (rst == 1'b1) begin
      M_seed_q <= 32'h00000001;
    end else begin
      M_seed_q <= M_seed_d;
    end
  end
  
endmodule

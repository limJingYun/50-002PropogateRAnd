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
    output reg low1,
    output reg low2,
    output reg low3,
    output reg high1,
    output reg high2,
    output reg high3
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
  reg [1-1:0] M_mypropogater_rst;
  reg [3-1:0] M_mypropogater_num;
  propogate_3 mypropogater (
    .clk(M_slowclk_value),
    .rst(M_mypropogater_rst),
    .num(M_mypropogater_num),
    .rowLit(M_mypropogater_rowLit),
    .numOut(M_mypropogater_numOut),
    .row1(M_mypropogater_row1),
    .row2(M_mypropogater_row2),
    .row3(M_mypropogater_row3)
  );
  wire [3-1:0] M_regs_out;
  reg [1-1:0] M_regs_en;
  reg [1-1:0] M_regs_rst;
  reg [3-1:0] M_regs_data;
  register_4 regs (
    .clk(M_slowclk_value),
    .en(M_regs_en),
    .rst(M_regs_rst),
    .data(M_regs_data),
    .out(M_regs_out)
  );
  
  reg [2:0] M_counter_d, M_counter_q = 3'h1;
  
  always @* begin
    M_counter_d = M_counter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_mypropogater_rst = rst;
    M_counter_d = M_counter_q + 1'h1;
    M_mypropogater_num = M_regs_out;
    M_regs_data = M_counter_q;
    M_regs_rst = rst;
    high1 = M_mypropogater_row1;
    high2 = M_mypropogater_row2;
    high3 = M_mypropogater_row3;
    led = M_mypropogater_numOut;
    low1 = M_mypropogater_numOut[0+0-:1];
    low2 = M_mypropogater_numOut[1+0-:1];
    low3 = M_mypropogater_numOut[2+0-:1];
    if (M_mypropogater_rowLit == 2'h0) begin
      M_regs_en = 1'h1;
    end else begin
      M_regs_en = 1'h0;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 3'h1;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
endmodule

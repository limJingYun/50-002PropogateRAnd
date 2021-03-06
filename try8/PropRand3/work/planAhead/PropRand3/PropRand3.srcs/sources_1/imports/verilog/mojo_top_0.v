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
  wire [2-1:0] M_mypropogater_rowLit;
  wire [3-1:0] M_mypropogater_numSeq;
  wire [1-1:0] M_mypropogater_row1;
  wire [1-1:0] M_mypropogater_row2;
  wire [1-1:0] M_mypropogater_row3;
  wire [1-1:0] M_mypropogater_gnd1;
  wire [1-1:0] M_mypropogater_gnd2;
  wire [1-1:0] M_mypropogater_gnd3;
  propogate_2 mypropogater (
    .clk(clk),
    .rst(rst),
    .rowLit(M_mypropogater_rowLit),
    .numSeq(M_mypropogater_numSeq),
    .row1(M_mypropogater_row1),
    .row2(M_mypropogater_row2),
    .row3(M_mypropogater_row3),
    .gnd1(M_mypropogater_gnd1),
    .gnd2(M_mypropogater_gnd2),
    .gnd3(M_mypropogater_gnd3)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    high1 = M_mypropogater_row1;
    high2 = M_mypropogater_row2;
    high3 = M_mypropogater_row3;
    low1 = M_mypropogater_gnd1;
    low2 = M_mypropogater_gnd2;
    low3 = M_mypropogater_gnd3;
    led[0+1-:2] = M_mypropogater_rowLit;
    led[2+5-:6] = 6'h00;
  end
endmodule

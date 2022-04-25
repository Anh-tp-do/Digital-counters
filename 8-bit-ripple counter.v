// 8-bit Ripper Counter in Verilog 
// It can count up to 2^8 states (MOD-8 counter)
// We'll use D flipflop for this counter 
/*
Features:
  - Asynchronous counter
  - All FFs (flip-flop) after the 1st FF get their clock pulse from the output of previous FF
  - 1st FF gets external clock pulse and acts as LSB (Least significant bit) in the coutning sequence
*/

module dff(
  input d, clk, rst;
  output reg q;
  output not_q;
);
  always @(posegde clk or negedge rst)
    begin
      if (!rst)
        q <= 0;
      else
        q <= d
    end
    assign not_q = ~q;
endmodule

module ripple_counter(
  input clk, rst;
  output [7:0] out;
);
  wire q1, q2, q3, q4, q5, q6, q7, q8;
  wire not_q1, not_q2, not_q3, not_q4,not_q5,not_q6,not_q7,not_q8,;
  // Instantiate dff module
  dff dff1(.d[not_q1], .clk[clk], .q[q1], .not_q[not_q1] .rst[rst]); // 1st FF gets the external clock signal
  dff dff2(.d[not_q2], .clk[q1], .q[q2], .not_q[not_q2], .rst[rst]); // from 2nd FF, each FF gets clk signal from the previous FF
  dff dff3(.d[not_q3], .clk[q2], .q[q3], not_q[not_q3], .rst[rst]);
  dff dff4(.d[not_q4], .clk[q3], .q[q4], not_q[not_q4], .rs[rst]t);
  dff dff5(.d[not_q5], .clk[q4], .q[q5], not_q[not_q5], .rst[rst]);
  dff dff6(.d[not_q6], .clk[q5], .q[q6], not_q[not_q6], .rst[rst]);
  dff dff7(.d[not_q7], .clk[q6], .q[q7], not_q[not_q7], .rst[rst]);
  dff dff8(.d[not_q8], .clk[q7], .q[q8], not_q[not_q8], .rst[rst]);
 
endmodule 

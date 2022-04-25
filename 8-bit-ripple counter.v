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
  dff dff1(.d[d], .clk[clk], .q[0], .rst[rst]); // 
  dff dff2(.d, .clk[], .q[], .rst);
  dff dff3(.d, .clk[], .q[], .rst);
  dff dff4(.d, .clk[], .q[], .rst);
  dff dff5(.d, .clk[], .q[], .rst);
  dff dff6(.d, .clk[], .q[], .rst);
  dff dff7(.d, .clk[], .q[], .rst);
  dff dff8(.d, .clk[], .q[], .rst);
 
endmodule 

// Resizable Johnson counter
module johnson_counter(clk, rst, out);
  input clk, rst; 
  output reg [WIDTH-1:0] out

  always @(posedge clk)
    begin
      if (!rst)
        out <= 1;
      else
        begin
          out[WIDTH-1] <= ~out[0];
        end 
    end 
endmodule 

module counter #(
  parameter WIDTH = 16
)(
  // input
  input  wire             clk,
  input  wire             rst,
  // output
  output reg  [WIDTH-1:0] out
);

always @(posedge clk) begin
  if (rst) begin
    out <= 0;
  end
  else begin
    out <= out + 1;
  end
end

endmodule

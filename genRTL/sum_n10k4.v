
module top
(
  input clk,
  input rst,
  input [4:0] num1,
  input [4:0] num2,
  input [4:0] num3,
  input [4:0] num4,
  input [4:0] num5,
  input [4:0] num6,
  input [4:0] num7,
  input [4:0] num8,
  input [4:0] num9,
  input [4:0] num10
);

  reg [9:0] res1;
  reg [9:0] res1Nxt;
  reg [9:0] res2;
  reg [9:0] res2Nxt;
  reg [9:0] res3;
  reg [9:0] res3Nxt;
  wire [9:0] out1;
  wire [9:0] out2;
  wire [9:0] out3;
  reg [9:0] in1;
  reg [9:0] in2;
  reg [9:0] in3;
  reg [9:0] in4;
  reg [9:0] in5;
  reg [9:0] in6;
  reg [3:0] counter;
  reg [3:0] counterNxt;
  assign out1 = in1 + in2;
  assign out2 = in3 + in4;
  assign out3 = in5 + in6;

  always @(posedge clk) begin
    counter <= counterNxt;
    res1 <= res1Nxt;
    res2 <= res2Nxt;
    res3 <= res3Nxt;
  end


  always @(*) begin
    res1Nxt = res1;
    res2Nxt = res2;
    res3Nxt = res3;
    counter = counter + 1;
    if(rst) begin
      res1Nxt = 0;
      res2Nxt = 0;
      res3Nxt = 0;
      counterNxt = 0;
    end else begin
      case(counter)
        0: begin
          in1 = num1;
          in2 = num2;
          in3 = num3;
          in4 = num4;
          in5 = num5;
          in6 = num6;
          resNxt1 = out1;
          resNxt2 = out2;
          resNxt3 = out3;
        end
        1: begin
          in1 = res1;
          in2 = num7;
          in3 = res2;
          in4 = num8;
          in5 = res3;
          in6 = num9;
          resNxt1 = out1;
          resNxt2 = out2;
          resNxt3 = out3;
        end
        2: begin
          in1 = res1;
          in2 = num10;
          in3 = res2;
          in4 = res3;
          resNxt1 = out1;
          resNxt2 = out2;
        end
        3: begin
          in1 = res1;
          in2 = res2;
          resNxt1 = out1;
        end
      endcase
    end
  end


endmodule

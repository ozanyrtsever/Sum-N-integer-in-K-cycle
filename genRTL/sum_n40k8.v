
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
  input [4:0] num10,
  input [4:0] num11,
  input [4:0] num12,
  input [4:0] num13,
  input [4:0] num14,
  input [4:0] num15,
  input [4:0] num16,
  input [4:0] num17,
  input [4:0] num18,
  input [4:0] num19,
  input [4:0] num20,
  input [4:0] num21,
  input [4:0] num22,
  input [4:0] num23,
  input [4:0] num24,
  input [4:0] num25,
  input [4:0] num26,
  input [4:0] num27,
  input [4:0] num28,
  input [4:0] num29,
  input [4:0] num30,
  input [4:0] num31,
  input [4:0] num32,
  input [4:0] num33,
  input [4:0] num34,
  input [4:0] num35,
  input [4:0] num36,
  input [4:0] num37,
  input [4:0] num38,
  input [4:0] num39,
  input [4:0] num40
);

  reg [9:0] res1;
  reg [9:0] res1Nxt;
  reg [9:0] res2;
  reg [9:0] res2Nxt;
  reg [9:0] res3;
  reg [9:0] res3Nxt;
  reg [9:0] res4;
  reg [9:0] res4Nxt;
  reg [9:0] res5;
  reg [9:0] res5Nxt;
  reg [9:0] res6;
  reg [9:0] res6Nxt;
  reg [9:0] res7;
  reg [9:0] res7Nxt;
  wire [9:0] out1;
  wire [9:0] out2;
  wire [9:0] out3;
  wire [9:0] out4;
  wire [9:0] out5;
  wire [9:0] out6;
  wire [9:0] out7;
  reg [9:0] in1;
  reg [9:0] in2;
  reg [9:0] in3;
  reg [9:0] in4;
  reg [9:0] in5;
  reg [9:0] in6;
  reg [9:0] in7;
  reg [9:0] in8;
  reg [9:0] in9;
  reg [9:0] in10;
  reg [9:0] in11;
  reg [9:0] in12;
  reg [9:0] in13;
  reg [9:0] in14;
  reg [4:0] counter;
  reg [4:0] counterNxt;
  assign out1 = in1 + in2;
  assign out2 = in3 + in4;
  assign out3 = in5 + in6;
  assign out4 = in7 + in8;
  assign out5 = in9 + in10;
  assign out6 = in11 + in12;
  assign out7 = in13 + in14;

  always @(posedge clk) begin
    counter <= counterNxt;
    res1 <= res1Nxt;
    res2 <= res2Nxt;
    res3 <= res3Nxt;
    res4 <= res4Nxt;
    res5 <= res5Nxt;
    res6 <= res6Nxt;
    res7 <= res7Nxt;
  end


  always @(*) begin
    res1Nxt = res1;
    res2Nxt = res2;
    res3Nxt = res3;
    res4Nxt = res4;
    res5Nxt = res5;
    res6Nxt = res6;
    res7Nxt = res7;
    counter = counter + 1;
    if(rst) begin
      res1Nxt = 0;
      res2Nxt = 0;
      res3Nxt = 0;
      res4Nxt = 0;
      res5Nxt = 0;
      res6Nxt = 0;
      res7Nxt = 0;
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
          in7 = num7;
          in8 = num8;
          in9 = num9;
          in10 = num10;
          in11 = num11;
          in12 = num12;
          in13 = num13;
          in14 = num14;
          resNxt1 = out1;
          resNxt2 = out2;
          resNxt3 = out3;
          resNxt4 = out4;
          resNxt5 = out5;
          resNxt6 = out6;
          resNxt7 = out7;
        end
        1: begin
          in1 = res1;
          in2 = num15;
          in3 = res2;
          in4 = num16;
          in5 = res3;
          in6 = num17;
          in7 = res4;
          in8 = num18;
          in9 = res5;
          in10 = num19;
          in11 = res6;
          in12 = num20;
          in13 = res7;
          in14 = num21;
          resNxt1 = out1;
          resNxt2 = out2;
          resNxt3 = out3;
          resNxt4 = out4;
          resNxt5 = out5;
          resNxt6 = out6;
          resNxt7 = out7;
        end
        2: begin
          in1 = res1;
          in2 = num22;
          in3 = res2;
          in4 = num23;
          in5 = res3;
          in6 = num24;
          in7 = res4;
          in8 = num25;
          in9 = res5;
          in10 = num26;
          in11 = res6;
          in12 = num27;
          resNxt1 = out1;
          resNxt2 = out2;
          resNxt3 = out3;
          resNxt4 = out4;
          resNxt5 = out5;
          resNxt6 = out6;
        end
        3: begin
          in1 = res1;
          in2 = num28;
          in3 = res2;
          in4 = num29;
          in5 = res3;
          in6 = num30;
          in7 = res4;
          in8 = num31;
          in9 = res5;
          in10 = num32;
          in11 = res6;
          in12 = num33;
          resNxt1 = out1;
          resNxt2 = out2;
          resNxt3 = out3;
          resNxt4 = out4;
          resNxt5 = out5;
          resNxt6 = out6;
        end
        4: begin
          in1 = res1;
          in2 = num34;
          in3 = res2;
          in4 = num35;
          in5 = res3;
          in6 = num36;
          in7 = res4;
          in8 = num37;
          in9 = res5;
          in10 = num38;
          in11 = res6;
          in12 = num39;
          resNxt1 = out1;
          resNxt2 = out2;
          resNxt3 = out3;
          resNxt4 = out4;
          resNxt5 = out5;
          resNxt6 = out6;
        end
        5: begin
          in1 = res1;
          in2 = num40;
          in3 = res2;
          in4 = res3;
          in5 = res4;
          in6 = res5;
          in7 = res6;
          in8 = res7;
          resNxt1 = out1;
          resNxt2 = out2;
          resNxt3 = out3;
          resNxt4 = out4;
        end
        6: begin
          in1 = res1;
          in2 = res2;
          in3 = res3;
          in4 = res4;
          resNxt1 = out1;
          resNxt2 = out2;
        end
        7: begin
          in1 = res1;
          in2 = res2;
          resNxt1 = out1;
        end
      endcase
    end
  end


endmodule

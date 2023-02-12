
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
  input [4:0] num40,
  input [4:0] num41,
  input [4:0] num42,
  input [4:0] num43,
  input [4:0] num44,
  input [4:0] num45,
  input [4:0] num46,
  input [4:0] num47,
  input [4:0] num48,
  input [4:0] num49,
  input [4:0] num50,
  input [4:0] num51,
  input [4:0] num52,
  input [4:0] num53,
  input [4:0] num54,
  input [4:0] num55
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
  reg [9:0] res8;
  reg [9:0] res8Nxt;
  reg [9:0] res9;
  reg [9:0] res9Nxt;
  reg [9:0] res10;
  reg [9:0] res10Nxt;
  wire [9:0] out1;
  wire [9:0] out2;
  wire [9:0] out3;
  wire [9:0] out4;
  wire [9:0] out5;
  wire [9:0] out6;
  wire [9:0] out7;
  wire [9:0] out8;
  wire [9:0] out9;
  wire [9:0] out10;
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
  reg [9:0] in15;
  reg [9:0] in16;
  reg [9:0] in17;
  reg [9:0] in18;
  reg [9:0] in19;
  reg [9:0] in20;
  reg [4:0] counter;
  reg [4:0] counterNxt;
  assign out1 = in1 + in2;
  assign out2 = in3 + in4;
  assign out3 = in5 + in6;
  assign out4 = in7 + in8;
  assign out5 = in9 + in10;
  assign out6 = in11 + in12;
  assign out7 = in13 + in14;
  assign out8 = in15 + in16;
  assign out9 = in17 + in18;
  assign out10 = in19 + in20;

  always @(posedge clk) begin
    counter <= counterNxt;
    res1 <= res1Nxt;
    res2 <= res2Nxt;
    res3 <= res3Nxt;
    res4 <= res4Nxt;
    res5 <= res5Nxt;
    res6 <= res6Nxt;
    res7 <= res7Nxt;
    res8 <= res8Nxt;
    res9 <= res9Nxt;
    res10 <= res10Nxt;
  end


  always @(*) begin
    res1Nxt = res1;
    res2Nxt = res2;
    res3Nxt = res3;
    res4Nxt = res4;
    res5Nxt = res5;
    res6Nxt = res6;
    res7Nxt = res7;
    res8Nxt = res8;
    res9Nxt = res9;
    res10Nxt = res10;
    counter = counter + 1;
    if(rst) begin
      res1Nxt = 0;
      res2Nxt = 0;
      res3Nxt = 0;
      res4Nxt = 0;
      res5Nxt = 0;
      res6Nxt = 0;
      res7Nxt = 0;
      res8Nxt = 0;
      res9Nxt = 0;
      res10Nxt = 0;
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
          in15 = num15;
          in16 = num16;
          in17 = num17;
          in18 = num18;
          in19 = num19;
          in20 = num20;
          resNxt1 = out1;
          resNxt2 = out2;
          resNxt3 = out3;
          resNxt4 = out4;
          resNxt5 = out5;
          resNxt6 = out6;
          resNxt7 = out7;
          resNxt8 = out8;
          resNxt9 = out9;
          resNxt10 = out10;
        end
        1: begin
          in1 = res1;
          in2 = num21;
          in3 = res2;
          in4 = num22;
          in5 = res3;
          in6 = num23;
          in7 = res4;
          in8 = num24;
          in9 = res5;
          in10 = num25;
          in11 = res6;
          in12 = num26;
          in13 = res7;
          in14 = num27;
          in15 = res8;
          in16 = num28;
          in17 = res9;
          in18 = num29;
          in19 = res10;
          in20 = num30;
          resNxt1 = out1;
          resNxt2 = out2;
          resNxt3 = out3;
          resNxt4 = out4;
          resNxt5 = out5;
          resNxt6 = out6;
          resNxt7 = out7;
          resNxt8 = out8;
          resNxt9 = out9;
          resNxt10 = out10;
        end
        2: begin
          in1 = res1;
          in2 = num31;
          in3 = res2;
          in4 = num32;
          in5 = res3;
          in6 = num33;
          in7 = res4;
          in8 = num34;
          in9 = res5;
          in10 = num35;
          in11 = res6;
          in12 = num36;
          in13 = res7;
          in14 = num37;
          in15 = res8;
          in16 = num38;
          in17 = res9;
          in18 = num39;
          in19 = res10;
          in20 = num40;
          resNxt1 = out1;
          resNxt2 = out2;
          resNxt3 = out3;
          resNxt4 = out4;
          resNxt5 = out5;
          resNxt6 = out6;
          resNxt7 = out7;
          resNxt8 = out8;
          resNxt9 = out9;
          resNxt10 = out10;
        end
        3: begin
          in1 = res1;
          in2 = num41;
          in3 = res2;
          in4 = num42;
          in5 = res3;
          in6 = num43;
          in7 = res4;
          in8 = num44;
          in9 = res5;
          in10 = num45;
          in11 = res6;
          in12 = num46;
          in13 = res7;
          in14 = num47;
          in15 = res8;
          in16 = num48;
          in17 = res9;
          in18 = num49;
          resNxt1 = out1;
          resNxt2 = out2;
          resNxt3 = out3;
          resNxt4 = out4;
          resNxt5 = out5;
          resNxt6 = out6;
          resNxt7 = out7;
          resNxt8 = out8;
          resNxt9 = out9;
        end
        4: begin
          in1 = res1;
          in2 = num50;
          in3 = res2;
          in4 = num51;
          in5 = res3;
          in6 = num52;
          in7 = res4;
          in8 = num53;
          in9 = res5;
          in10 = num54;
          in11 = res6;
          in12 = num55;
          in13 = res7;
          in14 = res8;
          in15 = res9;
          in16 = res10;
          resNxt1 = out1;
          resNxt2 = out2;
          resNxt3 = out3;
          resNxt4 = out4;
          resNxt5 = out5;
          resNxt6 = out6;
          resNxt7 = out7;
          resNxt8 = out8;
        end
        5: begin
          in1 = res1;
          in2 = res2;
          in3 = res3;
          in4 = res4;
          in5 = res5;
          in6 = res6;
          in7 = res7;
          in8 = res8;
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

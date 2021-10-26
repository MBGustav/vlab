//////////////////////////////////////////////////////////////////////////////////
// Company: UFSCar
// Author: Ricardo Menotti
// 
// Create Date: 29.09.2021 18:36:28
// Project Name: Lab. Remoto de Lógica Digital - DC/UFSCar
// Design Name: Hex Counter
// Module Name: colors
// Target Devices: xc7z020
// Tool Versions: Vivado v2019.2 (64-bit)
//////////////////////////////////////////////////////////////////////////////////

module top(
  input sysclk,
  output [3:0] jc, jd
  );

  integer count = 0;
  integer clkdiv = 0;
  wire [3:0] val;
  
  always@(posedge sysclk)
    clkdiv = clkdiv + 1;

  always@(posedge clkdiv[3])
    count = count + 1;

  Display7seg dig(val, {jd[2:0],jc});
 
  assign val = clkdiv[5] ? count[31:28] : count[27:24];
  assign jd[3] = clkdiv[5]; 
endmodule

module Display7seg (
    input  [3:0] bcd,
    output reg [6:0] segs
    );
        
    always @(bcd)        // gfedcba
      case (bcd)         // 6543210
        4'b0000 : segs = 7'b0111111; // 0
        4'b0001 : segs = 7'b0000110; // 1
        4'b0010 : segs = 7'b1011011; // 2
        4'b0011 : segs = 7'b1001111; // 3
        4'b0100 : segs = 7'b1100110; // 4
        4'b0101 : segs = 7'b1101101; // 5
        4'b0110 : segs = 7'b1111101; // 6
        4'b0111 : segs = 7'b0000111; // 7
        4'b1000 : segs = 7'b1111111; // 8
        4'b1001 : segs = 7'b1101111; // 9
        4'b1010 : segs = 7'b1110111; // A
        4'b1011 : segs = 7'b1111100; // b
        4'b1100 : segs = 7'b0111001; // C
        4'b1101 : segs = 7'b1011110; // d
        4'b1110 : segs = 7'b1111001; // E
        4'b1111 : segs = 7'b1110001; // F
      endcase
		
endmodule

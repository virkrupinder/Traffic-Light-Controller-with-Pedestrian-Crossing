`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:09:29 12/02/2019
// Design Name:   traffic_light_controller
// Module Name:   C:/Users/rupin/Desktop/SJSU/FALL 2019/EE 118 LAB/Final Project/final_project2/traffic_light_controller_tb.v
// Project Name:  final_project2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_light_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module traffic_light_controller_tb;

	// Inputs
	reg clk;
	reg rst;
	reg WB1;
	reg WB2;
	reg WB3;
	reg WB4;
	reg MSS;
	reg SSS;

	// Outputs
	wire [2:0] MSL;
	wire [2:0] SSL;
	wire [1:0] WL1;
	wire [1:0] WL2;
	wire [1:0] WL3;
	wire [1:0] WL4;

	// Instantiate the Unit Under Test (UUT)
	traffic_light_controller uut (
		.MSL(MSL), 
		.SSL(SSL), 
		.WL1(WL1), 
		.WL2(WL2), 
		.WL3(WL3), 
		.WL4(WL4), 
		.clk(clk), 
		.rst(rst), 
		.WB1(WB1), 
		.WB2(WB2), 
		.WB3(WB3), 
		.WB4(WB4), 
		.MSS(MSS), 
		.SSS(SSS)
	);

	// Instantiate the Design Under Test (DUT)
traffic_light_controller DUT (MSL,SSL,WL1,WL2,WL3,WL4,clk,rst,WB1,WB2,WB3,WB4,MSS,SSS);
initial
 begin
  clk=1'b1;
  WB1=0;
  forever #5  clk=~clk;
 
 end
 
initial
 begin 
  rst=1'b1;
  #15;
  rst=1'b0;
  #200;
  MSS=1'b0;
  WB2=1'b1;
  #30;
  MSS=1'b1;
  WB2=1'b0;
  #1000;
  $stop;
 end
endmodule

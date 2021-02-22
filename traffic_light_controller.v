`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: San Jose State University
// Engineer: Rupinderjit Kaur Virk
// Student ID: 012442378
// 
// Create Date:    19:49:16 12/02/2019 
// Design Name: 
// Module Name:    traffic_light_controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module traffic_light_controller(MSL,SSL,WL1,WL2,WL3,WL4,clk,rst,WB1,WB2,WB3,WB4,MSS,SSS); //Rupinderjit Virk
   output reg [2:0] MSL,SSL; //Main Signal Light and Side Signal Light
 output reg [1:0] WL1,WL2,WL3,WL4; //Walking Lights 1,2,3,4
 
   input      clk,WB1,WB2,WB3,WB4,MSS,SSS; //Walking Buttons 1,2,3,4
   input      rst;// To begin with state s0
 
   reg [2:0] state; 
 
   parameter [2:0] s0=3'b000; //States 1,2,3,4
   parameter [2:0] s1=3'b001;
   parameter [2:0] s2=3'b010;
   parameter [2:0] s3=3'b011;
   reg [2:0] count; //To time the traffic light states
 
   always @(posedge clk, posedge rst)
     begin
        if (rst)
            begin
                state=s0;
                count =3'b000; //Every new state, the count is returned to 0
            end
        else
            begin
                case (state)
                s0 :
                    begin
                        if ((count==3'b101) || ((MSS == 1'b0)&&(WB2==1'b1))) //
                            begin
                            count=3'b000;
                            state=s1;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=s0;
                            end
                    end
                s1 :
                    begin
                        if (count==3'b010)
        begin
                            count=3'b000;
                            state=s2;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=s1;
                        end
                    end
               s2 :
                    begin
                        if (count==3'b101)
                            begin
                            count=3'b0;
                            state=s3;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=s2;
                        end
                    end
            s3 :
                begin
                    if (count==3'b010)
                        begin
                        count=3'b0;
                        state=s0;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=s3;
                        end
                    end
            endcase // case (state)
        end // always @ (state)
    end

always @(state)
     begin
         case (state)
            s0 :
                begin
                    MSL78 = 3'b100;
                    SSL78 = 3'b001;
        WL178 = 1'b0;
        WL278 = 1'b1;
        WL378 = 1'b0;
        WL478 = 1'b1;
                   
                end // case: north
            s1 :
                begin
                    MSL78 = 3'b010;
                    SSL78 = 3'b001;
        WL178 = 1'b0;
        WL278 = 1'b1;
        WL378 = 1'b0;
        WL478 = 1'b1;
       
          
                end // case: north_1
            s2 :
                begin
                    MSL78 = 3'b001;
                    SSL78 = 3'b010;
        WL178 = 1'b1;
        WL278 = 1'b0;
        WL378 = 1'b1;
        WL478 = 1'b0;
                 
                end // case: south
            s3 :
                begin
                    MSL78 = 3'b001;
                    SSL78 = 3'b100;
        WL178 = 1'b1;
        WL278 = 1'b0;
        WL378 = 1'b1;
        WL478 = 1'b0;
                   
                end // case: south_2
     
            endcase // case (state)
     end // always @ (state)
endmodule


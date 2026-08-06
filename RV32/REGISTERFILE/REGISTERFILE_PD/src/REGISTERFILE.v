`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2026 10:31:28 AM
// Design Name: 
// Module Name: 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module registerfile(
input clk,
input we,
input rst,
input [4:0] rs1,  //read address 1
input [4:0] rs2,  //read address 2
input [4:0] rd,  //write address
input[31:0] wd, //data to write
output[31:0] rd1,//data read 1
output[31:0] rd2 //read data 2
    );
    reg[31:0] register[0:31];
    integer i;

    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1)
                register[i] <= 32'd0;
        end 
        else if (we && rd != 5'd0) begin
            register[rd] <= wd;
        end
    end
    
    assign rd1 = (rs1 == 5'd0) ? 32'd0 : register[rs1];
    assign rd2 = (rs2 == 5'd0) ? 32'd0 : register[rs2];
    
    
    
    
    
    
endmodule

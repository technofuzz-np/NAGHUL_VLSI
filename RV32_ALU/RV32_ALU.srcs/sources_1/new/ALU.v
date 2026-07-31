`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2026 12:54:26 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
input[31:0]A,
input[31:0]B,
input[3:0]control,

output reg[31:0]result,
output zero
    );
    
always @(*)begin 
    case(control)
                // Arithmetic
        4'b0000: result = A + B;                                     // ADD
        4'b0001: result = A - B;                                     // SUB

        // Logical
        4'b0010: result = A & B;                                     // AND
        4'b0011: result = A | B;                                     // OR
        4'b0100: result = A ^ B;                                     // XOR

        // Shift Operations
        4'b0101: result = A << B[4:0];                               // SLL
        4'b0110: result = A >> B[4:0];                               // SRL
        4'b0111: result = $signed(A) >>> B[4:0];                     // SRA

        // Comparison
        4'b1000: result = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0; // SLT
        4'b1001: result = (A < B) ? 32'd1 : 32'd0;                   // SLTU

        default: result = 32'b0;
    
    
    endcase
end
assign Zero = (result == 32'b0);
endmodule

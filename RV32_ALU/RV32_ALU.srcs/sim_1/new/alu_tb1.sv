`timescale 1ns / 1ps



module alu_tb;
logic[31:0]A;
logic[31:0]B;
logic[31:0]control;
logic[31:0]result;
logic zero;

ALU DUT(
.A(A),
.B(B),
.control(control),
.result(result),
.zero(zero)
);
initial begin

        // ---------------- ADD ----------------
        A = 32'd10;
        B = 32'd20;
        control = 4'b0000;
        #10;

        // ---------------- SUB ----------------
        A = 32'd30;
        B = 32'd15;
        control = 4'b0001;
        #10;

        // ---------------- AND ----------------
        A = 32'hF0F0F0F0;
        B = 32'h0FF00FF0;
        control = 4'b0010;
        #10;

        // ---------------- OR -----------------
        A = 32'hF0F0F0F0;
        B = 32'h0FF00FF0;
        control = 4'b0011;
        #10;

        // ---------------- XOR ----------------
        A = 32'hAAAA5555;
        B = 32'hFFFF0000;
        control = 4'b0100;
        #10;

        // ---------------- SLL ----------------
        A = 32'd5;
        B = 32'd2;
        control = 4'b0101;
        #10;

        // ---------------- SRL ----------------
        A = 32'd16;
        B = 32'd2;
        control = 4'b0110;
        #10;

        // ---------------- SRA ----------------
        A = -32;
        B = 2;
        control = 4'b0111;
        #10;

        // ---------------- SLT ----------------
        A = -5;
        B = 3;
        control = 4'b1000;
        #10;

        // ---------------- SLTU ---------------
        A = 32'd5;
        B = 32'd10;
        control = 4'b1001;
        #10;

        $finish;

    end
  
endmodule

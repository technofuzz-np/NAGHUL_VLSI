`timescale 1ns / 1ps

module tb_register;

    //---------------------------------------
    // Signals
    //---------------------------------------
    logic clk;
    logic rst;
    logic we;

    logic [4:0] rs1;
    logic [4:0] rs2;
    logic [4:0] rd;

    logic [31:0] wd;

    logic [31:0] rd1;
    logic [31:0] rd2;

    //---------------------------------------
    // DUT
    //---------------------------------------
    registerfile dut(
        .clk(clk),
        .rst(rst),
        .we(we),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .wd(wd),
        .rd1(rd1),
        .rd2(rd2)
    );

    //---------------------------------------
    // Clock : 10ns
    //---------------------------------------
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    //---------------------------------------
    // Test
    //---------------------------------------
    initial begin

        //-----------------------------
        // Initial Values
        //-----------------------------
        rst = 1;
        we  = 0;
        rs1 = 0;
        rs2 = 0;
        rd  = 0;
        wd  = 0;

        //-----------------------------
        // Hold reset for 2 clocks
        //-----------------------------
        repeat(2) @(posedge clk);

        rst = 0;

        @(posedge clk);

        $display("Reset Released");
        $display("x0=%0d x1=%0d x5=%0d",
                  dut.register[0],
                  dut.register[1],
                  dut.register[5]);

        //----------------------------------------------------
        // TEST 1 : Write x1 = 100
        //----------------------------------------------------
        $display("\n========== TEST 1 ==========");

        @(negedge clk);

        we = 1;
        rd = 5'd1;
        wd = 32'd100;

        @(posedge clk);

        #1;

        we = 0;

        rs1 = 5'd1;

        #1;

        if(rd1 == 32'd100)
            $display("PASS : x1 = %0d", rd1);
        else
            $display("FAIL : x1 = %0d", rd1);

        //----------------------------------------------------
        // TEST 2 : Write x5 = 200
        //----------------------------------------------------
        $display("\n========== TEST 2 ==========");

        @(negedge clk);

        we = 1;
        rd = 5'd5;
        wd = 32'd200;

        @(posedge clk);

        #1;

        we = 0;

        rs1 = 5'd5;

        #1;

        if(rd1 == 32'd200)
            $display("PASS : x5 = %0d", rd1);
        else
            $display("FAIL : x5 = %0d", rd1);

        //----------------------------------------------------
        // TEST 3 : Dual Read
        //----------------------------------------------------
        $display("\n========== TEST 3 ==========");

        rs1 = 5'd1;
        rs2 = 5'd5;

        #1;

        if(rd1 == 32'd100 && rd2 == 32'd200)
            $display("PASS : Dual Read");
        else begin
            $display("FAIL : Dual Read");
            $display("rd1 = %0d", rd1);
            $display("rd2 = %0d", rd2);
        end

        //----------------------------------------------------
        // TEST 4 : x0 should remain zero
        //----------------------------------------------------
        $display("\n========== TEST 4 ==========");

        @(negedge clk);

        we = 1;
        rd = 5'd0;
        wd = 32'd999;

        @(posedge clk);

        #1;

        we = 0;

        rs1 = 5'd0;

        #1;

        if(rd1 == 32'd0)
            $display("PASS : x0 remains zero");
        else
            $display("FAIL : x0 = %0d", rd1);

        //----------------------------------------------------
        // Dump Registers
        //----------------------------------------------------
        $display("\n========== REGISTER DUMP ==========");
        $display("x0 = %0d", dut.register[0]);
        $display("x1 = %0d", dut.register[1]);
        $display("x5 = %0d", dut.register[5]);

        #20;

        $display("\nSimulation Finished.");

        $finish;

    end

endmodule
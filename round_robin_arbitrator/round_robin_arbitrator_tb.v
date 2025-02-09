`include "round_robin_arbitrator.v"
`timescale 1ns / 1ps

module tb_round_robin_arbitrator;

    parameter NUM_PORTS = 4;

    reg clk;
    reg reset;
    reg [NUM_PORTS-1:0] req_i;
    wire [NUM_PORTS-1:0] gnt_o;

    round_robin_arbitrator #(.NUM_PORTS(NUM_PORTS)) uut (
        .clk(clk),
        .reset(reset),
        .req_i(req_i),
        .gnt_o(gnt_o)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_round_robin_arbitrator.vcd");
        $dumpvars(0, tb_round_robin_arbitrator);

        clk = 0;
        reset = 1;
        req_i = 4'b0000;

        #10; // Wait for reset to take effect

        reset = 0;

        // Test Cases (Improved)
        req_i = 4'b1010; #20;  // Ports 1 and 3
        req_i = 4'b0110; #20;  // Ports 1 and 2
        req_i = 4'b0001; #20;  // Port 0
        req_i = 4'b1111; #20;  // All ports
        req_i = 4'b0000; #20;  // No requests
        req_i = 4'b1000; #20; //Port 3
        req_i = 4'b0100; #20; //Port 2
        req_i = 4'b0010; #20; //Port 1
        req_i = 4'b0001; #20; //Port 0
        req_i = 4'b1010; #20; //Ports 3 and 1
        req_i = 4'b0110; #20; //Ports 2 and 1
        req_i = 4'b1100; #20; //Ports 3 and 2
        req_i = 4'b1110; #20; //Ports 3, 2, and 1
        req_i = 4'b1111; #20; //All Ports
        req_i = 4'b0000; #20; //No Ports
        req_i = 4'b0001; #20; //Port 0

        #10 $finish; // Added a small delay before $finish
    end

    initial begin
        $monitor("Time=%0t | req_i=%b | gnt_o=%b | sel_reg=%0d", $time, req_i, gnt_o, uut.sel_reg); // Added sel_reg
    end

endmodule
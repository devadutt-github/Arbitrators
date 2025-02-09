`include "priority_arbitrator.v"
module priority_arbitrator_tb;

    parameter NUM_PORTS = 4;

    reg [NUM_PORTS-1:0] req_i;
    wire [NUM_PORTS-1:0] gnt_o;

    priority_arbitrator dut (
        .req_i(req_i),
        .gnt_o(gnt_o)
    );

    reg [NUM_PORTS-1:0] expected_gnt;

 initial begin
        for (integer i = 0; i < (1 << NUM_PORTS); i = i + 1) begin
            req_i <= i;
            #10;
            calculate_expected_gnt; // Call the task
            check_results;       // Call the task
        end
        $display("All test cases passed!");
        $finish;
    end

  task calculate_expected_gnt;
    if (req_i[0]) begin
        expected_gnt = 4'b0001;
    end else if (req_i[1]) begin
        expected_gnt = 4'b0010;
    end else if (req_i[2]) begin
        expected_gnt = 4'b0100;
    end else if (req_i[3]) begin
        expected_gnt = 4'b1000;
    end else begin
        expected_gnt = 4'b0000;
    end
endtask

    task check_results;
        if (gnt_o !== expected_gnt) begin
            $error("Error: req_i = %b, gnt_o = %b (expected %b)", req_i, gnt_o, expected_gnt);
            $finish;
        end else begin
            $display("req_i = %b, gnt_o = %b (Correct)", req_i, gnt_o);
        end
    endtask

    initial begin
        $dumpfile("priority_arbitrator_tb1.vcd");
        $dumpvars(0, priority_arbitrator_tb);
    end

endmodule
module round_robin_arbitrator #(
    parameter NUM_PORTS = 4
)(  
    input  wire clk,
    input  wire reset,
    input  wire [NUM_PORTS-1:0] req_i,
    output reg  [NUM_PORTS-1:0] gnt_o // Made output a reg
);

    reg [$clog2(NUM_PORTS)-1:0] sel_reg;  // Selection register

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sel_reg <= 0;
        end else begin
            sel_reg <= (sel_reg + 1) % NUM_PORTS; // Round-robin selection
        end
    end

    always @(posedge clk or posedge reset) begin
        gnt_o <= 4'b0000; // Default no grant
        if (req_i[sel_reg]) begin
            gnt_o <= 1 << sel_reg;
        end else if (req_i[(sel_reg + 1) % NUM_PORTS]) begin
            gnt_o <= 1 << ((sel_reg + 1) % NUM_PORTS);
        end else if (req_i[(sel_reg + 2) % NUM_PORTS]) begin
            gnt_o <= 1 << ((sel_reg + 2) % NUM_PORTS);
        end else if (req_i[(sel_reg + 3) % NUM_PORTS]) begin
            gnt_o <= 1 << ((sel_reg + 3) % NUM_PORTS);
        end
    end

endmodule

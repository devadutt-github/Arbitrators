module priority_arbitrator #(
    parameter NUM_PORTS = 4
)(
    input wire[NUM_PORTS-1:0] req_i,
    output wire[NUM_PORTS-1:0] gnt_o // gnt_o is now a wire
);

    reg [NUM_PORTS-1:0] gnt_o_reg;  // Intermediate reg signal

    always @ (*) begin
        gnt_o_reg = 4'b0000; // Default: No grants

        if (req_i[0]) begin
            gnt_o_reg = 4'b0001;
        end else if (req_i[1]) begin
            gnt_o_reg = 4'b0010;
        end else if (req_i[2]) begin
            gnt_o_reg = 4'b0100;
        end else if (req_i[3]) begin
            gnt_o_reg = 4'b1000;
        end
    end

    assign gnt_o = gnt_o_reg; // Continuous assignment from reg to wire

endmodule

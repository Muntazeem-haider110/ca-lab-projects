`timescale 1ns / 1ps

module clock_divider (
    input  wire clk_in,    // 100 MHz
    input  wire rst,
    output reg  clk_out    // 1 Hz
);

    // Half period = 50,000,000 cycles of 100 MHz -> toggle gives 1 Hz
    localparam HALF = 26'd49_999_999;
    reg [25:0] cnt = 26'd0;

    initial clk_out = 1'b0;

    always @(posedge clk_in) begin
        if (rst) begin
            cnt     <= 26'd0;
            clk_out <= 1'b0;
        end else if (cnt == HALF) begin
            cnt     <= 26'd0;
            clk_out <= ~clk_out;
        end else begin
            cnt <= cnt + 26'd1;
        end
    end
endmodule
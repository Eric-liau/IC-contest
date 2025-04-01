module addrcal(
    input [6:0] H,
    input [6:0] V,
    output [13:0] A
);

assign A = 100 * V + H;

endmodule
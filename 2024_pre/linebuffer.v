module linebuffer(
    input clk,
    input rst,
    input [5:0] index,
    input [7:0] val_in,
    input write_signal,
    output [7:0] val_out,
    input read_signal
);

reg [2:0] dotcnt;
reg [7:0] linebuffer [62:0];
assign val_out = linebuffer[index];

localparam [2:0]    IDLE = 3'd0,
                    LOAD_DOT = 3'd1;
                    
always@(posedge clk, posedge rst) begin
    if(rst) begin
        dotcnt <= 3'b0;
    end
    else begin

    end

end


endmodule
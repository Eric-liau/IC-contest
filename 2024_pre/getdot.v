module getdot(
    input clk,
    input rst,
    input enable
    input rowend,
    output reg [2:0] cnt,
    output reg [2:0] first_dot
);



always@(posedge clk, posedge rst) begin
    if(rst) begin
        first_dot <= 3'b0;
        cnt <= 3'b0;
    end
    else begin
        if(rowend) begin
            cnt <= 3'd0;
            first_dot <= 3'd0;
        end
        else if(enable) begin
            cnt <= cnt == 3'd5 ? cnt : cnt + 3'd1;
            first_dot <= cnt == 3'd5 ? (first_dot == 3'd4 ? 3'd0 : first_dot + 3'd1) : first_dot; 
        end
    end

end

endmodule
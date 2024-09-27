`define marginal(x) (x % 128 == 0 || x % 128 == 127 ? 1 : 0)
`define s(p, c) (p >= c ? 1 : 0)

`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input   	clk;
input   	reset;
output reg [13:0] 	gray_addr;
output reg gray_req;
input   	gray_ready;
input   [7:0] 	gray_data;
output reg [13:0] 	lbp_addr;
output reg lbp_valid;
output reg [7:0] lbp_data;
output reg	finish;
//====================================================================
reg [7:0] gp, gc;
reg [3:0] state;
reg [13:0] gc_addr;
reg first;



always@(posedge clk, posedge reset) begin
    if(reset) begin
        gray_addr <= 14'd129;
        gray_req <= 1'b1;
        lbp_addr <= 14'd0;
        lbp_valid <= 1'b0;
        lbp_data <= 8'd0;
        finish <= 1'b0;
        state <= 4'd0;
        gc_addr <= 14'd129;
        first <= 1'b1;
    end
    else begin
        if(gray_ready) begin 
            gray_req <= 1'b1;
            if(gc_addr < 14'd16256) begin
                case(state) 
                    4'd0:begin
                        if(first == 1'b1) begin
                            first <= 1'b0;
                            gray_addr <= gc_addr - 8'd129;
                            gc <= gray_data;
                        end
                        else begin
                            if(`marginal(gc_addr)) begin
                                gc_addr <= gc_addr + 1'd1;
                                gray_addr <= gc_addr + 1'd1;
                                first <= 1'b1;
                            end
                            else begin
                                lbp_addr <= gc_addr;
                                gp <= gray_data;
                                lbp_data <= 8'd0;
                                gray_addr <= gc_addr - 8'd128;
                                state <= state + 1'd1;
                            end
                        end
                    end
                    4'd1:begin
                        lbp_valid <= 1'b0;
                        gp <= gray_data;
                        gray_addr <= gc_addr - 8'd127;
                        lbp_data <= lbp_data + `s(gp, gc);
                        state <= state +1'd1;
                    end
                    4'd2:begin
                        gp <= gray_data;
                        gray_addr <= gc_addr - 8'd1;
                        lbp_data <= lbp_data + (`s(gp, gc) << 1);
                        state <= state +1'd1;
                    end
                    4'd3:begin
                        gp <= gray_data;
                        gray_addr <= gc_addr + 8'd1;
                        lbp_data <= lbp_data + (`s(gp, gc) << 2);
                        state <= state +1'd1;
                    end
                    4'd4:begin
                        gp <= gray_data;
                        gray_addr <= gc_addr + 8'd127;
                        lbp_data <= lbp_data + (`s(gp, gc) << 3);
                        state <= state +1'd1;
                    end
                    4'd5:begin
                        gp <= gray_data;
                        gray_addr <= gc_addr + 8'd128;
                        lbp_data <= lbp_data + (`s(gp, gc) << 4);
                        state <= state +1'd1;
                    end
                    4'd6:begin
                        gp <= gray_data;
                        gray_addr <= gc_addr + 8'd129;
                        lbp_data <= lbp_data + (`s(gp, gc) << 5);
                        state <= state +1'd1;
                    end
                    4'd7:begin
                        gp <= gray_data;
                        gc_addr <= gc_addr + 1'd1;
                        gray_addr <= gc_addr + 1;
                        lbp_data <= lbp_data + (`s(gp, gc) << 6);
                        state <= state +1'd1;
                    end
                    4'd8:begin
                        gc <= gray_data;
                        gray_addr <= gc_addr - 8'd129;
                        lbp_data <= lbp_data + (`s(gp, gc) << 7);
                        state <= 1'd0;
                        lbp_valid <= 1;
                    end
                endcase
            end
            else begin
                finish <= 1'b1;
            end 
        end
    end
end
//====================================================================
endmodule

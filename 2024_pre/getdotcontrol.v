module getdotcontrol(
    input clk,
    input rst,
    input [5:0] mul_H,
    input [5:0] div_H,
    input next,
    input rowend,
    output getdot,
    output reg [5:0] mul
);

assign getdot = next & mul + mul_H >= div_H ? 1'b1 : 1'b0;

always@(posedge clk, posedge rst) begin
    if(rst) begin
        mul <= 6'b0;
    end
    else begin
        if(rowend) begin
            mul <= 6'd0;
        end
        else if(next) begin
            mul <= mul + mul_H >= div_H ? mul + mul_H - div_H : mul + mul_H;
        end
    end
end



endmodule
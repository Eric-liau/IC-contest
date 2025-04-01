module dotcal(
    input clk,
    input rst,
    input start,
    input [22:0] dot0,
    input [22:0] dot1,
    input [22:0] dot2,
    input [22:0] dot3,
    input [5:0] mul,
    input [5:0] div,
    output reg finish,
    output reg busy,
    output reg [7:0] result
);

reg signed [22:0] a, b, c;
reg [17:0] mult_reg, divt_reg, mult1, divt1;
wire [17:0] mult, divt;
reg signed [37:0] res, part_reg, mul1, mul2, div1;
wire signed [37:0] part;
reg signed [25:0] res1;

reg [2:0] state, nextstate;

assign part = ($signed(mul1) * $signed(mul2)) / $signed(div1);
assign mult = mult1 * mul;
assign divt = divt1 * div;

localparam [2:0]    IDLE = 3'd0,
                    D1 = 3'd1,
                    D2 = 3'd2,
                    D3 = 3'd3,
                    D4 = 3'd4,
                    D5 = 3'd5,
                    D6 = 3'd6;

always @(*) begin
    case(state)
        IDLE : begin
            nextstate = start ? D1 : IDLE;
        end
        D1 : begin
            nextstate = D2;
        end
        D2 : begin
            nextstate = D3;
        end
        D3 : begin
            nextstate = D4;
        end
        D4 : begin
            nextstate = D5;
        end
        D5 : begin
            nextstate = D6;
        end
        D6 : begin
            nextstate = IDLE;
        end
        default : begin
            nextstate = IDLE;
        end
    endcase
end
always @(*) begin
    case(state)
        D5 : begin
            res1 = res[37:12] + res[11];
        end
        default : begin
            res1 = 26'b0;
        end
    endcase
end
always @(*) begin
    case(state)
        IDLE : begin
            mul1 = {{15{dot1[22]}}, dot1};
            mul2 = 38'b1;
            div1 = 38'b1;
            mult1 = 18'b0;
            divt1 = 18'b0;
        end
        D1 : begin
            mul1 = {{15{c[22]}}, c};
            mul2 = {32'b0, mul};
            div1 = {32'b0, div};
            mult1 = mul;
            divt1 = div;
        end
        D2 : begin
            mul1 = {{15{b[22]}}, b};
            mul2 = {20'b0, mult_reg};
            div1 = {20'b0, divt_reg};
            mult1 = mult_reg;
            divt1 = divt_reg;
        end
        D3 : begin
            mul1 = {{15{a[22]}}, a};
            mul2 = {20'b0, mult_reg};
            div1 = {20'b0, divt_reg};
            mult1 = 18'b0;
            divt1 = 18'b0;
        end
        default : begin
            mul1 = 38'b0;
            mul2 = 38'b0;
            div1 = 38'b1;
            mult1 = 18'b0;
            divt1 = 18'b0;
        end
    endcase
end
always @(posedge clk) begin
    case(state)
        IDLE : begin
            a <= (dot1 + (dot1 >> 1) - (dot0 >> 1) - dot2 - (dot2 >> 1) + (dot3 >> 1)); 
            b <= (dot0 - (dot1 << 1) - (dot1 >> 1) + (dot2 << 1) - (dot3 >> 1));
            c <= ((dot2 >> 1) - (dot0 >> 1));
            part_reg <= part;//{{15{dot1[22]}}, dot1};
            res <= 38'b0;
            busy <= start ? 1'b1 : 1'b0;
            finish <= 1'b0;
        end
        D1 : begin
            mult_reg <= mult;
            divt_reg <= divt;
            part_reg <= part;//($signed({{15{c[22]}}, c}) * $signed({32'b0, mul})) / $signed({32'b0, div});
            res <= res + part_reg;
        end
        D2 : begin
            mult_reg <= mult;
            divt_reg <= divt;
            part_reg <= part;//($signed({{15{b[22]}}, b}) * $signed({20'b0, mult_reg})) / $signed({20'b0, divt_reg});
            res <= res + part_reg;
        end
        D3 : begin
            part_reg <= part;//($signed({{15{a[22]}}, a}) * $signed({20'b0, mult_reg})) / $signed({20'b0, divt_reg});
            res <= res + part_reg;
        end
        D4 : begin
            res <= res + part_reg;
        end
        D5 : begin
            result <= res1[25] ? 8'b0 : res1 > 26'd255 ? 8'd255 : res1[7:0];
            finish <= 1'b1;
        end
        D6 : begin
            finish <= 1'b0;
            busy <= 1'b0;
        end
    endcase

end

always @(posedge clk, posedge rst) begin
    if(rst) begin
        state <= IDLE;
    end
    else begin
        state <= nextstate;
    end
end

endmodule
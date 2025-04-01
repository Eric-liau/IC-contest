`include "ResultSRAM.v"
`include "ImgROM.v"
`include "dotcal.v"
`include "addrcal.v"
`include "getromaddr.v"

module Bicubic (
    input CLK,
    input RST,
    input [6:0] V0,
    input [6:0] H0,
    input [4:0] SW,
    input [4:0] SH,
    input [5:0] TW,
    input [5:0] TH,
    output reg DONE
);

//function logic [13:0] mul_100;
//        input logic [6:0] x;
//        begin
//            mul_100 = x << 6 + x << 5 + x << 2;
//        end
//endfunction
reg [7:0] dot[4:0];

reg [7:0] newline0 [62:0];
reg [7:0] newline1 [62:0];
reg [7:0] newline2 [62:0];
reg [7:0] newline3 [62:0];
reg [7:0] newline4 [62:0];

reg [3:0] state, nextstate;
reg CEN_ROM, CEN_SRAM, WEN_SRAM;
reg [13:0] A_ROM, A_SRAM;
reg [7:0] Q_ROM, Q_SRAM, D_SRAM;

reg [4:0] mul, div, mul_H, mul_V;
reg [5:0] rowcnt, colcnt;

reg [2:0] dotnum, rownum;

localparam [3:0]    IDLE = 4'd0,
                    ROW_CAL = 4'd1,
                    COL_CAL = 4'd2,
                    FIN = 4'd3;


always@(*) begin
    case(state) 
        IDLE : begin

        end
        ROW_CAL : begin
            nextstate = rownum >= 3'd4 ? COL_CAL : ROW_CAL;
        end
        COL_CAL : begin
            nextstate = rownum >= 3'd4 ? COL_CAL : ROW_CAL;
        end

    endcase

end

always@(posedge CLK, posedge RST) begin
    if(RST) begin
        dotnum <= 3'b0;
        rownum <= 3'b0;
    end
    else begin
        dotnum <= dotnum >= 3'd4 ? dotnum : dotnum + 3'd1;
    end
end

// sram 寫資料位置(row, col)
always@(posedge CLK, posedge RST) begin
    if(RST) begin
        rowcnt <= 6'b0;
        colcnt <= 6'b0;
    end
    else begin
        colcnt <= colcnt == TW - 6'd1 ? 6'd0 : colcnt + 6'd1;
        rowcnt <= colcnt == TW - 6'd1 ? rowcnt + 6'd1 : rowcnt;
    end
end
// dotcal mul value
always@(posedge CLK, posedge RST) begin
    if(RST) begin
        mul_H <= 5'b0;
        mul_V <= 5'b0;
        mul <= 5'b0;
        div <= 5'b0;
    end
    else begin

    end
end
// 三次內插計算
dotcal dotcal(
    .clk(CLK),
    .rst(RST),
    .dot0({3'b0, dot0, 3'b0}),
    .dot1({3'b0, dot1, 3'b0}),
    .dot2({3'b0, dot2, 3'b0}),
    .dot3({3'b0, dot3, 3'b0}),
    .mul(mul),
    .div(div),
    .result()
);
// 計算 address
addrcal ROMaddr(
    .H(),
    .V(),
    .A(A_SRAM)
);
// 狀態機
always@(posedge CLK, posedge RST) begin
    if(RST) begin
        state <= IDLE;
    end
    else begin
        state <= nextstate;
    end
end

ResultSRAM u_ResultSRAM(
    .CLK(CLK),
    .CEN(CEN_SRAM),
    .WEN(WEN_SRAM),
    .A(A_SRAM),
    .D(D_SRAM),
    .Q(Q_SRAM)
);

ImgROM u_ImgROM(
    CLK(CLK),
    CEN(CEN_ROM),
    A(A_ROM),
    Q(Q_ROM)
);

always@(posedge CLK, posedge RST) begin
    if(RST) begin
        DONE <= 1'b0;
    end
    else begin

    end

end

getromaddr getromaddr(
    clk(CLK),
    rst(RST),
    enable(),
    done(DONE),
    H0(H0),
    V0(V0),
    SW(SW),
    SH(SH),
    rowend(),
    A(A_ROM)
);

endmodule



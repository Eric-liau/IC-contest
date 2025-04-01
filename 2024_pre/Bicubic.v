//`include "ResultSRAM.v"
//`include "ImgROM.v"
`include "dotcal.v"
`include "addrcal.v"
//`include "getromaddr.v"

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


reg [7:0] dot_reg0 [3:0];
reg [7:0] dot_reg1 [3:0];

reg [5:0] mul_x, mul_y, new_x, new_y;
reg [6:0] x, y;
reg [2:0] state, nextstate, state1, nextstate1;
reg cal;
wire cal_busy;
reg [4:0] count, count_max;

reg [13:0] sram_A;
reg [7:0] sram_D;

reg usereg1;

wire [5:0] div_W, div_H, mul_W, mul_H;
reg [5:0] mul, div;
wire [6:0] x_max, y_max;
reg [6:0] rom_H, rom_V;
wire [7:0] cal_result, rom_Q;
wire [13:0] rom_A;
reg [13:0] rom_A_reg;
reg [7:0] dot [3:0];
reg wait_read, wait_write;
wire cal_fin;

integer  i;

assign mul_W = {1'b0, SW} - 6'b1;
assign mul_H = {1'b0, SH} - 6'b1;
assign div_W = TW - 6'b1;
assign div_H = TH - 6'b1;
assign x_max = H0 + {2'b0, SW} - 7'b1;
assign y_max = V0 + {2'b0, SH} - 7'b1;


localparam [2:0]    IDLE = 3'd0,
                    H_OVERLAP = 3'd1,
                    V_OVERLAP = 3'd2,
                    HV_OVERLAP = 3'd3,
                    NO_OVERLAP = 3'd4;

localparam [2:0]    decide = 3'd1,
                    read = 3'd2,
                    write = 3'd3;

always @(posedge CLK, posedge RST) begin
    if(RST) begin
        usereg1 <= 1'b0;
    end
    else begin
        if(usereg1)
            usereg1 <= cal ? 1'b1 : 1'b0;
        else
            usereg1 <= count == 5'd17 ? 1'b1 : usereg1;
    end
end

always@(posedge CLK, posedge RST) begin
    if(RST) begin
        rom_A_reg <= 14'b0;
    end
    else begin
        if(state1 == read && ~wait_read) begin
            rom_A_reg <= rom_A;
        end
    end
end

always@(posedge CLK, posedge RST) begin
    if(RST) begin
        sram_D <= 8'b0;
    end
    else if(state == HV_OVERLAP & state1 == decide) begin
        sram_D <= rom_Q;
    end
    else if(cal_fin) begin
        sram_D <= cal_result;
    end
end
always@(posedge CLK, posedge RST) begin
    if(RST) begin
        sram_A <= 14'b0;
    end
    else if(state == HV_OVERLAP & state1 == decide) begin
        sram_A <= TW * new_y + new_x;
    end
    else if(cal & ~cal_busy & ~usereg1) begin
        case(state) 
            H_OVERLAP : begin
                sram_A <= TW * new_y + new_x;
            end
            V_OVERLAP : begin
                sram_A <= TW * new_y + new_x;
            end
            NO_OVERLAP : begin
                sram_A <= TW * new_y + new_x;
            end
            default : begin
                sram_A <= 14'b0;
            end
        endcase
    end
end
// dotcal mul, div
always@(posedge CLK) begin
    if(cal) begin
        case(state)
            H_OVERLAP : begin
                mul = mul_y;
                div = div_H;
            end
            V_OVERLAP : begin
                mul = mul_x;
                div = div_W;
            end
            NO_OVERLAP : begin
                mul = usereg1 ? mul_y : mul_x;
                div = usereg1 ? div_H : div_W;
            end
            default : begin
                mul = 6'b0;
                div = 6'b0;
            end
        endcase
    end
    //else begin
    //    mul = 6'b0;
    //    div = 6'b0;
    //end
end
// dotcal dot
always@(*) begin
    if(usereg1) begin
        for(i = 0; i <= 3; i = i + 1) begin
            dot[i] = dot_reg1[i];
        end
    end
    else if(cal) begin
        for(i = 0; i <= 3; i = i + 1) begin
            dot[i] = dot_reg0[i];
        end
    end
    else begin
        for(i = 0; i <= 3; i = i + 1) begin
            dot[i] = 8'b0;
        end
    end
end
//cal signal control
always@(posedge CLK, posedge RST) begin
    if(RST) begin
        cal <= 1'b0;
    end
    else begin
        if(cal)
            cal <= cal_busy ? 1'b1 : 1'b0;
        else
            cal <= (count[1:0] == 2'b0 & count[4:2] != 3'b0 & ~wait_read) | (count == 5'd17 & ~wait_read) ? 1'b1 : 1'b0;
    end
end
//dot reg write
always@(posedge CLK) begin
    if(state1 == read & ~wait_read) begin
        dot_reg0[count[1:0] - 2'b1] <= rom_Q;
    end
    if(cal_fin) begin
        dot_reg1[count[3:2] - 2'b1] <= cal_result;
    end
end
//rom address(rom_H, rom_V)
always@(*) begin
    if(state1 == read & ~wait_read) begin
        case(state)
            H_OVERLAP : begin
                rom_H = x;
                rom_V = y - 7'd1 + {3'b0, count};
            end
            V_OVERLAP : begin
                rom_H = x - 7'd1 + {3'b0, count};
                rom_V = y;
            end
            HV_OVERLAP : begin
                rom_H = x;
                rom_V = y;
            end
            NO_OVERLAP : begin
                rom_H = x - 7'd1 + {5'b0, count[1:0]};
                rom_V = y - 7'd1 + {5'b0, count[3:2]};
            end
            default : begin
                rom_H = 7'b0;
                rom_V = 7'b0;
            end
        endcase
    end
    else begin
        rom_H = 7'b0;
        rom_V = 7'b0;
    end
end

always@(posedge CLK, posedge RST) begin
    if(RST) begin
        count_max <= 5'b0;
    end
    else begin
        if(state1 == decide) begin
            case(nextstate)
                H_OVERLAP : begin
                    count_max <= 5'd3;
                end
                V_OVERLAP : begin
                    count_max <= 5'd3;
                end
                HV_OVERLAP : begin
                    count_max <= 5'd1; // +1 due toavoid dotcal error 
                end
                NO_OVERLAP : begin
                    count_max <= 5'd16;
                end
            endcase
        end
    end
end
always@(posedge CLK, posedge RST) begin
    if(RST) begin
        count <= 5'b0;
    end
    else begin
        if(state1 == decide) begin
            count <= 5'b0;
        end
        else if(state1 == read & wait_read) begin
            count <= cal & cal_busy ? count : count + 5'b1;
        end
    end
end


always@(*) begin
    if(DONE) begin
        nextstate = IDLE;
    end
    else if(state1 == decide) begin
        if(mul_x == 6'b0 && mul_y == 6'b0) begin
            nextstate = HV_OVERLAP;
        end
        else if(mul_y == 6'b0) begin
            nextstate = V_OVERLAP;
        end
        else if(mul_x == 6'b0) begin
            nextstate = H_OVERLAP;
        end
        else begin
            nextstate = NO_OVERLAP;
        end
    end
    else begin
        nextstate = state;
    end  
end

always@(posedge CLK, posedge RST) begin
    if(RST) begin
        mul_x <= 6'b0;
        mul_y <= 6'b0;
    end
    else begin
        if(state == IDLE) begin
            mul_x <= 6'b0;
            mul_y <= 6'b0;
        end
        else if(nextstate1 == decide) begin
            if(x == x_max) begin
                mul_x <= 6'b0;
                mul_y <= mul_y + mul_H >= div_H ? mul_y + mul_H - div_H : mul_y + mul_H;
            end
            else begin
                mul_x <= mul_x + mul_W >= div_W ? mul_x + mul_W - div_W : mul_x + mul_W;
                mul_y <= mul_y;
            end
        end
    end
end

always@(posedge CLK, posedge RST) begin
    if(RST) begin
        new_x <= 7'b0 - 7'b1;
        new_y <= 7'b0;
    end
    else begin
        if(DONE) begin
            new_x <= 7'b0 - 7'b1;
            new_y <= 7'b0;
        end
        else if(state1 == decide) begin
            if(new_x == {1'b0, div_W}) begin
                new_x <= 7'b0;
                new_y <= new_y + 7'b1;
            end
            else begin
                new_x <= new_x + 7'b1;
            end
        end
    end
end
always@(posedge CLK, posedge RST) begin
    if(RST) begin
        x <= 7'b0;
        y <= 7'b0;
    end
    else begin
        if(state == IDLE) begin
            x <= H0;
            y <= V0;
        end
        else if(nextstate1 == decide) begin
            if(x == x_max) begin
                x <= H0;
                y <= mul_y + mul_H >= div_H ? y + 7'b1 : y;
            end
            else if(mul_x + mul_W >= div_W) begin
                x <= x + 7'b1;
            end
        end
    end
end
always@(posedge CLK, posedge RST) begin
    if(RST) begin
        wait_write <= 1'b0;
    end
    else begin
        if(cal_fin | (state == HV_OVERLAP & state1 == decide)) begin
            wait_write <= 1'b1;
        end
        else begin
            wait_write <= 1'b0;
        end
    end
end
always@(posedge CLK, posedge RST) begin
    if(RST) begin
        wait_read <= 1'b0;
    end
    else begin
        if(state1 == read) begin
            wait_read <= /*cal ? 1'b1 : */~wait_read;
        end
        else begin
            wait_read <= 1'b0;
        end
    end
end
always@(*) begin
    if(DONE) begin
        nextstate1 = IDLE;
    end
    else begin
        case(state1)
            IDLE : begin
                nextstate1 = decide;
            end
            decide : begin  
                nextstate1 = read;
            end
            read : begin
                nextstate1 = (count <= count_max | ~wait_read) ? read : decide;
            end
            //write : begin
            //    nextstate1 = decide; 
            //end
            default : begin
                nextstate1 = IDLE;
            end
        endcase
    end
end
always@(posedge CLK, posedge RST) begin
    if(RST) begin
        state <= IDLE;
        state1 <= IDLE;
    end
    else begin
        state <= nextstate;
        state1 <= nextstate1;
    end
end

dotcal dotcal(
    .clk(CLK),
    .rst(RST),
    .start(cal),
    .dot0({3'b0, dot[0], 12'b0}),
    .dot1({3'b0, dot[1], 12'b0}),
    .dot2({3'b0, dot[2], 12'b0}),
    .dot3({3'b0, dot[3], 12'b0}),
    .mul(mul),
    .div(div),
    .busy(cal_busy),
    .finish(cal_fin),
    .result(cal_result)
);


ResultSRAM u_ResultSRAM(
    .CLK(~CLK),
    .CEN(1'b0),
    .WEN(~wait_write),
    .A(sram_A),
    .D(sram_D),
    .Q()
);

ImgROM u_ImgROM(
    .CLK(~CLK),
    .CEN(~(state1 == read)),
    .A(rom_A_reg),
    .Q(rom_Q)
);

addrcal rom_addr(
    .V(rom_V),
    .H(rom_H),
    .A(rom_A)
);

always@(posedge CLK, posedge RST) begin
    if(RST) begin
        DONE <= 1'b0;
    end
    else begin
        if(state1 == decide & new_x == div_W & new_y == div_H) begin
            DONE <= 1'b1;
        end
        else if(DONE) begin
            DONE <= 1'b0;
        end
    end

end



endmodule



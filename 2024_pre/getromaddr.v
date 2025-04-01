`include "addrcal.v"

module getromaddr(
    input clk,
    input rst,
    input enable,
    input done,
    input [6:0] H0,
    input [6:0] V0,
    input [4:0] SW,
    input [4:0] SH,
    output rowend,
    output [13:0] A
);

reg [6:0] H, V, H_MAX, V_MAX, H_MIN, V_MIN;
reg [1:0] state, nextstate;

assign H_MIN = H0 - 7'd1;
assign V_MIN = V0 - 7'd1;
assign H_MAX = H0 + {2'b0, SW};
assign V_MAX = V0 + {2'b0, SH};

assign rowend = H == H_MAX ? 1'b1 : 1'b0;

localparam [1:0]    IDLE = 2'd0,
                    RUN = 2'd1,
                    FIN = 2'd2;

always@(*) begin
    case(state)
        IDLE : begin
            nextstate = RUN;
        end
        RUN : begin
            nextstate = done ? FIN : RUN;
        end
        FIN : begin
            nextstate = IDLE;
        end
    endcase
end


always@(posedge clk, posedge rst) begin
    if(rst) begin
        H <= 7'b0;
        V <= 7'b0;
    end
    else begin
        case(state)
            IDLE : begin
                H <= H_MIN;
                V <= V_MIN;
            end
            RUN : begin
                if(enable) begin
                    H <= H == H_MAX ? H_MIN : H + 7'd1;
                    V <= H == H_MAX ? V + 7'd1 : V;
                end
            end
            default : begin
                H <= 7'b0
                V <= 7'b0;
            end
        endcase
    end
end

always@(posedge clk, posedge rst) begin
    if(rst) begin
        state <= IDLE;
    end
    else begin
        state <= nextstate;
    end
end

always@(posedge clk, posedge rst) begin
    if(rst) begin
        H <= 7'b0;
        V <= 7'b0;
    end
    else begin

    end
end

addrcal addrcal(
    .H(H),
    .V(V),
    .A(A)
);

endmodule

module JAM (
input CLK,
input RST,
output reg [2:0] W,
output reg [2:0] J,
input [6:0] Cost,
output reg [3:0] MatchCount,
output reg [9:0] MinCost,
output reg Valid );

integer i;

reg [2:0] state, nextstate;
//reg [2:0] W_pre, J_pre;
reg [3:0] count;
wire [2:0] line [7:0];
//reg [6:0] cost_table [7:0][7:0];
wire sort_done, finish;
reg next;
reg [9:0] cur_cost;

localparam [2:0]    IDLE = 3'd0,
                    READ = 3'd1,
                    SORT = 3'd2,
                    CAL = 3'd3,
                    CHECK = 3'd4;

sort sort(
    .CLK(CLK),
    .RST(RST),
    .next(next),
    .changed(sort_done),
    .finish(finish),
    .sort({line[0], line[1], line[2], line[3], line[4], line[5], line[6], line[7]}) 
);

always @(*) begin
    case(state)
        IDLE : begin
            nextstate = SORT;
        end
        //READ : begin
        //    nextstate = W == 3'd7 & J == 3'd7 ? SORT : READ;
        //end
        SORT : begin
            nextstate = sort_done ? CAL : SORT;
        end
        CAL : begin
            nextstate = cur_cost + Cost > MinCost ? SORT : (count == 4'd9 ? CHECK : CAL);
        end
        CHECK : begin
            nextstate = SORT;
        end
        default : begin
            nextstate = IDLE;
        end
    endcase
end

always @(posedge CLK, posedge RST) begin
    if(RST) begin
        cur_cost <= 10'b0;
        count <= 4'b0;
    end
    else begin
        case(state)
            SORT : begin
                cur_cost <= 10'b0;
                count <= sort_done ? count + 4'b1 : 4'b0;
            end
            CHECK : begin
                //cur_cost <= 10'b0;
                count <= sort_done ? count + 4'b1 : 4'b0;
            end 
            CAL : begin
                count <= count + 4'b1;
                if(count > 4'd1) begin
                    cur_cost <= cur_cost + Cost;
                end
                if(cur_cost + Cost > MinCost) begin
                    count <= 4'b0;
                end
            end
        endcase
    end
end
always @(posedge CLK, posedge RST) begin
    if(RST) begin
        MatchCount <= 4'b0;
        MinCost <= 10'b0 - 10'b1;
    end
    else begin
        case(state)
            CHECK : begin
                if(cur_cost < MinCost) begin
                    MinCost <= cur_cost;
                    MatchCount <= 4'd1;
                end
                else if(cur_cost == MinCost) begin
                    MatchCount <= MatchCount + 4'd1;
                end
            end
        endcase
    end
end
//always @(*) begin
//    cur_cost = 10'b0;
//    for(i = 0; i <= 7; i = i + 1) begin
//        cur_cost = cur_cost + cost_table[i][line[i]];
//    end
//end
always @(*) begin
    case(state)
        SORT : begin
            next = ~sort_done;
        end
        //CAL : begin
        //    
        //end
        CHECK : begin
            next = 1'b1;
        end
        default : begin
            next = 1'b0;
        end
    endcase
end
//always @(posedge CLK) begin
//    cost_table[W_pre][J_pre] <= Cost;
//end

always @(posedge CLK, posedge RST) begin
    if(RST) begin
        W <= 3'b0;
        J <= 3'b0;
    end
    else begin
        case(state)
            //IDLE : begin
            //    if(J == 3'd7) begin
            //        J <= 3'd0;
            //        W <= W + 3'd1;
            //    end
            //    else begin
            //        J <= J + 3'd1;
            //    end
            //end 
            //READ : begin
            //    if(J == 3'd7) begin
            //        J <= 3'd0;
            //        W <= W + 3'd1;
            //    end
            //    else begin
            //        J <= J + 3'd1;
            //    end
            //end
            SORT : begin
                W <= count;
                J <= line[count];
            end
            CAL : begin
                W <= count;
                J <= line[count];
            end
            default : begin
                W <= 3'd0;
                J <= 3'd0;
            end
        endcase
    end
end
//always @(posedge CLK) begin
//    W_pre <= W;
//    J_pre <= J;
//end
always @(posedge CLK, posedge RST) begin
    if(RST) begin
        state <= IDLE;
        Valid <= 1'b0;
    end
    else begin
        state <= nextstate;
        Valid <= finish;
    end
end



endmodule



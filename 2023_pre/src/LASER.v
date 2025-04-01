
module LASER (
    input CLK,
    input RST,
    input [3:0] X,
    input [3:0] Y,
    output reg [3:0] C1X,
    output reg [3:0] C1Y,
    output reg [3:0] C2X,
    output reg [3:0] C2Y,
    output reg DONE
);


wire [2:0] searchtable [4:0];
reg [3:0] x_table [39:0];
reg [3:0] y_table [39:0];
reg [39:0] in_circle [1:0], in_circle_temp;
reg [5:0] count, num[1:0],/* max_num,*/ cur_num, temp, overlap_num,/* cur_overlap,*/ overlap_num_temp, total_num, pre_total_num;
reg [3:0] cur_x, cur_y,/* max_x, max_y,*/ x_diff, y_diff;
wire [3:0] min, max;

reg turn;
reg [2:0] state, nextstate;
reg [2:0] iter_num;

assign searchtable[0] = 3'd4;
assign searchtable[1] = 3'd3;
assign searchtable[2] = 3'd3;
assign searchtable[3] = 3'd2;
assign searchtable[4] = 3'd0;
assign min = 4'd2;
assign max = 4'd13;

localparam [2:0]    READ = 3'd0,
                    INIT = 3'd1,
                    CAL = 3'd2,
                    CHECK = 3'd3;



localparam [5:0]    CAL_MAX = 6'd40,
                    READ_MAX = 6'd39;

always @(*) begin
    x_diff = cur_x > x_table[count] ? cur_x - x_table[count] : x_table[count] - cur_x;
    y_diff = cur_y > y_table[count] ? cur_y - y_table[count] : y_table[count] - cur_y;
end

always @(posedge CLK, posedge RST) begin
    if(RST) begin
        iter_num <= 3'b0;
    end
    else begin
        if(DONE) begin
            iter_num <= 3'b0;
        end
        else if(state == CHECK) begin
            iter_num <= iter_num + 3'd1;
        end
    end
end

always @(posedge CLK, posedge RST) begin
    if(RST) begin
        turn <= 1'b0;
    end
    else begin
        turn <= state == INIT ? ~turn : turn;
    end
end

always @(posedge CLK, posedge RST) begin
    if(RST) begin
        DONE <= 1'b0;
    end
    else begin
        if(DONE) begin
            DONE <= 1'b0;
        end
        else if(state == CHECK) begin
            if(num[0] + num[1] - overlap_num == pre_total_num & iter_num >= 3'd4) begin
                DONE <= 1'b1;
            end
        end
    end
end

always @(posedge CLK, posedge RST) begin
    if(RST) begin
        total_num <= 6'b0;
        pre_total_num <= 6'b0;
    end
    else begin
        if(DONE) begin
            total_num <= 6'b0;
            pre_total_num <= 6'b0;
        end
        else if(state == INIT) begin
            total_num <= 6'b0;
            pre_total_num <= total_num;
        end
        else if(state == CHECK) begin
            total_num <= num[0] + num[1] - overlap_num;
        end
        
    end
end

always @(posedge CLK, posedge RST) begin
    if(RST) begin
        in_circle[0] <= 40'b0;
        in_circle[1] <= 40'b0;
        //cur_overlap <= 6'b0;
    end
    else begin
        if(DONE) begin
            in_circle[0] <= 40'b0;
            in_circle[1] <= 40'b0;
            //cur_overlap <= 6'b0;
        end
        else begin
            case(state) 
                INIT : begin
                    in_circle[~turn] <= 40'b0;
                    //cur_overlap <= 6'b0; 
                end
                CAL : begin
                    if(count == CAL_MAX & cur_num - overlap_num_temp >= num[turn] - overlap_num) begin
                        in_circle[turn] <= in_circle_temp;
                        //cur_overlap <= overlap_num_temp;
                    end
                end
            endcase
        end
    end
end

always @(posedge CLK, posedge RST) begin
    if(RST) begin
        cur_num <= 6'b0;
        in_circle_temp <= 40'b0;
        overlap_num_temp <= 6'b0;
    end
    else begin
        if(DONE) begin
            cur_num <= 6'b0;
            in_circle_temp <= 40'b0;
            overlap_num_temp <= 6'b0;
        end
        else if(state == CAL & count < CAL_MAX) begin
            if(x_diff <= 4'd4) begin
                if(y_diff <= searchtable[x_diff]) begin
                    cur_num <= cur_num + 6'd1;
                    in_circle_temp[count] <= 1'b1;
                    overlap_num_temp <= in_circle[~turn][count] ? overlap_num_temp + 6'd1 : overlap_num_temp; 
                end
            end
        end
        else if(state == CAL & count == CAL_MAX) begin
            cur_num <= 6'b0;
            in_circle_temp <= 40'b0;
            overlap_num_temp <= 6'b0;
        end
    end
end

//always @(posedge CLK, posedge RST) begin
//    if(RST) begin
//        max_num <= 6'b0;
//        max_x <= 4'b0;
//        max_y <= 4'b0;
//    end
//    else begin
//        if(DONE) begin
//            max_num <= 6'b0;
//            max_x <= 4'b0;
//            max_y <= 4'b0;
//        end
//        else if(state == CAL & count == CAL_MAX) begin
//            if(cur_num - overlap_num_temp >= max_num - cur_overlap) begin
//                max_num <= cur_num;
//                max_x <= cur_x;
//                max_y <= cur_y;
//            end
//        end
//        else if(state == INIT) begin
//            max_num <= 6'b0;
//            max_x <= 4'b0;
//            max_y <= 4'b0; 
//        end
//    end
//end

always @(posedge CLK, posedge RST) begin
    if(RST) begin
        num[0] <= 6'b0;
        num[1] <= 6'b0;
        overlap_num <= 6'b0;
    end
    else begin
        if(DONE) begin
            num[0] <= 6'b0;
            num[1] <= 6'b0;
            overlap_num <= 6'b0;
        end
        else if(state == CAL & count == CAL_MAX) begin
            if(cur_num - overlap_num_temp >= num[turn] - overlap_num) begin
                num[turn] <= cur_num;
                overlap_num <= overlap_num_temp;
            end
        end
        //else if(state == UPDATE) begin
        //    case(turn)
        //        1'b0 : begin
        //            num[0] <= max_num - cur_overlap >= num[0] - overlap_num ? max_num : num[0];
        //            overlap_num <= max_num - cur_overlap >= num[0] - overlap_num ? cur_overlap : overlap_num;
        //        end
        //        1'b1 : begin
        //            num[1] <= max_num - cur_overlap >= num[1] - overlap_num ? max_num : num[1];
        //            overlap_num <= max_num - cur_overlap >= num[1] - overlap_num ? cur_overlap : overlap_num;
        //        end
        //    endcase          
        //end
    end
end

always @(posedge CLK, posedge RST) begin
    if(RST) begin
        cur_x <= min;
        cur_y <= min;
    end
    else begin
        if(state == CAL) begin
            if(count == CAL_MAX) begin
                cur_x <= cur_x == max ? min : cur_x + 3'd1;
                cur_y <= cur_x == max ? cur_y + 3'd1 : cur_y;
            end
        end
        else begin
            cur_x <= min;
            cur_y <= min;
        end
    end
end

always @(*) begin
    case(state)
        READ : begin
            nextstate = count >= READ_MAX ? INIT : READ;  
        end
        INIT : begin
            nextstate = CAL;
        end
        CAL : begin
            nextstate = cur_x == max & cur_y == max & count == CAL_MAX ? CHECK : CAL;
        end
        //UPDATE : begin
        //    nextstate = CHECK;
        //end
        CHECK : begin
            nextstate = INIT;
        end
        default : begin
            nextstate = READ;
        end
    endcase
end

always @(posedge CLK, posedge RST) begin
    if(RST) begin
        C1X <= 4'b0;
        C1Y <= 4'b0;
        C2X <= 4'b0;
        C2Y <= 4'b0;
    end
    else begin
        if(state == CAL & count == CAL_MAX) begin
            if(cur_num - overlap_num_temp >= num[turn] - overlap_num) begin
                case(turn) 
                    1'b0 : begin
                        C1X <= cur_x;
                        C1Y <= cur_y;
                    end
                    1'b1 : begin
                        C2X <= cur_x;
                        C2Y <= cur_y;
                    end
                endcase
            end
        end
        //else if(state == UPDATE) begin
        //    case(turn) 
        //        1'b0 : begin
        //            C1X <= max_num - cur_overlap >= num[0] - overlap_num ? max_x : C1X;
        //            C1Y <= max_num - cur_overlap >= num[0] - overlap_num ? max_y : C1Y;
        //        end
        //        1'b1 : begin
        //            C2X <= max_num - cur_overlap >= num[1] - overlap_num ? max_x : C2X;
        //            C2Y <= max_num - cur_overlap >= num[1] - overlap_num ? max_y : C2Y;
        //        end
        //    endcase
        //end
    end
end

always @(posedge CLK) begin
    if(state == READ) begin
        x_table[count] <= X;
        y_table[count] <= Y;
    end
end

always @(posedge CLK, posedge RST) begin
    if(RST) begin
        count <= 6'b0;
    end
    else begin
        if(DONE | state == INIT) begin
            count <= 6'b0;
        end
        else if(state == READ) begin
            count <= count + 6'b1;
        end
        else if(state == CAL) begin
            count <= count < CAL_MAX ? count + 6'd1 : 6'd0;
        end
    end
end 
 
always @(posedge CLK, posedge RST) begin
    if(RST) begin
        state <= READ;
    end
    else begin
        if(DONE) begin
            state <= READ;
        end
        else begin
            state <= nextstate;
        end
    end
end

endmodule



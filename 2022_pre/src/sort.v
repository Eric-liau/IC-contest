module sort(
    input CLK,
    input RST,
    input next,
    output reg changed,
    output reg finish,
    output reg [23:0] sort 
);

reg [2:0] line [7:0], nextline [7:0];
reg [1:0] state, nextstate;
reg [2:0] index, pivot, cur_min, min_id;
reg [1:0] count;
reg full;
reg done;
wire [2:0] diff;
assign diff = 3'd7 - pivot;
integer  i;

localparam [1:0]    IDLE = 2'd0,
                    STEP1 = 2'd1,
                    STEP2 = 2'd2,
                    STEP3 = 2'd3;

always @(*) begin
    case(state)
    IDLE : begin
        nextstate = ~full & ~done ? STEP1 : IDLE;
    end
    STEP1 : begin
        nextstate = nextline[index - 3'd1] < nextline[index] ? STEP2 : STEP1;
    end
    STEP2 : begin
        nextstate = index == pivot ? STEP3 : STEP2;
    end
    STEP3 : begin
        nextstate = count >= diff[2:1] ? IDLE : STEP3;
    end
    endcase
end


always @(posedge CLK, posedge RST) begin
    if(RST) begin
        changed <= 1'b0;
        for(i = 0; i < 8; i = i + 1) begin
            line[i] <= i;
        end
    end
    else begin
        if(next & full) begin
            changed <= 1'b1;
            for(i = 0; i < 8; i = i + 1) begin
                line[i] <= nextline[i];
            end
        end
        else begin
            changed <= 1'b0;
        end
    end
end
always @(posedge CLK, posedge RST) begin
    if(RST) begin
        full <= 1'b1;
    end
    else begin
        if(done) begin
            full <= ~full;
        end
        else if(next & full) begin
            full <= ~full;
        end
    end 
end
always @(posedge CLK, posedge RST) begin
    if(RST) begin
        for(i = 0; i < 8; i = i + 1) begin
            nextline[i] <= i;
        end
        done <= 1'b0;
        cur_min <= 3'd7;
        min_id <= 3'd0;
        count <= 2'd0;
    end
    else begin
        case(state)
            IDLE : begin
                done <= 1'b0;
                cur_min <= 3'd7;
                min_id <= 3'd7;
                count <= 2'd1;
            end
            STEP1 : begin
                if(nextline[index - 3'd1] < nextline[index]) begin
                    pivot <= index - 3'd1;
                end
            end
            STEP2 : begin
                if(index == pivot) begin
                    nextline[min_id] <= nextline[pivot];
                    nextline[pivot] <= nextline[min_id];
                end
                else if(nextline[index] > nextline[pivot]) begin
                    if(nextline[index] <= cur_min) begin
                        cur_min <= nextline[index];
                        min_id <= index;
                    end
                end
            end
            STEP3 : begin
                count <= count + 2'd1;
                nextline[pivot + count] <= nextline[3'd0 - count];
                nextline[3'd0 - count] <= nextline[pivot + count];
                done <= count >= diff[2:1] ? 1'b1 : 1'b0;
            end
        endcase
    end
end
always @(posedge CLK, posedge RST) begin
    if(RST) begin
        finish <= 1'b0;
    end
    else begin
        case(state)
            STEP1 : begin
                finish <= index == 3'd0 ? 1'b1 : 1'b0;
            end
        endcase
    end
end
always @(posedge CLK, posedge RST) begin
    if(RST) begin
        index <= 3'd0;
    end
    else begin
        case(state) 
            IDLE : begin
                index <= 3'd7;
            end
            STEP1 : begin
                if(nextline[index - 3'd1] < nextline[index]) begin
                    index <= 3'd7;
                end
                else begin
                    index <= index - 3'd1;
                end
            end
            default : begin
                index <= index - 3'd1;
            end
        endcase
    end
end
always @(posedge CLK, posedge RST) begin
    if(RST) begin
        state <= IDLE;
    end
    else begin
        state <= nextstate;
    end
end
always @(*) begin
    sort = changed ? {nextline[0], nextline[1], nextline[2], nextline[3], nextline[4], nextline[5], nextline[6], nextline[7]} : {line[0], line[1], line[2], line[3], line[4], line[5], line[6], line[7]};
end

endmodule
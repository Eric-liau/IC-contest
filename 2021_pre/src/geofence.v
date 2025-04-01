
module geofence ( clk,reset,X,Y,R,valid,is_inside);
input clk;
input reset;
input [9:0] X;
input [9:0] Y;
input [10:0] R;
output reg valid;
output reg is_inside;

integer k;
reg [2:0] state, nextstate;
reg [2:0] num[4:0];
reg [2:0] i, j; 
reg [9:0] x_array[5:0], y_array[5:0];
reg [10:0] temp_x, temp_y, cur_x, cur_y;
wire [10:0] root;
reg [10:0] r_array[5:0];
reg [24:0] hexagon_area, tri_area;
reg [21:0] mul0, mul1, a, tri_area_temp;
//reg [9:0] multiplier0, multiplier1, multiplicand0, multiplicand1;
 

localparam [2:0]    LOAD = 3'd0,
                    SORT = 3'd1,
                    HEXA_CAL = 3'd2,
                    TRI_CAL = 3'd3,
                    FINISH = 3'd4;

DW_sqrt sqrt0(
    .a(a),
    .root(root)
);
always @(*) begin
    case (state)
        LOAD : begin
            nextstate = i == 3'd5 ? SORT : LOAD;
        end
        SORT : begin
            nextstate = i == 3'd5 ? HEXA_CAL : SORT;
        end
        HEXA_CAL : begin
            nextstate = i == 3'd6 ? TRI_CAL : HEXA_CAL;
        end
        TRI_CAL : begin
            nextstate = i == 3'd6 ? FINISH : TRI_CAL;
        end
        default : begin
            nextstate = LOAD;
        end 
    endcase
end
always @(*) begin
    a = 22'b0;
    case(state)
        TRI_CAL : begin
            case(j)
                3'd0 : begin
                    a = mul0 + mul1;
                end
                default : begin
                    a = mul0;
                end
            endcase
        end 
    endcase
end
always @(*) begin
    mul0 = 22'b0;
    mul1 = 22'b0;
    case(state)
        LOAD : begin
            if(i > 3'd1) begin
                mul0 = $signed(temp_x) * $signed(cur_y);
                mul1 = $signed(temp_y) * $signed(cur_x);
            end
        end
        SORT : begin
            if(i != j) begin
                mul0 = $signed(temp_x) * $signed(cur_y);
                mul1 = $signed(temp_y) * $signed(cur_x);
            end
        end
        HEXA_CAL : begin
            if(i == 3'd5) begin
                mul0 = x_array[5] * y_array[0];
                mul1 = x_array[0] * y_array[5];
            end
            else begin
                mul0 = x_array[i] * y_array[i + 3'd1];
                mul1 = x_array[i + 3'd1] * y_array[i];
            end
        end
        TRI_CAL : begin
            case(j)
                3'd0 : begin
                    if(i == 3'd5) begin
                        mul0 = (x_array[5] - x_array[0]) * (x_array[5] - x_array[0]);
                        mul1 = (y_array[5] - y_array[0]) * (y_array[5] - y_array[0]);
                    end
                    else begin
                        mul0 = (x_array[i] - x_array[i + 3'd1]) * (x_array[i] - x_array[i + 3'd1]);
                        mul1 = (y_array[i] - y_array[i + 3'd1]) * (y_array[i] - y_array[i + 3'd1]);
                    end
                end
                3'd1 : begin
                    mul0 = temp_y * (temp_y - r_array[i]);
                end
                3'd2 : begin
                    if(i == 3'd5) begin
                        mul0 = (temp_y - temp_x) * (temp_y - r_array[0]);
                    end
                    else begin
                        mul0 = (temp_y - temp_x) * (temp_y - r_array[i + 3'd1]);
                    end
                    mul1 = root * tri_area_temp;
                end

            endcase
        end
    endcase
end
always @(*) begin
    cur_x = 11'd0;
    cur_y = 11'd0;
    case(state)
        LOAD : begin
            if(i > 3'd1) begin
                cur_x = X - x_array[0];
                cur_y = Y - y_array[0];
            end
        end
        SORT : begin
            if(i != j) begin
                cur_x = x_array[j] - x_array[0];
                cur_y = y_array[j] - y_array[0];
            end
        end
    endcase
end
always @(posedge clk, posedge reset) begin
    if(reset) begin
        valid <= 1'b0;
        is_inside <= 1'b0;
    end
    else begin
        case(state)
            TRI_CAL : begin
                case(i)
                    3'd6 : begin
                        valid <= 1'b1;
                        is_inside <= tri_area <= hexagon_area;
                    end
                    default : begin
                        valid <= 1'b0;
                        is_inside <= 1'b0;
                    end
                endcase
            end
            default : begin
                valid <= 1'b0;
                is_inside <= 1'b0;
            end
        endcase
    end
end
always @(posedge clk, posedge reset) begin
    if(reset) begin
        tri_area <= 25'b0;
    end
    else begin
        case(state)
            TRI_CAL : begin
                case(j)
                    3'd3 : begin
                        tri_area <= tri_area + tri_area_temp;
                    end
                endcase
            end
            default : begin
                tri_area <= 25'b0;
            end
        endcase
    end
end
always @(posedge clk, posedge reset) begin
    if(reset) begin
        tri_area_temp <= 22'b0;
    end
    else begin
        case(state)
            TRI_CAL : begin
                case(j)
                    3'd1 : begin
                        tri_area_temp <= root;
                    end
                    3'd2 : begin
                        tri_area_temp <= mul1;
                    end
                endcase
            end
        endcase
    end
end
always @(posedge clk, posedge reset) begin
    if(reset) begin
        hexagon_area <= 25'd0;
    end
    else begin
        case(state)
            HEXA_CAL : begin
                if(i < 3'd6) begin
                    hexagon_area <= hexagon_area + ({5'b0, mul0} - {5'b0, mul1});
                end
                else begin
                    hexagon_area <= hexagon_area >>> 1;
                end
            end
            FINISH : begin
                hexagon_area <= 25'd0;
            end
        endcase
    end
end
always @(posedge clk, posedge reset) begin
    if(reset) begin
        temp_x <= 11'd0;
        temp_y <= 11'd0; 
    end
    else begin
        case(state)
            LOAD : begin
                if(i == 3'd1) begin
                    temp_x <= X - x_array[0];
                    temp_y <= Y - y_array[0]; 
                end
            end
            SORT : begin
                if(i == j) begin
                    temp_x <= x_array[i] - x_array[0];
                    temp_y <= y_array[i] - y_array[0]; 
                end
            end
            TRI_CAL : begin
                if(i == 3'd5) begin
                    case(j)
                        3'd0 : begin
                            temp_x <= root;//c
                            temp_y <= (root + r_array[5] + r_array[0]) >> 1;//s
                        end
                    endcase
                end
                else begin
                    case(j)
                        3'd0 : begin
                            temp_x <= root;//c
                            temp_y <= (root + r_array[i] + r_array[i + 3'd1]) >> 1;//s
                        end
                    endcase
                end
            end
        endcase
    end
end
always @(posedge clk, posedge reset) begin
    if(reset) begin
        num[0] <= 3'd1;
        num[1] <= 3'd1;
        num[2] <= 3'd1;
        num[3] <= 3'd1;
        num[4] <= 3'd1;
    end
    else begin
        case(state)
            LOAD : begin
                if(i > 3'd1) begin
                    if($signed(mul0) > $signed(mul1)) begin
                        num[i - 3'd1] <= num[i - 3'd1] + 3'd1;
                    end
                    else begin
                        num[0] <= num[0] + 3'd1;
                    end
                end
            end
            SORT : begin
                if(i != j) begin
                    if($signed(mul0) > $signed(mul1)) begin
                        num[j - 3'd1] <= num[j - 3'd1] + 3'd1;
                    end
                    else begin
                        num[i - 3'd1] <= num[i - 3'd1] + 3'd1;
                    end
                end
            end
            FINISH : begin
                num[0] <= 3'd1;
                num[1] <= 3'd1;
                num[2] <= 3'd1;
                num[3] <= 3'd1;
                num[4] <= 3'd1;
            end
        endcase
    end
end
always @(posedge clk) begin
    case(state)
        LOAD : begin
            x_array[i] <= X;
            y_array[i] <= Y;
            r_array[i] <= R;
        end
        SORT : begin
            if(i == 3'd5) begin
                for(k = 0; k < 5; k = k + 1) begin
                    x_array[num[k]] <= x_array[k + 1];
                    y_array[num[k]] <= y_array[k + 1];
                    r_array[num[k]] <= r_array[k + 1];
                end
            end
        end
    endcase
end
always @(posedge clk, posedge reset) begin
    if(reset) begin
        i <= 3'd0;
        j <= 3'd0;
    end
    else begin
        case(state)
            LOAD : begin
                i <= i == 3'd5 ? 3'd2 : i + 3'd1;
                j <= 3'd2;
            end
            SORT : begin
                i <= i == 3'd5 ? 3'd0 : (j == 3'd5 ? i + 3'd1 : i);
                j <= j == 3'd5 ? i + 3'd1 : j + 3'd1;   
            end
            HEXA_CAL : begin
                i <= i == 3'd6 ? 3'd0 : i + 3'd1;
                j <= 3'd0;
            end
            TRI_CAL : begin
                i <= i <= i == 3'd6 ? 3'd0 : (j == 3'd3 ? i + 3'd1 : i);
                j <= j == 3'd3 ? 3'd0 : j + 3'd1;
            end
            FINISH : begin
                i <= 3'd0;
                j <= 3'd0;
            end
        endcase
    end
end

always @(posedge clk, posedge reset) begin
    if(reset) begin
        state <= LOAD;
    end
    else begin
        state <= nextstate;
    end
end


endmodule


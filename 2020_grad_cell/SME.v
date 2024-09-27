
module SME(clk,reset,chardata,isstring,ispattern,valid,match,match_index);
input clk;
input reset;
input [7:0] chardata;
input isstring;
input ispattern;
output reg match;
output reg [4:0] match_index;
output reg valid;

reg [7:0]string[0:31];
reg [7:0]pattern[0:7];

reg [5:0] str_len, cur_str, str_start;
reg [3:0] cur_pat, pat_len, pat_start;
reg newstr;


always@(posedge clk, posedge reset) begin
    if(reset) begin
        str_len <= 6'd0;
        pat_len <= 4'd0;
        match <= 1'b0;
        match_index <= 5'd0;
        valid <= 1'b0;
        cur_str <= 6'd0;
        cur_pat <= 4'd0;
        newstr <= 1'b1;
        pat_start <= 4'd0;
        str_start <= 6'd0;
    end
    else begin
        if(valid) begin
            valid <= 1'b0;
        end
        // input
        if(isstring) begin
            if(newstr) begin
                string[0] <= chardata;
                str_len <= 6'd1;
                newstr <= 1'b0;
            end
            else begin
                string[str_len] <= chardata;
                str_len <= str_len + 1'd1;
            end
        end
        else if(ispattern) begin
            newstr <= 1'b1;
            match_index <= 5'd0;
            pattern[pat_len] <= chardata;
            pat_len <= pat_len + 1'd1;
        end
        // cal
        else begin
            if(cur_pat == pat_len) begin
                valid <= 1'b1;
                match <= 1'b1;
                pat_len <= 4'd0;
                cur_str <= 6'd0;
                cur_pat <= 4'd0;
                pat_start <= 4'd0;
                str_start <= 6'd0;
            end
            else if(pat_len - pat_start + str_start > str_len + 1'd1) begin
                valid <= 1'b1;
                match <= 1'b0;
                pat_len <= 4'd0;
                cur_str <= 6'd0;
                cur_pat <= 4'd0;
                pat_start <= 4'd0;
                str_start <= 6'd0;
            end
            else begin
                // .
                if(pattern[cur_pat] == 8'd46) begin
                    cur_pat <= cur_pat + 1'd1;
                    cur_str <= cur_str + 1'd1;
                end
                // *
                else if(pattern[cur_pat] == 8'd42) begin
                    cur_pat <= cur_pat + 1'd1;
                    pat_start <= cur_pat + 1'd1;
                    str_start <= cur_str;   
                end
                // ^
                else if(pattern[cur_pat] == 8'd94) begin
                    if(string[cur_str] == 8'd32) begin
                        cur_pat <= cur_pat + 1'd1;
                        cur_str <= cur_str + 1'd1;
                        match_index <= match_index + 1'd1;
                        str_start <= str_start + 1'd1;
                    end
                    else if(cur_str == 6'd0) begin
                        cur_pat <= cur_pat + 1'd1;
                        //cur_str <= cur_str + 1'd1;
                    end
                    else begin
                        match_index <= match_index + 1'd1;
                        cur_pat <= pat_start;
                        cur_str <= str_start + 1'd1;
                        str_start <= str_start + 1'd1;
                    end
                end
                // $
                else if(pattern[cur_pat] == 8'd36) begin
                    if(string[cur_str] == 8'd32) begin
                        valid <= 1'b1;
                        match <= 1'b1;
                        pat_len <= 4'd0;
                        cur_str <= 6'd0;
                        cur_pat <= 4'd0;
                        pat_start <= 4'd0;
                        str_start <= 6'd0;
                    end
                    else if(cur_str == str_len) begin
                        valid <= 1'b1;
                        match <= 1'b1;
                        pat_len <= 4'd0;
                        cur_str <= 6'd0;
                        cur_pat <= 4'd0;
                        pat_start <= 4'd0;
                        str_start <= 6'd0;
                    end
                    else begin
                        if(!pat_start) begin
                        match_index <= match_index + 1'd1;
                        end
                        str_start <= str_start + 1'd1;
                        cur_pat <= pat_start;
                        cur_str <= str_start + 1'd1;
                    end
                end
                else if(pattern[cur_pat] == string[cur_str]) begin
                    cur_pat <= cur_pat + 1'd1;
                    cur_str <= cur_str + 1'd1;
                end
                else begin
                    if(!pat_start) begin
                        match_index <= match_index + 1'd1;
                    end
                    str_start <= str_start + 1'd1;
                    cur_pat <= pat_start;
                    cur_str <= str_start + 1'd1;
                end
            end
            
        end
    end


end

endmodule

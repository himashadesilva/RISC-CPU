module stimulus;
wire[15:0] y;
reg[15:0] x;

leftshift ls(x,y);
initial
begin
x=16'b0000000000001011; 
#1 $display("x= %b, y= %b\n",x,y);

x=16'b0000000000000001; 
#1 $display("x= %b, y= %b\n",x,y);

end

endmodule





module leftshift(x,y);
input[15:0] x;
output reg[15:0] y;

always@(x) begin
y=x<<1'b1;
end

endmodule

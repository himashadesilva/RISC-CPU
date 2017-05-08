module stimulus;
reg[15:0] input_address;
wire[15:0] current_address;

pc mypc(input_address,current_address);
initial
begin
input_address = 16'd256;
#1 $display("input_addr= %b, current_addr= %b\n",input_address,current_address);
end


endmodule





module pc(input_address,current_address);//programme counter
input[15:0] input_address;
output reg[15:0] current_address;
always@(input_address) begin
if(input_address>0)
 current_address=input_address;
else
  current_address=0;
end
endmodule

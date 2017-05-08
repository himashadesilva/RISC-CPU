

module ins_memory(read_address,instruction);//instruction memory
input[15:0] read_address;
reg[15:0] registerFile[255:0];
output reg[15:0] instruction;
initial begin
instruction=registerFile[read_address];
end
endmodule

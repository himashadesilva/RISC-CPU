module stimulus;
wire[15:0] readData;
reg[15:0] addr;
reg[15:0] writeData;
reg read,write;


 
dataMem datamem(readData,writeData,addr,write,read);	

initial
begin

addr = 16'd16; write = 1'b1; read = 1'b0;  writeData= 16'd10000; 

#10 $display("address = %b ,writeData = %b ,write= %b ,read= %b \nreadData= %b\n",addr,writeData,write,read,readData);

addr = 16'd16; write = 1'b0; read = 1'b1;  writeData= 16'd10000; 

#10 $display("address = %b ,writeData = %b ,write= %b ,read= %b \nreadData= %b\n",addr,writeData,write,read,readData);
	

	
end




endmodule



module dataMem(readData,writeData,addr,write,read);

input[15:0] addr;
input[15:0] writeData;
input write,read;
reg[15:0] registerFile[255:0];

output[15:0] readData;


reg[15:0] temp1,temp2;

write = 0; read=0;

always@(addr,write||read)
	begin
	
	
	
	
	if(write==1'b1)
	begin
	    //for load
	temp2 = writeData;
	registerFile[addr] = temp2;
	
	end
	
	if(read==1'b1)
	begin
	temp1 = registerFile[addr];  
	
	end
	end
assign readData = temp1;

endmodule

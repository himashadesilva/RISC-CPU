module stimulus;

wire[3:0] out;
reg [3:0] in;
reg en,ctrl1,ctrl2,clk;

initial
	clk = 1'b1;

always
	#2 clk = ~clk;  //give #2 clock period

initial
	#100 $finish;
	// Instantiate the shiftregister
gray_code_counter counter(in,out,clk,ctrl1,ctrl2,en);

initial
begin
// set input lines
  en=1'b1 ; in[3]=1'b0; in[2]=1'b0; in[1]=1'b0; in[0]=1'b0; 
#4  $display("inputs %b%b%b%b\n",in[3],in[2],in[1],in[0]);

  en=1'b1 ; ctrl1=1'b0; ctrl2=1'b0; in[3]=1'b0; in[2]=1'b0; in[1]=1'b0; in[0]=1'b0; 
  #4 $display("load %b%b%b%b\n",out[3],out[2],out[1],out[0]);
  
 en=1'b1 ;ctrl1=1'b1; ctrl2=1'b0; 
  #4 $display("up \n%b%b%b%b\n",out[3],out[2],out[1],out[0]);
 
  en=1'b1 ;ctrl1=1'b1; ctrl2=1'b0; 
  #4 $display("%b%b%b%b\n",out[3],out[2],out[1],out[0]);

 en=1'b1 ;ctrl1=1'b1; ctrl2=1'b0; 
  #4 $display("%b%b%b%b\n",out[3],out[2],out[1],out[0]);

 en=1'b1 ;ctrl1=1'b1; ctrl2=1'b0; 
  #4 $display("%b%b%b%b\n",out[3],out[2],out[1],out[0]);
  
 en=1'b1 ;ctrl1=1'b1; ctrl2=1'b0; 
  #4 $display("%b%b%b%b\n",out[3],out[2],out[1],out[0]);
  
  ///////////
  en=1'b1 ;ctrl1=1'b1; ctrl2=1'b1; 
  #4 $display("down \n%b%b%b%b\n",out[3],out[2],out[1],out[0]);
 
  en=1'b1 ;ctrl1=1'b1; ctrl2=1'b1; 
  #4 $display("%b%b%b%b\n",out[3],out[2],out[1],out[0]);

 en=1'b1 ;ctrl1=1'b1; ctrl2=1'b1; 
  #4 $display("%b%b%b%b\n",out[3],out[2],out[1],out[0]);

 en=1'b1 ;ctrl1=1'b1; ctrl2=1'b1; 
  #4 $display("%b%b%b%b\n",out[3],out[2],out[1],out[0]);
  
 en=1'b1 ;ctrl1=1'b1; ctrl2=1'b1; 
  #4 $display("%b%b%b%b\n",out[3],out[2],out[1],out[0]);




end

endmodule

//----------------------------------------------------------------------

module gray_code_counter(register_in,register_out,clk,ctrl1,ctrl2,en);

input[3:0] register_in;
input ctrl1,ctrl2,en,clk;
output reg[3:0] register_out;


reg[3:0] temp;

always@(posedge clk)
	begin
	if(en==1'b1)
	begin
	
	if(ctrl1==1'b0 && ctrl2==1'b0)
	begin
	register_out <= register_in;  //load
	temp <= register_in;
	end
	
	else if(ctrl1==1'b0 && ctrl2==1'b1)
	register_out <= register_out; //hold
	
	else if(ctrl1==1'b1 && ctrl2==1'b0)
	begin
	temp = temp + 1;  //counts up
	register_out[3] = temp[3];
	register_out[2] = temp[3]^temp[2];
	register_out[1] = temp[2]^temp[1];
	register_out[0] = temp[1]^temp[0];
	end
	
	else if(ctrl1==1'b1 && ctrl2==1'b1)  //counts down
	begin
	temp = temp - 1;  //counts down
	register_out[3] = temp[3];
	register_out[2] = temp[3]^temp[2];
	register_out[1] = temp[2]^temp[1];
	register_out[0] = temp[1]^temp[0];
	end
	
	end
	end


endmodule




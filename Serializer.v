module Serializer (
	input [7:0] charline,
	input [2:0] charpos_x,
	input clk,
	output reg pixel
);

reg [7:0] mask;
reg [2:0] addr_r;

always @(posedge clk) begin
  addr_r <= charpos_x;
  case (addr_r)
		3'h0:mask <=8'b10000000;        
		3'h1:mask <=8'b01000000;        
		3'h2:mask <=8'b00100000;        
		3'h3:mask <=8'b00010000;        
		3'h4:mask <=8'b00001000;        
		3'h5:mask <=8'b00000100;        
		3'h6:mask <=8'b00000010;        
		3'h7:mask <=8'b00000001; 
	default : mask <= 0;
  endcase
  
  if ((charline & mask) == 8'b00000000) pixel <= 1'b0;
  else pixel <= 1'b1;
  
end
endmodule
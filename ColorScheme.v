module ColorScheme (
    input [23:0] foregnd,
	 input [23:0] backgnd,
	 input pixel,
	 input clk,
    output reg [7:0] RtoVGA,
	 output reg [7:0] GtoVGA,
	 output reg [7:0] BtoVGA
);

//'h000066 RGB Background default WP5.1 Blue
//'hE0E0E0 RGB Foreground default WP5.1 Light Gray

always @(posedge clk) begin
	if (pixel) begin
		RtoVGA <= foregnd[23:16];
		GtoVGA <= foregnd[15:8];
		BtoVGA <= foregnd[7:0];
	end
	else begin
		RtoVGA <= backgnd[23:16];
		GtoVGA <= backgnd[15:8];
		BtoVGA <= backgnd[7:0];
	end
end
endmodule
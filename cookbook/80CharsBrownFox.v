module Rom_80Chars (
    input clk,
    input [6:0] addr,
    output reg [6:0] out
);

reg [6:0] addr_r;
always @(posedge clk) begin
  addr_r <= addr;
  case (addr_r)
		7'b00:OUT <=7'b116;
		7'b01:OUT <=7'b104;
		7'b02:OUT <=7'b101;
		7'b03:OUT <=7'b32;
		7'b04:OUT <=7'b113;
		7'b05:OUT <=7'b117;
		7'b06:OUT <=7'b105;
		7'b07:OUT <=7'b99;
		7'b08:OUT <=7'b107;
		7'b09:OUT <=7'b32;
		7'b0A:OUT <=7'b98;
		7'b0B:OUT <=7'b114;
		7'b0C:OUT <=7'b111;
		7'b0D:OUT <=7'b119;
		7'b0E:OUT <=7'b110;
		7'b0F:OUT <=7'b32;
		7'b10:OUT <=7'b102;
		7'b11:OUT <=7'b111;
		7'b12:OUT <=7'b120;
		7'b13:OUT <=7'b32;
		7'b14:OUT <=7'b106;
		7'b15:OUT <=7'b117;
		7'b16:OUT <=7'b109;
		7'b17:OUT <=7'b112;
		7'b18:OUT <=7'b115;
		7'b19:OUT <=7'b32;
		7'b1A:OUT <=7'b111;
		7'b1B:OUT <=7'b118;
		7'b1C:OUT <=7'b101;
		7'b1D:OUT <=7'b114;
		7'b1E:OUT <=7'b32;
		7'b1F:OUT <=7'b116;
		7'b20:OUT <=7'b104;
		7'b21:OUT <=7'b101;
		7'b22:OUT <=7'b32;
		7'b23:OUT <=7'b108;
		7'b24:OUT <=7'b97;
		7'b25:OUT <=7'b122;
		7'b26:OUT <=7'b121;
		7'b27:OUT <=7'b32;
		7'b28:OUT <=7'b100;
		7'b29:OUT <=7'b111;
		7'b2A:OUT <=7'b103;
		7'b2B:OUT <=7'b32;
		7'b2C:OUT <=7'b49;
		7'b2D:OUT <=7'b50;
		7'b2E:OUT <=7'b51;
		7'b2F:OUT <=7'b52;
		7'b30:OUT <=7'b53;
		7'b31:OUT <=7'b54;
		7'b32:OUT <=7'b55;
		7'b33:OUT <=7'b56;
		7'b34:OUT <=7'b57;
		7'b35:OUT <=7'b48;
		7'b36:OUT <=7'b123;
		7'b37:OUT <=7'b125;
		7'b38:OUT <=7'b91;
		7'b39:OUT <=7'b93;
		7'b3A:OUT <=7'b59;
		7'b3B:OUT <=7'b58;
		7'b3C:OUT <=7'b39;
		7'b3D:OUT <=7'b34;
		7'b3E:OUT <=7'b13;
		7'b3F:OUT <=7'b10;
		7'b40:OUT <=7'b84;
		7'b41:OUT <=7'b72;
		7'b42:OUT <=7'b69;
		7'b43:OUT <=7'b32;
		7'b44:OUT <=7'b81;
		7'b45:OUT <=7'b85;
		7'b46:OUT <=7'b73;
		7'b47:OUT <=7'b67;
		7'b48:OUT <=7'b75;
		7'b49:OUT <=7'b32;
		7'b4A:OUT <=7'b66;
		7'b4B:OUT <=7'b82;
		7'b4C:OUT <=7'b79;
		7'b4D:OUT <=7'b87;
		7'b4E:OUT <=7'b78;
		7'b4F:OUT <=7'b32;
    default : out <= 0;
  endcase
end
endmodule

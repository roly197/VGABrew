module Rom_80Chars (
    input clk,
    input [6:0] addr,
    output reg [6:0] out
);

reg [6:0] addr_r;
always @(posedge clk) begin
  addr_r <= addr;
  case (addr_r)
		7'h00:out <=7'd116;
		7'h01:out <=7'd104;
		7'h02:out <=7'd101;
		7'h03:out <=7'd32;
		7'h04:out <=7'd113;
		7'h05:out <=7'd117;
		7'h06:out <=7'd105;
		7'h07:out <=7'd99;
		7'h08:out <=7'd107;
		7'h09:out <=7'd32;
		7'h0A:out <=7'd98;
		7'h0B:out <=7'd114;
		7'h0C:out <=7'd111;
		7'h0D:out <=7'd119;
		7'h0E:out <=7'd110;
		7'h0F:out <=7'd32;
		7'h10:out <=7'd102;
		7'h11:out <=7'd111;
		7'h12:out <=7'd120;
		7'h13:out <=7'd32;
		7'h14:out <=7'd106;
		7'h15:out <=7'd117;
		7'h16:out <=7'd109;
		7'h17:out <=7'd112;
		7'h18:out <=7'd115;
		7'h19:out <=7'd32;
		7'h1A:out <=7'd111;
		7'h1B:out <=7'd118;
		7'h1C:out <=7'd101;
		7'h1D:out <=7'd114;
		7'h1E:out <=7'd32;
		7'h1F:out <=7'd116;
		7'h20:out <=7'd104;
		7'h21:out <=7'd101;
		7'h22:out <=7'd32;
		7'h23:out <=7'd108;
		7'h24:out <=7'd97;
		7'h25:out <=7'd122;
		7'h26:out <=7'd121;
		7'h27:out <=7'd32;
		7'h28:out <=7'd100;
		7'h29:out <=7'd111;
		7'h2A:out <=7'd103;
		7'h2B:out <=7'd32;
		7'h2C:out <=7'd49;
		7'h2D:out <=7'd50;
		7'h2E:out <=7'd51;
		7'h2F:out <=7'd52;
		7'h30:out <=7'd53;
		7'h31:out <=7'd54;
		7'h32:out <=7'd55;
		7'h33:out <=7'd56;
		7'h34:out <=7'd57;
		7'h35:out <=7'd48;
		7'h36:out <=7'd123;
		7'h37:out <=7'd125;
		7'h38:out <=7'd91;
		7'h39:out <=7'd93;
		7'h3A:out <=7'd59;
		7'h3B:out <=7'd58;
		7'h3C:out <=7'd39;
		7'h3D:out <=7'd34;
		7'h3E:out <=7'd13;
		7'h3F:out <=7'd10;
		7'h40:out <=7'd84;
		7'h41:out <=7'd72;
		7'h42:out <=7'd69;
		7'h43:out <=7'd32;
		7'h44:out <=7'd81;
		7'h45:out <=7'd85;
		7'h46:out <=7'd73;
		7'h47:out <=7'd67;
		7'h48:out <=7'd75;
		7'h49:out <=7'd32;
		7'h4A:out <=7'd66;
		7'h4B:out <=7'd82;
		7'h4C:out <=7'd79;
		7'h4D:out <=7'd87;
		7'h4E:out <=7'd78;
		7'h4F:out <=7'd32;
    default : out <= 0;
  endcase
end
endmodule

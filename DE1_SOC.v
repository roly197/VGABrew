
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module DE1_SOC(

//	//////////// ADC //////////
//	inout 		          		ADC_CS_N,
//	output		          		ADC_DIN,
//	input 		          		ADC_DOUT,
//	output		          		ADC_SCLK,
//
//	//////////// Audio //////////
//	input 		          		AUD_ADCDAT,
//	inout 		          		AUD_ADCLRCK,
//	inout 		          		AUD_BCLK,
//	output		          		AUD_DACDAT,
//	inout 		          		AUD_DACLRCK,
//	output		          		AUD_XCK,

	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,

//	//////////// SDRAM //////////
//	output		    [12:0]		DRAM_ADDR,
//	output		     [1:0]		DRAM_BA,
//	output		          		DRAM_CAS_N,
//	output		          		DRAM_CKE,
//	output		          		DRAM_CLK,
//	output		          		DRAM_CS_N,
//	inout 		    [15:0]		DRAM_DQ,
//	output		          		DRAM_LDQM,
//	output		          		DRAM_RAS_N,
//	output		          		DRAM_UDQM,
//	output		          		DRAM_WE_N,
//
//	//////////// I2C for Audio and Video-In //////////
//	output		          		FPGA_I2C_SCLK,
//	inout 		          		FPGA_I2C_SDAT,

//	//////////// SEG7 //////////
//	output		     [6:0]		HEX0,
//	output		     [6:0]		HEX1,
//	output		     [6:0]		HEX2,
//	output		     [6:0]		HEX3,
//	output		     [6:0]		HEX4,
//	output		     [6:0]		HEX5,
//
//	//////////// IR //////////
//	input 		          		IRDA_RXD,
//	output		          		IRDA_TXD,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

//	//////////// PS2 //////////
//	inout 		          		PS2_CLK,
//	inout 		          		PS2_CLK2,
//	inout 		          		PS2_DAT,
//	inout 		          		PS2_DAT2,
//
//	//////////// SW //////////
//	input 		     [9:0]		SW,
//
//	//////////// Video-In //////////
//	input 		          		TD_CLK27,
//	input 		     [7:0]		TD_DATA,
//	input 		          		TD_HS,
//	output		          		TD_RESET_N,
//	input 		          		TD_VS,

	//////////// VGA //////////
	output		     [7:0]		VGA_B,
	output		          		VGA_BLANK_N,
	output		          		VGA_CLK,
	output		     [7:0]		VGA_G,
	output		          		VGA_HS,
	output		     [7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

wire CLOCK108;
wire rst;

wire [7:0] RED;
wire [7:0] GREEN;
wire [7:0] BLUE;

wire [10:0] location_x;
wire [9:0] location_y;

wire testpixel;

wire [23:0] foregnd;
wire [23:0] backgnd;

wire [6:0] ascii_char;
wire [7:0] charline;

wire [14:0] ascii_addr;


//=======================================================
//  Structural coding
//=======================================================

assign rst = !KEY[0];				// Reset as manual input KEY3

assign backgnd = 'h000066;			// Preset foreground hardcoded should be configurable
assign foregnd = 'hE0E0E0;			// Preset foreground hardcoded should be configurable

assign ascii_addr= (location_y[9:3] << 8) | location_x[10:3];

//assign ascii_char= tempchar [6:0];

assign LEDR=ascii_addr[14:5];

VGA108PLL c0 (
		.refclk   (CLOCK_50),   	// refclk.clk
		.rst      (rst),      		// reset.reset
		.outclk_0 (CLOCK108), 		// outclk0.clk
	);

//Rom_80Chars rr0 (						// Entity for testing charakter VGA output 
//    .clk(CLOCK108),					// input All runs at the VGA Clock
//    .addr(location_x[9:3]),		   // input Select charakter for x pos.
//    .out(ascii_char)					// output Corresponding ascii number to the x y pos.
//);
	
AsciiMatrix am1 (
	.address(ascii_addr),
	.data(),
	.inclock(CLOCK108),
	.outclock(CLOCK108),
	.wren(1'b0),
	.q(ascii_char),
	);

font_rom_8x8 fon0 (					// ASCII rom charakter starts at 8x(char)
    .clk(CLOCK108),					// input All runs at the VGA Clock
	 .ascii_offset(ascii_char),	// input The ascii charakter number
	 .charpos_y(location_y[2:0]), // input Actual row of the ascii charakter to display
    .out(charline)					// output The specifis byte of the charakter
);

Serializer ser0 (						// Serializer needed to send ascii bytes to VGA bit-by-bit
	.charline(charline),				// input byte from ascii y-row
	.charpos_x(location_x[2:0]),  // input position within the byte to serialize
	.clk(CLOCK108),					// input All runs at the VGA Clock
	.pixel(testpixel)					// output the actual pixel
);

ColorScheme col0 (					// Mixer to determine foreground and background colors
    .foregnd(foregnd),				// input Takes 3x8 RGB for foreground
	 .backgnd(backgnd),				// input Takes 3x8 RGB for background
	 .pixel(testpixel),				// input Pixel 0=BG ; 1=fg
	 .clk(CLOCK108),					// input All runs at the VGA Clock (
    .RtoVGA(RED),						// output RGB outputs to VGA controller
	 .GtoVGA(GREEN),					// "
	 .BtoVGA(BLUE),					// "
	); 
	
vga_driver v0	(
		.r(RED),.g(GREEN),.b(BLUE),							//input 8 bit value for RGB
		.current_x(location_x),.current_y(location_y),.request(),				//output x-y location of pixel and the pixel request
		.vga_r(VGA_R),.vga_g(VGA_G),.vga_b(VGA_B),		//output Value to VGA DAC pins
		.vga_hs(VGA_HS),.vga_vs(VGA_VS),						//output Control to VGA DAC pins
		.vga_blank(VGA_BLANK_N),.vga_clock(VGA_CLK),		//output Controls/Clock to VGA DAC pins
		.clk27(CLOCK108),.rst27(rst)							//input VGA clock plus reset signals
		);
	
endmodule

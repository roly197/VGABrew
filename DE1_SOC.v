
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module DE1_SOC(

	//////////// ADC //////////
	inout 		          		ADC_CS_N,
	output		          		ADC_DIN,
	input 		          		ADC_DOUT,
	output		          		ADC_SCLK,

	//////////// Audio //////////
	input 		          		AUD_ADCDAT,
	inout 		          		AUD_ADCLRCK,
	inout 		          		AUD_BCLK,
	output		          		AUD_DACDAT,
	inout 		          		AUD_DACLRCK,
	output		          		AUD_XCK,

	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,

	//////////// SDRAM //////////
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,

	//////////// I2C for Audio and Video-In //////////
	output		          		FPGA_I2C_SCLK,
	inout 		          		FPGA_I2C_SDAT,

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// IR //////////
	input 		          		IRDA_RXD,
	output		          		IRDA_TXD,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// PS2 //////////
	inout 		          		PS2_CLK,
	inout 		          		PS2_CLK2,
	inout 		          		PS2_DAT,
	inout 		          		PS2_DAT2,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// Video-In //////////
	input 		          		TD_CLK27,
	input 		     [7:0]		TD_DATA,
	input 		          		TD_HS,
	output		          		TD_RESET_N,
	input 		          		TD_VS,

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

wire CLOCK_27;
wire rst;

wire [7:0] RED;
wire [7:0] GREEN;
wire [7:0] BLUE;

wire [9:0] location_x;
wire [9:0] location_y;

wire testpixel;

wire [23:0] foregnd;
wire [23:0] backgnd;

wire [6:0] ascii_char;
wire [7:0] charline;


//=======================================================
//  Structural coding
//=======================================================

assign rst = !KEY[0];

assign backgnd = 'hE0E0E0;
assign foregnd = 'h000066;


VGA27PLL c0 (
		.refclk   (CLOCK_50),   	//  refclk.clk
		.rst      (rst),      		//   reset.reset
		.outclk_0 (CLOCK_27), 		// outclk0.clk
	);

ColorScheme col0 (
    .foregnd(foregnd),
	 .backgnd(backgnd),
	 .pixel(testpixel),
	 .clk(CLOCK_27),
    .RtoVGA(RED),
	 .GtoVGA(GREEN),
	 .BtoVGA(BLUE),
	); 
	

Serializer ser0 (
	.charline(charline),
	.charpos_x(location_x[2:0]),
	.clk(CLOCK_27),
	.pixel(testpixel)
);

font_rom_8x8 fon0 (
    .clk(CLOCK_27),
	 .ascii_offset(ascii_char),
	 .charpos_y(location_y[2:0]),
    .out(charline)
);

Rom_80Chars rr0 (													//entity for testing charakter VGA output 
    .clk(CLOCK_27),
    .addr(location_x[9:3]),									//select charakter for x pos.
    .out(ascii_char)												//corresponding ascii number to the x y pos.
);
	
vga_driver v0	(
		.r(RED),.g(GREEN),.b(BLUE),							//input
		.current_x(location_x),.current_y(location_y),.request(),				//Output
		.vga_r(VGA_R),.vga_g(VGA_G),.vga_b(VGA_B),		//Output
		.vga_hs(VGA_HS),.vga_vs(VGA_VS),						//Output
		.vga_blank(VGA_BLANK_N),.vga_clock(VGA_CLK),		//Output
		.clk27(CLOCK_27),.rst27(rst)							//input
		);
	
endmodule

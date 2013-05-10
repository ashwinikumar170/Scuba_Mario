module scuba_mario(clk, lcd_e, lcd_rs, lcd_rw, reset, cs1, cs2, lcd_data,down,G_SENSOR_CS_N,G_SENSOR_INT,I2C_SCLK,I2C_SDAT,KEY);

	input clk,G_SENSOR_INT;
	input [1:0]KEY;
	reg [7:0] mar[11:0][7:0];
	output wire G_SENSOR_CS_N,I2C_SCLK;
	inout I2C_SDAT;
	wire [7:0]LED;
	output reg lcd_e, lcd_rs, lcd_rw;
	output reg cs1, cs2, reset;
	output reg [7:0]lcd_data;
	reg [7:0]data;
	integer init_time=0;
	reg [28:0]divider;
	reg [8:0] count=0;
	reg already_on=0;
	reg [7:0]tmp;
	reg [7:0]tmp_1;
	reg [7:0]tmp_2;
	reg [7:0]tmp_3;
	reg [7:0]tmp_4;
	reg [7:0]tmp_5;
	reg [7:0]tmp_6;
	reg [7:0]tmp_7;
	reg [7:0]tmp_0_7,tmp_0_1,tmp_0_5,tmp_0_2,tmp_0_3;
	reg [7:0]tmp_0_6,tmp_0_4;
	integer page=0;
	integer gameover=0,bonus=0;
	integer i,j,k,m,l,p,q;
	integer mario_page=0;
	integer init=0,init_1=0,init_7=0,init_2=0,init_3=0,init_4=0,init_5=0,init_6=0,init_0_6=0,init_0_7=0,init_0_2=0,init_0_5=0,init_0_4=0,init_0_3=0;
	reg[7:0] mem[127:0][7:0];
	reg[7:0] mem_0[127:0][7:0];
	integer life=2,start=1,start_count=0;
	reg[7:0] finish[127:0][7:0];
	
	always @ (posedge clk)
	begin
	
		divider <= divider + 1;
	
	end
	
	assign sclk = divider[8];
	assign clk_2 =divider[24];
	assign clk_3 =divider[23];
	assign clk_4 =divider[19];
	assign clk_5 =divider[22]; 
	
	

	
	// page 2 memory

	always @(posedge clk_5)
	begin
	if(init_2==0)
	begin
	
		
	// starfish
	mem[54][2]=8'b10001000;
	mem[55][2]=8'b11011000;
	mem[56][2]=8'b10101000;
	mem[57][2]=8'b10000100;
	mem[58][2]=8'b01000010;
	mem[59][2]=8'b00100001;
	mem[60][2]=8'b01000010;
	mem[61][2]=8'b10000100;
	mem[62][2]=8'b10101000;
	mem[63][2]=8'b11011000;
	mem[64][2]=8'b10001000;
	
		
	
	
	mem[110][2]=8'b10001000;
	mem[111][2]=8'b01010100;
	mem[112][2]=8'b00100010;
	mem[113][2]=8'b00100001;
	mem[114][2]=8'b11100001;
	mem[115][2]=8'b00100001;
	mem[116][2]=8'b11100001;
	mem[117][2]=8'b00100001;
	mem[118][2]=8'b11100001;
	mem[119][2]=8'b00100001;
	mem[120][2]=8'b00100001;
	mem[121][2]=8'b00100010;
	mem[122][2]=8'b01010100;
	mem[123][2]=8'b10001000;
	
	
	
	
	
	
	init_2=1;
	end
	
		tmp_2=mem[0][2];
		for(k=0;k<127;k=k+1) begin
				mem[k][2]=mem[k+1][2];
			end	
	
		mem[127][2]=tmp_2;
	end
	
 
 
 
 
	// page 3 memory 
 
	always @(posedge clk_4)
	begin
	if(init_3==0)
	begin
	
	// power plus
	mem[54][3]=8'b00011000;
	mem[55][3]=8'b00011000;
	mem[56][3]=8'b00011000;
	mem[57][3]=8'b01111110;
	mem[58][3]=8'b00011000;
	mem[59][3]=8'b00011000;
	mem[60][3]=8'b00011000;
		
	
	
	// delta 
	
	mem[113][3]=8'b01000000;
	mem[114][3]=8'b01110000;
	mem[115][3]=8'b01001100;
	mem[116][3]=8'b01000010;
	mem[117][3]=8'b01001100;
	mem[118][3]=8'b01110000;
	mem[119][3]=8'b01000000;
	
	
	
	init_3=1;
	end
	
		tmp_3=mem[0][3];
		for(k=0;k<127;k=k+1) begin
				mem[k][3]=mem[k+1][3];
			end	
	
		mem[127][3]=tmp_3;
	end
	
 
 
 
 // page 4 memory 
	always @(posedge clk_3) 
	begin
	if(init_4==0)
	begin
	
	
	
	// mushroom
	
	mem[72][4]=8'b10011000;
	mem[73][4]=8'b10100100;
	mem[74][4]=8'b11100010;
	mem[75][4]=8'b11100001;
	mem[76][4]=8'b11100001;
	mem[77][4]=8'b11100010;
	mem[78][4]=8'b10100100;
	mem[79][4]=8'b10011000;
	

	// crab
	
	mem[110][4]=8'b10001000;
	mem[111][4]=8'b01010100;
	mem[112][4]=8'b00100010;
	mem[113][4]=8'b00100001;
	mem[114][4]=8'b11100001;
	mem[115][4]=8'b00100001;
	mem[116][4]=8'b11100001;
	mem[117][4]=8'b00100001;
	mem[118][4]=8'b11100001;
	mem[119][4]=8'b00100001;
	mem[120][4]=8'b00100001;
	mem[121][4]=8'b00100010;
	mem[122][4]=8'b01010100;
	mem[123][4]=8'b10001000;
	
		
	init_4=1;
	end
	
	
		tmp_4=mem[0][4];
		for(k=0;k<127;k=k+1) begin
				mem[k][4]=mem[k+1][4];
		end	
	
		mem[127][4]=tmp_4;
		
		
	end
	
 
 
 
 
 // page 5 memory 
  always @(posedge clk_2)
	begin
	if(init_5==0)
	begin
	
	// starfish
	
	mem[54][5]=8'b10001000;
	mem[55][5]=8'b11011000;
	mem[56][5]=8'b10101000;
	mem[57][5]=8'b10000100;
	mem[58][5]=8'b01000010;
	mem[59][5]=8'b00100001;
	mem[60][5]=8'b01000010;
	mem[61][5]=8'b10000100;
	mem[62][5]=8'b10101000;
	mem[63][5]=8'b11011000;
	mem[64][5]=8'b10001000;
	
	
	// starfish
	
	mem[94][5]=8'b10001000;
	mem[95][5]=8'b11011000;
	mem[96][5]=8'b10101000;
	mem[97][5]=8'b10000100;
	mem[98][5]=8'b01000010;
	mem[99][5]=8'b00100001;
	mem[100][5]=8'b01000010;
	mem[101][5]=8'b10000100;
	mem[102][5]=8'b10101000;
	mem[103][5]=8'b11011000;
	mem[104][5]=8'b10001000;
	
	
	// crab
	
	
	mem[110][5]=8'b10001000;
	mem[111][5]=8'b01010100;
	mem[112][5]=8'b00100010;
	mem[113][5]=8'b00100001;
	mem[114][5]=8'b11100001;
	mem[115][5]=8'b00100001;
	mem[116][5]=8'b11100001;
	mem[117][5]=8'b00100001;
	mem[118][5]=8'b11100001;
	mem[119][5]=8'b00100001;
	mem[120][5]=8'b00100001;
	mem[121][5]=8'b00100010;
	mem[122][5]=8'b01010100;
	mem[123][5]=8'b10001000;
	
		
	init_5=1;
	end
	
		tmp_5=mem[0][5];
		for(k=0;k<127;k=k+1) begin
				mem[k][5]=mem[k+1][5];
			end	
	
		mem[127][5]=tmp_5;
		
		
	end
 
 

 
 
 // page 6 memory 
 	always @(posedge clk_4) 
	begin
	if(init_6==0)
	begin
	
	
	// crab
	
	mem[110][6]=8'b00011000;
	mem[111][6]=8'b00011000;
	mem[112][6]=8'b00011000;
	mem[113][6]=8'b11111111;
	mem[114][6]=8'b00011000;
	mem[115][6]=8'b00011000;
	mem[116][6]=8'b00011000;
	
	
	init_6=1;
	end
	
		tmp_6=mem[0][6];
		for(k=0;k<127;k=k+1) begin
				mem[k][6]=mem[k+1][6];
			end	
	
		mem[127][6]=tmp_6;
	end
	
 

 
 //	page 7 memory 
	always @(posedge clk_3) 
	begin
	if(init_7==0)
	begin
	
	// starfish
	mem[24][7]=8'b10001000;
	mem[25][7]=8'b11011000;
	mem[26][7]=8'b10101000;
	mem[27][7]=8'b10000100;
	mem[28][7]=8'b01000010;
	mem[29][7]=8'b00100001;
	mem[30][7]=8'b01000010;
	mem[31][7]=8'b10000100;
	mem[32][7]=8'b10101000;
	mem[33][7]=8'b11011000;
	mem[34][7]=8'b10001000;
	
	
	
	// mushroom
	
	mem[72][7]=8'b00011000;
	mem[73][7]=8'b00100100;
	mem[74][7]=8'b11100010;
	mem[75][7]=8'b11100001;
	mem[76][7]=8'b11100001;
	mem[77][7]=8'b11100010;
	mem[78][7]=8'b00100100;
	mem[79][7]=8'b00011000;
	
	
	// crab
	
	mem[110][7]=8'b10001000;
	mem[111][7]=8'b01010100;
	mem[112][7]=8'b00100010;
	mem[113][7]=8'b00100001;
	mem[114][7]=8'b11100001;
	mem[115][7]=8'b00100001;
	mem[116][7]=8'b11100001;
	mem[117][7]=8'b00100001;
	mem[118][7]=8'b11100001;
	mem[119][7]=8'b00100001;
	mem[120][7]=8'b00100001;
	mem[121][7]=8'b00100010;
	mem[122][7]=8'b01010100;
	mem[123][7]=8'b10001000;
		
		
	init_7=1;
	end
	
		tmp_1=mem[0][7];
		for(k=0;k<127;k=k+1) begin
				mem[k][7]=mem[k+1][7];
			end	
	
		mem[127][7]=tmp_1;
		
		
	end
	

	
	
	// memory copy
	always @(posedge sclk)
	begin
	for(p=0;p<128;p=p+1)
	begin
	mem_0[p][0]=mem[p][0];
	finish[p][0]=mem[p][0];
	
	end
	end
	
	
	// Sensor Module
	DE0_NANO_G_Sensor Sensor(clk,LED,KEY,G_SENSOR_CS_N,G_SENSOR_INT,I2C_SCLK,I2C_SDAT );
	
	//G Sensor LED Output	
always @(LED) begin 
 if( (LED [7]) | (LED [6])) mario_page = 6; 
 else if(LED[5]) mario_page = 5;
 else if( (LED [4]) | (LED [3])) mario_page = 4;
 else if (LED [2]) mario_page = 3 ;
 else if ( (LED [1]) | (LED [0])) mario_page = 2 ;
 end

	
	
	
	
	// mario... 
	always@(posedge divider[24])
	begin
	if(init_time==0)
	
	begin
	
		
	
		mar[0][2]=8'b00000000;
		mar[1][2]=8'b00111000;
		mar[2][2]=8'b10100110;
		mar[3][2]=8'b01000101;
		mar[4][2]=8'b00000101;
		mar[5][2]=8'b00000101;
		mar[6][2]=8'b0000101;
		mar[7][2]=8'b00010101;
		mar[8][2]=8'b10000101;
		mar[9][2]=8'b01000110;
		mar[10][2]=8'b01001000;
		mar[11][2]=8'b00111000;
		
		
		mar[0][3]=8'b10011110;
		mar[1][3]=8'b11010001;
		mar[2][3]=8'b10100000;
		mar[3][3]=8'b10000000;
		mar[4][3]=8'b11100000;
		mar[5][3]=8'b00010000;
		mar[6][3]=8'b00010000;
		mar[7][3]=8'b11100000;
		mar[8][3]=8'b10000000;
		mar[9][3]=8'b10100001;
		mar[10][3]=8'b11010001;
		mar[11][3]=8'b10011110;
	
	
		init_time=1;
	end	
		
	for(m=2;m<=7;m=m+1)
		begin
		 
		 if(m==mario_page)
		  begin
		mar[0][mario_page]=8'b00000000;
		mar[1][mario_page]=8'b00111000;
		mar[2][mario_page]=8'b10100110;
		mar[3][mario_page]=8'b01000101;
		mar[4][mario_page]=8'b00000101;
		mar[5][mario_page]=8'b00000101;
		mar[6][mario_page]=8'b00000101;
		mar[7][mario_page]=8'b00010101;
		mar[8][mario_page]=8'b10000101;
		mar[9][mario_page]=8'b01000110;
		mar[10][mario_page]=8'b01001000;
		mar[11][mario_page]=8'b00111000;
		
		
		mar[0][mario_page+1]=8'b10011110;
		mar[1][mario_page+1]=8'b11010001;
		mar[2][mario_page+1]=8'b10100000;
		mar[3][mario_page+1]=8'b10000000;
		mar[4][mario_page+1]=8'b11100000;
		mar[5][mario_page+1]=8'b00010000;
		mar[6][mario_page+1]=8'b00010000;
		mar[7][mario_page+1]=8'b11100000;
		mar[8][mario_page+1]=8'b10000000;
		mar[9][mario_page+1]=8'b10100001;
		mar[10][mario_page+1]=8'b11010001;
		mar[11][mario_page+1]=8'b10011110;
		
	end
			else if((m-1)!=mario_page)
			begin
		mar[0][m]=8'b00000000;
		mar[1][m]=8'b00000000;
		mar[2][m]=8'b00000000;
		mar[3][m]=8'b00000000;
		mar[4][m]=8'b00000000;
		mar[5][m]=8'b00000000;
		mar[6][m]=8'b00000000;
		mar[7][m]=8'b00000000;
		mar[8][m]=8'b00000000;
		mar[9][m]=8'b00000000;
		mar[10][m]=8'b00000000;
		mar[11][m]=8'b00000000;
		
		
		end
		end
	end
	
	
	// life block
	
	always@(posedge sclk)
	begin 
	
			// letter l
				mem[16][0]=8'b11111111;
				mem[17][0]=8'b10000000;
				mem[18][0]=8'b10000000;
				mem[19][0]=8'b10000000;
			// letter i
				mem[22][0]=8'b11111111;
				
			// letter f	
				mem[25][0]=8'b11111111;
				mem[26][0]=8'b00010001;
				mem[27][0]=8'b00010001;
				mem[28][0]=8'b00010001;
	
			// letter e
			
				mem[31][0]=8'b11111111;
				mem[32][0]=8'b10010001;
				mem[33][0]=8'b10010001;
				mem[34][0]=8'b10010001;
	
	case(life)
	 
			0: begin 
				mem[40][0]=8'b11111111;
				mem[41][0]=8'b10000001;
				mem[42][0]=8'b10000001;
				mem[43][0]=8'b11111111;
				end	
				
				
			1: begin 
				mem[40][0]=8'b00000000;
				mem[41][0]=8'b00000000;
				mem[42][0]=8'b00000000;
				mem[43][0]=8'b11111111;
				end	
			2: begin 
				mem[40][0]=8'b11110001;
				mem[41][0]=8'b10010001;
				mem[42][0]=8'b10010001;
				mem[43][0]=8'b10011111;
				end	
					
			default:	begin 
				mem[40][0]=8'b11111111;
				mem[41][0]=8'b10000001;
				mem[42][0]=8'b10000001;
				mem[43][0]=8'b11111111;
				end
		endcase
	end

	
	
	// bonus
	always@(posedge divider[20])
	begin 
	
		
	// unit digit
	case((bonus/10)%10)
		
			0: begin 
				mem[110][0]=8'b11111111;
				mem[111][0]=8'b10000001;
				mem[112][0]=8'b10000001;
				mem[113][0]=8'b11111111;
				end	
				
				
			1: begin 
				mem[110][0]=8'b00000000;
				mem[111][0]=8'b00000000;
				mem[112][0]=8'b00000000;
				mem[113][0]=8'b11111111;
				end	
			2: begin 
				mem[110][0]=8'b11110001;
				mem[111][0]=8'b10010001;
				mem[112][0]=8'b10010001;
				mem[113][0]=8'b10011111;
				end	
			3:begin 
				mem[110][0]=8'b10000001;
				mem[111][0]=8'b10010001;
				mem[112][0]=8'b10010001;
				mem[113][0]=8'b11111111;
				end	
			4:begin 
				mem[110][0]=8'b00011111;
				mem[111][0]=8'b00010000;
				mem[112][0]=8'b00010000;
				mem[113][0]=8'b11111111;
				end		
			5: begin 
				mem[110][0]=8'b10011111;
				mem[111][0]=8'b10010001;
				mem[112][0]=8'b10010001;
				mem[113][0]=8'b11110001;
				end	
			6: begin 
				mem[110][0]=8'b11111111;
				mem[111][0]=8'b10010001;
				mem[112][0]=8'b10010001;
				mem[113][0]=8'b11110001;
				end	
			7: begin 
				mem[110][0]=8'b00000001;
				mem[111][0]=8'b00000001;
				mem[112][0]=8'b00000001;
				mem[113][0]=8'b11111111;
				end	
			8: begin 
				mem[110][0]=8'b11111111;
				mem[111][0]=8'b10010001;
				mem[112][0]=8'b10010001;
				mem[113][0]=8'b11111111;
				end	
			9:begin 
				mem[110][0]=8'b10011111;
				mem[111][0]=8'b10010001;
				mem[112][0]=8'b10010001;
				mem[113][0]=8'b11111111;
				end	
			default:	
				begin 
				mem[110][0]=8'b00000000;
				mem[111][0]=8'b00000000;
				mem[112][0]=8'b00000000;
				mem[113][0]=8'b00000000;
				end	
			endcase	
		// tens digit
		
		case(((bonus/10)/10)%10)
		
			0: begin 
				mem[104][0]=8'b11111111;
				mem[105][0]=8'b10000001;
				mem[106][0]=8'b10000001;
				mem[107][0]=8'b11111111;
				end	
				
				
			1: begin 
				mem[104][0]=8'b00000000;
				mem[105][0]=8'b00000000;
				mem[106][0]=8'b00000000;
				mem[107][0]=8'b11111111;
				end	
			2: begin 
				mem[104][0]=8'b11110001;
				mem[105][0]=8'b10010001;
				mem[106][0]=8'b10010001;
				mem[107][0]=8'b10011111;
				end	
			3:begin 
				mem[104][0]=8'b10000001;
				mem[105][0]=8'b10010001;
				mem[106][0]=8'b10010001;
				mem[107][0]=8'b11111111;
				end	
			4:begin 
				mem[104][0]=8'b00011111;
				mem[105][0]=8'b00010000;
				mem[106][0]=8'b00010000;
				mem[107][0]=8'b11111111;
				end		
			5: begin 
				mem[104][0]=8'b10011111;
				mem[105][0]=8'b10010001;
				mem[106][0]=8'b10010001;
				mem[107][0]=8'b11110001;
				end	
			6: begin 
				mem[104][0]=8'b11111111;
				mem[105][0]=8'b10010001;
				mem[106][0]=8'b10010001;
				mem[107][0]=8'b11110001;
				end	
			7: begin 
				mem[104][0]=8'b00000001;
				mem[105][0]=8'b00000001;
				mem[106][0]=8'b00000001;
				mem[107][0]=8'b11111111;
				end	
			8: begin 
				mem[104][0]=8'b11111111;
				mem[105][0]=8'b10010001;
				mem[106][0]=8'b10010001;
				mem[107][0]=8'b11111111;
				end	
			9:begin 
				mem[104][0]=8'b10011111;
				mem[105][0]=8'b10010001;
				mem[106][0]=8'b10010001;
				mem[107][0]=8'b11111111;
				end	
			default:	
				begin 
				mem[104][0]=8'b00000000;
				mem[105][0]=8'b00000000;
				mem[106][0]=8'b00000000;
				mem[107][0]=8'b00000000;
				end	
			endcase	
		
		// hundreds digit
		
		case((bonus/10)/100)
		
			0: begin 
				mem[98][0]=8'b11111111;
				mem[99][0]=8'b10000001;
				mem[100][0]=8'b10000001;
				mem[101][0]=8'b11111111;
				end	
				
				
			1: begin 
				mem[98][0]=8'b00000000;
				mem[99][0]=8'b00000000;
				mem[100][0]=8'b00000000;
				mem[101][0]=8'b11111111;
				end	
			2: begin 
				mem[98][0]=8'b11110001;
				mem[99][0]=8'b10010001;
				mem[100][0]=8'b10010001;
				mem[101][0]=8'b10011111;
				end	
			3:begin 
				mem[98][0]=8'b10000001;
				mem[99][0]=8'b10010001;
				mem[100][0]=8'b10010001;
				mem[101][0]=8'b11111111;
				end	
			4:begin 
				mem[98][0]=8'b00011111;
				mem[99][0]=8'b00010000;
				mem[100][0]=8'b00010000;
				mem[101][0]=8'b11111111;
				end		
			5: begin 
				mem[98][0]=8'b10011111;
				mem[99][0]=8'b10010001;
				mem[100][0]=8'b10010001;
				mem[101][0]=8'b11110001;
				end	
			6: begin 
				mem[98][0]=8'b11111111;
				mem[99][0]=8'b10010001;
				mem[100][0]=8'b10010001;
				mem[101][0]=8'b11110001;
				end	
			7: begin 
				mem[98][0]=8'b00000001;
				mem[99][0]=8'b00000001;
				mem[100][0]=8'b00000001;
				mem[101][0]=8'b11111111;
				end	
			8: begin 
				mem[98][0]=8'b11111111;
				mem[99][0]=8'b10010001;
				mem[100][0]=8'b10010001;
				mem[101][0]=8'b11111111;
				end	
			9:begin 
				mem[98][0]=8'b10011111;
				mem[99][0]=8'b10010001;
				mem[100][0]=8'b10010001;
				mem[101][0]=8'b11111111;
				end	
			default:	
				begin 
				mem[98][0]=8'b00000000;
				mem[99][0]=8'b00000000;
				mem[100][0]=8'b00000000;
				mem[101][0]=8'b00000000;
				end	
			endcase	
	end
	
	

	
	//life 1 memory
	
	// page 2 memory life 1
	always @(posedge clk_3)
	begin
	if(init_0_2==0)
	begin
	
		
	
	
	
	// starfish
	mem_0[54][2]=8'b10001000;
	mem_0[55][2]=8'b11011000;
	mem_0[56][2]=8'b10101000;
	mem_0[57][2]=8'b10000100;
	mem_0[58][2]=8'b01000010;
	mem_0[59][2]=8'b00100001;
	mem_0[60][2]=8'b01000010;
	mem_0[61][2]=8'b10000100;
	mem_0[62][2]=8'b10101000;
	mem_0[63][2]=8'b11011000;
	mem_0[64][2]=8'b10001000;
	
		
	
	
	mem_0[110][2]=8'b10001000;
	mem_0[111][2]=8'b01010100;
	mem_0[112][2]=8'b00100010;
	mem_0[113][2]=8'b00100001;
	mem_0[114][2]=8'b11100001;
	mem_0[115][2]=8'b00100001;
	mem_0[116][2]=8'b11100001;
	mem_0[117][2]=8'b00100001;
	mem_0[118][2]=8'b11100001;
	mem_0[119][2]=8'b00100001;
	mem_0[120][2]=8'b00100001;
	mem_0[121][2]=8'b00100010;
	mem_0[122][2]=8'b01010100;
	mem_0[123][2]=8'b10001000;
	
	
	init_0_2=1;
	end
	if(life==1)begin
		tmp_0_2=mem_0[0][2];
		for(k=0;k<127;k=k+1) begin
				mem_0[k][2]=mem_0[k+1][2];
			end	
	
		mem_0[127][2]=tmp_0_2;
	end
	
	end
 
 

	// page 6 memory life 1
  
	always @(posedge clk_4) 
	begin
	if(init_0_6==0)
	begin
	
	
	
	// crab
	
	mem_0[110][6]=8'b00011000;
	mem_0[111][6]=8'b00011000;
	mem_0[112][6]=8'b00011000;
	mem_0[113][6]=8'b11111111;
	mem_0[114][6]=8'b00011000;
	mem_0[115][6]=8'b00011000;
	mem_0[116][6]=8'b00011000;
	
	
	init_0_6=1;
	end
	if(life==1)
		begin
		tmp_0_6=mem_0[0][6];
		for(k=0;k<127;k=k+1) begin
				mem_0[k][6]=mem_0[k+1][6];
			end	
	
		mem_0[127][6]=tmp_0_6;
		end
	end
	
 

	// page 4 memory  life 1
	always @(posedge clk_2) 
	begin
	if(init_0_4==0)
	begin
	
	
	
	// mushroom
	
	mem_0[72][4]=8'b10011000;
	mem_0[73][4]=8'b10100100;
	mem_0[74][4]=8'b11100010;
	mem_0[75][4]=8'b11100001;
	mem_0[76][4]=8'b11100001;
	mem_0[77][4]=8'b11100010;
	mem_0[78][4]=8'b10100100;
	mem_0[79][4]=8'b10011000;
	

	// crab
	
	mem_0[110][4]=8'b10001000;
	mem_0[111][4]=8'b01010100;
	mem_0[112][4]=8'b00100010;
	mem_0[113][4]=8'b00100001;
	mem_0[114][4]=8'b11100001;
	mem_0[115][4]=8'b00100001;
	mem_0[116][4]=8'b11100001;
	mem_0[117][4]=8'b00100001;
	mem_0[118][4]=8'b11100001;
	mem_0[119][4]=8'b00100001;
	mem_0[120][4]=8'b00100001;
	mem_0[121][4]=8'b00100010;
	mem_0[122][4]=8'b01010100;
	mem_0[123][4]=8'b10001000;
	
	
	
	
	init_0_4=1;
	end
	if(life==1)
	begin
		tmp_0_4=mem_0[0][4];
		for(k=0;k<127;k=k+1) begin
				mem_0[k][4]=mem_0[k+1][4];
		end	
	
		mem_0[127][4]=tmp_0_4;
	end
	end
	
 
 
 
 
	// page 5 memory life 1
 
 always @(posedge clk_3)
	begin
	if(init_0_5==0)
	begin
	
	// starfish
	
	mem_0[54][5]=8'b10001000;
	mem_0[55][5]=8'b11011000;
	mem_0[56][5]=8'b10101000;
	mem_0[57][5]=8'b10000100;
	mem_0[58][5]=8'b01000010;
	mem_0[59][5]=8'b00100001;
	mem_0[60][5]=8'b01000010;
	mem_0[61][5]=8'b10000100;
	mem_0[62][5]=8'b10101000;
	mem_0[63][5]=8'b11011000;
	mem_0[64][5]=8'b10001000;
	
	
	// starfish
	
	mem_0[94][5]=8'b10001000;
	mem_0[95][5]=8'b11011000;
	mem_0[96][5]=8'b10101000;
	mem_0[97][5]=8'b10000100;
	mem_0[98][5]=8'b01000010;
	mem_0[99][5]=8'b00100001;
	mem_0[100][5]=8'b01000010;
	mem_0[101][5]=8'b10000100;
	mem_0[102][5]=8'b10101000;
	mem_0[103][5]=8'b11011000;
	mem_0[104][5]=8'b10001000;
	
	
	// crab
	
	
	mem_0[110][5]=8'b10001000;
	mem_0[111][5]=8'b01010100;
	mem_0[112][5]=8'b00100010;
	mem_0[113][5]=8'b00100001;
	mem_0[114][5]=8'b11100001;
	mem_0[115][5]=8'b00100001;
	mem_0[116][5]=8'b11100001;
	mem_0[117][5]=8'b00100001;
	mem_0[118][5]=8'b11100001;
	mem_0[119][5]=8'b00100001;
	mem_0[120][5]=8'b00100001;
	mem_0[121][5]=8'b00100010;
	mem_0[122][5]=8'b01010100;
	mem_0[123][5]=8'b10001000;
	
	
	init_0_5=1;
	end
	
	if(life==1)
	begin
		tmp_0_5=mem_0[0][5];
		for(k=0;k<127;k=k+1) begin
				mem_0[k][5]=mem_0[k+1][5];
			end	
	
		mem_0[127][5]=tmp_0_5;
	end
 end
 
 


 

	// page 3  memory life 1
 
	always @(posedge clk_4)
	begin
	if(init_0_3==0)
	begin
	
	// power plus
	mem_0[54][3]=8'b00011000;
	mem_0[55][3]=8'b00011000;
	mem_0[56][3]=8'b00011000;
	mem_0[57][3]=8'b01111110;
	mem_0[58][3]=8'b00011000;
	mem_0[59][3]=8'b00011000;
	mem_0[60][3]=8'b00011000;
		
	
	
	// delta 
	
	mem_0[93][3]=8'b01000000;
	mem_0[94][3]=8'b01110000;
	mem_0[95][3]=8'b01001100;
	mem_0[96][3]=8'b01000010;
	mem_0[97][3]=8'b01001100;
	mem_0[98][3]=8'b01110000;
	mem_0[99][3]=8'b01000000;
	
	init_0_3=1;
	
	end
	
	if(life==1)
	begin
		tmp_0_3=mem_0[0][3];
		for(k=0;k<127;k=k+1) begin
				mem_0[k][3]=mem_0[k+1][3];
			end	
	
		mem_0[127][3]=tmp_0_3;
	end
	end
  //	page 7 memory life 1
	always @(posedge clk_5) 
	begin
	if(init_0_7==0)
	begin
	
	// starfish
	mem_0[24][7]=8'b10001000;
	mem_0[25][7]=8'b11011000;
	mem_0[26][7]=8'b10101000;
	mem_0[27][7]=8'b10000100;
	mem_0[28][7]=8'b01000010;
	mem_0[29][7]=8'b00100001;
	mem_0[30][7]=8'b01000010;
	mem_0[31][7]=8'b10000100;
	mem_0[32][7]=8'b10101000;
	mem_0[33][7]=8'b11011000;
	mem_0[34][7]=8'b10001000;
	
	
	
	// mushroom
	
	mem_0[72][7]=8'b00011000;
	mem_0[73][7]=8'b00100100;
	mem_0[74][7]=8'b11100010;
	mem_0[75][7]=8'b11100001;
	mem_0[76][7]=8'b11100001;
	mem_0[77][7]=8'b11100010;
	mem_0[78][7]=8'b00100100;
	mem_0[79][7]=8'b00011000;
	
	
	// crab
	
	mem_0[110][7]=8'b10001000;
	mem_0[111][7]=8'b01010100;
	mem_0[112][7]=8'b00100010;
	mem_0[113][7]=8'b00100001;
	mem_0[114][7]=8'b11100001;
	mem_0[115][7]=8'b00100001;
	mem_0[116][7]=8'b11100001;
	mem_0[117][7]=8'b00100001;
	mem_0[118][7]=8'b11100001;
	mem_0[119][7]=8'b00100001;
	mem_0[120][7]=8'b00100001;
	mem_0[121][7]=8'b00100010;
	mem_0[122][7]=8'b01010100;
	mem_0[123][7]=8'b10001000;
		
	init_0_7=1;
	end
	if(life==1)
	begin
		tmp_0_1=mem_0[0][7];
		for(k=0;k<127;k=k+1) begin
				mem_0[k][7]=mem_0[k+1][7];
			end	
	
		mem_0[127][7]=tmp_0_1;
	end
	
	
 
 end
 
 
 

 
	// Introduction and Gameover Text
 always@(posedge divider[25])
	begin 
	start_count=start_count+1;
if(start==1)
begin //page 0 scuba mario
	
	// S
	
	finish[24][4]=8'b10011111;
	finish[25][4]=8'b10010001;
	finish[26][4]=8'b10010001;
	finish[27][4]=8'b10010001;
	finish[28][4]=8'b11110001;
	
	//space
	finish[29][4]=8'b00000000;
	finish[30][4]=8'b00000000;
	
	// C
	
	finish[31][4]=8'b11111111;
	finish[32][4]=8'b10000001;
	finish[33][4]=8'b10000001;
	finish[34][4]=8'b10000001;
	finish[35][4]=8'b10000001;
	// space
	
	finish[36][4]=8'b00000000;
	finish[37][4]=8'b00000000;
	
	
	// U
	
	finish[38][4]=8'b11111111;
	finish[39][4]=8'b10000000;
	finish[40][4]=8'b10000000;
	finish[41][4]=8'b10000000;
	finish[42][4]=8'b11111111;
	
	
	// space
	
	finish[43][4]=8'b00000000;
	finish[44][4]=8'b00000000;
	
	// B
	
	finish[45][4]=8'b11111111;
	finish[46][4]=8'b10010001;
	finish[47][4]=8'b10010001;
	finish[48][4]=8'b10010001;
	finish[49][4]=8'b10011111;
	finish[50][4]=8'b11110000;
	
	
	// space
	
	finish[51][4]=8'b00000000;
	finish[52][4]=8'b00000000;
	
	// letter a
	finish[53][4]=8'b11111000;
	finish[54][4]=8'b00010100;
	finish[55][4]=8'b00010010;
	finish[56][4]=8'b00010001;
	finish[57][4]=8'b00010001;
	finish[58][4]=8'b00010010;
	finish[59][4]=8'b00010100;
	finish[60][4]=8'b11111000;
	
	
	// space
	
	finish[62][4]=8'b00000000;
	finish[63][4]=8'b00000000;
	finish[64][4]=8'b00000000;
	finish[65][4]=8'b00000000;
	finish[66][4]=8'b00000000;
	// letter m
	finish[67][4]=8'b11111111;
	finish[68][4]=8'b00000001;
	finish[69][4]=8'b00000010;
	finish[70][4]=8'b00000100;
	finish[71][4]=8'b00001000;
	finish[72][4]=8'b00000100;
	finish[73][4]=8'b00000010;
	finish[74][4]=8'b00000001;
	finish[75][4]=8'b11111111;
	// space 
	finish[76][4]=8'b00000000;
	finish[77][4]=8'b00000000;
	// letter a
	finish[78][4]=8'b11111000;
	finish[79][4]=8'b00010100;
	finish[80][4]=8'b00010010;
	finish[81][4]=8'b00010001;
	finish[82][4]=8'b00010001;
	finish[83][4]=8'b00010010;
	finish[84][4]=8'b00010100;
	finish[85][4]=8'b11111000;
	//space
	finish[86][4]=8'b00000000;
	finish[87][4]=8'b00000000;
	// letter r
	finish[88][4]=8'b11111111;
	finish[89][4]=8'b00010001;
	finish[90][4]=8'b00010001;
	finish[91][4]=8'b00010001;
	finish[92][4]=8'b11101110;
	// space 
	finish[93][4]=8'b00000000;
	finish[94][4]=8'b00000000;
	// letter i
	finish[95][4]=8'b11111111;
	// space
	finish[96][4]=8'b00000000;
	finish[97][4]=8'b00000000;
	// letter o
	finish[98][4]=8'b11111111;
	finish[99][4]=8'b10000001;
	finish[100][4]=8'b10000001;
	finish[101][4]=8'b10000001;
	finish[102][4]=8'b10000001;
	finish[103][4]=8'b11111111;

	// gameover
	
	// g
	finish[34][3]=8'b11111111;
	finish[35][3]=8'b10000001;
	finish[36][3]=8'b10000001;
	finish[37][3]=8'b10010001;
	finish[38][3]=8'b11110001;


	finish[39][3]=8'b00000000;
	finish[40][3]=8'b00000000;


// letter a
	finish[41][3]=8'b11111000;
	finish[42][3]=8'b00010100;
	finish[43][3]=8'b00010010;
	finish[44][3]=8'b00010001;
	finish[45][3]=8'b00010001;
	finish[46][3]=8'b00010010;
	finish[47][3]=8'b00010100;
	finish[48][3]=8'b11111000;
	
	
	finish[49][3]=8'b00000000;
	finish[50][3]=8'b00000000;
	
	// letter m
	finish[51][3]=8'b11111111;
	finish[52][3]=8'b00000010;
	finish[53][3]=8'b00000100;
	finish[54][3]=8'b00001000;
	finish[55][3]=8'b00010000;
	finish[56][3]=8'b00001000;
	finish[57][3]=8'b00000100;
	finish[58][3]=8'b00000010;
	finish[59][3]=8'b11111111;

	finish[60][3]=8'b00000000;
	finish[61][3]=8'b00000000;


	// letter e

	finish[62][3]=8'b11111111;
	finish[63][3]=8'b10010001;
	finish[64][3]=8'b10010001;
	finish[65][3]=8'b10010001;
	finish[66][3]=8'b10010001;


	finish[67][3]=8'b00000000;
	finish[68][3]=8'b00000000;
	finish[69][3]=8'b00000000;

	//o 

	finish[70][3]=8'b11111111;
	finish[71][3]=8'b10000001;
	finish[72][3]=8'b10000001;
	finish[73][3]=8'b10000001;
	finish[74][3]=8'b11111111;


	finish[75][3]=8'b00000000;
	finish[76][3]=8'b00000000;

	//v
	finish[77][3]=8'b00111111;
	finish[78][3]=8'b01000000;
	finish[79][3]=8'b10000000;
	finish[80][3]=8'b01000000;
	finish[81][3]=8'b00111111;


	finish[82][3]=8'b00000000;
	finish[83][3]=8'b00000000;
	//e


	finish[84][3]=8'b11111111;
	finish[85][3]=8'b10010001;
	finish[86][3]=8'b10010001;
	finish[87][3]=8'b10010001;
	finish[88][3]=8'b10010001;
	finish[89][3]=8'b00000000;
	finish[90][3]=8'b00000000;
	// r
	finish[91][3]=8'b11111111;
	finish[92][3]=8'b00010001;
	finish[93][3]=8'b00010001;
	finish[94][3]=8'b00010001;
	finish[95][3]=8'b11101110;


	//bazinga !!

	// b 
	finish[37][5]=8'b11111111;
	finish[38][5]=8'b10010001;
	finish[39][5]=8'b10010001;
	finish[40][5]=8'b10010001;
	finish[41][5]=8'b10011111;
	finish[42][5]=8'b11110000;
	// space
	
	finish[43][5]=8'b00000000;
	finish[44][5]=8'b00000000;
	
	// letter a
	finish[45][5]=8'b11111000;
	finish[46][5]=8'b00010100;
	finish[47][5]=8'b00010010;
	finish[48][5]=8'b00010001;
	finish[49][5]=8'b00010001;
	finish[50][5]=8'b00010010;
	finish[51][5]=8'b00010100;
	finish[52][5]=8'b11111000;
	
	// space
	finish[53][5]=8'b00000000;
	finish[54][5]=8'b00000000;
	
	// z	
	
	finish[55][5]=8'b11000001;
	finish[56][5]=8'b10100001;
	finish[57][5]=8'b10010001;
	finish[58][5]=8'b10001001;
	finish[59][5]=8'b10000101;
	finish[60][5]=8'b10000011;
	
	
	// space
	finish[61][5]=8'b00000000;
	finish[62][5]=8'b00000000;
	
	// i

	finish[63][5]=8'b11111111;
	
	// space
	finish[64][5]=8'b00000000;
	finish[65][5]=8'b00000000;
	// n
	finish[66][5]=8'b11111111;
	finish[67][5]=8'b00000011;
	finish[68][5]=8'b00000100;
	finish[69][5]=8'b00001000;
	finish[70][5]=8'b00010000;
	finish[71][5]=8'b00100000;
	finish[72][5]=8'b11000000;
	finish[73][5]=8'b11111111;

	
	//
	finish[74][5]=8'b00000000;
	finish[75][5]=8'b00000000;
	
	
	// g 
	

	finish[76][5]=8'b11111111;
	finish[77][5]=8'b10000001;
	finish[78][5]=8'b10000001;
	finish[79][5]=8'b10010001;
	finish[80][5]=8'b11110001;
	
	
	
	//
	finish[81][5]=8'b00000000;
	finish[82][5]=8'b00000000;
	// a
	finish[83][5]=8'b11111000;
	finish[84][5]=8'b00010100;
	finish[85][5]=8'b00010010;
	finish[86][5]=8'b00010001;
	finish[87][5]=8'b00010001;
	finish[88][5]=8'b00010010;
	finish[89][5]=8'b00010100;
	finish[90][5]=8'b11111000;
	
	
	//space
	finish[91][5]=8'b00000000;
	finish[92][5]=8'b00000000;
	
	//!!
	finish[93][5]=8'b10011111;
	finish[94][5]=8'b10011111;
	end

	

	if(start_count==2)
	begin 
	start=0;
	end

end
	
	
	
	//Display Block (Refreshing Screen Multiple times per second)
	always@(posedge divider[8]) begin
		count <= count + 1;
		reset <= 1;
			
		if(count <= 9)
			begin cs1<=1; cs2<=1;lcd_rs <= 0; lcd_rw <= 0; lcd_e <= 0; lcd_data <= 8'b00000000; end
		else if(count == 10)
			begin lcd_rs <= 0; lcd_rw <= 0; lcd_data <= 8'b00111111; lcd_e <= 1; end
		else if(count == 11)
			lcd_e <= 0;
		else if(count == 12)
			begin cs1<=1;cs2<=1;lcd_rs <= 0; lcd_rw <= 0; lcd_data <= 184+page; lcd_e <= 1; end
		else if(count == 13)
			lcd_e <= 0;
		else if(count == 14)
			begin lcd_rs <= 0; lcd_rw <= 0; lcd_data <=8'b01000000; lcd_e <= 1; end
		else if(count == 15)
			lcd_e <= 0;
		else begin		
			if(!already_on) begin
				if((life==2)&&(start==0))
				begin 
				if (i <64 ) begin
					cs1 <= 1;
					cs2 <= 0;
				end 
				else if (i > 63) begin
					cs1 <= 0;
					cs2 <= 1;
				end
				
				lcd_rs <=1 ; 
				lcd_rw <= 0; 
				if (i<12) begin 
					if((mar[i][page]>0)&&(mem[i][page]>0))
					begin  
					if((page==3)|(page==6))			
						begin
							lcd_data=mar[i][page];
							bonus<=bonus+1;
						end
					else 
						begin
							life=1;			//gameover = 1 ; 
						end
					end
					else lcd_data = (mar[i][page]|mem[i][page]);
				end
				if (i>=12 && i<128) begin  lcd_data = mem[i][page] ; end 
				lcd_e <= 1; 
				i <= i+1;
				already_on <= 1;
				if (i == 128) begin
					i <= 0;
					page = (page ==7)? 0 : page+ 1 ;
					count <= 10;
				end
				end
				
				else if(life==1)
				begin 
				if (i <64 ) begin
					cs1 <= 1;
					cs2 <= 0;
				end 
				else if (i > 63) begin
					cs1 <= 0;
					cs2 <= 1;
				end
				
				lcd_rs <=1 ; 
				lcd_rw <= 0; 
				if (i<12) begin 
					if((mar[i][page]>0)&&(mem_0[i][page]>0))
					begin  
					if((page==3)|(page==6))			
						begin
							lcd_data=mar[i][page];
							bonus<=bonus+1;
						end
					else 
						begin
							life=0;
							gameover = 1 ; 
						end
					end
					else lcd_data = (mar[i][page]|mem_0[i][page]);
				end
				if (i>=12& i<128) begin  lcd_data = mem_0[i][page] ; end 
				lcd_e <= 1; 
				i <= i+1;
				already_on <= 1;
				if (i == 128) begin
					i <= 0;
					page = (page ==7)? 0 : page+ 1 ;
					count <= 10;
				end
				end
				
				else if((gameover==1)|(start==1)) begin 
				if (i <64 ) begin
					cs1 <= 1;
					cs2 <= 0;
				end 
				else if (i > 63) begin
					cs1 <= 0;
					cs2 <= 1;
				end
				
				lcd_rs <=1 ; 
				lcd_rw <= 0; 
				if(start==1)begin 
					if(page!=4)
							begin lcd_data =8'b00000000;end 
							else begin lcd_data=finish[i][page];end
					end
				else 
				if(page==4)
				begin lcd_data=8'b00000000;end
				else  begin lcd_data=finish[i][page];end
			
				lcd_e <= 1; 
				i <= i+1;
				already_on <= 1;
				if (i == 128) begin
					i <= 0;
					page = (page ==7)? 0 : page+ 1 ;
					count <= 10;
				end
				end
				
				
				
				
				
				
			end
			else begin
				already_on <= 0;
				lcd_e <= 0;
			end
		end
end		








	endmodule
	
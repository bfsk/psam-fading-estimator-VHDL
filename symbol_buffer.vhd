LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY symbol_buffer IS
	PORT(
		real_in: IN integer;
		imag_in: IN integer;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		real_out: OUT integer;
		imag_out: OUT integer;
		pilot_symbol_CLK: OUT STD_LOGIC;
		symbol_index: out integer;
		pilot_real_15: out integer;
		pilot_imag_15: out integer;
		pilot_real_16: out integer;
		pilot_imag_16: out integer;
		pilot_real_17: out integer;
		pilot_imag_17: out integer;
		pilot_real_18: out integer;
		pilot_imag_18: out integer;
		pilot_real_19: out integer;
		pilot_imag_19: out integer;
		pilot_real_20: out integer;
		pilot_imag_20: out integer;
		pilot_real_21: out integer;
		pilot_imag_21: out integer;
		pilot_real_22: out integer;
		pilot_imag_22: out integer;
		pilot_real_23: out integer;
		pilot_imag_23: out integer;
		pilot_real_24: out integer;
		pilot_imag_24: out integer;
		pilot_real_25: out integer;
		pilot_imag_25: out integer;
		pilot_real_26: out integer;
		pilot_imag_26: out integer;
		pilot_real_27: out integer;
		pilot_imag_27: out integer;
		pilot_real_28: out integer;
		pilot_imag_28: out integer;
		pilot_real_29: out integer;
		pilot_imag_29: out integer;
		pilot_real_30: out integer;
		pilot_imag_30: out integer
		);
END symbol_buffer;

ARCHITECTURE arch_symbol_buffer OF symbol_buffer IS
	COMPONENT frame_buffer IS
	generic (shift_reg_depth: integer := 15); 
		PORT(
			real_in: IN integer;
			imag_in: IN integer;
			RESET: IN STD_LOGIC;
			CLK: IN STD_LOGIC;
			real_out: OUT integer;
			imag_out: OUT integer
			);
	END COMPONENT;
	
	COMPONENT count_to IS
	PORT(
		clk,reset: in std_logic;
		upper_bound: in integer;
		clock_out: out std_logic;
		count_out: out integer
		);
	END COMPONENT;
	
	constant number_of_symbols_per_frame : integer := 15;
	constant number_of_frames : integer := 30;
	constant number_of_frames_half : integer := number_of_frames / 2 + 1; -- + 1 stands for current frame
	constant number_of_frames_half_past : integer := (number_of_frames - 1) / 2;
	
	
	type int_array is array(0 to number_of_frames_half - 1) of integer;
	signal buffer_outputs_real : int_array;
	signal buffer_outputs_imag : int_array;
	
	signal inverse_clk : std_logic := '0';

begin
	
		inverse_clk <= not(CLK);
		--buffer gornje polovine okvira
		a: for i in 0 to number_of_frames_half - 1 generate
			x: if i /= 0 generate
				aa: frame_buffer PORT MAP(
					buffer_outputs_real(i - 1),
					buffer_outputs_imag(i - 1),
					RESET,
					CLK,
					buffer_outputs_real(i),
					buffer_outputs_imag(i)
					);		
			end generate x;
		y: if i = 0 generate
				aa: frame_buffer PORT MAP(
					real_in,
					imag_in,
					RESET,
					CLK,
					buffer_outputs_real(i),
					buffer_outputs_imag(i)
					);	
			end generate y;	
		end generate a;
		
	
	p: count_to port map(
	  inverse_clk,RESET, 
	  number_of_symbols_per_frame - 1,
	  pilot_symbol_CLK,
	  symbol_index
	 );
	 
	 real_out <= buffer_outputs_real(15);
	 imag_out <= buffer_outputs_imag(15);
	 
	 pilot_real_15 <= buffer_outputs_real(15);
	 pilot_imag_15 <= buffer_outputs_imag(15);
	 
	 pilot_real_16 <= buffer_outputs_real(14);
	 pilot_imag_16 <= buffer_outputs_imag(14);
	 
	 pilot_real_17 <= buffer_outputs_real(13);
	 pilot_imag_17 <= buffer_outputs_imag(13);
	 
	 pilot_real_18 <= buffer_outputs_real(12);
	 pilot_imag_18 <= buffer_outputs_imag(12);
	 
	 pilot_real_19 <= buffer_outputs_real(11);
	 pilot_imag_19 <= buffer_outputs_imag(11);
	 
	 pilot_real_20 <= buffer_outputs_real(10);
	 pilot_imag_20 <= buffer_outputs_imag(10);
	 
	 pilot_real_21 <= buffer_outputs_real(9);
	 pilot_imag_21 <= buffer_outputs_imag(9);
	 
	 pilot_real_22 <= buffer_outputs_real(8);
	 pilot_imag_22 <= buffer_outputs_imag(8);
	 
	 pilot_real_23 <= buffer_outputs_real(7);
	 pilot_imag_23 <= buffer_outputs_imag(7);
	 
	 pilot_real_24 <= buffer_outputs_real(6);
	 pilot_imag_24 <= buffer_outputs_imag(6);
	 
	 pilot_real_25 <= buffer_outputs_real(5);
	 pilot_imag_25 <= buffer_outputs_imag(5);
	 
	 pilot_real_26 <= buffer_outputs_real(4);
	 pilot_imag_26 <= buffer_outputs_imag(4);
	 
	 pilot_real_27 <= buffer_outputs_real(3);
	 pilot_imag_27 <= buffer_outputs_imag(3);
	 
	 pilot_real_28 <= buffer_outputs_real(2);
	 pilot_imag_28 <= buffer_outputs_imag(2);
	 
	 pilot_real_29 <= buffer_outputs_real(1);
	 pilot_imag_29 <= buffer_outputs_imag(1);
	 
	 pilot_real_30 <= buffer_outputs_real(0);
	 pilot_imag_30 <= buffer_outputs_imag(0);
	 
END ARCHITECTURE;
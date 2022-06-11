LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY pilot_buffer IS
	PORT(
		real_in: IN integer;
		imag_in: IN integer;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		pilot_CLK: IN STD_LOGIC;
		symbol_index: IN integer;
	        pilot_in_real_15: in integer;
		pilot_in_imag_15: in integer;
		pilot_in_real_16: in integer;
		pilot_in_imag_16: in integer;
		pilot_in_real_17: in integer;
		pilot_in_imag_17: in integer;
		pilot_in_real_18: in integer;
		pilot_in_imag_18: in integer;
		pilot_in_real_19: in integer;
		pilot_in_imag_19: in integer;
		pilot_in_real_20: in integer;
		pilot_in_imag_20: in integer;
		pilot_in_real_21: in integer;
		pilot_in_imag_21: in integer;
		pilot_in_real_22: in integer;
		pilot_in_imag_22: in integer;
		pilot_in_real_23: in integer;
		pilot_in_imag_23: in integer;
		pilot_in_real_24: in integer;
		pilot_in_imag_24: in integer;
		pilot_in_real_25: in integer;
		pilot_in_imag_25: in integer;
		pilot_in_real_26: in integer;
		pilot_in_imag_26: in integer;
		pilot_in_real_27: in integer;
		pilot_in_imag_27: in integer;
		pilot_in_real_28: in integer;
		pilot_in_imag_28: in integer;
		pilot_in_real_29: in integer;
		pilot_in_imag_29: in integer;
		pilot_in_real_30: in integer;
		pilot_in_imag_30: in integer;
		pilot_real_1: out integer;
		pilot_imag_1: out integer;
		pilot_real_2: out integer;
		pilot_imag_2: out integer;
		pilot_real_3: out integer;
		pilot_imag_3: out integer;
		pilot_real_4: out integer;
		pilot_imag_4: out integer;
		pilot_real_5: out integer;
		pilot_imag_5: out integer;
		pilot_real_6: out integer;
		pilot_imag_6: out integer;
		pilot_real_7: out integer;
		pilot_imag_7: out integer;
		pilot_real_8: out integer;
		pilot_imag_8: out integer;
		pilot_real_9: out integer;
		pilot_imag_9: out integer;
		pilot_real_10: out integer;
		pilot_imag_10: out integer;
		pilot_real_11: out integer;
		pilot_imag_11: out integer;
		pilot_real_12: out integer;
		pilot_imag_12: out integer;
		pilot_real_13: out integer;
		pilot_imag_13: out integer;
		pilot_real_14: out integer;
		pilot_imag_14: out integer;
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
END pilot_buffer;

ARCHITECTURE arch_pilot_buffer OF pilot_buffer IS

	COMPONENT complex_delay IS
	PORT(
		real_in: IN integer;
		imag_in: IN integer;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		real_out: OUT integer;
		imag_out: OUT integer
		);
	END COMPONENT;

	constant number_of_symbols_per_frame : integer := 15;
	constant number_of_frames : integer := 30;
	constant number_of_frames_half : integer := number_of_frames / 2 + 1; -- + 1 stands for current frame
	constant number_of_frames_half_past : integer := (number_of_frames - 1) / 2;
	
	type int_array_a is array(0 to number_of_frames_half_past - 1) of integer;
	signal shift_outputs_real : int_array_a;
	signal shift_outputs_imag : int_array_a;

	type int_array_b is array(0 to number_of_frames_half_past) of integer;
	signal delay_outputs_real : int_array_b;
	signal delay_outputs_imag : int_array_b;
	
	signal conn_real : integer := 0;
	signal conn_imag : integer := 0;
begin

	--buffer pilota iz polovine okvira koja je prosla kroz buffer okvira
	b: for i in 0 to number_of_frames_half_past - 1 generate
		xb: if i /= 0 generate
			aab: complex_delay PORT MAP(
				shift_outputs_real(i - 1),
				shift_outputs_imag(i - 1),
				RESET,
				pilot_CLK,
				shift_outputs_real(i),
				shift_outputs_imag(i)
				);		
		end generate xb;
	yb: if i = 0 generate
			aab: complex_delay PORT MAP(
				conn_real,
				conn_imag,
				RESET,
				pilot_CLK,
				shift_outputs_real(i),
				shift_outputs_imag(i)
				);	
		end generate yb;	
	end generate b;

	pilot_real_1 <= shift_outputs_real(13);
	pilot_imag_1 <= shift_outputs_imag(13);
	pilot_real_2 <= shift_outputs_real(12);
	pilot_imag_2 <= shift_outputs_imag(12);
	pilot_real_3 <= shift_outputs_real(11);
	pilot_imag_3 <= shift_outputs_imag(11);
	pilot_real_4 <= shift_outputs_real(10);
	pilot_imag_4 <= shift_outputs_imag(10);
	pilot_real_5 <= shift_outputs_real(9);
	pilot_imag_5 <= shift_outputs_imag(9);
	pilot_real_6 <= shift_outputs_real(8);
	pilot_imag_6 <= shift_outputs_imag(8);
	pilot_real_7 <= shift_outputs_real(7);
	pilot_imag_7 <= shift_outputs_imag(7);
	pilot_real_8 <= shift_outputs_real(6);
	pilot_imag_8 <= shift_outputs_imag(6);
	pilot_real_9 <= shift_outputs_real(5);
	pilot_imag_9 <= shift_outputs_imag(5);
	pilot_real_10 <= shift_outputs_real(4);
	pilot_imag_10 <= shift_outputs_imag(4);
	pilot_real_11 <= shift_outputs_real(3);
	pilot_imag_11 <= shift_outputs_imag(3);
	pilot_real_12 <= shift_outputs_real(2);
	pilot_imag_12 <= shift_outputs_imag(2);
	pilot_real_13 <= shift_outputs_real(1);
	pilot_imag_13 <= shift_outputs_imag(1);
	pilot_real_14 <= shift_outputs_real(0);
	pilot_imag_14 <= shift_outputs_imag(0);


	pilot_real_15 <= conn_real;
	pilot_imag_15 <= conn_imag;

	frame_pilot_15: complex_delay PORT MAP(
				pilot_in_real_15,
				pilot_in_imag_15,
				RESET,
				pilot_CLK,
				conn_real,
				conn_imag
				);	
	frame_pilot_16: complex_delay PORT MAP(
				pilot_in_real_16,
				pilot_in_imag_16,
				RESET,
				pilot_CLK,
				pilot_real_16,
				pilot_imag_16
				);	
	frame_pilot_17: complex_delay PORT MAP(
				pilot_in_real_17,
				pilot_in_imag_17,
				RESET,
				pilot_CLK,
				pilot_real_17,
				pilot_imag_17
				);	
	frame_pilot_18: complex_delay PORT MAP(
				pilot_in_real_18,
				pilot_in_imag_18,
				RESET,
				pilot_CLK,
				pilot_real_18,
				pilot_imag_18
				);	
	frame_pilot_19: complex_delay PORT MAP(
				pilot_in_real_19,
				pilot_in_imag_19,
				RESET,
				pilot_CLK,
				pilot_real_19,
				pilot_imag_19
				);	

	frame_pilot_20: complex_delay PORT MAP(
				pilot_in_real_20,
				pilot_in_imag_20,
				RESET,
				pilot_CLK,
				pilot_real_20,
				pilot_imag_20
				);	
	frame_pilot_21: complex_delay PORT MAP(
				pilot_in_real_21,
				pilot_in_imag_21,
				RESET,
				pilot_CLK,
				pilot_real_21,
				pilot_imag_21
				);	
	frame_pilot_22: complex_delay PORT MAP(
				pilot_in_real_22,
				pilot_in_imag_22,
				RESET,
				pilot_CLK,
				pilot_real_22,
				pilot_imag_22
				);	
	frame_pilot_23: complex_delay PORT MAP(
				pilot_in_real_23,
				pilot_in_imag_23,
				RESET,
				pilot_CLK,
				pilot_real_23,
				pilot_imag_23
				);	
	frame_pilot_24: complex_delay PORT MAP(
				pilot_in_real_24,
				pilot_in_imag_24,
				RESET,
				pilot_CLK,
				pilot_real_24,
				pilot_imag_24
				);	
	frame_pilot_25: complex_delay PORT MAP(
				pilot_in_real_25,
				pilot_in_imag_25,
				RESET,
				pilot_CLK,
				pilot_real_25,
				pilot_imag_25
				);	
	frame_pilot_26: complex_delay PORT MAP(
				pilot_in_real_26,
				pilot_in_imag_26,
				RESET,
				pilot_CLK,
				pilot_real_26,
				pilot_imag_26
				);	
	frame_pilot_27: complex_delay PORT MAP(
				pilot_in_real_27,
				pilot_in_imag_27,
				RESET,
				pilot_CLK,
				pilot_real_27,
				pilot_imag_27
				);	
	frame_pilot_28: complex_delay PORT MAP(
				pilot_in_real_28,
				pilot_in_imag_28,
				RESET,
				pilot_CLK,
				pilot_real_28,
				pilot_imag_28
				);	
	frame_pilot_29: complex_delay PORT MAP(
				pilot_in_real_29,
				pilot_in_imag_29,
				RESET,
				pilot_CLK,
				pilot_real_29,
				pilot_imag_29
				);	

	frame_pilot_30: complex_delay PORT MAP(
				pilot_in_real_30,
				pilot_in_imag_30,
				RESET,
				pilot_CLK,
				pilot_real_30,
				pilot_imag_30
				);	

end ARCHITECTURE;
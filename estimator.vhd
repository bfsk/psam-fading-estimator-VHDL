LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY estimator IS
	PORT(
		precision: in integer;
		real_in: IN integer;
		imag_in: IN integer;
		real_in_pilot_constant: IN integer;
		imag_in_pilot_constant: IN integer;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		H_S_CLK: in std_logic;
		real_estim_out: OUT integer;
		imag_estim_out: OUT integer;
		real_out: OUT integer;
		imag_out: OUT integer;
		symbol_index: OUT integer;
		calc_rdy: out std_logic
		);
END estimator;

ARCHITECTURE arch_estimator OF estimator IS
	
	COMPONENT symbol_buffer IS
	PORT(
		real_in: IN integer;
		imag_in: IN integer;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		H_S_CLK: IN STD_LOGIC;
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
	END COMPONENT;

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

	COMPONENT complex_divider IS
	PORT(
		precision: in integer;
		ref_real: in integer;
		ref_imag: in integer;
		real_windowed_in: in integer;
		imag_windowed_in: in integer;
		estimate_real: out integer;
		estimate_imag: out integer
		);
	END COMPONENT;

	COMPONENT pilot_buffer IS
	PORT(
		real_in: IN integer;
		imag_in: IN integer;
		RESET: IN STD_LOGIC;
		H_S_CLK: IN STD_LOGIC;
		pilot_CLK: IN STD_LOGIC;
		pilots_ready_flag: OUT STD_LOGIC;
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
	END COMPONENT;
	
	
	COMPONENT sinc_coefficients IS
	PORT(
		index_of_symbol: IN integer;		  
		sinc_m14 : OUT integer;
	  sinc_m13 : OUT integer;
	  sinc_m12 : OUT integer;
	  sinc_m11 : OUT integer;
	  sinc_m10 : OUT integer;
	  sinc_m9 : OUT integer;
	  sinc_m8 : OUT integer;
	  sinc_m7 : OUT integer;
	  sinc_m6 : OUT integer;
	  sinc_m5 : OUT integer;
	  sinc_m4 : OUT integer;
	  sinc_m3 : OUT integer;
	  sinc_m2 : OUT integer;
	  sinc_m1 : OUT integer;
	  sinc_0 : OUT integer;
	  sinc_1 : OUT integer;
	  sinc_2 : OUT integer;
	  sinc_3 : OUT integer;
	  sinc_4 : OUT integer;
	  sinc_5 : OUT integer;
	  sinc_6 : OUT integer;
	  sinc_7 : OUT integer;
	  sinc_8 : OUT integer;
	  sinc_9 : OUT integer;
	  sinc_10 : OUT integer;
	  sinc_11 : OUT integer;
	  sinc_12 : OUT integer;
	  sinc_13 : OUT integer;
	  sinc_14 : OUT integer;
	  sinc_15 : OUT integer
		);
	END COMPONENT;
	
	COMPONENT multiplier IS
	PORT(
		CLK: in std_logic;
		H_S_CLK: in std_logic;
		RESET: in std_logic;
		precision: in integer;
		pilot_real_1: in integer;
		pilot_imag_1: in integer;
		pilot_real_2: in integer;
		pilot_imag_2: in integer;
		pilot_real_3: in integer;
		pilot_imag_3: in integer;
		pilot_real_4: in integer;
		pilot_imag_4: in integer;
		pilot_real_5: in integer;
		pilot_imag_5: in integer;
		pilot_real_6: in integer;
		pilot_imag_6: in integer;
		pilot_real_7: in integer;
		pilot_imag_7: in integer;
		pilot_real_8: in integer;
		pilot_imag_8: in integer;
		pilot_real_9: in integer;
		pilot_imag_9: in integer;
		pilot_real_10: in integer;
		pilot_imag_10: in integer;
		pilot_real_11: in integer;
		pilot_imag_11: in integer;
		pilot_real_12: in integer;
		pilot_imag_12: in integer;
		pilot_real_13: in integer;
		pilot_imag_13: in integer;
		pilot_real_14: in integer;
		pilot_imag_14: in integer;
		pilot_real_15: in integer;
		pilot_imag_15: in integer;
		pilot_real_16: in integer;
		pilot_imag_16: in integer;
		pilot_real_17: in integer;
		pilot_imag_17: in integer;
		pilot_real_18: in integer;
		pilot_imag_18: in integer;
		pilot_real_19: in integer;
		pilot_imag_19: in integer;
		pilot_real_20: in integer;
		pilot_imag_20: in integer;
		pilot_real_21: in integer;
		pilot_imag_21: in integer;
		pilot_real_22: in integer;
		pilot_imag_22: in integer;
		pilot_real_23: in integer;
		pilot_imag_23: in integer;
		pilot_real_24: in integer;
		pilot_imag_24: in integer;
		pilot_real_25: in integer;
		pilot_imag_25: in integer;
		pilot_real_26: in integer;
		pilot_imag_26: in integer;
		pilot_real_27: in integer;
		pilot_imag_27: in integer;
		pilot_real_28: in integer;
		pilot_imag_28: in integer;
		pilot_real_29: in integer;
		pilot_imag_29: in integer;
		pilot_real_30: in integer;
		pilot_imag_30: in integer;
		sinc_m14 : in integer;
		sinc_m13 : in integer;
		sinc_m12 : in integer;
		sinc_m11 : in integer;
		sinc_m10 : in integer;
		sinc_m9 : in integer;
		sinc_m8 : in integer;
		sinc_m7 : in integer;
		sinc_m6 : in integer;
		sinc_m5 : in integer;
		sinc_m4 : in integer;
		sinc_m3 : in integer;
		sinc_m2 : in integer;
		sinc_m1 : in integer;
		sinc_0 : in integer;
		sinc_1 : in integer;
		sinc_2 : in integer;
		sinc_3 : in integer;
		sinc_4 : in integer;
		sinc_5 : in integer;
		sinc_6 : in integer;
		sinc_7 : in integer;
		sinc_8 : in integer;
		sinc_9 : in integer;
		sinc_10 : in integer;
		sinc_11 : in integer;
		sinc_12 : in integer;
		sinc_13 : in integer;
		sinc_14 : in integer;
		sinc_15 : in integer;
		pilot_sinc_real_1: out integer;
		pilot_sinc_imag_1: out integer;
		pilot_sinc_real_2: out integer;
		pilot_sinc_imag_2: out integer;
		pilot_sinc_real_3: out integer;
		pilot_sinc_imag_3: out integer;
		pilot_sinc_real_4: out integer;
		pilot_sinc_imag_4: out integer;
		pilot_sinc_real_5: out integer;
		pilot_sinc_imag_5: out integer;
		pilot_sinc_real_6: out integer;
		pilot_sinc_imag_6: out integer;
		pilot_sinc_real_7: out integer;
		pilot_sinc_imag_7: out integer;
		pilot_sinc_real_8: out integer;
		pilot_sinc_imag_8: out integer;
		pilot_sinc_real_9: out integer;
		pilot_sinc_imag_9: out integer;
		pilot_sinc_real_10: out integer;
		pilot_sinc_imag_10: out integer;
		pilot_sinc_real_11: out integer;
		pilot_sinc_imag_11: out integer;
		pilot_sinc_real_12: out integer;
		pilot_sinc_imag_12: out integer;
		pilot_sinc_real_13: out integer;
		pilot_sinc_imag_13: out integer;
		pilot_sinc_real_14: out integer;
		pilot_sinc_imag_14: out integer;
		pilot_sinc_real_15: out integer;
		pilot_sinc_imag_15: out integer;
		pilot_sinc_real_16: out integer;
		pilot_sinc_imag_16: out integer;
		pilot_sinc_real_17: out integer;
		pilot_sinc_imag_17: out integer;
		pilot_sinc_real_18: out integer;
		pilot_sinc_imag_18: out integer;
		pilot_sinc_real_19: out integer;
		pilot_sinc_imag_19: out integer;
		pilot_sinc_real_20: out integer;
		pilot_sinc_imag_20: out integer;
		pilot_sinc_real_21: out integer;
		pilot_sinc_imag_21: out integer;
		pilot_sinc_real_22: out integer;
		pilot_sinc_imag_22: out integer;
		pilot_sinc_real_23: out integer;
		pilot_sinc_imag_23: out integer;
		pilot_sinc_real_24: out integer;
		pilot_sinc_imag_24: out integer;
		pilot_sinc_real_25: out integer;
		pilot_sinc_imag_25: out integer;
		pilot_sinc_real_26: out integer;
		pilot_sinc_imag_26: out integer;
		pilot_sinc_real_27: out integer;
		pilot_sinc_imag_27: out integer;
		pilot_sinc_real_28: out integer;
		pilot_sinc_imag_28: out integer;
		pilot_sinc_real_29: out integer;
		pilot_sinc_imag_29: out integer;
		pilot_sinc_real_30: out integer;
		pilot_sinc_imag_30: out integer;
		calculation_ready: out std_logic
		);
	END COMPONENT;
	
	COMPONENT vector_sum IS
	PORT(
		windowed_real_1: in integer;
		windowed_imag_1: in integer;
		windowed_real_2: in integer;
		windowed_imag_2: in integer;
		windowed_real_3: in integer;
		windowed_imag_3: in integer;
		windowed_real_4: in integer;
		windowed_imag_4: in integer;
		windowed_real_5: in integer;
		windowed_imag_5: in integer;
		windowed_real_6: in integer;
		windowed_imag_6: in integer;
		windowed_real_7: in integer;
		windowed_imag_7: in integer;
		windowed_real_8: in integer;
		windowed_imag_8: in integer;
		windowed_real_9: in integer;
		windowed_imag_9: in integer;
		windowed_real_10: in integer;
		windowed_imag_10: in integer;
		windowed_real_11: in integer;
		windowed_imag_11: in integer;
		windowed_real_12: in integer;
		windowed_imag_12: in integer;
		windowed_real_13: in integer;
		windowed_imag_13: in integer;
		windowed_real_14: in integer;
		windowed_imag_14: in integer;
		windowed_real_15: in integer;
		windowed_imag_15: in integer;
		windowed_real_16: in integer;
		windowed_imag_16: in integer;
		windowed_real_17: in integer;
		windowed_imag_17: in integer;
		windowed_real_18: in integer;
		windowed_imag_18: in integer;
		windowed_real_19: in integer;
		windowed_imag_19: in integer;
		windowed_real_20: in integer;
		windowed_imag_20: in integer;
		windowed_real_21: in integer;
		windowed_imag_21: in integer;
		windowed_real_22: in integer;
		windowed_imag_22: in integer;
		windowed_real_23: in integer;
		windowed_imag_23: in integer;
		windowed_real_24: in integer;
		windowed_imag_24: in integer;
		windowed_real_25: in integer;
		windowed_imag_25: in integer;
		windowed_real_26: in integer;
		windowed_imag_26: in integer;
		windowed_real_27: in integer;
		windowed_imag_27: in integer;
		windowed_real_28: in integer;
		windowed_imag_28: in integer;
		windowed_real_29: in integer;
		windowed_imag_29: in integer;
		windowed_real_30: in integer;
		windowed_imag_30: in integer;
		real_estim_out: OUT integer;
		imag_estim_out: OUT integer
		);
	END COMPONENT;


	
	constant number_of_symbols_per_frame : integer := 15;
	constant number_of_frames : integer := 30;
	constant number_of_frames_half : integer := number_of_frames / 2 + 1; -- + 1 stands for current frame
	constant number_of_frames_half_past : integer := (number_of_frames - 1) / 2;
	
	type int_array is array(0 to number_of_frames_half) of integer;
	signal first_symbols_from_buffer_array_real : int_array;
	signal first_symbols_from_buffer_array_imag : int_array;
	
	type int_array_b is array(0 to number_of_frames - 1) of integer;
	signal pilot_symbols_real : int_array_b;
	signal pilot_symbols_imag : int_array_b;
	
	signal pilot_estimates_real : int_array_b;
	signal pilot_estimates_imag : int_array_b;
	signal sinc_coefficients_signal : int_array_b;
	
	signal windowed_real : int_array_b;
	signal windowed_imag : int_array_b;
	
	
	signal real_out_a: integer;
	signal imag_out_a: integer;

	signal real_out_b: integer;
	signal imag_out_b: integer;

	signal pilot_symbol_CLK_signal : std_logic;
	signal not_CLK : std_logic;
	signal symbol_index_signal : integer;
	signal symbol_index_synced : integer;
	signal symbol_index_synced_sinc : integer;

	signal real_in_synced: integer;
	signal imag_in_synced: integer;

	signal real_in_synced_conn: integer;
	signal imag_in_synced_conn: integer;

	signal real_windowed: integer;
	signal imag_windowed: integer;

	signal real_estim_divided: integer;
	signal imag_estim_divided: integer;

	signal estim_calc_ready : std_logic;
	signal H_S_NOT_CLK : std_logic;


	signal pilots_ready_flag : std_logic;
begin


	buffer_of_symbols: symbol_buffer PORT MAP(
					real_in,
					imag_in,
					RESET,
					CLK,
					H_S_CLK,
					real_out_a,
					imag_out_a,
					pilot_symbol_CLK_signal,
					symbol_index_signal,
					first_symbols_from_buffer_array_real(0),
					first_symbols_from_buffer_array_imag(0),
					first_symbols_from_buffer_array_real(1),
					first_symbols_from_buffer_array_imag(1),
					first_symbols_from_buffer_array_real(2),
					first_symbols_from_buffer_array_imag(2),
					first_symbols_from_buffer_array_real(3),
					first_symbols_from_buffer_array_imag(3),
					first_symbols_from_buffer_array_real(4),
					first_symbols_from_buffer_array_imag(4),
					first_symbols_from_buffer_array_real(5),
					first_symbols_from_buffer_array_imag(5),
					first_symbols_from_buffer_array_real(6),
					first_symbols_from_buffer_array_imag(6),
					first_symbols_from_buffer_array_real(7),
					first_symbols_from_buffer_array_imag(7),
					first_symbols_from_buffer_array_real(8),
					first_symbols_from_buffer_array_imag(8),
					first_symbols_from_buffer_array_real(9),
					first_symbols_from_buffer_array_imag(9),
					first_symbols_from_buffer_array_real(10),
					first_symbols_from_buffer_array_imag(10),
					first_symbols_from_buffer_array_real(11),
					first_symbols_from_buffer_array_imag(11),
					first_symbols_from_buffer_array_real(12),
					first_symbols_from_buffer_array_imag(12),
					first_symbols_from_buffer_array_real(13),
					first_symbols_from_buffer_array_imag(13),
					first_symbols_from_buffer_array_real(14),
					first_symbols_from_buffer_array_imag(14),
					first_symbols_from_buffer_array_real(15),
					first_symbols_from_buffer_array_imag(15)
					);		

	buffer_of_pilots: pilot_buffer PORT MAP(
					real_out_a,
					imag_out_a,
					RESET,
					H_S_CLK,
					pilot_symbol_CLK_signal,
					pilots_ready_flag,
					first_symbols_from_buffer_array_real(0),
					first_symbols_from_buffer_array_imag(0),
					first_symbols_from_buffer_array_real(1),
					first_symbols_from_buffer_array_imag(1),
					first_symbols_from_buffer_array_real(2),
					first_symbols_from_buffer_array_imag(2),
					first_symbols_from_buffer_array_real(3),
					first_symbols_from_buffer_array_imag(3),
					first_symbols_from_buffer_array_real(4),
					first_symbols_from_buffer_array_imag(4),
					first_symbols_from_buffer_array_real(5),
					first_symbols_from_buffer_array_imag(5),
					first_symbols_from_buffer_array_real(6),
					first_symbols_from_buffer_array_imag(6),
					first_symbols_from_buffer_array_real(7),
					first_symbols_from_buffer_array_imag(7),
					first_symbols_from_buffer_array_real(8),
					first_symbols_from_buffer_array_imag(8),
					first_symbols_from_buffer_array_real(9),
					first_symbols_from_buffer_array_imag(9),
					first_symbols_from_buffer_array_real(10),
					first_symbols_from_buffer_array_imag(10),
					first_symbols_from_buffer_array_real(11),
					first_symbols_from_buffer_array_imag(11),
					first_symbols_from_buffer_array_real(12),
					first_symbols_from_buffer_array_imag(12),
					first_symbols_from_buffer_array_real(13),
					first_symbols_from_buffer_array_imag(13),
					first_symbols_from_buffer_array_real(14),
					first_symbols_from_buffer_array_imag(14),
					first_symbols_from_buffer_array_real(15),
					first_symbols_from_buffer_array_imag(15),
					pilot_symbols_real(0),
					pilot_symbols_imag(0),
					pilot_symbols_real(1),
					pilot_symbols_imag(1),
					pilot_symbols_real(2),
					pilot_symbols_imag(2),
					pilot_symbols_real(3),
					pilot_symbols_imag(3),
					pilot_symbols_real(4),
					pilot_symbols_imag(4),
					pilot_symbols_real(5),
					pilot_symbols_imag(5),
					pilot_symbols_real(6),
					pilot_symbols_imag(6),
					pilot_symbols_real(7),
					pilot_symbols_imag(7),
					pilot_symbols_real(8),
					pilot_symbols_imag(8),
					pilot_symbols_real(9),
					pilot_symbols_imag(9),
					pilot_symbols_real(10),
					pilot_symbols_imag(10),
					pilot_symbols_real(11),
					pilot_symbols_imag(11),
					pilot_symbols_real(12),
					pilot_symbols_imag(12),
					pilot_symbols_real(13),
					pilot_symbols_imag(13),
					pilot_symbols_real(14),
					pilot_symbols_imag(14),
					pilot_symbols_real(15),
					pilot_symbols_imag(15),
					pilot_symbols_real(16),
					pilot_symbols_imag(16),
					pilot_symbols_real(17),
					pilot_symbols_imag(17),
					pilot_symbols_real(18),
					pilot_symbols_imag(18),
					pilot_symbols_real(19),
					pilot_symbols_imag(19),
					pilot_symbols_real(20),
					pilot_symbols_imag(20),
					pilot_symbols_real(21),
					pilot_symbols_imag(21),
					pilot_symbols_real(22),
					pilot_symbols_imag(22),
					pilot_symbols_real(23),
					pilot_symbols_imag(23),
					pilot_symbols_real(24),
					pilot_symbols_imag(24),
					pilot_symbols_real(25),
					pilot_symbols_imag(25),
					pilot_symbols_real(26),
					pilot_symbols_imag(26),
					pilot_symbols_real(27),
					pilot_symbols_imag(27),
					pilot_symbols_real(28),
					pilot_symbols_imag(28),
					pilot_symbols_real(29),
					pilot_symbols_imag(29)
					);	
					

	coefficients_real: sinc_coefficients port map(
					symbol_index_signal, 
					sinc_coefficients_signal(0),
					sinc_coefficients_signal(1),
					sinc_coefficients_signal(2),
					sinc_coefficients_signal(3),
					sinc_coefficients_signal(4),
					sinc_coefficients_signal(5),
					sinc_coefficients_signal(6),
					sinc_coefficients_signal(7),
					sinc_coefficients_signal(8),
					sinc_coefficients_signal(9),
					sinc_coefficients_signal(10),
					sinc_coefficients_signal(11),
					sinc_coefficients_signal(12),
					sinc_coefficients_signal(13),
					sinc_coefficients_signal(14),
					sinc_coefficients_signal(15),
					sinc_coefficients_signal(16),
					sinc_coefficients_signal(17),
					sinc_coefficients_signal(18),
					sinc_coefficients_signal(19),
					sinc_coefficients_signal(20),
					sinc_coefficients_signal(21),
					sinc_coefficients_signal(22),
					sinc_coefficients_signal(23),
					sinc_coefficients_signal(24),
					sinc_coefficients_signal(25),
					sinc_coefficients_signal(26),
					sinc_coefficients_signal(27),
					sinc_coefficients_signal(28),
					sinc_coefficients_signal(29)
				 );
				
	windowing: multiplier PORT MAP(
					CLK,
					H_S_CLK,
					RESET,
					precision,
					pilot_symbols_real(0),
					pilot_symbols_imag(0),
					pilot_symbols_real(1),
					pilot_symbols_imag(1),
					pilot_symbols_real(2),
					pilot_symbols_imag(2),
					pilot_symbols_real(3),
					pilot_symbols_imag(3),
					pilot_symbols_real(4),
					pilot_symbols_imag(4),
					pilot_symbols_real(5),
					pilot_symbols_imag(5),
					pilot_symbols_real(6),
					pilot_symbols_imag(6),
					pilot_symbols_real(7),
					pilot_symbols_imag(7),
					pilot_symbols_real(8),
					pilot_symbols_imag(8),
					pilot_symbols_real(9),
					pilot_symbols_imag(9),
					pilot_symbols_real(10),
					pilot_symbols_imag(10),
					pilot_symbols_real(11),
					pilot_symbols_imag(11),
					pilot_symbols_real(12),
					pilot_symbols_imag(12),
					pilot_symbols_real(13),
					pilot_symbols_imag(13),
					pilot_symbols_real(14),
					pilot_symbols_imag(14),
					pilot_symbols_real(15),
					pilot_symbols_imag(15),
					pilot_symbols_real(16),
					pilot_symbols_imag(16),
					pilot_symbols_real(17),
					pilot_symbols_imag(17),
					pilot_symbols_real(18),
					pilot_symbols_imag(18),
					pilot_symbols_real(19),
					pilot_symbols_imag(19),
					pilot_symbols_real(20),
					pilot_symbols_imag(20),
					pilot_symbols_real(21),
					pilot_symbols_imag(21),
					pilot_symbols_real(22),
					pilot_symbols_imag(22),
					pilot_symbols_real(23),
					pilot_symbols_imag(23),
					pilot_symbols_real(24),
					pilot_symbols_imag(24),
					pilot_symbols_real(25),
					pilot_symbols_imag(25),
					pilot_symbols_real(26),
					pilot_symbols_imag(26),
					pilot_symbols_real(27),
					pilot_symbols_imag(27),
					pilot_symbols_real(28),
					pilot_symbols_imag(28),
					pilot_symbols_real(29),
					pilot_symbols_imag(29),
					sinc_coefficients_signal(0),
					sinc_coefficients_signal(1),
					sinc_coefficients_signal(2),
					sinc_coefficients_signal(3),
					sinc_coefficients_signal(4),
					sinc_coefficients_signal(5),
					sinc_coefficients_signal(6),
					sinc_coefficients_signal(7),
					sinc_coefficients_signal(8),
					sinc_coefficients_signal(9),
					sinc_coefficients_signal(10),
					sinc_coefficients_signal(11),
					sinc_coefficients_signal(12),
					sinc_coefficients_signal(13),
					sinc_coefficients_signal(14),
					sinc_coefficients_signal(15),
					sinc_coefficients_signal(16),
					sinc_coefficients_signal(17),
					sinc_coefficients_signal(18),
					sinc_coefficients_signal(19),
					sinc_coefficients_signal(20),
					sinc_coefficients_signal(21),
					sinc_coefficients_signal(22),
					sinc_coefficients_signal(23),
					sinc_coefficients_signal(24),
					sinc_coefficients_signal(25),
					sinc_coefficients_signal(26),
					sinc_coefficients_signal(27),
					sinc_coefficients_signal(28),
					sinc_coefficients_signal(29),
					windowed_real(0),
					windowed_imag(0),
					windowed_real(1),
					windowed_imag(1),
					windowed_real(2),
					windowed_imag(2),
					windowed_real(3),
					windowed_imag(3),
					windowed_real(4),
					windowed_imag(4),
					windowed_real(5),
					windowed_imag(5),
					windowed_real(6),
					windowed_imag(6),
					windowed_real(7),
					windowed_imag(7),
					windowed_real(8),
					windowed_imag(8),
					windowed_real(9),
					windowed_imag(9),
					windowed_real(10),
					windowed_imag(10),
					windowed_real(11),
					windowed_imag(11),
					windowed_real(12),
					windowed_imag(12),
					windowed_real(13),
					windowed_imag(13),
					windowed_real(14),
					windowed_imag(14),
					windowed_real(15),
					windowed_imag(15),
					windowed_real(16),
					windowed_imag(16),
					windowed_real(17),
					windowed_imag(17),
					windowed_real(18),
					windowed_imag(18),
					windowed_real(19),
					windowed_imag(19),
					windowed_real(20),
					windowed_imag(20),
					windowed_real(21),
					windowed_imag(21),
					windowed_real(22),
					windowed_imag(22),
					windowed_real(23),
					windowed_imag(23),
					windowed_real(24),
					windowed_imag(24),
					windowed_real(25),
					windowed_imag(25),
					windowed_real(26),
					windowed_imag(26),
					windowed_real(27),
					windowed_imag(27),
					windowed_real(28),
					windowed_imag(28),
					windowed_real(29),
					windowed_imag(29),
					estim_calc_ready
			);	
					
   final_estimation: vector_sum PORT MAP(
					windowed_real(0),
					windowed_imag(0),
					windowed_real(1),
					windowed_imag(1),
					windowed_real(2),
					windowed_imag(2),
					windowed_real(3),
					windowed_imag(3),
					windowed_real(4),
					windowed_imag(4),
					windowed_real(5),
					windowed_imag(5),
					windowed_real(6),
					windowed_imag(6),
					windowed_real(7),
					windowed_imag(7),
					windowed_real(8),
					windowed_imag(8),
					windowed_real(9),
					windowed_imag(9),
					windowed_real(10),
					windowed_imag(10),
					windowed_real(11),
					windowed_imag(11),
					windowed_real(12),
					windowed_imag(12),
					windowed_real(13),
					windowed_imag(13),
					windowed_real(14),
					windowed_imag(14),
					windowed_real(15),
					windowed_imag(15),
					windowed_real(16),
					windowed_imag(16),
					windowed_real(17),
					windowed_imag(17),
					windowed_real(18),
					windowed_imag(18),
					windowed_real(19),
					windowed_imag(19),
					windowed_real(20),
					windowed_imag(20),
					windowed_real(21),
					windowed_imag(21),
					windowed_real(22),
					windowed_imag(22),
					windowed_real(23),
					windowed_imag(23),
					windowed_real(24),
					windowed_imag(24),
					windowed_real(25),
					windowed_imag(25),
					windowed_real(26),
					windowed_imag(26),
					windowed_real(27),
					windowed_imag(27),
					windowed_real(28),
					windowed_imag(28),
					windowed_real(29),
					windowed_imag(29),
					real_windowed,
					imag_windowed
			);	

	pilot_division: complex_divider PORT MAP(
		precision,
		real_in_pilot_constant,
		imag_in_pilot_constant,
		real_windowed,
		imag_windowed,
		real_estim_divided,
		imag_estim_divided
		);		

	--sync symbola i pilota
	--not_CLK
	sync_out: complex_delay PORT MAP(
		real_estim_divided,
		imag_estim_divided,
		RESET,
		estim_calc_ready,
		real_estim_out,
		imag_estim_out
		);		
	calc_rdy <= estim_calc_ready;
	sync_a: complex_delay PORT MAP(
		real_out_a,
		imag_out_a,
		RESET,
		CLK,
		real_out_b,
		imag_out_b
		);	
	sync_b: complex_delay PORT MAP(
		real_out_b,
		imag_out_b,
		RESET,
		estim_calc_ready,
		real_in_synced,
		imag_in_synced
		);	
	real_out <= real_in_synced;
	imag_out <= imag_in_synced;
				
									
END ARCHITECTURE;

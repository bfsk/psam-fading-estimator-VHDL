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
		pilot_clk: in std_logic;
		H_S_CLK: in std_logic;
		symbol_index: in integer;
		real_estim_out: OUT integer;
		imag_estim_out: OUT integer
		);
END estimator;

ARCHITECTURE arch_estimator OF estimator IS
	
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
	COMPONENT sinc_coefficients_1 IS
	PORT(
		index_of_symbol: IN std_logic_vector(3 downto 0);	  
		sinc_m14 : OUT integer
		);
	END COMPONENT;

	COMPONENT pilot_buffer_new IS
	PORT(
        real_in: IN integer;
		imag_in: IN integer;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
        calculation_in_progress: in std_logic;
		serial_real_out: out integer;
        serial_imag_out: out integer
		);
	END COMPONENT;
	
	COMPONENT sinc_coefficients IS
	PORT(
		index_of_symbol: IN std_logic_vector(3 downto 0);		  
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
		symbol_index: in integer;
		pilot_real_in: in integer;
		pilot_imag_in: in integer;
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
		sinc_real_sum: out integer;
		sinc_imag_sum: out integer;
		calculation_in_progress: out std_logic;
		pilot_buffer_calc_clock: out std_logic
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

	signal testaa:std_logic_vector(3 downto 0);
	signal pilots_ready_flag : std_logic;
	signal vect:std_logic_vector(31 downto 0);


	signal clk_for_pilot_buffer : std_logic;
	signal calculation_in_progress_flag : std_logic;
	signal calc_clk : std_logic;

	signal pilot_from_buffer_real : integer;
	signal pilot_from_buffer_imag : integer;
begin

	clk_for_pilot_buffer <= pilot_clk when calculation_in_progress_flag = '0' else calc_clk;
	--pilot_clk
	buffer_of_pilots: pilot_buffer_new PORT MAP(
					real_in,
					imag_in,
					RESET,
					clk_for_pilot_buffer,
					calculation_in_progress_flag,
					pilot_from_buffer_real,
					pilot_from_buffer_imag
					);	
	vect <= std_logic_vector(to_unsigned(symbol_index, 32));
	testaa <= vect(3 downto 0);

	

	coefficients_real: sinc_coefficients PORT MAP(
		testaa, 
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
					symbol_index,
					pilot_from_buffer_real,
					pilot_from_buffer_imag,
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
					real_windowed,
					imag_windowed,
					calculation_in_progress_flag,
					calc_clk
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


	sync_with_symbol_clk: complex_delay PORT MAP(
		real_estim_divided,
		imag_estim_divided,
		RESET,
		CLK,
		real_estim_out,
		imag_estim_out
		);		
									
END ARCHITECTURE;

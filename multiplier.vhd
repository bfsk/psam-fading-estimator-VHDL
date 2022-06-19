LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY multiplier IS
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
END multiplier;

ARCHITECTURE arch_multiplier OF multiplier IS

	COMPONENT multiplication_num_selector IS
	PORT(
		CLK: in std_logic;
		H_S_CLK: in std_logic;
		RESET: in std_logic;
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
		selected_sinc_out: out integer
		);
	END COMPONENT;

	COMPONENT simple_scaler IS
	PORT(
	    precision: in integer;
		real_in: in integer;
		imag_in: in integer;
		scale_factor: in integer;
		real_result: out integer;
		imag_result: out integer
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
	
	COMPONENT simple_delay IS
	PORT(
		signal_in: IN STD_LOGIC;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		signal_out: OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT pulse_generator is
	port (
    	pulse_in: in std_logic;
		clk,reset: in std_logic;
		pulse_out: out std_logic
		);
	end COMPONENT;


	COMPONENT starter is
	port ( 
		trigger,reset: in std_logic;
		clock_out: out std_logic
		);
	end COMPONENT;

	COMPONENT count_to_stop is
	port ( 
		clk,reset: in std_logic;
		upper_bound: in integer;
		count_out: out integer;
		stop_flag: out std_logic
		);
	END COMPONENT;

	COMPONENT accumulator is
		port ( 
			data_in: in integer;
			sum_reset: in std_logic;
			clk,reset: in std_logic;
			data_out: out integer
			);
	END COMPONENT;
	COMPONENT SR_FF is
		PORT( 
			S,R,CLOCK, RESET: in std_logic;
			Q, QBAR: out std_logic
			);
	end COMPONENT;

	COMPONENT n_pulse_generator is
		port (
			trigger: in std_logic;
			number_of_pulses: in integer;
			clk,reset: in std_logic;
			pulses_out: out std_logic;
			enable_flag: out std_logic;
			enable_flag_n: out std_logic
			);
	end COMPONENT;

	signal safe_clk : std_logic;
	
	signal safe_clk_count: std_logic;
	signal selected_sinc_coeff : integer;
	signal selected_sinc_coeff_synced : integer;
	signal reset_pilot_clk_counter : std_logic;
	signal reset_pilot_clk_counter_RESET : std_logic;
	signal stop_buffer_clocking: std_logic;
	signal h_s_not_clk: std_logic;
	signal real_after_scale: integer;
	signal imag_after_scale: integer;
	signal test_count:integer; --delete after
	signal calc_stop_count:integer;

	signal set_calc_in_progress: std_logic;
	signal reset_calc_in_progress: std_logic;
	
	signal last_symbol_flag: std_logic;
	signal last_symbol_flag_n: std_logic;
	signal calc_in_progress_flag: std_logic;
	signal pilot_buffer_full_cycle_n: std_logic;
	signal pilot_buffer_full_cycle: std_logic;
	signal pilot_buffer_full_cycle_d: std_logic;

	signal pre_real_sum: integer;
	signal pre_imag_sum: integer;

	signal testar: integer;

begin

	pilot_buffer_clocking: n_pulse_generator PORT MAP (
			safe_clk,
			30,
			H_S_CLK,RESET,
			pilot_buffer_calc_clock,
			pilot_buffer_full_cycle_n,
			open
			);

	h_s_not_clk <= not(H_S_CLK);

	delaying_symbol_clk: simple_delay PORT MAP(
			CLK, --symbol clock
			RESET,
			h_s_not_clk,
			safe_clk
		);

	sync_coeff_selection: multiplication_num_selector PORT MAP(
		CLK,
		H_S_CLK,
		RESET,
		sinc_m14,
		sinc_m13,
		sinc_m12,
		sinc_m11,
		sinc_m10,
		sinc_m9,
		sinc_m8,
		sinc_m7,
		sinc_m6,
		sinc_m5,
		sinc_m4,
		sinc_m3,
		sinc_m2,
		sinc_m1,
		sinc_0,
		sinc_1,
		sinc_2,
		sinc_3,
		sinc_4,
		sinc_5,
		sinc_6,
		sinc_7,
		sinc_8,
		sinc_9,
		sinc_10,
		sinc_11,
		sinc_12,
		sinc_13,
		sinc_14,
		sinc_15,
		selected_sinc_coeff
	);

	set_calc_in_progress <= '1' when (symbol_index >= 2 and symbol_index <= 14) else '0';
	start_stop_calc: SR_FF PORT MAP( 
			set_calc_in_progress,
			reset_calc_in_progress,
			H_S_CLK,
			RESET,
			calc_in_progress_flag, 
			open --inversed
			);

	calculation_in_progress <= calc_in_progress_flag;

	last_symbol_flag <=  '1' when symbol_index = 15 else '0';

	delaying_last_symbol_flag: simple_delay PORT MAP(
			last_symbol_flag, --symbol clock
			RESET,
			h_s_not_clk,
			last_symbol_flag_n
		);
	

	calc_process_stopping: n_pulse_generator PORT MAP (
			last_symbol_flag_n,
			32,
			H_S_CLK,RESET,
			open,
			open,
			reset_calc_in_progress
			);

	
	syncing_sinc_coeffs: complex_delay PORT MAP(
		selected_sinc_coeff,
		0, --imag in ignore
		RESET,
		H_S_CLK,
		selected_sinc_coeff_synced,
		open
		);

	scaling: simple_scaler PORT MAP(
	    precision,
		pilot_real_in,
		pilot_imag_in,
		selected_sinc_coeff_synced,
		real_after_scale,
		imag_after_scale
		);

	hgf: complex_delay PORT MAP(
		real_after_scale,
		0, --imag in ignore
		RESET,
		h_s_not_clk,
		testar,
		open
		);

	accumulation_real: accumulator PORT MAP(
		testar,
		pilot_buffer_full_cycle_n,
		H_S_CLK,RESET,
		pre_real_sum
	);
	accumulation_imag: accumulator PORT MAP(
		imag_after_scale,
		pilot_buffer_full_cycle_n,
		h_s_not_clk,RESET,
		pre_imag_sum
	);

	pilot_buffer_full_cycle <= not(pilot_buffer_full_cycle_n);


	hold_correct_values_for_output: complex_delay PORT MAP(
		pre_real_sum,
		pre_imag_sum,
		RESET,
		pilot_buffer_full_cycle,
		sinc_real_sum,
		sinc_imag_sum
		);

END ARCHITECTURE;
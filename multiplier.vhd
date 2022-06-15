LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY multiplier IS
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
END multiplier;

ARCHITECTURE arch_multiplier OF multiplier IS
	COMPONENT multiplication_num_selector IS
	PORT(
		CLK: in std_logic;
		H_S_CLK: in std_logic;
		RESET: in std_logic;
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
		selected_real_out: out integer;
		selected_imag_out: out integer;
		selected_sinc_out: out integer
		);
	END COMPONENT;

	COMPONENT parallel_access_buffer IS
	PORT(
		real_in: IN integer;
		imag_in: IN integer;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
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
	
	COMPONENT parallel_register IS
	PORT(
        CLK: in std_logic;
        RESET: in std_logic;
		real_in_1: in integer;
		imag_in_1: in integer;
		real_in_2: in integer;
		imag_in_2: in integer;
		real_in_3: in integer;
		imag_in_3: in integer;
		real_in_4: in integer;
		imag_in_4: in integer;
		real_in_5: in integer;
		imag_in_5: in integer;
		real_in_6: in integer;
		imag_in_6: in integer;
		real_in_7: in integer;
		imag_in_7: in integer;
		real_in_8: in integer;
		imag_in_8: in integer;
		real_in_9: in integer;
		imag_in_9: in integer;
		real_in_10: in integer;
		imag_in_10: in integer;
		real_in_11: in integer;
		imag_in_11: in integer;
		real_in_12: in integer;
		imag_in_12: in integer;
		real_in_13: in integer;
		imag_in_13: in integer;
		real_in_14: in integer;
		imag_in_14: in integer;
		real_in_15: in integer;
		imag_in_15: in integer;
		real_in_16: in integer;
		imag_in_16: in integer;
		real_in_17: in integer;
		imag_in_17: in integer;
		real_in_18: in integer;
		imag_in_18: in integer;
		real_in_19: in integer;
		imag_in_19: in integer;
		real_in_20: in integer;
		imag_in_20: in integer;
		real_in_21: in integer;
		imag_in_21: in integer;
		real_in_22: in integer;
		imag_in_22: in integer;
		real_in_23: in integer;
		imag_in_23: in integer;
		real_in_24: in integer;
		imag_in_24: in integer;
		real_in_25: in integer;
		imag_in_25: in integer;
		real_in_26: in integer;
		imag_in_26: in integer;
		real_in_27: in integer;
		imag_in_27: in integer;
		real_in_28: in integer;
		imag_in_28: in integer;
		real_in_29: in integer;
		imag_in_29: in integer;
		real_in_30: in integer;
		imag_in_30: in integer;
		real_out_1: out integer;
		imag_out_1: out integer;
		real_out_2: out integer;
		imag_out_2: out integer;
		real_out_3: out integer;
		imag_out_3: out integer;
		real_out_4: out integer;
		imag_out_4: out integer;
		real_out_5: out integer;
		imag_out_5: out integer;
		real_out_6: out integer;
		imag_out_6: out integer;
		real_out_7: out integer;
		imag_out_7: out integer;
		real_out_8: out integer;
		imag_out_8: out integer;
		real_out_9: out integer;
		imag_out_9: out integer;
		real_out_10: out integer;
		imag_out_10: out integer;
		real_out_11: out integer;
		imag_out_11: out integer;
		real_out_12: out integer;
		imag_out_12: out integer;
		real_out_13: out integer;
		imag_out_13: out integer;
		real_out_14: out integer;
		imag_out_14: out integer;
		real_out_15: out integer;
		imag_out_15: out integer;
		real_out_16: out integer;
		imag_out_16: out integer;
		real_out_17: out integer;
		imag_out_17: out integer;
		real_out_18: out integer;
		imag_out_18: out integer;
		real_out_19: out integer;
		imag_out_19: out integer;
		real_out_20: out integer;
		imag_out_20: out integer;
		real_out_21: out integer;
		imag_out_21: out integer;
		real_out_22: out integer;
		imag_out_22: out integer;
		real_out_23: out integer;
		imag_out_23: out integer;
		real_out_24: out integer;
		imag_out_24: out integer;
		real_out_25: out integer;
		imag_out_25: out integer;
		real_out_26: out integer;
		imag_out_26: out integer;
		real_out_27: out integer;
		imag_out_27: out integer;
		real_out_28: out integer;
		imag_out_28: out integer;
		real_out_29: out integer;
		imag_out_29: out integer;
		real_out_30: out integer;
		imag_out_30: out integer
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

	signal selected_real: integer;
	signal selected_imag: integer;
	signal selected_scale_factor: integer;

	signal multiplication_index: integer;
	signal multiplication_index_pre_sync: integer;

	signal scaled_real: integer;
	signal scaled_imag: integer;

	signal sync_rst: std_logic;
	signal store_clk: std_logic;

	signal hi_speed_not_clk: std_logic;
	signal symbol_clock_delayed: std_logic;
	signal symbol_clock_del: std_logic;

	signal multi_reset:std_logic;

	signal calculation_in_progress_flag: std_logic;
	signal store_results_clk: std_logic;
	signal run_multiplic_num_selection_clk: std_logic;
	signal run_store_clk : std_logic;
	signal pilot_sinc_real_shift_30:integer;
	signal pilot_sinc_imag_shift_30:integer;
	signal pilot_sinc_real_shift_29:integer;
	signal pilot_sinc_imag_shift_29:integer;
	signal pilot_sinc_real_shift_28:integer;
	signal pilot_sinc_imag_shift_28:integer;
	signal pilot_sinc_real_shift_27:integer;
	signal pilot_sinc_imag_shift_27:integer;
	signal pilot_sinc_real_shift_26:integer;
	signal pilot_sinc_imag_shift_26:integer;
	signal pilot_sinc_real_shift_25:integer;
	signal pilot_sinc_imag_shift_25:integer;
	signal pilot_sinc_real_shift_24:integer;
	signal pilot_sinc_imag_shift_24:integer;
	signal pilot_sinc_real_shift_23:integer;
	signal pilot_sinc_imag_shift_23:integer;
	signal pilot_sinc_real_shift_22:integer;
	signal pilot_sinc_imag_shift_22:integer;
	signal pilot_sinc_real_shift_21:integer;
	signal pilot_sinc_imag_shift_21:integer;
	signal pilot_sinc_real_shift_20:integer;
	signal pilot_sinc_imag_shift_20:integer;
	signal pilot_sinc_real_shift_19:integer;
	signal pilot_sinc_imag_shift_19:integer;
	signal pilot_sinc_real_shift_18:integer;
	signal pilot_sinc_imag_shift_18:integer;
	signal pilot_sinc_real_shift_17:integer;
	signal pilot_sinc_imag_shift_17:integer;
	signal pilot_sinc_real_shift_16:integer;
	signal pilot_sinc_imag_shift_16:integer;
	signal pilot_sinc_real_shift_15:integer;
	signal pilot_sinc_imag_shift_15:integer;
	signal pilot_sinc_real_shift_14:integer;
	signal pilot_sinc_imag_shift_14:integer;
	signal pilot_sinc_real_shift_13:integer;
	signal pilot_sinc_imag_shift_13:integer;
	signal pilot_sinc_real_shift_12:integer;
	signal pilot_sinc_imag_shift_12:integer;
	signal pilot_sinc_real_shift_11:integer;
	signal pilot_sinc_imag_shift_11:integer;
	signal pilot_sinc_real_shift_10:integer;
	signal pilot_sinc_imag_shift_10:integer;
	signal pilot_sinc_real_shift_9:integer;
	signal pilot_sinc_imag_shift_9:integer;
	signal pilot_sinc_real_shift_8:integer;
	signal pilot_sinc_imag_shift_8:integer;
	signal pilot_sinc_real_shift_7:integer;
	signal pilot_sinc_imag_shift_7:integer;
	signal pilot_sinc_real_shift_6:integer;
	signal pilot_sinc_imag_shift_6:integer;
	signal pilot_sinc_real_shift_5:integer;
	signal pilot_sinc_imag_shift_5:integer;
	signal pilot_sinc_real_shift_4:integer;
	signal pilot_sinc_imag_shift_4:integer;
	signal pilot_sinc_real_shift_3:integer;
	signal pilot_sinc_imag_shift_3:integer;
	signal pilot_sinc_real_shift_2:integer;
	signal pilot_sinc_imag_shift_2:integer;
	signal pilot_sinc_real_shift_1:integer;
	signal pilot_sinc_imag_shift_1:integer;

	signal unused_signal_trash:std_logic;
begin
	multiplic_nums_selection: multiplication_num_selector PORT MAP(
		symbol_clock_delayed,
		run_multiplic_num_selection_clk,
		RESET,
		pilot_real_1,
		pilot_imag_1,
		pilot_real_2,
		pilot_imag_2,
		pilot_real_3,
		pilot_imag_3,
		pilot_real_4,
		pilot_imag_4,
		pilot_real_5,
		pilot_imag_5,
		pilot_real_6,
		pilot_imag_6,
		pilot_real_7,
		pilot_imag_7,
		pilot_real_8,
		pilot_imag_8,
		pilot_real_9,
		pilot_imag_9,
		pilot_real_10,
		pilot_imag_10,
		pilot_real_11,
		pilot_imag_11,
		pilot_real_12,
		pilot_imag_12,
		pilot_real_13,
		pilot_imag_13,
		pilot_real_14,
		pilot_imag_14,
		pilot_real_15,
		pilot_imag_15,
		pilot_real_16,
		pilot_imag_16,
		pilot_real_17,
		pilot_imag_17,
		pilot_real_18,
		pilot_imag_18,
		pilot_real_19,
		pilot_imag_19,
		pilot_real_20,
		pilot_imag_20,
		pilot_real_21,
		pilot_imag_21,
		pilot_real_22,
		pilot_imag_22,
		pilot_real_23,
		pilot_imag_23,
		pilot_real_24,
		pilot_imag_24,
		pilot_real_25,
		pilot_imag_25,
		pilot_real_26,
		pilot_imag_26,
		pilot_real_27,
		pilot_imag_27,
		pilot_real_28,
		pilot_imag_28,
		pilot_real_29,
		pilot_imag_29,
		pilot_real_30,
		pilot_imag_30,
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
		selected_real,
		selected_imag,
		selected_scale_factor
	);

	


	hi_speed_not_clk <= not(H_S_CLK);
	
	symbol_clk_sync_a: simple_delay PORT MAP(
				CLK,
				RESET,
				H_S_CLK,
				symbol_clock_del);
	symbol_clk_sync: simple_delay PORT MAP(
				symbol_clock_del,
				RESET,
				H_S_CLK,
				symbol_clock_delayed);

	multiplication_sync: pulse_generator PORT MAP(
			symbol_clock_delayed,
			hi_speed_not_clk,
			RESET,
			sync_rst
	);

	multi_reset <= RESET or sync_rst;
	
	multiplication_index_generation: count_to PORT MAP(
			H_S_CLK, multi_reset,
			45 - 1, --more than 35
			open,
			multiplication_index
			);

	calculation_in_progress_flag <= '1' when (multiplication_index >= 0 and  multiplication_index < 30) else '0';


	scaling: simple_scaler PORT MAP(
			precision,
			selected_real,
			selected_imag,
			selected_scale_factor,
			scaled_real,
			scaled_imag
			);

	store_results_clk <= hi_speed_not_clk and not(run_store_clk);
	run_multiplic_num_selection_clk <= H_S_CLK and calculation_in_progress_flag;
	store_clk <= not(calculation_in_progress_flag);
	
	store_clk_sync: simple_delay PORT MAP(
				store_clk,
				RESET,
				H_S_CLK,
				run_store_clk);

	calc_ready_sync: simple_delay PORT MAP(
				run_store_clk,
				RESET,
				H_S_CLK,
				calculation_ready);

				
	scaled_pilots: parallel_access_buffer PORT MAP(
				scaled_real,
				scaled_imag,
				reset,
				store_results_clk,
				pilot_sinc_real_30,
				pilot_sinc_imag_30,
				pilot_sinc_real_29,
				pilot_sinc_imag_29,
				pilot_sinc_real_28,
				pilot_sinc_imag_28,
				pilot_sinc_real_27,
				pilot_sinc_imag_27,
				pilot_sinc_real_26,
				pilot_sinc_imag_26,
				pilot_sinc_real_25,
				pilot_sinc_imag_25,
				pilot_sinc_real_24,
				pilot_sinc_imag_24,
				pilot_sinc_real_23,
				pilot_sinc_imag_23,
				pilot_sinc_real_22,
				pilot_sinc_imag_22,
				pilot_sinc_real_21,
				pilot_sinc_imag_21,
				pilot_sinc_real_20,
				pilot_sinc_imag_20,
				pilot_sinc_real_19,
				pilot_sinc_imag_19,
				pilot_sinc_real_18,
				pilot_sinc_imag_18,
				pilot_sinc_real_17,
				pilot_sinc_imag_17,
				pilot_sinc_real_16,
				pilot_sinc_imag_16,
				pilot_sinc_real_15,
				pilot_sinc_imag_15,
				pilot_sinc_real_14,
				pilot_sinc_imag_14,
				pilot_sinc_real_13,
				pilot_sinc_imag_13,
				pilot_sinc_real_12,
				pilot_sinc_imag_12,
				pilot_sinc_real_11,
				pilot_sinc_imag_11,
				pilot_sinc_real_10,
				pilot_sinc_imag_10,
				pilot_sinc_real_9,
				pilot_sinc_imag_9,
				pilot_sinc_real_8,
				pilot_sinc_imag_8,
				pilot_sinc_real_7,
				pilot_sinc_imag_7,
				pilot_sinc_real_6,
				pilot_sinc_imag_6,
				pilot_sinc_real_5,
				pilot_sinc_imag_5,
				pilot_sinc_real_4,
				pilot_sinc_imag_4,
				pilot_sinc_real_3,
				pilot_sinc_imag_3,
				pilot_sinc_real_2,
				pilot_sinc_imag_2,
				pilot_sinc_real_1,
				pilot_sinc_imag_1
				);

	
END ARCHITECTURE;
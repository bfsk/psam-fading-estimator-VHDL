LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY multiplier IS
	PORT(
		H_S_CLK: in std_logic;
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
		pilot_sinc_imag_30: out integer
		);
END multiplier;

ARCHITECTURE arch_multiplier OF multiplier IS

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

	signal selected_real: integer := 0;
	signal selected_imag: integer := 0;
	signal selected_scale_factor: integer := 0;

	signal multiplication_index: integer := 0;

	signal scaled_real: integer := 0;
	signal scaled_imag: integer := 0;

	--signal hi_speed_clk: std_logic;
	signal interval_clk: std_logic;
	signal hi_speed_not_clk: std_logic;
	signal reset: std_logic := '0';
	

begin
	hi_speed_not_clk <= not(H_S_CLK);
	--selecting data
	process(multiplication_index,
	sinc_m14,
	pilot_real_1,
	pilot_imag_1
	) is
		begin
		case multiplication_index is
		when 0 =>
			selected_real <= pilot_real_1;
			selected_imag <= pilot_imag_1;
			selected_scale_factor <= sinc_m14;
		when 1 =>
			selected_real <= pilot_real_2;
			selected_imag <= pilot_imag_2;
			selected_scale_factor <= sinc_m13;
		when 2 => 
			selected_real <= pilot_real_3;
			selected_imag <= pilot_imag_3;
			selected_scale_factor <= sinc_m12;
		when 3 => 
			selected_real <= pilot_real_4;
			selected_imag <= pilot_imag_4;
			selected_scale_factor <= sinc_m11;
		when 4 => 
			selected_real <= pilot_real_5;
			selected_imag <= pilot_imag_5;
			selected_scale_factor <= sinc_m10;
		when 5 => 
			selected_real <= pilot_real_6;
			selected_imag <= pilot_imag_6;
			selected_scale_factor <= sinc_m9;
		when 6 => 
			selected_real <= pilot_real_7;
			selected_imag <= pilot_imag_7;
			selected_scale_factor <= sinc_m8;
		when 7 => 
			selected_real <= pilot_real_8;
			selected_imag <= pilot_imag_8;
			selected_scale_factor <= sinc_m7;
		when 8 => 
			selected_real <= pilot_real_9;
			selected_imag <= pilot_imag_9;
			selected_scale_factor <= sinc_m6;
		when 9 => 
			selected_real <= pilot_real_10;
			selected_imag <= pilot_imag_10;
			selected_scale_factor <= sinc_m5;
		when 10 => 
			selected_real <= pilot_real_11;
			selected_imag <= pilot_imag_11;
			selected_scale_factor <= sinc_m4;
		when 11 => 
			selected_real <= pilot_real_12;
			selected_imag <= pilot_imag_12;
			selected_scale_factor <= sinc_m3;
		when 12 => 
			selected_real <= pilot_real_13;
			selected_imag <= pilot_imag_13;
			selected_scale_factor <= sinc_m2;
		when 13 => 
			selected_real <= pilot_real_14;
			selected_imag <= pilot_imag_14;
			selected_scale_factor <= sinc_m1;
		when 14 => 
			selected_real <= pilot_real_15;
			selected_imag <= pilot_imag_15;
			selected_scale_factor <= sinc_0;
		when 15 => 
			selected_real <= pilot_real_16;
			selected_imag <= pilot_imag_16;
			selected_scale_factor <= sinc_1;
		when 16 => 
			selected_real <= pilot_real_17;
			selected_imag <= pilot_imag_17;
			selected_scale_factor <= sinc_2;
		when 17 => 
			selected_real <= pilot_real_18;
			selected_imag <= pilot_imag_18;
			selected_scale_factor <= sinc_3;
		when 18 => 
			selected_real <= pilot_real_19;
			selected_imag <= pilot_imag_19;
			selected_scale_factor <= sinc_4;
		when 19 => 
			selected_real <= pilot_real_20;
			selected_imag <= pilot_imag_20;
			selected_scale_factor <= sinc_5;
		when 20 => 
			selected_real <= pilot_real_21;
			selected_imag <= pilot_imag_21;
			selected_scale_factor <= sinc_6;
		when 21 => 
			selected_real <= pilot_real_22;
			selected_imag <= pilot_imag_22;
			selected_scale_factor <= sinc_7;
		when 22 => 
			selected_real <= pilot_real_23;
			selected_imag <= pilot_imag_23;
			selected_scale_factor <= sinc_8;
		when 23 => 
			selected_real <= pilot_real_24;
			selected_imag <= pilot_imag_24;
			selected_scale_factor <= sinc_9;
		when 24 => 
			selected_real <= pilot_real_25;
			selected_imag <= pilot_imag_25;
			selected_scale_factor <= sinc_10;
		when 25 => 
			selected_real <= pilot_real_26;
			selected_imag <= pilot_imag_26;
			selected_scale_factor <= sinc_11;
		when 26 => 
			selected_real <= pilot_real_27;
			selected_imag <= pilot_imag_27;
			selected_scale_factor <= sinc_12;
		when 27 => 
			selected_real <= pilot_real_28;
			selected_imag <= pilot_imag_28;
			selected_scale_factor <= sinc_13;
		when 28 => 
			selected_real <= pilot_real_29;
			selected_imag <= pilot_imag_29;
			selected_scale_factor <= sinc_14;
		when others => -- 29 and others
			selected_real <= pilot_real_30;
			selected_imag <= pilot_imag_30;
			selected_scale_factor <= sinc_15;
		end case;
	end process;

	counting: count_to PORT MAP(
			hi_speed_not_clk, reset,
			30 - 1,
			interval_clk,
			multiplication_index
			);

	scaling: simple_scaler PORT MAP(
			precision,
			selected_real,
			selected_imag,
			selected_scale_factor,
			scaled_real,
			scaled_imag
			);

	scaled_pilots: parallel_access_buffer PORT MAP(
				scaled_real,
				scaled_imag,
				reset,
				hi_speed_not_clk,
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
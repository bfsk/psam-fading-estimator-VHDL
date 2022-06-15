LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY test_synt IS
	PORT(
		CLK: in std_logic;
		H_S_CLK: in std_logic;
		RESET: in std_logic;
        selected_real_out: out integer;
        selected_imag_out: out integer;
        selected_sinc_out: out integer
		);
END test_synt;

ARCHITECTURE arch_test_synt OF test_synt IS
    COMPONENT PISO_shift_register IS
    PORT(
        CLK: in std_logic;
        RESET: in std_logic;
        parallel_load: in std_logic;
        data_1: in integer;
        data_2: in integer;
        data_3: in integer;
        data_4: in integer;
        data_5: in integer;
        data_6: in integer;
        data_7: in integer;
        data_8: in integer;
        data_9: in integer;
        data_10: in integer;
        data_11: in integer;
        data_12: in integer;
        data_13: in integer;
        data_14: in integer;
        data_15: in integer;
        data_16: in integer;
        data_17: in integer;
        data_18: in integer;
        data_19: in integer;
        data_20: in integer;
        data_21: in integer;
        data_22: in integer;
        data_23: in integer;
        data_24: in integer;
        data_25: in integer;
        data_26: in integer;
        data_27: in integer;
        data_28: in integer;
        data_29: in integer;
        data_30: in integer;
        serial_out: out integer
        );
    END COMPONENT;
	
	COMPONENT pulse_generator is
	port (
    	pulse_in: in std_logic;
		clk,reset: in std_logic;
		pulse_out: out std_logic
		);
	end COMPONENT;

        signal load_new_data: std_logic;
        signal h_s_not_clk: std_logic;
        signal sinc_m14 : integer;
        signal sinc_m13 : integer;
        signal sinc_m12 : integer;
        signal sinc_m11 : integer;
        signal sinc_m10 : integer;
        signal sinc_m9 : integer;
        signal sinc_m8 : integer;
        signal sinc_m7 : integer;
        signal sinc_m6 : integer;
        signal sinc_m5 : integer;
        signal sinc_m4 : integer;
        signal sinc_m3 : integer;
        signal sinc_m2 : integer;
        signal sinc_m1 : integer;
        signal sinc_0 : integer;
        signal sinc_1 : integer;
        signal sinc_2 : integer;
        signal sinc_3 : integer;
        signal sinc_4 : integer;
        signal sinc_5 : integer;
        signal sinc_6 : integer;
        signal sinc_7 : integer;
        signal sinc_8 : integer;
        signal sinc_9 : integer;
        signal sinc_10 : integer;
        signal sinc_11 : integer;
        signal sinc_12 : integer;
        signal sinc_13 : integer;
        signal sinc_14 : integer;
        signal sinc_15 : integer;

begin
    h_s_not_clk <= not(H_S_CLK);
	parallel_load_signal_gen: pulse_generator PORT MAP (
            CLK,
            h_s_not_clk,RESET,
            load_new_data
            );


    sinc_coeffs: PISO_shift_register PORT MAP(
            h_s_not_clk,
            RESET,
            load_new_data,
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
            selected_sinc_out
            );
END ARCHITECTURE;
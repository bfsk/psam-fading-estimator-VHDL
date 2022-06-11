LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY parallel_access_buffer IS
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
END parallel_access_buffer;

ARCHITECTURE arch_parallel_access_buffer OF parallel_access_buffer IS
	
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

    constant number_of_symbols : integer := 30;

    type int_array_a is array(0 to number_of_symbols - 1) of integer;
	signal shift_outputs_real : int_array_a;
	signal shift_outputs_imag : int_array_a;

begin
    b: for i in 0 to number_of_symbols - 1 generate
		xb: if i /= 0 generate
			aab: complex_delay PORT MAP(
				shift_outputs_real(i - 1),
				shift_outputs_imag(i - 1),
				RESET,
				CLK,
				shift_outputs_real(i),
				shift_outputs_imag(i)
				);		
		end generate xb;
	yb: if i = 0 generate
			aab: complex_delay PORT MAP(
				real_in,
				imag_in,
				RESET,
				CLK,
				shift_outputs_real(i),
				shift_outputs_imag(i)
				);	
		end generate yb;	
	end generate b;

    pilot_real_1 <= shift_outputs_real(0);
    pilot_imag_1 <= shift_outputs_imag(0);
    pilot_real_2 <= shift_outputs_real(1);
    pilot_imag_2 <= shift_outputs_imag(1);
    pilot_real_3 <= shift_outputs_real(2);
    pilot_imag_3 <= shift_outputs_imag(2);
    pilot_real_4 <= shift_outputs_real(3);
    pilot_imag_4 <= shift_outputs_imag(3);
    pilot_real_5 <= shift_outputs_real(4);
    pilot_imag_5 <= shift_outputs_imag(4);
    pilot_real_6 <= shift_outputs_real(5);
    pilot_imag_6 <= shift_outputs_imag(5);
    pilot_real_7 <= shift_outputs_real(6);
    pilot_imag_7 <= shift_outputs_imag(6);
    pilot_real_8 <= shift_outputs_real(7);
    pilot_imag_8 <= shift_outputs_imag(7);
    pilot_real_9 <= shift_outputs_real(8);
    pilot_imag_9 <= shift_outputs_imag(8);
    pilot_real_10 <= shift_outputs_real(9);
    pilot_imag_10 <= shift_outputs_imag(9);
    pilot_real_11 <= shift_outputs_real(10);
    pilot_imag_11 <= shift_outputs_imag(10);
    pilot_real_12 <= shift_outputs_real(11);
    pilot_imag_12 <= shift_outputs_imag(11);
    pilot_real_13 <= shift_outputs_real(12);
    pilot_imag_13 <= shift_outputs_imag(12);
    pilot_real_14 <= shift_outputs_real(13);
    pilot_imag_14 <= shift_outputs_imag(13);
    pilot_real_15 <= shift_outputs_real(14);
    pilot_imag_15 <= shift_outputs_imag(14);
    pilot_real_16 <= shift_outputs_real(15);
    pilot_imag_16 <= shift_outputs_imag(15);
    pilot_real_17 <= shift_outputs_real(16);
    pilot_imag_17 <= shift_outputs_imag(16);
    pilot_real_18 <= shift_outputs_real(17);
    pilot_imag_18 <= shift_outputs_imag(17);
    pilot_real_19 <= shift_outputs_real(18);
    pilot_imag_19 <= shift_outputs_imag(18);
    pilot_real_20 <= shift_outputs_real(19);
    pilot_imag_20 <= shift_outputs_imag(19);
    pilot_real_21 <= shift_outputs_real(20);
    pilot_imag_21 <= shift_outputs_imag(20);
    pilot_real_22 <= shift_outputs_real(21);
    pilot_imag_22 <= shift_outputs_imag(21);
    pilot_real_23 <= shift_outputs_real(22);
    pilot_imag_23 <= shift_outputs_imag(22);
    pilot_real_24 <= shift_outputs_real(23);
    pilot_imag_24 <= shift_outputs_imag(23);
    pilot_real_25 <= shift_outputs_real(24);
    pilot_imag_25 <= shift_outputs_imag(24);
    pilot_real_26 <= shift_outputs_real(25);
    pilot_imag_26 <= shift_outputs_imag(25);
    pilot_real_27 <= shift_outputs_real(26);
    pilot_imag_27 <= shift_outputs_imag(26);
    pilot_real_28 <= shift_outputs_real(27);
    pilot_imag_28 <= shift_outputs_imag(27);
    pilot_real_29 <= shift_outputs_real(28);
    pilot_imag_29 <= shift_outputs_imag(28);
    pilot_real_30 <= shift_outputs_real(29);
    pilot_imag_30 <= shift_outputs_imag(29);



END ARCHITECTURE;
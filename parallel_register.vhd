LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY parallel_register IS
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
END parallel_register; 

ARCHITECTURE arch_parallel_register OF parallel_register IS
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
begin

    reg1: complex_delay PORT MAP(
                real_in_1,
				imag_in_1,
				RESET,
				CLK,
				real_out_1,
				imag_out_1);
    reg2: complex_delay PORT MAP(
                real_in_2,
                imag_in_2,
                RESET,
                CLK,
                real_out_2,
                imag_out_2);
    reg3: complex_delay PORT MAP(
                real_in_3,
                imag_in_3,
                RESET,
                CLK,
                real_out_3,
                imag_out_3);
    reg4: complex_delay PORT MAP(
                real_in_4,
                imag_in_4,
                RESET,
                CLK,
                real_out_4,
                imag_out_4);
    reg5: complex_delay PORT MAP(
                real_in_5,
                imag_in_5,
                RESET,
                CLK,
                real_out_5,
                imag_out_5);
    reg6: complex_delay PORT MAP(
                real_in_6,
                imag_in_6,
                RESET,
                CLK,
                real_out_6,
                imag_out_6);
    reg7: complex_delay PORT MAP(
                real_in_7,
                imag_in_7,
                RESET,
                CLK,
                real_out_7,
                imag_out_7);
    reg8: complex_delay PORT MAP(
                real_in_8,
                imag_in_8,
                RESET,
                CLK,
                real_out_8,
                imag_out_8);
    reg9: complex_delay PORT MAP(
                real_in_9,
                imag_in_9,
                RESET,
                CLK,
                real_out_9,
                imag_out_9);
    reg10: complex_delay PORT MAP(
                real_in_10,
                imag_in_10,
                RESET,
                CLK,
                real_out_10,
                imag_out_10);
    reg11: complex_delay PORT MAP(
                real_in_11,
                imag_in_11,
                RESET,
                CLK,
                real_out_11,
                imag_out_11);
    reg12: complex_delay PORT MAP(
                real_in_12,
                imag_in_12,
                RESET,
                CLK,
                real_out_12,
                imag_out_12);
    reg13: complex_delay PORT MAP(
                real_in_13,
                imag_in_13,
                RESET,
                CLK,
                real_out_13,
                imag_out_13);
    reg14: complex_delay PORT MAP(
                real_in_14,
                imag_in_14,
                RESET,
                CLK,
                real_out_14,
                imag_out_14);
    reg15: complex_delay PORT MAP(
                real_in_15,
                imag_in_15,
                RESET,
                CLK,
                real_out_15,
                imag_out_15);
    reg16: complex_delay PORT MAP(
                real_in_16,
                imag_in_16,
                RESET,
                CLK,
                real_out_16,
                imag_out_16);
    reg17: complex_delay PORT MAP(
                real_in_17,
                imag_in_17,
                RESET,
                CLK,
                real_out_17,
                imag_out_17);
    reg18: complex_delay PORT MAP(
                real_in_18,
                imag_in_18,
                RESET,
                CLK,
                real_out_18,
                imag_out_18);
    reg19: complex_delay PORT MAP(
                real_in_19,
                imag_in_19,
                RESET,
                CLK,
                real_out_19,
                imag_out_19);
    reg20: complex_delay PORT MAP(
                real_in_20,
                imag_in_20,
                RESET,
                CLK,
                real_out_20,
                imag_out_20);
    reg21: complex_delay PORT MAP(
                real_in_21,
                imag_in_21,
                RESET,
                CLK,
                real_out_21,
                imag_out_21);
    reg22: complex_delay PORT MAP(
                real_in_22,
                imag_in_22,
                RESET,
                CLK,
                real_out_22,
                imag_out_22);
    reg23: complex_delay PORT MAP(
                real_in_23,
                imag_in_23,
                RESET,
                CLK,
                real_out_23,
                imag_out_23);
    reg24: complex_delay PORT MAP(
                real_in_24,
                imag_in_24,
                RESET,
                CLK,
                real_out_24,
                imag_out_24);
    reg25: complex_delay PORT MAP(
                real_in_25,
                imag_in_25,
                RESET,
                CLK,
                real_out_25,
                imag_out_25);
    reg26: complex_delay PORT MAP(
                real_in_26,
                imag_in_26,
                RESET,
                CLK,
                real_out_26,
                imag_out_26);
    reg27: complex_delay PORT MAP(
                real_in_27,
                imag_in_27,
                RESET,
                CLK,
                real_out_27,
                imag_out_27);
    reg28: complex_delay PORT MAP(
                real_in_28,
                imag_in_28,
                RESET,
                CLK,
                real_out_28,
                imag_out_28);
    reg29: complex_delay PORT MAP(
                real_in_29,
                imag_in_29,
                RESET,
                CLK,
                real_out_29,
                imag_out_29);
    reg30: complex_delay PORT MAP(
                real_in_30,
                imag_in_30,
                RESET,
                CLK,
                real_out_30,
                imag_out_30);
                    
END ARCHITECTURE;

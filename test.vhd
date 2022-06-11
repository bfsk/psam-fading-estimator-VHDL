LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY test IS
	PORT(
		CLK: IN STD_LOGIC;
		corrected_real_data_out: OUT integer;
		corrected_imag_data_out: OUT integer;
		pilot_clk: OUT STD_LOGIC;
		count_symbol: OUT integer;
		count_symbol_all: OUT integer
		);
END test;

ARCHITECTURE arch_test OF test IS
	
	COMPONENT PSAM_Altera IS
	PORT(
		real_data_in: IN integer;
		imag_data_in: IN integer;
		real_in_pilot_constant: IN integer;
		imag_in_pilot_constant: IN integer;
		RESET: IN STD_LOGIC;
		RESET_manual: IN STD_LOGIC;
		CLK_HIL: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		H_S_CLK: in std_logic;
		corrected_real_data_out: OUT integer;
		corrected_imag_data_out: OUT integer;
		pilot_clk: OUT STD_LOGIC;
		count_symbol: OUT integer
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

	COMPONENT clock_divider is
		port ( 
			count_to: in integer;
			clk,reset: in std_logic;
			clock_out: out std_logic
			);
	end COMPONENT;
	
	signal ccc: std_logic;
	signal notclk: std_logic;

	signal a1: std_logic;
	signal a2: std_logic;
	signal a3: std_logic;
	signal a4: integer;

	signal symbol_clock: std_logic;
	signal symbol_clock_inverted: std_logic;
begin

	a: PSAM_Altera port map(
		1000000, --real symbol
		1000000, --imag symbol
		500000, --real part of inverse pilot
		-500000, --imag part of inverse pilot
		'0', --reset
		'0', --reset manual
		'0', --CLK HIL
		symbol_clock_inverted, --symbol clock
		CLK, --High speed clock
		corrected_real_data_out,
		corrected_imag_data_out,
		pilot_clk,
		count_symbol
	 );

notclk<=not(CLK);
p: count_to port map(
	  notclk,'0', 
	  1500000 - 1,
	  ccc,
	  count_symbol_all
	 );

o: clock_divider port map(
		15 - 1,
		notclk, '0',
		symbol_clock
	   );
	symbol_clock_inverted <= not(symbol_clock);
END ARCHITECTURE;
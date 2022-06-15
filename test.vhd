LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY test IS
	PORT(
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		real_data_to_matlab_out: OUT integer;
		imag_data_to_matlab_out: OUT integer;
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
		RESET: IN STD_LOGIC;
		RESET_manual: IN STD_LOGIC;
		CLK_HIL: IN STD_LOGIC;
		H_S_CLK: in std_logic;
		corrected_real_data_out: OUT integer;
		corrected_imag_data_out: OUT integer;
		count_symbol: OUT integer;
		symbol_clock_out : out std_logic
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
	

	
	signal notclk: std_logic;


	signal matlab_symbol_clock: std_logic;
	signal matlab_symbol_clock_inverted: std_logic;
	signal h_s_not_clk: std_logic;
	signal matlab_symbol: integer;
	signal generated_symbols_from_matlab: integer;
begin

	PSAM: PSAM_Altera port map(
		generated_symbols_from_matlab,--generated_symbols_from_matlab,--1000000, --real symbol
		generated_symbols_from_matlab,--generated_symbols_from_matlab, --1000000, --imag symbol
		RESET, --reset
		RESET, --reset manual
		'0', --CLK HIL
		CLK, --High speed clock
		real_data_to_matlab_out,
		imag_data_to_matlab_out,
		open,
		open
	 );

	notclk<=not(CLK);
	--p: count_to port map(
	--	notclk,'0', 
	--o	1500000 - 1,
	--	open,
	--	count_symbol_all
	--	);

	h_s_not_clk <= not(CLK);
	matlb_symbol_clock_generation_test: clock_divider port map(
		21 - 1,
		CLK, RESET,
		matlab_symbol_clock
	   );

	matlab_symbol_clock_inverted <= not(matlab_symbol_clock);
	generating_matlab_symbols: count_to port map(
		matlab_symbol_clock_inverted,RESET, 
		1500000 - 1,
		open,
		matlab_symbol
		);

	generated_symbols_from_matlab <= (matlab_symbol + 2)*1000000; --+2 because count_to starts from -1 when reset

END ARCHITECTURE;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY PSAM_Altera IS
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
END PSAM_Altera;

ARCHITECTURE arch_PSAM_Altera OF PSAM_Altera IS
	
	COMPONENT full_complex_divider IS
	PORT(
		precision: in integer;
		real_data: in integer;
		imag_data: in integer;
		real_estim: in integer;
		imag_estim: in integer;
		corrected_real: out integer;
		corrected_imag: out integer
		);
	END COMPONENT;
	COMPONENT estimator IS
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
		pilot_CLK: OUT STD_LOGIC;
		symbol_index: OUT integer
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


	signal real_data : integer := 0;
	signal imag_data : integer := 0;
	signal real_estim_conn : integer := 0;
	signal imag_estim_conn : integer := 0;
	signal real_corrected_conn : integer := 0;
	signal imag_corrected_conn : integer := 0;
	signal symbol_index : integer := 0;
	signal not_clk: std_logic;
	signal not_used_clk: std_logic;

	signal precision : integer := 1000000;

	signal not_used_clk1: std_logic;
	signal symbol_index_real : integer := 0;
begin

	a: estimator port map(
		precision,
		real_data_in,
		imag_data_in,
		real_in_pilot_constant,
		imag_in_pilot_constant,
		'0', 
		CLK,
		H_S_CLK,
		real_estim_conn,
		imag_estim_conn,
		real_data,
		imag_data,
		pilot_CLK
	 );

	data_correction: full_complex_divider PORT MAP(
		precision,
		real_data,
		imag_data,
		real_estim_conn,
		imag_estim_conn,
		real_corrected_conn,
		imag_corrected_conn
		);	

	not_clk <= not(CLK);
	p: count_to port map(
	  	not_clk,RESET, 
	  	15 - 1,
	  	not_used_clk,
	  	symbol_index
	 );
count_symbol <= symbol_index;


	delete_me: count_to port map(
	  	not_clk,RESET, 
	  	15000000 - 1,
	  	not_used_clk1,
	  	symbol_index_real
	 );


corrected_real_data_out <= 7000000 when symbol_index = 0 else real_corrected_conn;
corrected_imag_data_out <= 7000000 when symbol_index = 0 else imag_corrected_conn;
END ARCHITECTURE;

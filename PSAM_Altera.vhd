LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY PSAM_Altera IS
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
		pilot_clk: in std_logic;
		H_S_CLK: in std_logic;
		symbol_index: in integer;
		real_estim_out: OUT integer;
		imag_estim_out: OUT integer
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

	COMPONENT simple_delay IS
	PORT(
		signal_in: IN STD_LOGIC;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		signal_out: OUT STD_LOGIC
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

	signal real_data : integer;
	signal imag_data : integer;
	signal real_estim_conn : integer;
	signal imag_estim_conn : integer;
	signal real_corrected_conn_pre_sync : integer;
	signal imag_corrected_conn_pre_sync : integer;
	signal real_corrected_conn : integer;
	signal imag_corrected_conn : integer;
	signal symbol_index : integer;
	signal symbol_index_low : integer;
	signal not_clk: std_logic;
	
	signal not_used_clk: std_logic;

	signal symbol_clock: std_logic;
	signal symbol_clock_pre_sync: std_logic;
	
	signal pilot_clk_generated: std_logic;
	signal pilot_clk_pre_sync: std_logic;

	signal corrected_ready: std_logic;
	signal corrected_ready_sync: std_logic;
	signal not_used_clk1: std_logic;
	signal symbol_index_real : integer;
	signal symbol_index_r : integer;

	constant precision : integer := 1000000;
	constant inversed_pilot_real : integer := 500000;
	constant inversed_pilot_imag : integer := -500000;
	--signal h_s_not_clk: std_logic;
	signal sc_conn: std_logic;

begin

	--h_s_not_clk <= not(H_S_CLK);
	symbol_clock_generation: clock_divider port map(
		20 - 1,
		H_S_CLK, RESET_manual,
		sc_conn
	   );

	symbol_clock_sync: simple_delay PORT MAP(
				sc_conn,
				RESET_manual,
				H_S_CLK,
				symbol_clock
		);


	symbol_clock_out <= symbol_clock;


	pilot_clock_generation: clock_divider port map(
		300 - 1,
		H_S_CLK, RESET_manual,
		pilot_clk_pre_sync
	   );

	   pilotclk: simple_delay PORT MAP(
		pilot_clk_pre_sync,
		RESET_manual,
		H_S_CLK,
		pilot_clk_generated
);
	data_processing: estimator port map(
		precision,
		real_data_in,
		imag_data_in,
		inversed_pilot_real,
		inversed_pilot_imag,
		RESET_manual, 
		symbol_clock,--CLK,
		pilot_clk_generated, --pilot clk
		H_S_CLK,
		symbol_index,
		real_estim_conn,
		imag_estim_conn
	 );

	not_clk <= not(symbol_clock);


	generating_symbol_index: count_to port map(
		symbol_clock,RESET_manual, 
	  	15 - 1,
	  	open,
	  	symbol_index_low
	 );
	 symbol_index <= symbol_index_low + 1;
count_symbol <= symbol_index;


	delete_me: count_to port map(
		symbol_clock,RESET_manual, 
	  	15000000 - 1,
	  	open,
	  	symbol_index_r
	 );
	 symbol_index_real<= symbol_index_r + 1;

corrected_real_data_out <= 7123456 when symbol_index = 0 else real_estim_conn;
corrected_imag_data_out <= 7123456 when symbol_index = 0 else imag_estim_conn;
END ARCHITECTURE;

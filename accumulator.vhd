library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity accumulator is
port ( 
    data_in: in integer;
	sum_reset : in std_logic;
	clk,reset: in std_logic;
	data_out: out integer
	);
end accumulator;
  
architecture bhv of accumulator is
	COMPONENT pulse_generator is
		port (
			pulse_in: in std_logic;
			clk,reset: in std_logic;
			pulse_out: out std_logic
			);
	end COMPONENT;

signal sum: integer;
signal d_out: integer;
signal reset_sum_signal : std_logic;
signal not_clk : std_logic;
begin
	not_clk <= not(clk);
	short_sum_reset_pulse: pulse_generator PORT MAP(
		sum_reset,
		not_clk,
		reset,
		reset_sum_signal
	);


process(clk, reset,reset_sum_signal)
begin
	if(reset='1' or reset_sum_signal='1' ) then
      d_out <= 0;
	elsif(clk'event and clk='1') then
       d_out <= sum;
	end if;
end process;
	sum <= data_in + d_out;
	data_out <= d_out;
end bhv;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity pulse_generator is
port (
    pulse_in: in std_logic;
	clk,reset: in std_logic;
	pulse_out: out std_logic
	);
end pulse_generator;
  
architecture bhv of pulse_generator is
  COMPONENT simple_delay IS
	PORT(
		signal_in: IN STD_LOGIC;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		signal_out: OUT STD_LOGIC
		);
	END COMPONENT;

	signal pulse_in_delayed : std_logic;
  
begin
  
	pulse_delaying: simple_delay PORT MAP(
				pulse_in,
				RESET,
				CLK,
				pulse_in_delayed);
				
	pulse_out <= pulse_in and not(pulse_in_delayed);
  
end bhv;

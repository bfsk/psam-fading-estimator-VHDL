 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY simple_delay IS
	PORT(
		signal_in: IN STD_LOGIC;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		signal_out: OUT STD_LOGIC
		);
END simple_delay;

ARCHITECTURE arch_simple_delay OF simple_delay IS
	signal signal_d: std_logic;
begin

PROCESS(CLK, RESET, signal_d)
    begin
	if(RESET='1') then 
            signal_d <= '0';
			signal_out <= '0';
	  elsif(CLK'event and CLK = '1') then
            signal_d <= signal_in; 
	  end if;  
	signal_out <= signal_d;   
    end PROCESS;
END arch_simple_delay;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity starter is
port ( 
	trigger,reset: in std_logic;
	clock_out: out std_logic
	);
end starter;
  
architecture bhv of starter is
  
  
begin
  
process(trigger,reset)
begin
	if(reset='1') then
		clock_out <= '0';
	elsif(trigger'event and trigger='1') then
		clock_out <= '1';
	end if;
end process;
end bhv;

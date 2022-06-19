library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity count_to_stop is
port ( 
	clk,reset: in std_logic;
	upper_bound: in integer;
	count_out: out integer;
    stop_flag: out std_logic
	);
end count_to_stop;
  
architecture bhv of count_to_stop is
  
signal count: integer;

begin
  
process(clk, reset, count)
begin
	if(reset='1') then
		count <= 0;
        stop_flag <= '0';
	elsif(clk'event and clk='1') then
        if (count /= upper_bound) then
		    count <= count + 1;
        else
            stop_flag <= '1';
        end if;
	end if;
	count_out <= count;
end process;
end bhv;

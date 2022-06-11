library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity count_to is
port ( 
	clk,reset: in std_logic;
	upper_bound: in integer;
	clock_out: out std_logic;
	count_out: out integer
	);
end count_to;
  
architecture bhv of count_to is
  
signal count: integer := 0;
signal pilot_count: integer := 0;
signal tmp : std_logic := '0';
  
begin
  
process(clk,reset)
begin
	if(reset='1') then
		count <= 0;
		pilot_count <= 0;
		tmp <= '0';
	elsif(clk'event and clk='1') then
		count <= count + 1;
		if (count = upper_bound) then
			count <= 0;
		end if;
	elsif(clk'event and clk='0') then
		pilot_count <= pilot_count + 1;
		if (pilot_count = upper_bound) then
			tmp <= '1';
			pilot_count <= 0;
		else
			tmp <= '0';
		end if;
	end if;
	clock_out <= tmp;
	count_out <= count;
end process;
end bhv;

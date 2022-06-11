library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity clock_divider is
    port ( 
        count_to: in integer;
        clk,reset: in std_logic;
        clock_out: out std_logic
        );
end clock_divider;
  
architecture bhv of clock_divider is
  
signal count: integer:= 0;
signal tmp : std_logic := '0';

begin
  
process(clk,reset,count_to)
begin
    if(reset='1') then
        count<=1;
        tmp<='0';
    elsif(clk'event and clk='1') then
        count <=count+1;
        if (count = count_to) then
            tmp <= NOT tmp;
            count <= 0;
        end if;
    end if;
    clock_out <= tmp;
end process;
end architecture;

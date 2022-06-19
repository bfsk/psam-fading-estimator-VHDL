library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity clock_to is
    port ( 
        clock_to: in integer;
        clk,reset: in std_logic;
        clock_out: out std_logic
        );
end clock_to;
  
architecture bhv_clock_to of clock_to is
  
signal count: integer;
signal tmp : std_logic;

begin
  
process(clk,reset,clock_to)
begin
    if(reset='1') then
        count<=0;
        tmp<='1';
    elsif(clk'event and clk='1') then
        if(count /= clock_to) then
            tmp <= clk;
            count <= count + 1;
        else
            tmp <= '0';
        end if;
    end if;
    clock_out <= tmp;
end process;
end architecture;

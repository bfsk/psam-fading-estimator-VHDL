 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY complex_delay IS
	PORT(
		real_in: IN integer;
		imag_in: IN integer;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		real_out: OUT integer;
		imag_out: OUT integer
		);
END complex_delay;

ARCHITECTURE arch_complex_delay OF complex_delay IS
	signal real_d: integer;
	signal imag_d: integer;
begin

PROCESS(CLK, RESET)
    begin
		if(RESET='1') then 
			real_out <= 0;
			imag_out <= 0;
	  elsif(CLK'event and CLK = '1') then
			real_out <= real_in; 
			imag_out <= imag_in; 
	  end if;     
    end PROCESS;
END ARCHITECTURE;

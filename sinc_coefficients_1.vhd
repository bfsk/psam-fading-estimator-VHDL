LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

ENTITY sinc_coefficients_1 IS
	PORT(
		index_of_symbol: IN std_logic_vector(3 downto 0);		  
		sinc_m14 : OUT integer
		);
END sinc_coefficients_1;

ARCHITECTURE arch_sinc_coefficients_1 OF sinc_coefficients_1 IS
begin

process(index_of_symbol) is
begin
	case index_of_symbol is
when "0001"=>
        sinc_m14 <= 4704;

when "0010"=>
        sinc_m14 <= 9160;


when "0011"=>
        sinc_m14 <= 13175;


when "0100"=>
        sinc_m14 <= 16580;


when "0101"=>
        sinc_m14 <= 19232;


when "0110"=>
        sinc_m14 <= 21022;


when "0111"=>
        sinc_m14 <= 21882;


when "1000"=>
        sinc_m14 <= 21782;
 

when "1001"=>
        sinc_m14 <= 20734;


when "1010"=>
        sinc_m14 <= 18795;


when "1011"=>
        sinc_m14 <= 16055;


when "1100"=>
        sinc_m14 <= 12641;


when "1101"=>
        sinc_m14 <= 8708;


when "1110"=>
        sinc_m14 <= 4431;
  when others=> -- 0 and others
			  sinc_m14 <= 0;
	end case;
end process;
END ARCHITECTURE;
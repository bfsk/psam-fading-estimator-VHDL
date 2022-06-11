LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY simple_scaler IS
	PORT(
	    precision: in integer;
		real_in: in integer;
		imag_in: in integer;
		scale_factor: in integer;
		real_result: out integer;
		imag_result: out integer
		);
END simple_scaler;

ARCHITECTURE arch_simple_scaler OF simple_scaler IS

begin
    real_result <= 
        to_integer(resize(to_signed(real_in, 32) * to_signed(scale_factor, 32)/precision, 32));
    
    imag_result <= 
		to_integer(resize(to_signed(imag_in, 32) * to_signed(scale_factor, 32)/precision, 32));
		
END ARCHITECTURE;
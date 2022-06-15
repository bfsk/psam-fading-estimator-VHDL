LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY full_complex_divider IS
	PORT(
	        precision: in integer;
		real_data: in integer;
		imag_data: in integer;
		real_estim: in integer;
		imag_estim: in integer;
		corrected_real: out integer;
		corrected_imag: out integer
		);
END full_complex_divider;

ARCHITECTURE arch_full_complex_divider OF full_complex_divider IS
	signal modul: signed(63 downto 0);
begin
    modul <= (to_signed(real_estim, 32) * to_signed(real_estim, 32)
	     + to_signed(imag_estim, 32) * to_signed(imag_estim, 32))/precision
             + 2; -- +2 to avoid division by zero, 2 is too small compared to modul value (around pow(10,10)

    corrected_real <= 
		to_integer(resize(
			(to_signed(real_data, 32) * to_signed(real_estim, 32)
                       + to_signed(imag_data, 32) * to_signed(imag_estim, 32))/modul
                       , 32));

    corrected_imag <= 
        to_integer(resize(
            (to_signed(imag_data, 32) * to_signed(real_estim, 32)
                        - to_signed(real_data, 32) * to_signed(imag_estim, 32))/modul
                        , 32));
END ARCHITECTURE;
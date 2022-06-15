LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY complex_divider IS
	PORT(
	        precision: in integer;
		ref_real: in integer;
		ref_imag: in integer;
		real_windowed_in: in integer;
		imag_windowed_in: in integer;
		estimate_real: out integer;
		estimate_imag: out integer
		);
END complex_divider;

ARCHITECTURE arch_complex_divider OF complex_divider IS
signal s_32_bit_vector: signed(31 downto 0);
begin
   estimate_real <= 
		to_integer(resize(to_signed(real_windowed_in, s_32_bit_vector'length) * to_signed(ref_real, s_32_bit_vector'length)/precision, s_32_bit_vector'length))
		- to_integer(resize(to_signed(imag_windowed_in, s_32_bit_vector'length) * to_signed(ref_imag, s_32_bit_vector'length)/precision, s_32_bit_vector'length));
		
	--estimate_real <= real_windowed_in * ref_real/precision - imag_windowed_in * ref_imag/precision;
	
	
	--estimate_imag <= real_windowed_in * ref_imag/precision + imag_windowed_in * ref_real/precision;
	
	estimate_imag <= 
		to_integer(resize(to_signed(real_windowed_in, s_32_bit_vector'length) * to_signed(ref_imag, s_32_bit_vector'length)/precision, s_32_bit_vector'length))
		+ to_integer(resize(to_signed(imag_windowed_in, s_32_bit_vector'length) * to_signed(ref_real, s_32_bit_vector'length)/precision, s_32_bit_vector'length));
		
END ARCHITECTURE;
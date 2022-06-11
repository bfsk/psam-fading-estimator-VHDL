LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY frame_buffer IS
	generic(shift_reg_depth : integer);
	PORT(
		real_in: IN integer;
		imag_in: IN integer;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		real_out: OUT integer;
		imag_out: OUT integer
		);
END frame_buffer;

ARCHITECTURE arch_frame_buffer OF frame_buffer IS
	
	COMPONENT complex_delay IS
	PORT(
		real_in: IN integer;
		imag_in: IN integer;
		RESET: IN STD_LOGIC;
		CLK: IN STD_LOGIC;
		real_out: OUT integer;
		imag_out: OUT integer
		);
	END COMPONENT;
	
	type int_array is array(0 to shift_reg_depth - 1) of integer;
	signal ff_outputs_real : int_array;
	signal ff_outputs_imag : int_array;
begin

		a: for i in 0 to shift_reg_depth - 1 generate
			x: if i /= 0 generate
				aa: complex_delay PORT MAP(
					ff_outputs_real(i - 1),
					ff_outputs_imag(i - 1),
					RESET,
					CLK,
					ff_outputs_real(i),
					ff_outputs_imag(i)
					);		
			end generate x;
		y: if i = 0 generate
				aa: complex_delay PORT MAP(
					real_in,
					imag_in,
					RESET,
					CLK,
					ff_outputs_real(i),
					ff_outputs_imag(i)
					);	
			end generate y;	
	end generate a;
	
	real_out <= ff_outputs_real(shift_reg_depth - 1);
	imag_out <= ff_outputs_imag(shift_reg_depth - 1);
END ARCHITECTURE;

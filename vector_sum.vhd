LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
ENTITY vector_sum IS
	PORT(
		windowed_real_1: in integer;
		windowed_imag_1: in integer;
		windowed_real_2: in integer;
		windowed_imag_2: in integer;
		windowed_real_3: in integer;
		windowed_imag_3: in integer;
		windowed_real_4: in integer;
		windowed_imag_4: in integer;
		windowed_real_5: in integer;
		windowed_imag_5: in integer;
		windowed_real_6: in integer;
		windowed_imag_6: in integer;
		windowed_real_7: in integer;
		windowed_imag_7: in integer;
		windowed_real_8: in integer;
		windowed_imag_8: in integer;
		windowed_real_9: in integer;
		windowed_imag_9: in integer;
		windowed_real_10: in integer;
		windowed_imag_10: in integer;
		windowed_real_11: in integer;
		windowed_imag_11: in integer;
		windowed_real_12: in integer;
		windowed_imag_12: in integer;
		windowed_real_13: in integer;
		windowed_imag_13: in integer;
		windowed_real_14: in integer;
		windowed_imag_14: in integer;
		windowed_real_15: in integer;
		windowed_imag_15: in integer;
		windowed_real_16: in integer;
		windowed_imag_16: in integer;
		windowed_real_17: in integer;
		windowed_imag_17: in integer;
		windowed_real_18: in integer;
		windowed_imag_18: in integer;
		windowed_real_19: in integer;
		windowed_imag_19: in integer;
		windowed_real_20: in integer;
		windowed_imag_20: in integer;
		windowed_real_21: in integer;
		windowed_imag_21: in integer;
		windowed_real_22: in integer;
		windowed_imag_22: in integer;
		windowed_real_23: in integer;
		windowed_imag_23: in integer;
		windowed_real_24: in integer;
		windowed_imag_24: in integer;
		windowed_real_25: in integer;
		windowed_imag_25: in integer;
		windowed_real_26: in integer;
		windowed_imag_26: in integer;
		windowed_real_27: in integer;
		windowed_imag_27: in integer;
		windowed_real_28: in integer;
		windowed_imag_28: in integer;
		windowed_real_29: in integer;
		windowed_imag_29: in integer;
		windowed_real_30: in integer;
		windowed_imag_30: in integer;
		real_estim_out: OUT integer;
		imag_estim_out: OUT integer
		);
END vector_sum; 

ARCHITECTURE arch_vector_sum OF vector_sum IS
begin

			real_estim_out <= windowed_real_1 + 
									windowed_real_2 +		
									windowed_real_3 +		
									windowed_real_4 +		
									windowed_real_5 +		
									windowed_real_6 +		
									windowed_real_7 +		
									windowed_real_8 +		
									windowed_real_9 +		
									windowed_real_10 +		
									windowed_real_11 +		
									windowed_real_12 +		
									windowed_real_13 +		
									windowed_real_14 +		
									windowed_real_15 +		
									windowed_real_16 +		
									windowed_real_17 +		
									windowed_real_18 +		
									windowed_real_19 +		
									windowed_real_20 +		
									windowed_real_21 +		
									windowed_real_22 +		
									windowed_real_23 +		
									windowed_real_24 +		
									windowed_real_25 +		
									windowed_real_26 +		
									windowed_real_27 +		
									windowed_real_28 +		
									windowed_real_29 +
									windowed_real_30;
									
			imag_estim_out <= windowed_imag_1 + 
									windowed_imag_2 +		
									windowed_imag_3 +		
									windowed_imag_4 +		
									windowed_imag_5 +		
									windowed_imag_6 +		
									windowed_imag_7 +		
									windowed_imag_8 +		
									windowed_imag_9 +		
									windowed_imag_10 +		
									windowed_imag_11 +		
									windowed_imag_12 +		
									windowed_imag_13 +		
									windowed_imag_14 +		
									windowed_imag_15 +		
									windowed_imag_16 +		
									windowed_imag_17 +		
									windowed_imag_18 +		
									windowed_imag_19 +		
									windowed_imag_20 +		
									windowed_imag_21 +		
									windowed_imag_22 +		
									windowed_imag_23 +		
									windowed_imag_24 +		
									windowed_imag_25 +		
									windowed_imag_26 +		
									windowed_imag_27 +		
									windowed_imag_28 +		
									windowed_imag_29 +
									windowed_imag_30;
END ARCHITECTURE;

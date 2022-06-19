library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity n_pulse_generator is
port (
    trigger: in std_logic;
    number_of_pulses: in integer;
	clk,reset: in std_logic;
	pulses_out: out std_logic;
    enable_flag: out std_logic;
    enable_flag_n: out std_logic
	);
end n_pulse_generator;
  
architecture bhv of n_pulse_generator is
	signal count : integer;
    signal not_clk: std_logic;
    signal enable_out: std_logic;
	signal last_trig_state: std_logic;
    signal triggered: std_logic;
begin
    not_clk <= not(CLK);
    process(not_clk, RESET, trigger)
    begin
        if(RESET = '1') then
            count <= 1;
            enable_out <= '0';
			last_trig_state <= '0';
            triggered <= '0';
		  elsif(not_clk'event and not_clk = '1') then
            if(count /=number_of_pulses and triggered = '1') then
                enable_out <= '1';
                count <= count + 1;
            else
                enable_out <= '0';
				triggered <= '0';	 
            end if;
				
			  if(trigger = '1' and last_trig_state = '0') then
					count <= 1;
					enable_out <= '1';
				last_trig_state <= '1';
			    triggered <= '1';
			  elsif(trigger = '0' and last_trig_state = '1') then
					last_trig_state <= '0'; --clear trigger
			  end if;
		  end if;
        pulses_out <= CLK and enable_out;
        enable_flag <= enable_out;
        enable_flag_n <= not(enable_out);
    end process;
  
end bhv;

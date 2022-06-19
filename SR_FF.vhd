library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
 
entity SR_FF is
PORT( 
    S,R,CLOCK, RESET: in std_logic;
    Q, QBAR: out std_logic
    );
end SR_FF;
 
Architecture behavioral of SR_FF is
    signal tmp: std_logic;
begin
    PROCESS(CLOCK, S, R, RESET)
    
    begin
        if(RESET = '1') then
            tmp <= '0';
        elsif(CLOCK='1' and CLOCK'EVENT) then
            if(S='1') then
                tmp <= '1';
            elsif(R='1') then
                tmp <= '0';
            elsif(S = '1' and R = '1') then
                tmp <= '0'; --forbidden
            end if;
        end if;
        Q <= tmp;
        QBAR <= not tmp;
    end PROCESS;
end behavioral;

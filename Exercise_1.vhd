----------------------------------------------------------------------------------
-- Company: UTU
-- Engineer: Joni Rajamäki
-- 
-- Create Date: 09/07/2022 12:21:22 PM
-- Module Name: Exercise_1 - Behavioral
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity tally is
    Port (
        score_a     : in std_logic_vector(2 downto 0);
        score_b     : in std_logic_vector(2 downto 0);
        winner      : out std_logic_vector(1 downto 0)
    );
    
end tally;

architecture loopy of tally is
begin
    
    process
        variable TMP_a: integer; -- Temporary variable for each players' score
        variable TMP_b: integer;
        
    begin
        TMP_a := 0; -- Set starting scores to 0
        TMP_b := 0;
        
        for i in 0 to 2 loop -- Check vectors score_a and score_b for '1' and grow temporary variables accordingly
            if score_a(i) = '1' then
                TMP_a := TMP_a + 1;
            else
                TMP_a := TMP_a;
            end if;
            if score_b(i) = '1' then
                TMP_b := TMP_b + 1;
            else
                TMP_b := TMP_b;
            end if;
        end loop;
        
        winner <= "00" when TMP_a = 0 and TMP_b = 0 else -- Check for winner and assign corresponding value to 'winner'
        "10" when TMP_a > TMP_b else
        "01" when TMP_a < TMP_b else
        "11" when TMP_a = TMP_b;
        
        wait for 1ps; -- Wait in order to end process
        
    end process;
end loopy;

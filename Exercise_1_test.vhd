----------------------------------------------------------------------------------
-- Company: UTU
-- Engineer: Joni Rajamäki
-- 
-- Create Date: 09/08/2022 12:02:42 PM
-- Module Name: Exercise_1_test
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity Exercise_1_test is

end Exercise_1_test;

architecture tb of Exercise_1_test is
    component tally
        port (
            score_a : in std_logic_vector(2 downto 0);
            score_b : in std_logic_vector(2 downto 0);
            winner  : out std_logic_vector(1 downto 0)
            );
            
    end component;
    
    signal test_a       : std_logic_vector(2 downto 0);
    signal test_b       : std_logic_vector(2 downto 0);
    signal test_winner  : std_logic_vector(1 downto 0);

    function results(
        a   : in std_logic_vector(2 downto 0);
        b   : in std_logic_vector(2 downto 0)
        )
        return std_logic_vector is variable w: std_logic_vector(1 downto 0); -- output w for results, which will be compared to simulation values
        
        variable test_TMP_a: integer; -- Temporary variable for each players' score
        variable test_TMP_b: integer;
        
    begin 
            for i in 0 to 2 loop -- check vectors a and b for '1' and grow temporary variables accordingly
                if a(i) = '1' then
                    test_TMP_a := test_TMP_a + 1;
                end if;
                if b(i) = '1' then
                    test_TMP_b := test_TMP_b + 1;
                end if;
            end loop;
            
            w := "00" when test_TMP_a = 0 and test_TMP_b = 0 else -- Check for winner and assign corresponding value to 'w'
            "10" when test_TMP_a > test_TMP_b else
            "01" when test_TMP_a < test_TMP_b else
            "11" when test_TMP_a = test_TMP_b;
            
            return w;
    end;    
    
begin

    DUT: tally port map (score_a => test_a, score_b => test_b, winner => test_winner); -- match simulation signals to inputs in behavioral file
    
    process
    begin
        for i in 0 to 7 loop -- 2x 0-7 loop to ensure all input combinations are tested
        test_a <= std_logic_vector(TO_UNSIGNED(i,3)); -- 
            for j in 0 to 7 loop
                test_b <= std_logic_vector(TO_UNSIGNED(j,3));
                wait for 10ns;
                assert (test_winner = results(test_a, test_b)) -- check that simulation output matches theoretical output and report accordingly
                    report "TEST FAILURE"
                    severity error; 
            end loop;
        end loop;
    end process;

end tb;

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

    function results( -- results function to supply assert with expected results
        a   : in std_logic_vector(2 downto 0);
        b   : in std_logic_vector(2 downto 0)
        )
        return std_logic_vector is variable w: std_logic_vector(1 downto 0); -- output w for results, which will be compared to simulation values
        
    begin 
        if a = "000" and b = "000" then -- truth table to check all possible binary combination 0-64 :)
            w := "00";
        elsif a = "000" and b = "001" then
            w := "01";
        elsif a = "000" and b = "010" then
            w := "01";
        elsif a = "000" and b = "011" then
            w := "01";
        elsif a = "000" and b = "100" then
            w := "01";
        elsif a = "000" and b = "101" then
            w := "01";
        elsif a = "000" and b = "110" then
            w := "01";
        elsif a = "000" and b = "111" then
            w := "01";
        elsif a = "001" and b = "000" then
            w := "10";
        elsif a = "001" and b = "001" then
            w := "11";
        elsif a = "001" and b = "010" then
            w := "11";
        elsif a = "001" and b = "011" then
            w := "01";
        elsif a = "001" and b = "100" then
            w := "11";
        elsif a = "001" and b = "101" then
            w := "01";
        elsif a = "001" and b = "110" then
            w := "01";
        elsif a = "001" and b = "111" then
            w := "01";
        elsif a = "010" and b = "000" then
            w := "10";
        elsif a = "010" and b = "001" then
            w := "11";
        elsif a = "010" and b = "010" then
            w := "11";
        elsif a = "010" and b = "011" then
            w := "01";
        elsif a = "010" and b = "100" then
            w := "11";
        elsif a = "010" and b = "101" then
            w := "01";
        elsif a = "010" and b = "110" then
            w := "01";
        elsif a = "010" and b = "111" then
            w := "01";
        elsif a = "011" and b = "000" then
            w := "10";
        elsif a = "011" and b = "001" then
            w := "10";
        elsif a = "011" and b = "010" then
            w := "10";
        elsif a = "011" and b = "011" then
            w := "11";
        elsif a = "011" and b = "100" then
            w := "10";
        elsif a = "011" and b = "101" then
            w := "11";
        elsif a = "011" and b = "110" then
            w := "11";
        elsif a = "011" and b = "111" then
            w := "01";
        elsif a = "100" and b = "000" then
            w := "10";
        elsif a = "100" and b = "001" then
            w := "11";
        elsif a = "100" and b = "010" then
            w := "11";
        elsif a = "100" and b = "011" then
            w := "01";
        elsif a = "100" and b = "100" then
            w := "11";
        elsif a = "100" and b = "101" then
            w := "01";
        elsif a = "100" and b = "110" then
            w := "01";
        elsif a = "100" and b = "111" then
            w := "01";
        elsif a = "101" and b = "000" then
            w := "10";
        elsif a = "101" and b = "001" then
            w := "10";
        elsif a = "101" and b = "010" then
            w := "10";
        elsif a = "101" and b = "011" then
            w := "11";
        elsif a = "101" and b = "100" then
            w := "10";
        elsif a = "101" and b = "101" then
            w := "11";
        elsif a = "101" and b = "110" then
            w := "11";
        elsif a = "101" and b = "111" then
            w := "01";
        elsif a = "110" and b = "000" then
            w := "10";
        elsif a = "110" and b = "001" then
            w := "10";
        elsif a = "110" and b = "010" then
            w := "10";
        elsif a = "110" and b = "011" then
            w := "11";
        elsif a = "110" and b = "100" then
            w := "10";
        elsif a = "110" and b = "101" then
            w := "11";
        elsif a = "110" and b = "110" then
            w := "11";
        elsif a = "110" and b = "111" then
            w := "01";
        elsif a = "111" and b = "000" then
            w := "10";
        elsif a = "111" and b = "001" then
            w := "10";
        elsif a = "111" and b = "010" then
            w := "10";
        elsif a = "111" and b = "011" then
            w := "10";
        elsif a = "111" and b = "100" then
            w := "10";
        elsif a = "111" and b = "101" then
            w := "10";
        elsif a = "111" and b = "110" then
            w := "10";
        elsif a = "111" and b = "111" then
            w := "11";
        else
            w := "00";
        end if;
            
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

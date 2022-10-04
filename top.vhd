----------------------------------------------------------------------------------
-- Company: UTU
-- Engineer: Joni Rajamäki
-- 
-- Create Date: 09/13/2022 05:04:42 PM
-- Module Name: top
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    port (
        SW0 :   in STD_LOGIC;
        SW1 :   in STD_LOGIC;
        SW2 :   in STD_LOGIC;
        SW3 :   in STD_LOGIC;
        SW4 :   in STD_LOGIC;
        SW5 :   in STD_LOGIC;
    
        LD0 :   out STD_LOGIC;
        LD1 :   out STD_LOGIC);
        
end top;

architecture Behavioral of top is

    component tally
        port (
            score_a : in std_logic_vector(2 downto 0);
            score_b : in std_logic_vector(2 downto 0);
            winner  : out std_logic_vector(1 downto 0)
            );
            
    end component;
    
begin
    DUT: tally port map (
        score_a(0) => SW0,
        score_a(1) => SW1,
        score_a(2) => SW2,
        score_b(0) => SW3,
        score_b(1) => SW4,
        score_b(2) => SW5,
        winner(0) => LD1,
        winner(1) => LD0);

end Behavioral;          
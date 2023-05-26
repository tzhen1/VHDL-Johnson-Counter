LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY Tb_Johnson_counter IS
END Tb_Johnson_counter;

ARCHITECTURE behaviour OF Tb_Johnson_counter IS
        COMPONENT Johnson_counter -- component of DUT
        PORT (  clk : IN std_logic;
                rst : IN std_logic;
                  Q : OUT std_logic_vector(3 DOWNTO 0));
        END COMPONENT;
        
        SIGNAL clk : std_logic := '0'; -- i/p
        SIGNAL rst : std_logic := '0';
        SIGNAL Q : std_logic_vector(3 DOWNTO 0); 
        CONSTANT clk_period : TIME := 10 ns; -- change t = 1/f, if given freq
BEGIN
        uut : Johnson_counter PORT MAP( clk => clk, rst => rst, Q => Q ); 
        clk_process : PROCESS -- clk process def
                BEGIN clk <= '0';
                WAIT FOR clk_period/2; clk <= '1';
                WAIT FOR clk_period/2;
        END PROCESS;

-- Stimulus process
        stim_proc : PROCESS
        BEGIN
                WAIT FOR 100 ns; -- hold reset state for 100 ns
                rst <= '1';
                WAIT FOR 100 ns;
                rst <= '0';
                WAIT;
        END PROCESS;
END behaviour;

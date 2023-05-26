LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY Johnson_counter IS

PORT (  clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0) ); -- 4 bit counter
END Johnson_counter;

ARCHITECTURE Behavioural OF Johnson_counter IS
    SIGNAL temp : std_logic_vector(3 DOWNTO 0) := "0000";
BEGIN
        PROCESS (clk, rst)
        BEGIN
                IF rst = '1' THEN
                    temp <= "0000"; -- reset make 0 
                 ELSIF Rising_edge(clk) THEN
                    temp(1) <= temp(0);
                    temp(2) <= temp(1);
                    temp(3) <= temp(2);
                    temp(0) <= NOT temp(3);
                 END IF;
        END PROCESS;
        Q <= temp;
END Behavioural;
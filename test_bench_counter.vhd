library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity test_bench_counter is
end test_bench_counter;

architecture tb of test_bench_counter is
    signal clk, rst : std_logic;
    signal q : std_logic_vector(3 downto 0);
begin
    -- conectando os sinais do test bench aos sinais do contador
    UUT : entity work.ring_counter_ff port map 
	            (clk => clk, reset => rst, Q => q);

    rst <= '1', '0' after 10 ns;
	 
	 -- processo gerador de clock
	 tb1 : process
        constant periodo: time := 20 ns; -- periodo do clock
        begin
				clk <= '1';
            wait for periodo/2; -- 50% do periodo pra cada nivel
				clk <= '0';
				wait for periodo/2;
        end process;
end tb;
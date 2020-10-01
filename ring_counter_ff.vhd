library IEEE;
use IEEE.Std_Logic_1164.all;
use ieee.std_logic_signed.all;

entity ring_counter_ff is
	port (
			clk, reset: in std_logic;
			Q: buffer std_logic_vector(3 downto 0)
		);
end ring_counter_ff;

architecture bhv of ring_counter_ff is

component flip_flop_jk is
	port (
			J, K, clk: in std_logic;
			Q, notQ: buffer std_logic
		);
end component;

signal qTemp, notQSignal, qFinal: std_logic_vector(3 downto 0);

begin

	G0: flip_flop_jk port map(qTemp(3), not qTemp(3), clk, qTemp(0), notQSignal(0));

	GEN_REG:
	for I in 1 to 3 generate
		REGX : flip_flop_jk port map
		  (qTemp(I - 1), not qTemp(I - 1), clk, qTemp(I), notQSignal(I));
	end generate GEN_REG;

	process (reset, clk)
	begin
		if reset = '1' then
			qFinal <= "0001";
		elsif clk'event and clk = '1' then
			-- Q(1) <= Q(0);
			-- Q(2) <= Q(1);
			-- Q(3) <= Q(2);
			-- Q(0) <= Q(3);
			qFinal <= qTemp;
		end if;
	end process;
	
	Q <= qFinal;

end;
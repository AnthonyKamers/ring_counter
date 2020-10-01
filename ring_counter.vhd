library IEEE;
use IEEE.Std_Logic_1164.all;
use ieee.std_logic_signed.all;

entity ring_counter is
	port (
			clk, reset: in std_logic;
			Q: buffer std_logic_vector(3 downto 0)
		);
end ring_counter;

architecture bhv of ring_counter is

	signal qTemp: std_logic_vector(3 downto 0);

begin

	process (reset, clk)
	begin
		if reset = '1' then
			qTemp <= "0001";
		elsif clk'event and clk = '1' then
			qTemp(1) <= qTemp(0);
			qTemp(2) <= qTemp(1);
			qTemp(3) <= qTemp(2);
			qTemp(0) <= qTemp(3);
		end if;
	end process;
	
	Q <= qTemp;

end;
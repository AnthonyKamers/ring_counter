library IEEE;
use IEEE.Std_Logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.NUMERIC_STD.all;

entity flip_flop_jk is
	port (
			J, K, clk: in std_logic;
			Q, notQ: buffer std_logic
		);
end flip_flop_jk;

architecture bhv of flip_flop_jk is

signal jk: std_logic_vector(1 downto 0);

begin

	jk <= J & K;

	process (clk)
	begin
		if clk'event and clk = '1' then
		
			case (jk) is
				when "00" => Q <= Q;
				when "01" => Q <= '0';
				when "10" => Q <= '1';
				when "11" => notQ <= '1';
			end case;
		end if;
	end process;

end;
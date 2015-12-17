-- this module will take in a rising edge and output a
-- pulse one clock wide one clock after that.
library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;

entity delay_pulse is
port(clk	: in 	std_logic;
	 reset	: in	std_logic;
	 edge_in : in std_logic ;
	 pulse_out : out std_logic 
	 );
end delay_pulse;

architecture beh of delay_pulse is

signal del_regs : std_logic_vector(1 downto 0 ) ;

begin

process( clk, reset, edge_in, del_regs)
begin
	if reset='1' then
		del_regs <= (others => '0') ;
	else
		if rising_edge(clk) then
			del_regs <= del_regs(0) & edge_in ;
		end if ;
	end if ;

	pulse_out <= del_regs(0) and not del_regs(1) ;
end process ;

end beh ;

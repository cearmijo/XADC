--
-- this module will compare two std_logic_vectors of equal size
-- it will put out a result bit. 1=equal 0=not equal
--
-- rick 5-30-14
--

-- IEEE VHDL standard library:
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_bit.all;
use IEEE.std_logic_unsigned.all;
-- use IEEE.std_logic_signed.all;

entity comp_vect is
	generic(max_bits : integer := 32) ;
	port(A, B : in std_logic_vector(max_bits-1 downto 0);
	     res : out std_logic
		);
end comp_vect ;

architecture beh of comp_vect is

	signal res_int : std_logic ;
	
begin

	process(A, B)
	begin
		res_int <= '1' ; -- assume equal
		for i in 0 to max_bits-1 loop
			if ( A(i) /= B(i) ) then
				res_int <= '0' ; -- sticky bit
			end if ;
		end loop ;
	end process ;

	res <= res_int ;
	
end beh ;

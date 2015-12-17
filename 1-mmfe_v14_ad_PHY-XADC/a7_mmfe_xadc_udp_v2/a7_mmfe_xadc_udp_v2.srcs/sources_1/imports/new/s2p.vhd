--
-- VMM stream capture
--
-- this module will read the serial stream comming from the VMM
--
-- rick 5-10-14
--
-- data0 first bit out is flag.
-- data1 first bit out is threshold indicator.
-- 6 bits channel address, 10 bits peak amplitude, 20 bits of timing
--

-- IEEE VHDL standard library:
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_bit.all;
use IEEE.std_logic_unsigned.all;
-- use IEEE.std_logic_signed.all;

entity s2p is
	generic(max_bits : integer := 19) ;
	port(clk : in std_logic; -- main clock
	     rst : in std_logic; -- reset
	     data0, data1 : in std_logic; -- serial data in
	     par_out : out std_logic_vector((max_bits*2)-1 downto 0); -- parallel data out
		  ckdt_en : out std_logic ;
	     done : out std_logic
		);
end s2p ;

architecture beh of s2p is

	-- different fields of stream
	signal bit_cntr : std_logic_vector(4 downto 0) ;
	signal par_shft0, par_shft1 : std_logic_vector(max_bits-1 downto 0) ;
	
	-- counter enables
	signal bit_cntr_ena, shift_en, bit_cntr_done, ckdt_en_int : std_logic ;
	
begin

	-- need sync reset here
	
	-- we need to make sure to capture the flag bit
	-- latch flag, start bit.
	process(clk, rst, data0, bit_cntr_done)
	begin
		if rising_edge(clk) then
			if (rst = '1') or (bit_cntr_done = '1') then
				shift_en <= '0' ;
				bit_cntr_ena <= '0';
				ckdt_en_int <= '0' ;
			else
				if (data0 = '1') then  -- start when we see the flag bit.
					shift_en <= '1' ;
					bit_cntr_ena <= '1';
					ckdt_en_int <= '1' ; -- sarah item #2
				else
					shift_en <= shift_en ;
					bit_cntr_ena <= bit_cntr_ena ;
					ckdt_en_int <= ckdt_en_int ;
				end if ;
			end if ;
		end if;
	end process ;

	ckdt_en <= ckdt_en_int ;
	
	-- capture rising edge on data0, the flag bit
	process(clk, rst, data0, data1, bit_cntr_done)
	begin
		if rising_edge(clk) then
			if (rst = '1') or (bit_cntr_done = '1') then
				par_shft0 <= (others => '0') ;
				par_shft1 <= (others => '0') ;
			else -- start at the same time so we capture the flag bit.
				if (data0 = '1') or (shift_en = '1') then
					-- since LSB goes out first we need to shift into MSB
					par_shft0 <= data0 & par_shft0((max_bits-1) downto 1) ;
					par_shft1 <= data1 & par_shft1((max_bits-1) downto 1) ;
				else
					par_shft0 <= par_shft0 ;
					par_shft1 <= par_shft1 ;
				end if ;
			end if ;
		end if ;
	end process ;
	
	-- serial in
	process(clk, rst, bit_cntr_ena, bit_cntr_done)
	begin
		if (rising_edge(clk)) then
			if (rst = '1') or (bit_cntr_done = '1') then
				bit_cntr <= (others=>'0') ;
			else
				if (bit_cntr_ena = '1') then
					bit_cntr <= bit_cntr + '1' ;
				else
					bit_cntr <= bit_cntr ;
				end if ;
			end if ;
		end if ;
	end process ;

	bit_cntr_done <= '1' when (bit_cntr = max_bits-1) else '0' ; -- when you hit the max, reset for next one
	done <= '1' when (bit_cntr = max_bits-1) else '0' ; -- when you hit the max, all done

	-- "un-pack" DATA1/0 bits to get 38 bit word.
	par_gen :
	for i in 0 to max_bits-1 generate
			par_out(i*2)   <= par_shft0(i) ;
			par_out(i*2+1) <= par_shft1(i) ;
	end generate ;
	
end beh ;

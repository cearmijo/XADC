--
-- VMM serial configuration word.
--
-- this module will send and receive configuration stream from the VMM
--
-- rick 5-18-14
--
-- the config word is 1616 bits long.
-- we also need to do a compare of the stream sent with the one received.
--

-- IEEE VHDL standard library:
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_bit.all;
use IEEE.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

entity vmm_cfg_sr is
	generic(cfg_bits : integer := 32) ; -- for test use 32 not 1616
	port( 
	       clk            : in std_logic; -- main clock
	       rst            : in std_logic; -- reset
	       load_en        : in std_logic; -- serial data in
		   run            : in std_logic ;
		   vmm_cfg_out    : in std_logic_vector(cfg_bits-1 downto 0) ;
		   cfg_bit_out    : out std_logic ;
		   vmm_clk_int_en : out std_logic ;
		   vmm_ena        : out std_logic ;
		   vmm_wen        : out std_logic ;
		   statex         : out std_logic_vector(3 downto 0);
		   bit_cntrx      : out std_logic_vector(11 downto 0)
		 );
end vmm_cfg_sr ;

architecture beh of vmm_cfg_sr is

--    signal vmm_rx_en_i, vmm_tx_en_i : std_logic;
    signal sm_cntr  :    std_logic_vector(7 downto 0) ;
--    signal sm_sw_cnt  :    std_logic_vector(7 downto 0) := x"20";
--    signal sm_sw_cnt  :    std_logic_vector(7 downto 0) := x"10";
--    signal sm_sw_cnt  :    std_logic_vector(7 downto 0) := x"01";
    signal sm_sw_cnt  :    std_logic_vector(7 downto 0) := x"00";
	signal state, state_nxt : std_logic_vector(3 downto 0) ;
	signal statex1 : std_logic_vector(3 downto 0) ;

	-- counter to delay the config state machine clock.
--	signal clk_cntr : std_logic_vector(31 downto 0) ;
	
	signal bit_cntr : integer range 0 to 1632 := 0 ; -- only need 11 bits
	signal bit_cntrx1 : std_logic_vector(11 downto 0) := x"000" ; -- only need 11 bits
	
--	signal bit_cntr_ena, done_int, bit_cntr_done, bit_cntr_rst : std_logic ;
	signal bit_cntr_ena, bit_cntr_done, bit_cntr_rst : std_logic ;
	signal vmm_clk_int, vmm_wen_int, vmm_ena_int : std_logic ;
    signal bc_rst : std_logic ;
	signal run_sync_rst : std_logic ;
	
	attribute keep: boolean;
	attribute keep of run_sync_rst : signal is true;
	attribute keep of state : signal is true;

begin
	process( clk, state, rst, load_en, run, bit_cntr, vmm_wen_int, bit_cntr_done, run_sync_rst, sm_cntr, sm_sw_cnt)
    begin
		if (rising_edge( clk)) then --10MHz
			if (rst = '1') then
				state <= (others=>'0') ;
                vmm_clk_int_en <= '0';
				vmm_wen_int <= '0' ;
				run_sync_rst <= '0' ;
                bit_cntr <= 0 ;
                
			else
					case state is -- shift out the tx stream
                        
                        -- reset
						when x"0" => 
                                            vmm_clk_int_en <= '0';
							       			vmm_wen_int <= '0' ;
										    run_sync_rst <= '0' ;
                                            bit_cntr <= 0 ;
										    if (run = '1') then
											    state <= x"1" ;
										    end if;     
										
						-- reset sync, set wen
                        when x"1" => 
                                            vmm_wen_int <= '1' ; -- set wen high early
                                            vmm_clk_int_en <= '1';
                                            state <= x"2";
                                        
						-- reset sync, set wen
                        when x"2" => 
                                            vmm_clk_int_en <= '1';
                                            state <= x"3";
                                        
						-- clock out the next bit				
						when x"3" => 
--										if( bit_cntr = 1615) then		
										if( bit_cntr = 1614) then		
                                                vmm_clk_int_en <= '0';
                                                bit_cntr <= bit_cntr + 1 ;
                                                state <= x"4" ;
										else
                                                bit_cntr <= bit_cntr + 1 ;
										end if ;
						
						-- done
						when x"4" => 	
                                            bit_cntr <= 0 ;
                                            vmm_clk_int_en <= '0';
										    state <= x"5" ;
						
						-- done, goto begining
						when x"5" => 
									      	vmm_wen_int <= '0' ;
					       					state <= x"0" ;

                        -- catch an error
						when others => 
                                        vmm_clk_int_en <= '0';
										run_sync_rst <= '1' ;
										vmm_wen_int <= '0' ;
                                        bit_cntr <= 0 ;
										state <= (others=>'0') ;
					end case ;
			end if ;
        end if ;
	end process ;

--    vmm_rx_en <= vmm_rx_en_i;
--    vmm_tx_en <= vmm_tx_en_i;
	
	
	vmm_wen <= vmm_wen_int ;
	vmm_ena <= '0';

	cfg_bit_out <= vmm_cfg_out( bit_cntr) ;

     statex <= state;
    bit_cntrx <=  conv_std_logic_vector( bit_cntr, 12);

end beh ;

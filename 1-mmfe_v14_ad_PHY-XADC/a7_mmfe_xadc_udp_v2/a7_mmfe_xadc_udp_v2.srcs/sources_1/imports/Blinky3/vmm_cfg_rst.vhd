--
-- VMM reset
--
-- this module will send two signals out to reset the VMM
--
-- rick 10-22-14
--
-- the resets are global and acquisition
-- each sequence has four states
-- NOTE: does the clock have to run?
-- if so we can have as many clocks as we need
-- and have or way with the wave form.
--
--        acquisition reset
--  ENA -------------------- (0) 
--             -----
--  WEN -------     --------
--
--         global reset
--             -----
--  ENA -------     --------
--           ---------
--  WEN -----         ------
--

-- IEEE VHDL standard library:
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_bit.all;
use IEEE.std_logic_unsigned.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity vmm_cfg_rst is
	port(  clk             : in std_logic; -- 100MHz
	       rst             : in std_logic; -- reset
	       gbl_rst         : in std_logic ; -- from control register. a pulse
	       acq_rst         : in std_logic ; -- from control register. a pulse
		   vmm_ena         : out std_logic ; -- these will be ored with same from other sm
		   vmm_wen         : out std_logic ; -- these will be ored with same from other sm
           rst_state       : out std_logic_vector(2 downto 0) ;
           cfg_rst_ctr_e   : out std_logic_vector(31 downto 0);
	       done            : out std_logic
		);
end vmm_cfg_rst ;

architecture beh of vmm_cfg_rst is


--	signal state_switch_count : std_logic_vector(31 downto 0) := x"00004000"; --fast
--	signal state_switch_count : std_logic_vector(31 downto 0) := x"00020000"; --fast
	signal state_switch_count : std_logic_vector(31 downto 0) := x"00010000"; --fast
	signal cfg_rst_ctr : std_logic_vector(31 downto 0) := x"00000000";


	signal state_nxt : std_logic_vector(2 downto 0) ;
	signal gbl_acq_rst : std_logic_vector(1 downto 0) ;

	signal bit_cntr : integer range 0 to 16 := 0 ; 
	
	signal bit_cntr_ena, done_int, bit_cntr_done, bit_cntr_rst : std_logic ;
	signal vmm_clk_int, vmm_wen_int, vmm_ena_int : std_logic ;
	signal acq_rst_int, gbl_rst_int, run : std_logic ;
	
	constant cfg_reset_sm : integer := 4;

	attribute keep: boolean;
	attribute keep of vmm_ena_int: signal is true;
	attribute keep of vmm_wen_int: signal is true;
	attribute keep of cfg_rst_ctr: signal is true;

begin

	process( clk, rst, done_int, acq_rst, acq_rst_int, gbl_rst, gbl_rst_int)
	begin
		if( rst = '1' or done_int = '1') then
				acq_rst_int <= '0' ;
				gbl_rst_int <= '0' ;
		else
			if( rising_edge( clk)) then  --100MHz
				if (gbl_rst = '1') then
					gbl_rst_int <= '1' ;
				end if ;
				if (acq_rst = '1') then
					acq_rst_int <= '1' ;
				end if ;
			end if ;
		end if ;
	end process ;
	
	gbl_acq_rst <= acq_rst_int & gbl_rst_int ;

	run <= acq_rst_int or gbl_rst_int ;


	process( clk, state_nxt, rst, gbl_acq_rst, run, done_int, vmm_ena_int, vmm_wen_int,	cfg_rst_ctr)
	begin
		if ( rising_edge( clk)) then       --100MHz
			if (rst = '1') then
				state_nxt <= (others=>'0') ;
				done_int <= '0' ;
				vmm_ena_int <= '0' ;
				vmm_wen_int <= '0' ;
				cfg_rst_ctr  <= (others=>'0') ;
			else
					case state_nxt is 
						when "000" => 
--						                vmm_clk_int <= '0' ;
										vmm_wen_int <= '0' ;
										vmm_ena_int <= '0' ;
--										bit_cntr_rst <= '0' ;
										done_int <= '0' ;
--										bit_cntr_ena <= '0' ;
										
										if (run = '1') then
											state_nxt <= "001" ;									
                               				cfg_rst_ctr  <= (others=>'0') ;
										else	
											state_nxt <= "000" ;
--											cfg_rst_ctr <= cfg_rst_ctr +  '1';
										end if ;

						when "001" => 
						                case (gbl_acq_rst) is
										      when "10" => 
											                 vmm_ena_int <= '0' ;
											                 vmm_wen_int <= '1' ;
										      when "01" => 
											                 vmm_ena_int <= '0' ;
											                 vmm_wen_int <= '1' ;
										      when others => 
											                 vmm_ena_int <= '0' ;
											                 vmm_wen_int <= '0' ;
										end case;
										
										if( run = '1' and cfg_rst_ctr = state_switch_count) then
                                            state_nxt <= "010" ;                                    
                                            cfg_rst_ctr  <= (others=>'0') ;
                                        else    
                                            state_nxt <= "001" ;
                                            cfg_rst_ctr <= cfg_rst_ctr +  '1';
                                        end if ;

						when "010" =>     
						                case (gbl_acq_rst) is
										      when "10" => 
											                 vmm_ena_int <= '0' ;
											                 vmm_wen_int <= '1' ;
										      when "01" => 
											                 vmm_ena_int <= '1' ;
											                 vmm_wen_int <= '1' ;
										      when others => 
											                 vmm_ena_int <= '0' ;
											                 vmm_wen_int <= '0' ;
										  end case;
										  
										  vmm_clk_int <= '0' ; 
										  if (run = '1' and cfg_rst_ctr = state_switch_count) then
                                                state_nxt <= "101" ;                                    
                                                cfg_rst_ctr  <= (others=>'0') ;
                                           else    
                                                state_nxt <= "010" ;
                                                cfg_rst_ctr <= cfg_rst_ctr +  '1';
                                           end if ;

						when "101" => 
						                  case (gbl_acq_rst) is
										      when "10" => 
											                 vmm_ena_int <= '0' ;
											                 vmm_wen_int <= '1' ;
										      when "01" => 
											                 vmm_ena_int <= '0' ;
											                 vmm_wen_int <= '1' ;
										      when others => 
											                 vmm_ena_int <= '0' ;
											                 vmm_wen_int <= '0' ;
										  end case;
										  
										  vmm_clk_int <= '1' ;

										  if (run = '1' and cfg_rst_ctr = state_switch_count) then
                                                state_nxt <= "110" ;                                    
                                                cfg_rst_ctr  <= (others=>'0') ;
                                           else    
                                                state_nxt <= "101" ;
                                                cfg_rst_ctr <= cfg_rst_ctr +  '1';
                                           end if ;
						when "110" => 
						                  case (gbl_acq_rst) is
										      when "10" => 
											                 vmm_ena_int <= '0' ;
											                 vmm_wen_int <= '1' ;
										      when "01" => 
											                 vmm_ena_int <= '0' ;
											                 vmm_wen_int <= '0' ;
										      when others => 
											                 vmm_ena_int <= '0' ;
											                 vmm_wen_int <= '0' ;
										  end case;
										
										  vmm_clk_int <= '1' ;

										  if (run = '1' and cfg_rst_ctr = state_switch_count) then
                                                state_nxt <= "111" ;                                    
                                                cfg_rst_ctr  <= (others=>'0') ;
                                            else    
                                                state_nxt <= "110" ;
                                                cfg_rst_ctr <= cfg_rst_ctr +  '1';
                                            end if ;
						when "111" => 
						                  vmm_ena_int <= '0' ;
										  vmm_wen_int <= '0' ;
										  vmm_clk_int <= '0' ;

                                          state_nxt <= "000" ;                                    
    								      done_int <= '1' ;
                                          cfg_rst_ctr <= cfg_rst_ctr +  '1';

						when others =>    vmm_clk_int <= '0' ;
										  vmm_ena_int <= '0' ;
										  vmm_wen_int <= '0' ;
										  done_int <= '1' ;
										  state_nxt <= (others=>'0') ;
					end case ;
			end if ;
	   end if;
	end process ;
	
	cfg_rst_ctr_e <= cfg_rst_ctr;

	rst_state <= state_nxt;
	done <= done_int ;
	
	vmm_wen <= vmm_wen_int ;
	vmm_ena <= vmm_ena_int ;
	
end beh ;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2015 09:00:17 AM
-- Design Name: 
-- Module Name: external_trigger - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity external_trigger is
    Port ( clk_40MHz                : in STD_LOGIC;
           reset_for_bc_counters    : in STD_LOGIC;
           ext_trigger_in           : in STD_LOGIC;
           ext_trigger_pulse        : out STD_LOGIC;
           busy_from_ext_trigger    : out STD_LOGIC;
           bcid_counter             : buffer unsigned (11 downto 0);
           bcid_captured            : out unsigned (11 downto 0);
           bcid_corrected           : out unsigned (11 downto 0);
           turn_counter             : buffer unsigned (15 downto 0);
           turn_captured            : out unsigned (15 downto 0)
       );

end external_trigger;

architecture Behavioral of external_trigger is

	constant bcid_offset : unsigned (11 downto 0)   := x"000";
	constant busy_width : unsigned (15 downto 0)	:= x"9C40";   -- time busy is set (1 ms) busy_width = f_clk / (1/t_desired)
	constant trigger_pulse_width : unsigned (3 downto 0) := x"A"; --trigger pulse width of 250ns. trigger_pulse_width = t_desired / t_clk
	signal trigger : std_logic;
	signal trigger_pulse : std_logic;
	signal busy : std_logic;
	signal busy_count : unsigned (15 downto 0);
	signal trigger_pulse_count : unsigned(3 downto 0);
	signal trigger_was_low : std_logic; --flag to check that ext_trigger has been low after busy is done. This eliminates problem of trigger
										-- pulse firing again once busy goes low if ext_trigger never goes low.
	
begin

	ext_trigger_pulse     <= trigger_pulse;
	busy_from_ext_trigger <= busy;

	process (clk_40MHz, reset_for_bc_counters, ext_trigger_in) 
	
	begin
		if (reset_for_bc_counters = '1') then
		--  this comes from the state machine that starts the bc clock
			bcid_counter <= x"000";
			turn_counter <= x"0000";
			busy <= '0';
			trigger_pulse <= '0';
			trigger_was_low <= '1';
			
		elsif (rising_edge (clk_40MHz) ) then
						bcid_counter <= bcid_counter + 1;
						if ( bcid_counter = x"fff" ) then
						  turn_counter <= turn_counter + 1;
						end if;
						
			if (busy = '0') then
			--  here comes an external trigger and we were waiting for one
				  if  (ext_trigger_in = '1' and trigger_was_low = '1')then
					-- generate a trigger pulse and busy
					trigger_pulse <= '1';
					busy <= '1';
					trigger_was_low <= '0';
					bcid_captured <= bcid_counter;
					turn_captured <= turn_counter;
					--  here adjust the bcid to reflect the fact that the trigger
					--  may come later than the time of the actual event
                        if (bcid_offset > bcid_counter) then 
                            bcid_corrected <= x"FFF"- bcid_offset + bcid_counter;
                        else 
                            bcid_corrected <= bcid_counter - bcid_offset;
                        end if;
            -- if not busy and no external trigger, continue to wait            
				    elsif (ext_trigger_in = '0') then 
					  trigger_was_low <= '1';
				    end if;
			else
			-- here we are in the busy state
			-- keep busy high until the busy width is reached
				if (busy_count >= busy_width - 1) then
					busy <= '0';
				end if;
			
				if (trigger_pulse_count >= trigger_pulse_width - 1) then
					trigger_pulse <= '0';
				end if;
			end if;
		end if;
		
		
	end process;
	
	--time for trigger_pulse
	process (clk_40MHz) 
	begin
	   if clk_40MHz='1' and clk_40MHz'event then
		  if trigger_pulse='0' or reset_for_bc_counters = '1' then 
			 trigger_pulse_count <= x"0";
		  elsif trigger_pulse='1' then
			 trigger_pulse_count <= trigger_pulse_count + 1;
		  end if;
	   end if;
	end process; 
	
	--time for busy
	process (clk_40MHz) 
	begin
	   if clk_40MHz='1' and clk_40MHz'event then
		  if busy ='0' or reset_for_bc_counters = '1' then 
			 busy_count <= x"0000";
		  elsif busy='1' then
			 busy_count <= busy_count + 1;
		  end if;
	   end if;
	end process; 


end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2015 12:41:52 PM
-- Design Name: 
-- Module Name: my_ckbc_ena - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_ckbc_ena is
    Port ( user_31MHz_clk_i : in STD_LOGIC;
           axi_reg_0 : in STD_LOGIC_VECTOR (31 downto 0);
           user_40MHz_clk_i : in STD_LOGIC;
           vmm_ckbc_i : out STD_LOGIC);
end my_ckbc_ena;

architecture Behavioral of my_ckbc_ena is

begin

vmm_ckbc_i <= user_40MHz_clk_i when axi_reg_0(0) = '1' else
              '0';

end Behavioral;

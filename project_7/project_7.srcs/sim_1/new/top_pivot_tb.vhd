----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2022 10:03:30 AM
-- Design Name: 
-- Module Name: top_pivot_tb - Behavioral
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
use ieee.std_logic_arith.all;
--use ieee.fixed_pkg.all;
--use ieee.std_logic_texio.all;
use ieee.std_logic_textio.all;
--use ieee.numeric_std.all;
use std.textio.all;

use std.textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_pivot_tb is
--  Port ( );
end top_pivot_tb;

architecture Behavioral of top_pivot_tb is
component top_pivot
      Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           ready : out STD_LOGIC;
           --software to memory
           en_s : IN STD_LOGIC;
           we_s : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
           addr_s : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
           data_in_s : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           data_out_s : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
  end component;
  
  
signal clk,reset_tb, start_tb, ready_tb, en_s_tb, we_s_tb: std_logic;
signal  addr_s_tb: STD_LOGIC_VECTOR(12 DOWNTO 0);
signal data_in_s_tb, data_out_s_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);

begin

duv: top_pivot
 Port map( clk => clk,
        reset =>reset_tb,
        start =>start_tb,
        ready =>ready_tb,
        en_s =>en_s_tb,
        we_s(0) =>we_s_tb,
        addr_s =>addr_s_tb,
        data_in_s =>data_in_s_tb,
        data_out_s =>data_out_s_tb);

clk_gen: process
    begin
        clk <= '0', '1' after 10ns;
        wait for 20ns;
    end process;


    
stim_gen: process
 variable cnt: integer; 
   file ulaz: text;
variable val_sfixed: STD_LOGIC_VECTOR(10 DOWNTO -21);  
    begin
    
   wait;
 end process;

        
end Behavioral;

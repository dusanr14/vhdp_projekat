----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2022 05:29:31 PM
-- Design Name: 
-- Module Name: dsp - Behavioral
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
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity dsp is
 generic (WIDTHA:natural:=32;
          WIDTHB:natural:=32;
          SIGNED_UNSIGNED: string:= "signed");
 Port ( clk: in std_logic;
        a_i: in std_logic_vector (WIDTHA - 1 downto 0);
        b_i: in std_logic_vector (WIDTHB - 1 downto 0);
        c_i: in std_logic_vector (WIDTHB - 1 downto 0);
        res_o: out std_logic_vector(WIDTHB - 1 downto 0));
 end dsp;
architecture Behavioral of dsp is

-----------------------------------------------------------------------------------
---------------------
 -- Atributes that need to be defined so Vivado synthesizer maps appropriate
 -- code to DSP cells
 attribute use_dsp : string;
 attribute use_dsp of Behavioral : architecture is "yes";

------------------------------------------------------------------------

-- Pipeline registers.
 signal a_reg_s: std_logic_vector(WIDTHA - 1 downto 0);
 signal b_reg_s: std_logic_vector(WIDTHB - 1 downto 0);
 signal c_reg_s: std_logic_vector(WIDTHA + WIDTHB - 1 downto 0);
 signal m_reg_s: std_logic_vector(WIDTHA + WIDTHB - 1 downto 0);
 signal m1_reg_s: std_logic_vector(WIDTHA + WIDTHB - 1 downto 0);
 signal p_reg_s: std_logic_vector(WIDTHA + WIDTHB - 1 downto 0);

-----------------------------------------------------------------------------------
---------------------
begin
 process (clk) is
 begin
    if (rising_edge(clk))then
        a_reg_s <= a_i;
        b_reg_s <= b_i;
        c_reg_s <= "00000000000000000000000000000000" & c_i; -- c_i(0) & ..... & c_i(0) & c_i;
            if (SIGNED_UNSIGNED = "signed") then
                m_reg_s <= std_logic_vector(signed(a_reg_s) * signed(b_reg_s));
                m1_reg_s <= c_reg_s;
                p_reg_s <= std_logic_vector(signed(m1_reg_s) - signed(m_reg_s));
            else
                m_reg_s <= std_logic_vector(unsigned(a_reg_s) *
 unsigned(b_reg_s));
                p_reg_s <= m_reg_s;
            end if;
    end if;
 end process;
 res_o <= p_reg_s(31 DOWNTO 0);
end Behavioral;

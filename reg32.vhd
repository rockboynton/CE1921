-- ***************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 1 - 32-bit Register 
-- * FILENAME: reg32.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 3/28/18
-- * DESCRIPTION: 
-- * - This specification implements a 32-bit register in a dataflow VHDL 
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
-- use: std_logic_unsigned
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- active high load, active low reset 
entity reg32 is 
port(   D   : in   std_logic_vector(31 downto 0);
	    LD  : in   std_logic;
	    RST : in   std_logic;
	    CLK : in   std_logic;
	    Q   : out  std_logic_vector(31 downto 0)
	);
end entity reg32;

-- architecture: internal circuit 
architecture behavioral of reg32 is

begin 

	reg: process(RST, CLK, LD) 
	begin 
		if RST = '1' then Q <= (others => '0');
		elsif rising_edge(clk) then
			if LD = '1' then 
				Q <= D;
			end if;
		end if;
	end process reg;
	
end architecture behavioral;
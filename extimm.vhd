-- ***************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 1 - numeric extender 
-- * FILENAME: extimm.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 4/3/18
-- * DESCRIPTION: 
-- * - This specification implements the ARMv4 numeric extender 
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
-- use: std_logic_unsigned
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- active high load, active low reset 
entity extimm is 
port(   imm   : in   std_logic_vector(23 downto 0);
	    exts  : in   std_logic_vector(1 downto 0);
	    imm32 : out  std_logic_vector(31 downto 0)
	);
end entity extimm;

-- architecture: internal circuit 
architecture dataflow of extimm is

begin 

    with exts select 
    imm32 <= X"000000"&imm(7 downto 0) when B"00",
             X"00000"&imm(11 downto 0) when B"01",
             X"00"&imm(23 downto 0) when others;
	
end architecture dataflow;
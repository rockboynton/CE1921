-- ***************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 1 - comstant 4 
-- * FILENAME: constant4.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 4/11/18
-- * DESCRIPTION: 
-- * - This specification implements a constant 4  
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
-- use: std_logic_unsigned
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity constant4 is 
port(  
        Y: out   std_logic_vector(31 downto 0)
	);
end entity constant4;

-- architecture: internal circuit 
architecture dataflow of constant4 is

    constant four: std_logic_vector(31 downto 0) := X"00000004";

begin 

    Y <= four;  
	
end architecture dataflow;
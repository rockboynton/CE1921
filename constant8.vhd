-- ***************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 1 - comstant 8
-- * FILENAME: constant8.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 4/11/18
-- * DESCRIPTION: 
-- * - This specification implements a constant 8  
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
-- use: std_logic_unsigned
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity constant8 is 
port(  
        Y: out   std_logic_vector(31 downto 0)
	);
end entity constant8;

-- architecture: internal circuit 
architecture dataflow of constant8 is

    constant eight: std_logic_vector(31 downto 0) := X"00000008";

begin 

    Y <= eight;  
	
end architecture dataflow;
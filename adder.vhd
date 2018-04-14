-- ***************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 1 - adder
-- * FILENAME: adder.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 4/11/18
-- * DESCRIPTION: 
-- * - This specification implements an ARMv4 ALU in a dataflow VHDL 
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
-- use: std_logic_unsigned
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder is 
port(   A    : in    std_logic_vector(31 downto 0);
	    B    : in    std_logic_vector(31 downto 0);
        S    : out   std_logic_vector(31 downto 0)
	);
end entity adder;

-- architecture: internal circuit 
architecture dataflow of adder is

    constant four: std_logic_vector(31 downto 0) := X"00000001";

begin 

    S <= A + B;  
	
end architecture dataflow;
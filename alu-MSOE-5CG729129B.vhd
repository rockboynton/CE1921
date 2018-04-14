-- ***************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 1 - ARMv4 ALU bla
-- * FILENAME: alu.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 3/30/18
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

-- active high load, active low reset 
entity alu is 
port(   A    : in    std_logic_vector(31 downto 0);
	    B    : in    std_logic_vector(31 downto 0);
        ALUS : in    std_logic_vector(2 downto 0);
        F    : inout std_logic_vector(31 downto 0);
        C    : out   std_logic;
        V    : out   std_logic;
        N    : out   std_logic;
        Z    : out   std_logic
	);
end entity alu;

-- architecture: internal circuit 
architecture behavioral of alu is

    constant one: std_logic_vector(31 downto 0) := X"00000001";

begin 

    with ALUS select
    F <=    A   +  B   when B"000",
            A   -  B   when B"001",
            A  AND B   when B"010",
            A  OR  B   when B"011",
            A  XOR B   when B"100",
            A          when B"101",
            B          when B"110",
            one        when others;

    C <= '0';

    V <= '0';

    N <= F(31);

    Z <= '1' when F = X"00000000" else '0';
	
end architecture behavioral;
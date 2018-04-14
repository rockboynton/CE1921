-- ***************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 1 - Fetch Circuitry 
-- * FILENAME: fetch.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DESCRIPTION: 
-- * - top-level schematic of the fetch circuitry in a single-cycle processorfetch
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
library ieee;
use ieee.std_logic_1164.all;

-- entity declaration: external-view
entity fetch is
port(   PCWD   : in  std_logic_vector(3 downto 0);
        PCWE   : in  std_logic;
        RST    : in  std_logic;
        CLK    : in  std_logic;
        PC8    : out std_logic_vector(31 downto 0);
        PC4    : out std_logic_vector(31 downto 0);
        INSTR  : out std_logic_vector(31 downto 0)
	  );
end entity fetch;
 
architecture structural of fetch is	
						 
    signal CONST8   : std_logic_vector(31 downto 0);
    signal CONST4   : std_logic_vector(31 downto 0);
    signal PCbus       : std_logic_vector(31 downto 0);
	
 begin 
 	  
	pc: 	    entity work.reg32
					port map(D=>PCWD,LD=>PCWE,RST=>RST,CLK=>CLK,Q=>PCbus); 
			  
	constant4: 	entity work.constant4
                    port map(Y=>CONST4); 
                    
    constant8: 	entity work.constant8
					port map(Y=>CONST8); 

    adder4: 	entity work.adder
                    port map(A=>CONST4,B=>PCbus,S=>PC4);  

    adder8: 	entity work.adder
                    port map(A=>CONST8,B=>PCbus,S=>PC8); 

    irom: 	entity work.irom
                    port map(A=>PCbus,RD=>INSTR); 
	
end architecture structural;
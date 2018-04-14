-- ***************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 1 - Decode Circuitry 
-- * FILENAME: decode.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DESCRIPTION: 
-- * - top-level schematic of the decode circuitry in a single-cycle processorfetch
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
library ieee;
use ieee.std_logic_1164.all;

-- entity declaration: external-view
entity decode is
port(   PC8   : in  std_logic_vector(31 downto 0);
        INSTR   : in  std_logic_vector(31 downto 0); 
        WD3   : in  std_logic_vector(31 downto 0); 
        REGDST    : in  std_logic;
        REGWR    : in  std_logic;
        EXTS    : in std_logic_vector(1 downto 0);
        RST    : in  std_logic;
        CLK    : in  std_logic;
        BRAADDR    : out std_logic_vector(31 downto 0);
        RD1    : out std_logic_vector(31 downto 0);
        RD2  : out std_logic_vector(31 downto 0);
        IMM32  : out std_logic_vector(31 downto 0)
	  );
end entity decode;
 
architecture structural of decode is	
						 
    signal SRCB   : std_logic_vector(31 downto 0);
    signal IMM  : std_logic_vector(31 downto 0);
	
 begin 
 	  
	regsrcbmux: entity work.bmux2to1
					port map(D1=>INSTR(15 downto 12),D0=>INSTR(3 downto 0),S=>REGDST,Y=>SRCB); 

    adder: 	    entity work.adder
                    port map(A=>PC8,B=>IMM,S=>BRAADDR);  

    regfile: 	entity work.regfile
                    port map(A1=>INSTR(19 downto 16),A2=>SRCB,A3=>INSTR(15 downto 12),WD3=>WD3,WE3=>REGWR,RST=>RST,CLK=>CLK,RD1=>RD1,RD2=>RD2); 

    extimm: 	entity work.extimm
                    port map(imm=>INSTR(23 downto 0),exts=>EXTS,imm32=>IMM); 

    IMM32 <= IMM;
	
end architecture structural;
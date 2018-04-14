-- ***************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 1 - 16-element register file
-- * FILENAME: regfile.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DESCRIPTION: 
-- * - top-level schematic of a  16-element register file implemented as structural VHDL
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
library ieee;
use ieee.std_logic_1164.all;

-- entity declaration: external-view
entity regfile is
port( A1      : in  std_logic_vector(3 downto 0);
	  A2      : in  std_logic_vector(3 downto 0);
	  A3      : in  std_logic_vector(3 downto 0);
      WD3     : in  std_logic_vector(31 downto 0);
      WE3     : in  std_logic;
      RST     : in  std_logic;
      CLK     : in  std_logic;
      RD1     : out std_logic_vector(31 downto 0);
      RD2     : out std_logic_vector(31 downto 0)
	  );
end entity regfile;
 
architecture structural of regfile is	
						 
	signal LD     : std_logic_vector(15 downto 0);
    signal Q15    : std_logic_vector(31 downto 0);
    signal Q14    : std_logic_vector(31 downto 0);
    signal Q13    : std_logic_vector(31 downto 0);
    signal Q12    : std_logic_vector(31 downto 0);
    signal Q11    : std_logic_vector(31 downto 0);
    signal Q10    : std_logic_vector(31 downto 0);
    signal Q9     : std_logic_vector(31 downto 0); --how to make a 16 bit wide cable of 32-bit wide numbers
    signal Q8     : std_logic_vector(31 downto 0);
    signal Q7     : std_logic_vector(31 downto 0);
    signal Q6     : std_logic_vector(31 downto 0);
    signal Q5     : std_logic_vector(31 downto 0);
    signal Q4     : std_logic_vector(31 downto 0);
    signal Q3     : std_logic_vector(31 downto 0);
    signal Q2     : std_logic_vector(31 downto 0);
    signal Q1     : std_logic_vector(31 downto 0);
    signal Q0     : std_logic_vector(31 downto 0);

	signal clk1Hz: std_logic; 
	
 begin 
 	  
	decoder: 	entity work.decode4to16
					port map(EN=>WE3,ADDR=>A3,Y=>LD); 
			  
	reg32_15: 	entity work.reg32
					port map(D=>WD3,LD=>LD(15),RST=>RST,CLK=>CLK,Q=>Q15); 

    reg32_14: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(14),RST=>RST,CLK=>CLK,Q=>Q14);  
                    
    reg32_13: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(13),RST=>RST,CLK=>CLK,Q=>Q13);  
                    
    reg32_12: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(12),RST=>RST,CLK=>CLK,Q=>Q12);  
                    
    reg32_11: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(11),RST=>RST,CLK=>CLK,Q=>Q11);  
                    
    reg32_10: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(10),RST=>RST,CLK=>CLK,Q=>Q10);  
                    
    reg32_9: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(9),RST=>RST,CLK=>CLK,Q=>Q9);
                    
    reg32_8: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(8),RST=>RST,CLK=>CLK,Q=>Q8);  
                    
    reg32_7: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(7),RST=>RST,CLK=>CLK,Q=>Q7);  
                    
    reg32_6: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(6),RST=>RST,CLK=>CLK,Q=>Q6);  
                    
    reg32_5: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(5),RST=>RST,CLK=>CLK,Q=>Q5);  
                    
    reg32_4: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(4),RST=>RST,CLK=>CLK,Q=>Q4);  
                    
    reg32_3: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(3),RST=>RST,CLK=>CLK,Q=>Q3); 
                    
    reg32_2: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(2),RST=>RST,CLK=>CLK,Q=>Q2);  
                    
    reg32_1: 	entity work.reg32
                    port map(D=>WD3,LD=>LD(1),RST=>RST,CLK=>CLK,Q=>Q1);  
                    
    reg32_0: 	entity work.reg32
					port map(D=>WD3,LD=>LD(0),RST=>RST,CLK=>CLK,Q=>Q0);  

	mux_A:      entity work.bmux16to1
                    port map(D15=>Q15,D14=>Q14,D13=>Q13,D12=>Q12,D11=>Q11,
                             D10=>Q10,D9=>Q9,D8=>Q8,D7=>Q7,D6=>Q6,D5=>Q5,
                             D4=>Q4,D3=>Q3,D2=>Q2,D1=>Q1,D0=>Q0,S=>A1,Y=>RD1);
								
	mux_B:      entity work.bmux16to1
                    port map(D15=>Q15,D14=>Q14,D13=>Q13,D12=>Q12,D11=>Q11,
                             D10=>Q10,D9=>Q9,D8=>Q8,D7=>Q7,D6=>Q6,D5=>Q5,
                             D4=>Q4,D3=>Q3,D2=>Q2,D1=>Q1,D0=>Q0,S=>A2,Y=>RD2);
	
end architecture structural;
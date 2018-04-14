-- ***************************************************************************************
-- * PROJECT: LW4 - Special Purpose Processor - 16-to-1 Bus Mux
-- * FILENAME: bmux16to1.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 3/28/17
-- * DESCRIPTION: 
-- * - This specification implements a 16-bit bus multiplexar in a dataflow VHDL 
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
-- use: std_logic_unsigned
library ieee;
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;

-- entity declaration: external-view
-- inputs: 
--    D15-0: inputs to be selected 
--    S: Selection bits
-- outputs: 
-- 	Y: outputs the value
entity bmux16to1 is
    port(   
        D15,D14,D13,D12,D11,D10,D9,D8,
        D7,D6,D5,D4,D3,D2,D1,D0 : in  std_logic_vector(31 downto 0);
        S : in  std_logic_vector(3 downto 0);
        Y : out  std_logic_vector(31 downto 0)
    );
end entity bmux16to1;

-- architecture: internal circuit 
architecture dataflow of bmux16to1 is

  begin 

      with S select 
      Y <= D0   when  B"0000",
           D1   when  B"0001",
           D2   when  B"0010",
           D3   when  B"0011",
           D4   when  B"0100",
           D5   when  B"0101",
           D6   when  B"0110",
           D7   when  B"0111",
           D8   when  B"1000",
           D9   when  B"1001",
           D10  when  B"1010",
           D11  when  B"1011",
           D12  when  B"1100",
           D13  when  B"1101",
           D14  when  B"1110",
           D15  when  others; 
            
end architecture dataflow;
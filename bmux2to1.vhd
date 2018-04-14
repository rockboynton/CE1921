-- ***************************************************************************************
-- * PROJECT: LW4 - Special Purpose Processor - 2-to-1 Bus Mux
-- * FILENAME: bmux2to1.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 3/28/17
-- * DESCRIPTION: 
-- * - This specification implements a 2 by 4-bit bus multiplexar in a dataflow VHDL 
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
--    D1-0: inputs to be selected 
--    S: Selection bits
-- outputs: 
-- 	Y: outputs the value
entity bmux2to1 is
    port(   
        D1,D0   : in  std_logic_vector(3 downto 0);
        S       : in  std_logic;
        Y       : out  std_logic_vector(3 downto 0)
    );
end entity bmux2to1;

-- architecture: internal circuit 
architecture dataflow of bmux2to1 is

  begin 

      with S select 
      Y <= D0   when  '0',
           D1   when  others;
            
end architecture dataflow;
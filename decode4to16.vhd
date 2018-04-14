-- ***************************************************************************************
-- * PROJECT: LW4 - Single-Cycle Processor Design Week 1 - 4-to-16 decoder
-- * FILENAME: decode4to16.vhd
-- * AUTHOR: boyntonrl@msoe.edu <Rock Boynton>
-- * DATE: 3/30/18
-- * DESCRIPTION: 
-- * - This specification implements a 4-to-16 decoder in a dataflow VHDL 
-- * - This component is used to design the register file.
-- * - It controls load on the destination register
-- ***************************************************************************************

-- load libraries 
-- use: std_logic
-- use: std_logic_vector
-- use: std_logic_unsigned
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- active high load, active low reset 
entity decode4to16 is 
port(   EN    : in std_logic;
	    ADDR  : in std_logic_vector(3 downto 0);
	    Y : out std_logic_vector(15 downto 0)
	);
end entity decode4to16;

-- architecture: internal circuit 
architecture behavioral of decode4to16 is

begin 

process (ADDR, EN)
begin
    -- default output values
    Y <= X"0000";

    if (EN = '1') then  -- active high enable pin
        case ADDR is
            when "1111" => Y(15) <= '1';
            when "1110" => Y(14) <= '1';
            when "1101" => Y(13) <= '1';
            when "1100" => Y(12) <= '1';
            when "1011" => Y(11) <= '1';
            when "1010" => Y(10) <= '1';
            when "1001" => Y(9)  <= '1';
            when "1000" => Y(8)  <= '1';
            when "0111" => Y(7)  <= '1';
            when "0110" => Y(6)  <= '1';
            when "0101" => Y(5)  <= '1';
            when "0100" => Y(4)  <= '1';
            when "0011" => Y(3)  <= '1';
            when "0010" => Y(2)  <= '1';
            when "0001" => Y(1)  <= '1';
            when "0000" => Y(0)  <= '1';
            when others => Y     <= X"0000";
        end case;
    end if;
end process;	
end architecture behavioral;
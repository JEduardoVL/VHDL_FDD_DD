----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:50:15 10/18/2022 
-- Design Name: 
-- Module Name:    multiplicador - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplicador is
    Port ( A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           B1 : in  STD_LOGIC;
           B2 : in  STD_LOGIC;
           C0 : out  STD_LOGIC;
           C1 : out  STD_LOGIC;
           C2 : out  STD_LOGIC;
           C3 : out  STD_LOGIC;
           C4 : out  STD_LOGIC;
           C5 : out  STD_LOGIC);
end multiplicador;

architecture Behavioral of multiplicador is

begin

C0 <= A0 AND B0;
C1 <= (A0 AND B1) XOR (A1 AND B0);
C2 <= (((A0 AND B1) AND (A1 AND B0)) XOR (A0 AND B2) XOR (A1 AND B1)) XOR (A2 AND B0);
C3 <= (((((A0 AND B1) AND (A1 AND B0)) AND ((A0 AND B2) XOR (A1 AND B1))) OR ((A0 AND B2) AND (A1 AND B1))) AND (A2 AND B0)) XOR (A1 AND B2) XOR (A2 AND B1);
C4 <= (((((((A0 AND B1) AND (A1 AND B0)) AND ((A0 AND B2) XOR (A1 AND B1))) OR ((A0 AND B2) AND (A1 AND B1))) AND (A2 AND B0)) AND (((A1 AND B2) XOR (A2 AND B1))) )OR ((A1 AND B2) AND (A2 AND B1))) XOR (A2 AND B2);  
C5 <= (((((((A0 AND B1) AND (A1 AND B0)) AND ((A0 AND B2) XOR (A1 AND B1))) OR ((A0 AND B2) AND (A1 AND B1))) AND (A2 AND B0)) AND (((A1 AND B2) XOR (A2 AND B1))) )OR ((A1 AND B2) AND (A2 AND B1))) AND (A2 AND B2);

end Behavioral;


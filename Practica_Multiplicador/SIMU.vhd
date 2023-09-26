--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:23:14 10/18/2022
-- Design Name:   
-- Module Name:   /home/ise/Desktop/Practica_Multiplicador/SIMU.vhd
-- Project Name:  Practica_Multiplicador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplicador
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SIMU IS
END SIMU;
 
ARCHITECTURE behavior OF SIMU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplicador
    PORT(
         A0 : IN  std_logic;
         A1 : IN  std_logic;
         A2 : IN  std_logic;
         B0 : IN  std_logic;
         B1 : IN  std_logic;
         B2 : IN  std_logic;
         C0 : OUT  std_logic;
         C1 : OUT  std_logic;
         C2 : OUT  std_logic;
         C3 : OUT  std_logic;
         C4 : OUT  std_logic;
         C5 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A0 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A2 : std_logic := '0';
   signal B0 : std_logic := '0';
   signal B1 : std_logic := '0';
   signal B2 : std_logic := '0';

 	--Outputs
   signal C0 : std_logic;
   signal C1 : std_logic;
   signal C2 : std_logic;
   signal C3 : std_logic;
   signal C4 : std_logic;
   signal C5 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplicador PORT MAP (
          A0 => A0,
          A1 => A1,
          A2 => A2,
          B0 => B0,
          B1 => B1,
          B2 => B2,
          C0 => C0,
          C1 => C1,
          C2 => C2,
          C3 => C3,
          C4 => C4,
          C5 => C5
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		A0 <= '0';
		A1 <= '0';
		A2 <= '1';
		B0 <= '0';
		B1 <= '1';
		B2 <= '0';
		wait for 100 ns;
		A0 <= '1';
		A1 <= '0';
		A2 <= '1';
		B0 <= '1';
		B1 <= '1';
		B2 <= '0';
		wait for 100 ns;
      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

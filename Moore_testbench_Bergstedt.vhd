--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Matt Bergstedt
--
-- Create Date:   23:13:56 03/06/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Matthew.Bergstedt/Documents/Personal/Spring 2014/ECE 281/Computer Exercises/CE3_Bergstedt/Moore_testbench_Bergstedt.vhd
-- Project Name:  CE3_Bergstedt
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MooreElevatorController_Shell
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
 
ENTITY Moore_testbench_Bergstedt IS
END Moore_testbench_Bergstedt;
 
ARCHITECTURE behavior OF Moore_testbench_Bergstedt IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MooreElevatorController_Shell
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         stop : IN  std_logic;
         up_down : IN  std_logic;
         floor : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal stop : std_logic := '0';
   signal up_down : std_logic := '0';

 	--Outputs
   signal floor : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 75 ns; -- make 100 to be easier to see
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MooreElevatorController_Shell PORT MAP (
          clk => clk,
          reset => reset,
          stop => stop,
          up_down => up_down,
          floor => floor
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		-- reset
		reset <= '1';
      wait for clk_period;
		-- change reset back to off
		reset <= '0';
		-- change up_down to 1 to move up
		up_down <= '1';
		-- wait one clock period to go up
		wait for clk_period;
		-- stop and wait for two clock cycles
		stop <= '1'; -- at floor 2
		wait for clk_period*2;
		-- don't stop to move up again
		stop <= '0';
		wait for clk_period;
		-- stop and wait for two clock cycles
		stop <= '1'; -- at floor 3
		wait for clk_period*2;
		-- don't stop to move up again
		stop <= '0';
		wait for clk_period;
		-- stop and wait for two clock cycles
		stop <= '1'; -- at floor 4
		up_down <= '0'; -- reached top so can't go any higher
		wait for clk_period*2;
		
		-- move back down to floor 1
		stop <= '0';
      wait;
   end process;

END;

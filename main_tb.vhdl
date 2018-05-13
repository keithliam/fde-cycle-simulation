library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main_tb is
end entity main_tb;

architecture behav of main_tb is
  -- test signals
  signal input1, input2, output1 : std_logic;
  
  -- attach unit under test (UUT)
  component main is
    -- port(input1, input2: in std_logic; output1: out std_logic);
  end component main;
 
begin
  -- initialize an and2 unit 
  -- attach test signals to UUT
  --uut : main port map(input1, input2, output1);
  uut : main;
  process
    -- initialize variables
    variable error_count : integer := 0;
    --std_logic vector
    variable test_input : unsigned(1 downto 0);
    variable expected_output : std_logic;
  begin
    test_input := B"00"; -- binary number 1 (2 bits)
    
    -- for loop construct
    for count in 0 to 3 loop
      input1 <= test_input(1); -- index 1 of vector
      input2 <= test_input(0); -- index 1 of vector
      --give process some time
      wait for 10 ns;
      --get expected output
      expected_output := input1 and input2;

      assert output1=expected_output report std_logic'image(input1) & " AND " & std_logic'image(input2) &
                              " | EXPECTED: " & std_logic'image(expected_output) & "| ACTUAL: " & std_logic'image(output1)
                        severity ERROR;
      if output1/=expected_output then error_count := error_count + 1; end if;

      test_input := test_input + 1;
    end loop;
    
    -- last notice
    report "Done with the test. There were " & integer'image(error_count) &
           " errors found." severity NOTE;
    wait;
  end process;                    
end architecture behav;

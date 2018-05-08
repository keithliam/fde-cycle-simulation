library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SR_FF_tb is
end entity SR_FF_tb;

architecture hehehe of SR_FF_tb is
  -- test signals
  signal S, R, Q, QT : std_logic;
  
  -- attach unit under test (UUT)
  component SR_FF is
    port(S, R: in std_logic; Q, QT: inout std_logic);
  end component SR_FF;
 
begin
  -- initialize an and2 unit 
  -- attach test signals to UUT
  uut : SR_FF port map(S, R, Q, QT);
  process
    -- initialize variables
    variable error_count : integer := 0;
    --std_logic vector
    variable test_input : unsigned(1 downto 0);
    variable output1 : std_logic;
    variable output2 : std_logic;
  begin
    test_input := B"00"; -- binary number 1 (2 bits)
    
    -- for loop construct
    for count in 0 to 2 loop
      S <= test_input(1); -- index 1 of vector
      R <= test_input(0); -- index 1 of vector
      --give process some time
      wait for 10 ns;
      --get expected out put
      output1 := (S nand S) nand output2;

      assert Q=output1 report "(" & std_logic'image(S) & " NAND " & std_logic'image(S) &
                              ") NAND Q | EXPECTED: " & std_logic'image(output1) & "| ACTUAL: " & std_logic'image(Q)
                        severity ERROR;
      if Q/=output1 then error_count := error_count + 1; end if;

      output2 := (R nand R) nand output1;

      assert QT=output2 report "(" & std_logic'image(R) & " NAND " & std_logic'image(R) &
                              ") NAND QT | EXPECTED: " & std_logic'image(output2) & "| ACTUAL: " & std_logic'image(QT)
                        severity ERROR;
      if QT/=output2 then error_count := error_count + 1; end if;


      test_input := test_input + 1;
    end loop;
    
    -- last notice
    report "Done with the test. There were " & integer'image(error_count) &
           " errors found." severity NOTE;
    wait;
  end process;                    
end architecture hehehe;

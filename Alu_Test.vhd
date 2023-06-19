library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity Alu_Test is
    port (
        A, B    : in    std_logic_vector(7 downto 0);
        ALU_Sel : in    std_logic_vector(1 downto 0);
        NZVC    : out   std_logic_vector(3 downto 0);
        Display0,Display1,Display2,Display3 : out std_logic_vector(6 downto 0)
    );
end entity; 

architecture arch_Alu_Test of Alu_Test is

component ALU is
    port (
        A, B    : in    std_logic_vector(7 downto 0);
        ALU_Sel : in    std_logic_vector(1 downto 0);
        NZVC    : out   std_logic_vector(3 downto 0);
        Result  : out   std_logic_vector(7 downto 0)
    );
end component; 

component DecodificadorBCD_Hexadecimal is
port (
			bcd : in  STD_LOGIC_VECTOR (3 downto 0);
         hex : out STD_LOGIC_VECTOR (6 downto 0));
			  
end component;

signal Result 	: std_logic_vector(7 downto 0);
signal Result0 : std_logic_vector(3 downto 0):= Result(3 downto 0);
signal Result1 : std_logic_vector(3 downto 0):= Result(7 downto 4);
signal B_low   : std_logic_vector(3 downto 0):= B(3 downto 0);
signal B_alta  : std_logic_vector(3 downto 0):= B(7 downto 4);
begin

D1: DecodificadorBCD_Hexadecimal port map (Result0,Display2);
D2: DecodificadorBCD_Hexadecimal port map (Result1,Display3);
D3: ALU port map (A,B,ALU_Sel,NZVC,Result);
D4: DecodificadorBCD_Hexadecimal port map (B_low,Display0);
D5: DecodificadorBCD_Hexadecimal port map (B_alta,Display1);		
end architecture ;
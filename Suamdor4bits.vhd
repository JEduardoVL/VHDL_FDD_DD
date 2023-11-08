----------------------------------------------------------------------------------
--Sumador de 2 números de 4 bits con expresiones booleanas
-- Se trabajaron a las entradas de manera independiente, pero también las podemos 
-- definir como vectores modificando a" A: in std_logic_vector (3 downto 0); y
-- A: in std_logic_vector (3 downto 0);", al igual que las salidas 
-- S : out std_logic_vector (4 donwto 0); (en esta salida ya se está contemplando 
-- al acarreo de la suma).
----------------------------------------------------------------------------------
library IEEE;    
use IEEE.STD_LOGIC_1164.ALL;    

entity Suamdor4bits is
    Port ( A1 : in  STD_LOGIC;  -- definimos las entradas A1 - A4 para el primer número
           A2 : in  STD_LOGIC;
           A3 : in  STD_LOGIC;
           A4 : in  STD_LOGIC;
           B1 : in  STD_LOGIC; -- Entradas del segundo número B1 - B4
           B2 : in  STD_LOGIC;
           B3 : in  STD_LOGIC;
           B4 : in  STD_LOGIC;
           S0 : out  STD_LOGIC;  -- salidas para mostrar la suma resultante de los 2 números S0 - S3
           S1 : out  STD_LOGIC;
           S2 : out  STD_LOGIC;
           S3 : out  STD_LOGIC;
           Cout : out  STD_LOGIC);  -- definimos esta salida para mostrar el acarreo de la suma 
end Suamdor4bits;

architecture Behavioral of Suamdor4bits is

begin
S0 <= A1 XOR B1;
S1 <= (A1 AND B1) XOR (A2 XOR B2);
S2 <= (((A1 AND B1) AND (A2 XOR B2)) OR (A2 AND B2)) XOR (A3 XOR B3);
S3 <= (((((A1 AND B1) AND (A2 XOR B2)) OR (A2 AND B2)) AND (A3 XOR B3)) OR (A3 AND B3)) XOR (A4 XOR B4);
Cout <= ((((((A1 AND B1) AND (A2 XOR B2)) OR (A2 AND B2)) AND (A3 XOR B3))) AND (A4 XOR B4)) OR (A4 AND B4);

end Behavioral;


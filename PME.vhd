library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  

entity PME is
    port (  
        A : in std_logic;  --Entrada 
		B : in std_logic;  --Entrada
        Resetn : in std_logic;  --Indicar cuando se empiezan hacer las verificaciones
		salida : out std_logic;  --Se crea una salida para un led y ver como están funcionando las transiciones del reloj
        Clock : in std_logic;   --Entrada para el reloj de la FPGA
        z : out std_logic   -- Salida de led que solo se activa al tener la serie de entradas correctas
    );
end PME;

architecture Behavioral of PME is

-------------ESTADOS------------------------
    type State_type is (E1,E2,E3,E4,E5);
    signal y : State_type; 
	signal Ent:std_logic_vector(1 downto 0) := "00";

---------------------Entrada--------------------
	signal neg: std_logic:='0';  -- Creamos una señal de entrada para B, con el objetivo que tenga activo en bajo

-------------CONTADOR-------------------------
signal cuenta1 : integer range 0 to 4;

-------------SEALES DIVISOR DE FRECUENCIA----------	 
    signal count : integer range 0 to 50000000;
    signal clk_state : std_logic := '0';


begin

---------------Divisor de frecuencia----------------------
    gen_clock : process (Clock, count, clk_state)
    begin
        if Clock'event and Clock = '1' then
            if count = 50000000 then
                count <= 0;
                clk_state <= not clk_state;
            else
					 count <= count + 1;
            end if;
        end if;
    end process;
	 salida <= clk_state;
	 
------------------------Proceso negación B------------------
process (B)
begin
		neg <= not B;
end process;

----------------Maquina de estados------------------------

Ent <= A & neg;

    PROCESS (Resetn, clk_state)
    BEGIN
        IF Resetn = '0' then
            y <= E1;
        elsif clk_state'event and clk_state = '1' then
				CASE y IS
                WHEN E1 =>
                    IF (Ent = "00") or (Ent = "01") or (Ent = "10") THEN
                        y <= E1;
                    ELSE
                        y <= E2;
                    END IF;
                WHEN E2 =>
                    IF  (Ent = "11") THEN
                        y <= E3;
                    ELsif
								Ent = "01" then
								y <=E2;
								else
                        y <= E1;
                    END IF;
                WHEN E3 =>
                    IF  (Ent = "00") THEN
                        y <= E4;
                    ELsif
								Ent = "01" then
								y <=E3;
								else
                        y <= E1;
                    END IF;
					WHEN E4 =>
                    IF  (Ent = "11") THEN
                        y <= E5;
                    ELsif
								Ent = "01" then
								y <=E4;
								else
                        y <= E1;
                    END IF;
					WHEN E5 =>
            if y = E5 then
                if cuenta1 = 4 then
                    cuenta1 <= 0;
						  y <= E1;
                else
                    cuenta1 <= cuenta1 + 1;
						  y <= E5;
                end if;
            end if;
            end case;
			end if;
    end process;
    
    z <= '1' when y = E5 else '0';
end Behavioral;
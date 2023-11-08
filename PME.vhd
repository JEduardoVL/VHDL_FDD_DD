--------------------------------Descripción del problema------------------------------------
-- Se desea diseñar el circuito de control de un semáforo de peatones, cuyo funcionamiento 
-- se describe a continuación. Mientras no se active el pulsador (P = 0), el semáforo 
-- permanecerá por tiempo indefinido en VERDE. Cuando se pulse P, se encenderá en el 
-- siguiente ciclo de reloj la luz AMBAR, sin apagarse la VERDE, y transcurridos 5 
-- segundos, se apagarán ambas y se encenderá la ROJA durante 40 segundos, finalizados 
-- los cuales se volverá a la situación inicial con sólo la luz VERDE encendida. Se supone 
-- que P se pulsa sólo cuando esté encendida la luz 6 VERDE, y nunca en los restantes casos
--------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
  
entity PME is    
    port (
        P: in std_logic;  --- Entrada P que indicara el inicio de la máquina de estado
        Resetn : in std_logic; --- Indica cuando se resetea la máquina
        Clock : in std_logic;  -- Entrada de reloj para la FPGA
        v : out std_logic :='0'; -- Salida del color verde
	  a : out std_logic:='0';  -- Salida color amarillo
	  r : out std_logic :='0'  -- salida color rojo
    );
end PME;

architecture Behavioral of PME is

-----------------------Estados----------------------------
    type State_type is (E1,E2,E3);
    signal y : State_type;

------------------------Cuentas---------------------------
signal cuenta1 : integer range 0 to 4;
signal cuenta2 : integer range 0 to 39;
	 
------------------Señal divisor de frecuencia--------------
    signal count : integer range 0 to 25000000;
    signal clk_state : std_logic := '0';

begin

---------------Divisor de frecuencia----------------------
    gen_clock : process (Clock, count, clk_state)
    begin
        if Clock'event and Clock = '1' then
            if count = 25000000 then
                count <= 0;
                clk_state <= not clk_state;
            else
					 count <= count + 1;
            end if;
        end if;
    end process;

----------------Maquina de estados------------------------
    PROCESS (Resetn, clk_state)
    BEGIN
        IF Resetn = '0' then
            v <= '0';
		a <= '0';
		r <= '0';
		y <= E1;
        elsif clk_state'event and clk_state = '1' then
				CASE y IS
                WHEN E1 =>
                    IF P = '0'  THEN
	                     v <= '1';
	                     a <= '0';
	                     r <= '0';
				         y <= E1;
                    ELSE
				         y <= E2;
					     v <= '1';
				         a <= '1';
                    END IF;
                WHEN E2 =>
			        if cuenta1 = 4 then
                         cuenta1 <= 0;
			            	y <= E3;
				            v <='0';
				            a <='0';
			            	r <='1';
                    else
                        cuenta1 <= cuenta1 + 1;
				            v <= '1';
				            a <= '1';
                            y <= E2;			
					 end if;
                WHEN E3 =>
                        if cuenta2 = 39 then
                          cuenta2 <= 0;
		            		y <= E1;
			            	r <='0';
			            	v <='1';
			            	a <='1';
                        else
                          cuenta2 <= cuenta2 + 1;
				            r <='1';
                            y <= E3;
                         end if;				
                 end case;
		end if;
    end process;
end Behavioral;

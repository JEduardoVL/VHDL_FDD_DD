library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Contador is   
    Port (  
        clk50Mhz : in  std_logic;
        reset : in std_logic;
        C : in std_logic; --señal para el control de conteo (ascendente o descendente)
		  D1 : out std_logic_vector(6 downto 0); -- salida al display de 7 segmentos
		  D2 : out std_logic_vector(6 downto 0) -- segunda salida para display de 7 segmentos
    );
end Contador;

architecture Behavioral of Contador is

    -------Señales Cuentas-----------
    signal cuenta1 : integer range 0 to 9;
    signal cuenta2 : integer range 0 to 6;
    signal clkDec : std_logic := '0';

    ------------Divisor de frecuencia-----------------------
  
    signal count : integer range 0 to 25000000;
    signal clk_state: std_logic :='0';

begin

	
gen_clock: process (clk50Mhz, count, clk_state)
begin

		if(clk50Mhz'event and clk50Mhz='1') then
			if count = 25000000 then
				count <= 0;
				clk_state <= not clk_state;
			else
				count <= count +1;
			end if;
	end if;
	
end process;

    -----------Contador Unidades------------------
    process (clk_state, Reset, C)
    begin
        if Reset ='1' then
            cuenta1<=0;
            cuenta2<=0;
            clkDec<='0';

        elsif ( clk_state'event and clk_state='1') then
            if C = '1' then
                if cuenta1 = 5 and cuenta2 = 6 then 
                    cuenta1 <= 0;
                    cuenta2 <= 0;
                else
                    if cuenta1 = 9 then
                        cuenta1 <= 0;
                    else
                        cuenta1 <= cuenta1 + 1;
                    end if;
                    if  cuenta1 = 9 then
                        cuenta2 <= cuenta2 + 1;
                    end if;
                end if;
            else
                if cuenta1 = 0 and cuenta2 = 0 then
                    cuenta1 <= 5;
                    cuenta2 <= 6; 
                else
                    if cuenta1 = 0 then
                        cuenta1 <= 9;
                        clkDec <='1';

                    else
                        cuenta1 <= cuenta1 - 1;
                        clkDec <='0';
                    end if;
        
                        if cuenta1 = 0 then
                            cuenta2 <= cuenta2 - 1;
                        end if;

                end if;
            end if;
        end if;
    end process;
	 
process(cuenta1)
begin
if cuenta1 = 0 then
	D1 <= "1000000";
	elsif cuenta1 = 1 then
	D1 <= "1111001";
	elsif cuenta1 = 2 then
	D1 <= "0100100";
	elsif cuenta1 = 3 then
	D1 <= "0110000";
	elsif cuenta1 = 4 then
	D1 <= "0011001";
	elsif cuenta1 = 5 then
	D1 <= "0010010";
	elsif cuenta1 = 6 then
	D1 <= "0000010";
	elsif cuenta1 = 7 then
	D1 <= "1111000";
	elsif cuenta1 = 8 then
	D1 <= "0000000";
	elsif cuenta1 = 9 then
	D1 <= "0000001";
	else
	D1<="1111111";
end if;
end process;

process(cuenta2)
begin
if cuenta2 = 0 then
	D2 <= "1000000";
	elsif cuenta2 = 1 then
	D2 <= "1111001";
	elsif cuenta2 = 2 then
	D2 <= "0100100";
	elsif cuenta2 = 3 then
	D2 <= "0110000";
	elsif cuenta2 = 4 then
	D2 <= "0011001";
	elsif cuenta2 = 5 then
	D2 <= "0010010";
	elsif cuenta2 = 6 then
	D2 <= "0000010";
	elsif cuenta2 = 7 then
	D2 <= "1111000";
	elsif cuenta2 = 8 then
	D2 <= "0000000";
	elsif cuenta2 = 9 then
	D2 <= "0000001";
	else
	D2<="1111111";
end if;
end process;

end Behavioral;

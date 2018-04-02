%{
avança 10% 5% 5% 5%
volta 20% 20% 20% 30%

Analisar como que o número de vezes influencia o boxplot.
Fazer boxplot
%}

testes = input('Digite o número de testes: ');

frente = [0.1];
tras = [0];
estado = [1];


for i = drange(1:testes)
    rvai = 1*rand;
    rvem = 1*rand;
    
    if estado == 1
        frente = horzcat(0.1);
        tras = horzcat(0);
    end
    
    if estado == 4
        frente = horzcat(0);
        tras = horzcat(0.3);
    end
    
    if frente >= rvai
        estado = estado + 1;
        frente = horzcat(0.05);
    end
        
    if tras >= rvem
        estado = estado - 1;
        tras = horzcat(0.2);
    end     
    
end

fprintf('estado = %d\n',estado);
%fprintf('estado = %d\n',estado);
%fprintf('estado = %d\n',estado);
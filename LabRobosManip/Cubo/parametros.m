function  [usrRef, usrRotx, usrRoty, usrRotz] = parametros(P0)
while(1)
    usrRef = input('Sistema de referencia fixo no mundo (W), ou fixo no cubo (C): \n', 's');
    while(usrRef ~= 'W' & usrRef ~= 'C')
        fprintf('Entrada inválida\n');
        usrRef = input('Sistema de referencia fixo no mundo (W), ou fixo no cubo (C): \n', 's');
    end
    %Valores em graus
    usrRotx = input('Rotação em torno de X: ');
    usrRoty = input('Rotação em torno de Y: ');
    usrRotz = input('Rotação em torno de Z: ');
    
    %
    for i = 1:1:60
        global P
        rotacao(usrRef, i*usrRotx/60, i*usrRoty/60, i*usrRotz/60)
        DesenhaCubo(P)
        %clf
    end
    
    while(1)
        usrAskAgain = input('Deseja fazer outra transformação? [S/N]\n', 's');

        if(usrAskAgain == 'N' | usrAskAgain == 'n')
            return
        elseif(usrAskAgain ~= 'S' & usrAskAgain ~= 's')
            fprintf('Entrada inválida\n');
        else
            break
        end
    end
end


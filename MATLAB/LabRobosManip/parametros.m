function  [usrRef, usrRotx, usrRoty, usrRotz] = parametros()
while(1)
    usrRef = input('Sistema de referencia fixo no mundo (W), ou fixo no cubo (C): \n', 's');
    while(usrRef ~= 'W' & usrRef ~= 'C')
        fprintf('Entrada inv�lida\n');
        usrRef = input('Sistema de referencia fixo no mundo (W), ou fixo no cubo (C): \n', 's');
    end
    %Valores em graus
    usrRotx = rotx(input('Rota��o em torno de X '));
    usrRoty = roty(input('Rota��o em torno de Y '));
    usrRotz = rotz(input('Rota��o em torno de Z '));
    
    while(1)
        usrAskAgain = input('Deseja fazer outra transforma��o? [S/N]\n', 's');

        if(usrAskAgain == 'N' | usrAskAgain == 'n')
            return
        elseif(usrAskAgain ~= 'S' & usrAskAgain ~= 's')
            fprintf('Entrada inv�lida\n');
        else
            break
        end
    end
end







function  [usrRef, usrRotx, usrRoty, usrRotz] = parametros(P0)
global H
global P
global P0

H = eye(3);

while(1)
    %Menu
    %Trata o referencial
    usrRef = input('Sistema de referência fixo no mundo (W), ou fixo no cubo (C): \n', 's');
    while(usrRef ~= 'W' & usrRef ~= 'C')
        fprintf('Entrada inválida\n');
        usrRef = input('Sistema de referência fixo no mundo (W), ou fixo no cubo (C): \n', 's');
    end
    %Valores em graus
    usrRotx = input('Rotação em torno de X: ');
    usrRoty = input('Rotação em torno de Y: ');
    usrRotz = input('Rotação em torno de Z: ');
    %Animacao
    for i = 1:60
        rotacao(usrRef, usrRotx/60, usrRoty/60, usrRotz/60);
        DesenhaCubo(P);
        pause(15E-3);
    end
    %Executa novamente
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


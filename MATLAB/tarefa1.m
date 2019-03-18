clear

%{
while(1)
    usrRef = input('Sistema de referencia fixo no mundo (W), ou fixo no cubo (C): ', 's');
    usrRotx = input('Rotação em torno de X [S/N] ', 's');
    usrRoty = input('Rotação em torno de Y [S/N] ', 's');
    usrRotz = input('Rotação em torno de Z [S/N] ', 's');
    usrAskAgain = input('Deseja fazer outra transformação? [S/N]', 's');
    
    if (usrAskAgain ~= 's' | usrAskAgain ~= 'S') & (usrAskAgain == 'n' | usrAskAgain == 'N')
        break
    else 
        usrAskAgain = input('Deseja fazer outra transformação? [S/N]', 's');
    end
end
%}
%%

P = []; %Parâmetro de entrada
vert1 = [0 ; 1];
vert2 = [1 ; 0];
vert3 = [1 ; 1];








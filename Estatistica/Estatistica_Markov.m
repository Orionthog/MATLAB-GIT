%{
Quando n�mero de caras for igual o n�mero de coroas eu ganho e paro de
jogar. Quantas intera��es s�o precisas na m�dia?
%}


intera = input('Digite o n�mero de rodadas: ');
testes = input('Digite o n�mero de testes: ');
media = [];

for j = drange(1:intera)
    vector = [];
    for i = drange(1:testes)
        r = round(1*rand);  %cara = 0, coroa = 1
        fprintf('r = %d \n',r);
        vector = horzcat(vector, r);
        fprintf('vector = %d \n', vector)

        if (mod(i,2) == 0) %verifica se i � par, pois intera��o �mpar � irrelevante
            x = [];
            x = sum(ones(1, i))/2;
            flag = sum(vector);
            fprintf('x = %d \n\n', x);
            fprintf('flag = %d \n\n', flag);
            if flag == x
                fprintf('� tetraaaaaa\n');
                vector = [];
                break;
            end
        end
        fprintf('\n');
    end
    fprintf('\n');
    fprintf('O n�mero de intera��es necess�rias foi de i = %d \n',i);
    media = horzcat(media, i);
    fprintf('mean = %d \n', mean(media));
end

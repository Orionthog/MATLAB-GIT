testes = input('Digite o número de testes: ');

suc = 0;
dblsuc = 0;

for i = drange(1:testes);
    %disp(i);
    moeda = round(40*rand);
    disp('Moeda :', moeda);
    lado = round(2*rand);
    
    if moeda < 35
        dblsuc = dblsuc + 1;
        disp(dblsuc);
    end
end
disp(x);
disp(testes);
x1 = [19;23;27;31;35;39;43;47;51;55;59;63;67;71;75;79;83;87;91;95];
y1 = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20];

f1 = polyfit(x1,y1,1);

hold on
plot(x1,y1,'ob');
plot(x1,polyval(f1,x1),'-b');
hold off;

grid
legend('Produto A');
axis([18,100,0,21])
xlabel('Quantidades Consumidas (mil unidades)');
ylabel('Preço (mil R$)');

disp(f1);

syms x;
elas1 = diff(-3*x+100);
    
disp(elas1);
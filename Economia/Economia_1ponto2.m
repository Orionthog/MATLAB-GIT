x1 = [97;94;91;88;85;82;79;76;73;70;67;64;61;58;55;52;49;46;43;40];
y1 = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20];[97;94;91;88;85;82;79;76;73;70;67;64;61;58;55;52;49;46;43;40];

x2 = [160;130,;106;107;81;61;54;42;38;30;27;20;17;15;13;9;9;7;6;4];
y2 = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20];

f1 = polyfit(x1,y1,1);
f2 = polyfit(x2,y2,3);

hold on
plot(x1,y1,'xb');
plot(x2,y2,'*r');
plot(x1,polyval(f1,x1),'-b');
plot(x2,polyval(f2,x2),'--r');
hold off;

grid
legend('Produto A','Produto B');
axis([0,170,0,21])
xlabel('Preço (mil R$)');
ylabel('Quantidades Consumidas (mil unidades)');

disp(f1);
disp(f2);

syms x;
elas1 = diff(-3*x+100);
elas2 = diff(-.0304*x^3 + 1.5472*x^2 -27.7669*x + 183.3986);

disp(elas1);
disp(elas2);

%plot(x1, elas1,'-b');
%plot(x2, polyval(elas2,x2),'--r');
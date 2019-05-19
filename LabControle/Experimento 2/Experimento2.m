clear
%Malha Aberta
t = 0:0.1:100;
Vd0 = [0.484 1.07 2.05 3.04 4.01 5.02 6.03 7.03 8.03 9.08 9.99 ];
Vd025 = [0.213 530E-3 943E-3 1.36 1.84 2.3 2.69 3.27 3.58 3.98 4.32];
G2 = [1 2 4 6 8 10 12 14 16 18 20];


Rpa = zeros( 1 , length(Vd0) );
for i = 1:length(Vd0)
    Rpa( 1 , i ) = Vd0( 1 , i ) / Vd025( 1 , i );
end

figure(1)
clf
plot(G2, Rpa, 'x')
hold on
grid on
yline(2, 'r')
%plot(t, RpaTeorico)
title('Rejeição de Ruído para Vi = 0,5 V e G1 = 1')
xlabel('G2')
ylabel('RPa')
legend('Valores Medidos', 'Valor Teorico', 'Location', 'Southeast')
ylim([1.8 2.4])
xlim([0 21])
%%
G2 = [1 2 4 6 8 10 12 14 16 18 20];
Vd0 = [0.52 1.03 2 3.05 4.01 5.02 6.04 7.1 8.22 9.26 9.99];
Vd025 = [0.733 1.435 2.86 4.34 5.72 7.13 8.59 9.55 11.57 13.05 13.99];

Rpa = zeros( 1 , length(Vd0) );
for i = 1:length(Vd0)
    Rpa( 1 , i ) = G2(i)*(Vd0( 1 , i ) / Vd025( 1 , i ));
end
aa = Rpa;
aa(2) = [];

figure(2)
clf
plot(G2, Rpa, 'x')
hold on
grid on
plot(t, t)
%plot(t, RpaTeorico)
title('Rejeição de Ruído para Vi = 0,5 V e G2 = 1')
xlabel('G1')
ylabel('RPa')
legend('Valores Medidos', 'Valor Teorico', 'Location', 'Southeast')
ylim([0 20])
xlim([0 21])

%%
%Malha Fechada

t = 0:0.01:20;
Vo1 = [ 8.31 5.35 5.05 4.88 4.82 4.74 4.68 4.67 4.59 4.59];
Vo1Vd = [ 3.17 3.9 4.02 4.12 4.18 4.21 4.2 4.24 4.21 4.23];
G2 = [1 4 6 8 10 12 14 16 18 20];

z = 4.*t./(1+t) - 2./(1+t);

figure(3)
clf
plot(G2, Vo1, 'x')
hold on
grid on
plot(G2, Vo1Vd, 'o')
plot(t, z)
title('Saída do sistema com chave fechada para G2 = 1')
xlabel('G1')
ylabel('V')
legend('Vi (Vd = 0V)', 'Vo (Vo = -2V)', 'Teórico' , 'Location', 'Southeast')
ylim([0 10])
xlim([0 21])

%%

t = 0:0.01:20;
Vo1 = [ 5.4 5 4.83 4.73 4.72 4.61 4.61 4.57 4.56 5.4 ];
Vo1Vd = [ 2.78 2.66 2.59 2.54 2.55 2.49 2.55 2.49 2.48 2.78 ];
G2 = [1 4 6 8 10 12 14 16 18 20];

z = 4.*t./(1+t) - 2.*t./(1+t);

figure(4)
clf
plot(G2, Vo1, 'x')
hold on
grid on
plot(G2, Vo1Vd, 'o')
plot(t, z)
title('Saída do sistema com chave fechada para G1 = 1')
xlabel('G2')
ylabel('V')
legend('Vi (Vd = 0V)', 'Vo (Vo = -2V)', 'Teórico' , 'Location', 'Southeast')
ylim([0 10])
xlim([0 21])


%%
%Rejeição Perturbação Malha Fechada

G2 = [1 4 6 8 10 12 14 16 18 20];
Vd0 = [ 5.4 5 4.83 4.73 4.72 4.61 4.61 4.57 4.56 5.4 ];
Vd025 = [ 2.78 2.66 2.59 2.54 2.55 2.49 2.55 2.49 2.48 2.78 ];

Rpa = zeros( 1 , length(Vd0) );
for i = 1:length(Vd0)
    Rpa( 1 , i ) = (Vd0( 1 , i ) / Vd025( 1 , i ));
end


figure(5)
clf
plot(G2, Rpa, 'x')
hold on
grid on
yline(2, 'r');
%plot(t, RpaTeorico)
title('Rejeição de Ruído com G1 = 1')
xlabel('G2')
ylabel('RPa')
legend('Valores Medidos', 'Valor Teorico', 'Location', 'Southeast')
ylim([1.7 2.1])
xlim([0 21])
%%

G2 = [1 4 6 8 10 12 14 16 18 20];
Vd0 = [ 8.31 5.35 5.05 4.88 4.82 4.74 4.68 4.67 4.59 4.59];
Vd025 = [ 3.17 3.9 4.02 4.12 4.18 4.21 4.2 4.24 4.21 4.23];

Rpa = zeros( 1 , length(Vd0) );
for i = 1:length(Vd0)
    Rpa( 1 , i ) = G2(i)*(Vd0( 1 , i ) / Vd025( 1 , i ));
end
af = Rpa;

figure(6)
clf
plot(G2, -Rpa, 'x')
hold on
grid on
plot(t, -t)
%plot(t, RpaTeorico)
title('Rejeição de Ruído com G2 = 1')
xlabel('G1')
ylabel('RPa')
legend('Valores Medidos', 'Valor Teorico', 'Location', 'Southeast')
ylim([-22 0])
xlim([0 21])

%%
%Melhoria de Rejeição
X = -af./aa;

figure(7)
clf
plot(G2, X, 'x')
hold on
grid on
yline(-1,'r');
%plot(t, XTeorico)
title('Melhora da Rejeição de Ruído')
xlabel('G1')
ylabel('RPa')
legend('Valores Medidos', 'Valor Teorico', 'Location', 'Southeast')
ylim([-4 -0.9])
xlim([0 21])

%%
%Sensibilidade Malha Fechada

%S = 1/(1-G1.*G2);
S = [0.33 0.265 0.199 0.041 0.164 0.143 0.109 0.076 0.063 0.056];

figure(8)
clf
plot(G2, -S, 'x')
hold on
grid on
plot(t, 1./(1-t));
title('Sensibilidade em Malha Fechada G2 = 1')
xlabel('G1')
ylabel('S')
legend('Valores Medidos', 'Valor Teorico', 'Location', 'Southeast')
ylim([-0.4 0])
xlim([0 21])

%%
%Sensibilidade Malha Aberta

%S = 1/(1-G1.*G2);
S = [0.947 1.010 1.003 0.997 1.011 1.005 0.969 1.047 1.126 0.771];

figure(9)
clf
plot(G2, S, 'x')
hold on
grid on
%plot(t, 1./(1-t));
title('Sensibilidade em Malha Aberta')
xlabel('G1')
ylabel('S')
legend('Valores Medidos', 'Valor Teorico', 'Location', 'South')
%ylim([-0.4 0])
xlim([0 21])


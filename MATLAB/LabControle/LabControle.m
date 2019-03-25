%% O que tem na planta
% Primeira Ordem
RPassaBaixa = 6.8E3;
CPassaBaixa = 22E-9;
RPassaAlta  = 10E3;
CPassaAlta  = 33E-9;
%Segunda Ordem
IndutSegOrd = 529.7E-3;
CapSegOrd = 96E-9;


FreqNat = 1/sqrt(IndutSegOrd*CapSegOrd);
FatAmort = input('Digite o fator de amort: '); % É um potênciometro, então tem que trocar depois
Ganho = input('Digite o ganho: ');

% Funções de Transferência
%% Primeira Ordem
tf(1, [RPassaBaixa*CPassaBaixa, Ganho])
step(tf(1, [RPassaBaixa*CPassaBaixa, Ganho]))

%% Segunda Ordem
tf(FreqNat^2, [1, 2*FatAmort*FreqNat, FreqNat^2])
figure
step(tf(FreqNat^2, [1, 2*0.2*FreqNat, FreqNat^2]), 'r')
figure
step(tf(FreqNat^2, [1, 2*1.0*FreqNat, FreqNat^2]), 'm')
figure
step(tf(FreqNat^2, [1, 2*2.0*FreqNat, FreqNat^2]), 'c')

%% Bode
magrc = tf(1, [RPassaBaixa*CPassaBaixa, Ganho])
magrlc = tf(FreqNat^2, [1, 2*FatAmort*FreqNat, FreqNat^2])
%[Ganho/(sqrt(1-(1/RPassaBaixa*CPassaBaixa)^2*(RPassaBaixa*CPassaBaixa)^2))])
%fase =tf(-atan(1/(sqrt(RPassaBaixa*CPassaBaixa))*RPassaBaixa*CPassaBaixa))
figure
bode(magrc)
figure
bode(magrlc)

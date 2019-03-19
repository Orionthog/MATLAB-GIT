T0 = se2(0, 0, 00*pi/180);
T1 = se2(1, 2, 30*pi/180);
T2 = se2(2, 1, 00*pi/180);
T3 = T1*T2;
T4 = T2*T1;

P = [3; 2];
P1 = inv(T1)*[P; 1];
P2 = inv(T2)*[P; 1];
e2h(P);
h2e(P1);

R = rotx(pi/2);
R1 = rotx(-pi/2); % = inv(R1)


%%

grid on
trplot2(T1, 'frame', '1', 'color', 'b')
axis([-1, 5, -1, 5])
hold on

trplot2(T2, 'frame', '2', 'color', 'r')
trplot2(T0, 'frame', '0', 'color', 'k')
trplot2(T3, 'frame', '3', 'color', 'm')
trplot2(T4, 'frame', '4', 'color', 'g')

plot_point(P, '*')
%%
figure
trplot(R, 'frame', 'R')
%%
figure
R1 = rotx(pi/2)*roty(pi/2);
tranimate(R1, 'frame', 'Ranim', 'fps', 60)
%%
figure
R0 = rotx(0);
trplot(R0, 'color', 'r')
%%
Ta = transl(1, 0, 0);
Tb = trotx(pi/2);

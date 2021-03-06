t = 0:2E-1:10;
t = t';
Td = 10;
global joint1 joint2 joint3 joint4 joint5 joint6 joint7

%Atribuicao dos valores de junta tal qual
%joint = c0 + c1*t + c2*t.^2 + c3*t.^3 + c4*t.^4 + c5*t.^5;
theta_s = 0;
theta_g = 90;
c0 = theta_s;
c1 = 0;
c2 = 0;
c3 = 10*(theta_g - theta_s)/(Td.^3);
c4 = 15*(theta_s - theta_g)/(Td.^4);
c5 = 06*(theta_g - theta_s)/(Td.^5);

pos = [c5 c4 c3 c2 c1 c0];
vel = polyder(pos);
acc = polyder(vel);
joint1 = [polyval( pos , t ) , polyval( vel , t ) , polyval( acc , t )];
joint2 = [polyval( pos , t ) , polyval( vel , t ) , polyval( acc , t )];

theta_g = 180;
c0 = theta_s;
c1 = 0;
c2 = 0;
c3 = 10*(theta_g - theta_s)/(Td.^3);
c4 = 15*(theta_s - theta_g)/(Td.^4);
c5 = 06*(theta_g - theta_s)/(Td.^5);
pos = [c5 c4 c3 c2 c1 c0];
vel = polyder(pos);
acc = polyder(vel);
joint3 = [polyval( pos , t ) , polyval( vel , t ) , polyval( acc , t )];

theta_g = -90;
c0 = theta_s;
c1 = 0;
c2 = 0;
c3 = 10*(theta_g - theta_s)/(Td.^3);
c4 = 15*(theta_s - theta_g)/(Td.^4);
c5 = 06*(theta_g - theta_s)/(Td.^5);
pos = [c5 c4 c3 c2 c1 c0];
vel = polyder(pos);
acc = polyder(vel);
joint4 = [polyval( pos , t ) , polyval( vel , t ) , polyval( acc , t )];

theta_g = 90;
c0 = theta_s;
c1 = 0;
c2 = 0;
c3 = 10*(theta_g - theta_s)/(Td.^3);
c4 = 15*(theta_s - theta_g)/(Td.^4);
c5 = 06*(theta_g - theta_s)/(Td.^5);
pos = [c5 c4 c3 c2 c1 c0];
vel = polyder(pos);
acc = polyder(vel);
joint5 = [polyval( pos , t ) , polyval( vel , t ) , polyval( acc , t )];
joint6 = [polyval( pos , t ) , polyval( vel , t ) , polyval( acc , t )];

theta_g = 0;
c0 = theta_s;
c1 = 0;
c2 = 0;
c3 = 10*(theta_g - theta_s)/(Td.^3);
c4 = 15*(theta_s - theta_g)/(Td.^4);
c5 = 06*(theta_g - theta_s)/(Td.^5);
pos = [c5 c4 c3 c2 c1 c0];
vel = polyder(pos);
acc = polyder(vel);
joint7 = [polyval( pos , t ) , polyval( vel , t ) , polyval( acc , t )];

%Matriz Nx7 que representa posição, velocidade e aceleração do braço
armPos = [joint1(:,1) , joint2(:,1) , joint3(:,1) , joint4(:,1) , joint5(:,1) , joint6(:,1) , joint7(:,1)];
armVel = [joint1(:,2) , joint2(:,2) , joint3(:,2) , joint4(:,2) , joint5(:,2) , joint6(:,2) , joint7(:,2)];
armAcc = [joint1(:,3) , joint2(:,3) , joint3(:,3) , joint4(:,3) , joint5(:,3) , joint6(:,3) , joint7(:,3)];

%Grafico de Posicao
figure(2)
clf
plot(t, joint1(:,1))
hold on
grid on
plot(t, joint2(:,1))
plot(t, joint3(:,1))
plot(t, joint4(:,1))
plot(t, joint5(:,1))
plot(t, joint6(:,1))
plot(t, joint7(:,1))
xlabel('Tempo [s]');
ylabel('Posicao [°]');
title('Posicao de Junta')
legend('Junta 1','Junta 2','Junta 3','Junta 4','Junta 5','Junta 6','Junta 7','Location', 'northeast')

%Grafico de Velocidade
figure(3)
clf
plot(t, joint1(:,2))
hold on
grid on
plot(t, joint2(:,2))
plot(t, joint3(:,2))
plot(t, joint4(:,2))
plot(t, joint5(:,2))
plot(t, joint6(:,2))
plot(t, joint7(:,2))
xlabel('Tempo [s]');
ylabel('Velocidade [°/s]');
title('Velocidade de Junta')
legend('Junta 1','Junta 2','Junta 3','Junta 4','Junta 5','Junta 6','Junta 7','Location', 'northeast')

%Grafico de Aceleracao
figure(4)
clf
plot(t, joint1(:,3))
hold on
grid on
plot(t, joint2(:,3))
plot(t, joint3(:,3))
plot(t, joint4(:,3))
plot(t, joint5(:,3))
plot(t, joint6(:,3))
plot(t, joint7(:,3))
xlabel('Tempo [s]');
ylabel('Aceleracao [°/s²]');
title('Aceleracao de Junta')
legend('Junta 1','Junta 2','Junta 3','Junta 4','Junta 5','Junta 6','Junta 7','Location', 'northeast')

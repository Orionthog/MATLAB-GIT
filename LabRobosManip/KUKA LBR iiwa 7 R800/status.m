t = 0:1E-2:10;
t = t';
Td = 10;

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

figure(2)
clf
plot(joint1(:,1))
hold on
plot(joint2(:,1))
plot(joint3(:,1))
plot(joint4(:,1))
plot(joint5(:,1))
plot(joint6(:,1))
plot(joint7(:,1))
title('Posicao de Junta')
legend('Junta 1','Junta 2','Junta 3','Junta 4','Junta 5','Junta 6','Junta 7','Location', 'northeast')

figure(3)
clf
plot(joint1(:,2))
hold on
plot(joint2(:,2))
plot(joint3(:,2))
plot(joint4(:,2))
plot(joint5(:,2))
plot(joint6(:,2))
plot(joint7(:,2))
title('Velocidade de Junta')
legend('Junta 1','Junta 2','Junta 3','Junta 4','Junta 5','Junta 6','Junta 7','Location', 'northeast')

figure(4)
clf
plot(joint1(:,3))
hold on
plot(joint2(:,3))
plot(joint3(:,3))
plot(joint4(:,3))
plot(joint5(:,3))
plot(joint6(:,3))
plot(joint7(:,3))
title('Aceleracao de Junta')
legend('Junta 1','Junta 2','Junta 3','Junta 4','Junta 5','Junta 6','Junta 7','Location', 'northeast')

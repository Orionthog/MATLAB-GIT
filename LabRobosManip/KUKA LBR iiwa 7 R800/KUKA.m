%%

%Parâmetros
a1 = 340;
a2 = 400;
a3 = 400;
a4 = 126;
theta1 = 0;
theta2 = 0;
theta3 = 0;
theta4 = 0;
theta5 = 0;
theta6 = 0;
theta7 = 0;
%Braço
L(1) = Link([0, -1*pi/2,  a1 , -pi/2 + theta1, 0]);
L(2) = Link([0,  1*pi/2,  0.0,    0  + theta2, 0]);
L(3) = Link([0,  1*pi/2, a2/2,    0  + theta3, 0]);
L(4) = Link([0, -1*pi/2,  0.0,    0  + theta4, 0]);
L(5) = Link([0, -1*pi/2, a3/2,    0  + theta5, 0]);
L(6) = Link([0,  1*pi/2,  0.0,    0  + theta6, 0]);
L(7) = Link([0,    0   , a4/2,  pi/2 + theta7, 0]);
 
kuka = SerialLink(L, 'name', 'kuka') 

%%
%Plot
kuka.plot([0 0 0 0 0 0 0])
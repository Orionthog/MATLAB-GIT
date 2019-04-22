%%
run('/home/igor.barbara/github/MATLAB-GIT/LabRobosManip/rvctools/startup_rvc.m')
%%
%Parametros
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
%Braco
L(1) = Link([ -pi/2 + theta1 ,  a1  , 0 , -1*pi/2]);
L(2) = Link([   0   + theta2 ,  0   , 0 ,  1*pi/2]);
L(3) = Link([   0   + theta3 , a2/2 , 0 ,  1*pi/2]);
L(4) = Link([   0   + theta4 ,  0   , 0 , -1*pi/2]);
L(5) = Link([   0   + theta5 , a3/2 , 0 , -1*pi/2]);
L(6) = Link([   0   + theta6 ,  0   , 0 , -1*pi/2]);
L(7) = Link([  pi/2 + theta7 , a4/2 , 0 ,     0  ]);

kuka = SerialLink(L, 'name', 'kuka') 

%%
%Plot
figure
kuka.plot(zeros(1, kuka.n))
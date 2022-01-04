% Konsta Keski-Mattinen 08.04.2021

close all
clear

p1 = [0;0;0];
p2 = [2;2;0];
p3 = [4;2;0];
p1_3 = [p1,p2,p3];

v1 = 2^(-0.5)*[-1;0;1];
v2 = 3^(-0.5)*[1;1;1];
v3 = 6^(-0.5)*[1;-2;1];

S = eye(3);
V = [v1, v2, v3];

u1_3 = V*p1_3;

alpha = pi/3;

% A
R1 = [cos(alpha) -sin(alpha) 0; 
      sin(alpha)  cos(alpha) 0; 
      0             0        1];
p1_3R1 = R1*p1_3;

figure('Name','A')
hold on
fill3(p1_3(1,:),p1_3(2,:),p1_3(3,:), 'r');
fill3(p1_3R1(1,:),p1_3R1(2,:),p1_3R1(3,:), 'b');
quiver3(0,0,0,S(1,1),S(1,2),S(1,3), 'r');
quiver3(0,0,0,S(2,1),S(2,2),S(2,3), 'r');
quiver3(0,0,0,S(3,1),S(3,2),S(3,3), 'r');
axis equal
grid on

% B
R2 = [cos(alpha) 0 sin(alpha); 
      0          1          0 ; 
      -sin(alpha) 0 cos(alpha)];
p1_3R2 = R2*p1_3;

figure('Name','B')
hold on
fill3(p1_3(1,:),p1_3(2,:),p1_3(3,:), 'r');
fill3(p1_3R2(1,:),p1_3R2(2,:),p1_3R2(3,:), 'b');
quiver3(0,0,0,S(1,1),S(1,2),S(1,3), 'r');
quiver3(0,0,0,S(2,1),S(2,2),S(2,3), 'r');
quiver3(0,0,0,S(3,1),S(3,2),S(3,3), 'r');
axis equal
grid on

% C
R3 = R1;
u1_3R3 = R3*u1_3;

figure('Name','C')
hold on
fill3(u1_3(1,:),u1_3(2,:),u1_3(3,:), 'r');
fill3(u1_3R3(1,:),u1_3R3(2,:),u1_3R3(3,:), 'b');
quiver3(0,0,0,S(1,1),S(1,2),S(1,3), 'r');
quiver3(0,0,0,S(2,1),S(2,2),S(2,3), 'r');
quiver3(0,0,0,S(3,1),S(3,2),S(3,3), 'r');
axis equal
grid on

% D
R4 = R2;
u1_3R4 = R4*u1_3;

figure('Name','D')
hold on
fill3(u1_3(1,:),u1_3(2,:),u1_3(3,:), 'r');
fill3(u1_3R4(1,:),u1_3R4(2,:),u1_3R4(3,:), 'b');
quiver3(0,0,0,S(1,1),S(1,2),S(1,3), 'r');
quiver3(0,0,0,S(2,1),S(2,2),S(2,3), 'r');
quiver3(0,0,0,S(3,1),S(3,2),S(3,3), 'r');
axis equal
grid on

% E
R5 = V*R1*inv(V)        
u1_3R5 = R5*u1_3;

figure('Name','E')
hold on
fill3(u1_3(1,:),u1_3(2,:),u1_3(3,:), 'r');
fill3(u1_3R5(1,:),u1_3R5(2,:),u1_3R5(3,:), 'b');
quiver3(0,0,0,S(1,1),S(1,2),S(1,3), 'r');
quiver3(0,0,0,S(2,1),S(2,2),S(2,3), 'r');
quiver3(0,0,0,S(3,1),S(3,2),S(3,3), 'r');
axis equal
grid on

% F
R6 = V*R2*inv(V);
u1_3R6 = R6*u1_3;

figure('Name','F')
hold on
fill3(u1_3(1,:),u1_3(2,:),u1_3(3,:), 'r');
fill3(u1_3R6(1,:),u1_3R6(2,:),u1_3R6(3,:), 'b');
quiver3(0,0,0,S(1,1),S(1,2),S(1,3), 'r');
quiver3(0,0,0,S(2,1),S(2,2),S(2,3), 'r');
quiver3(0,0,0,S(3,1),S(3,2),S(3,3), 'r');
axis equal
grid on


% G

alpha = pi/3
v=[1;1;1];
u1=[0;1;-1];
u2=cross(v, u1);
W=[u2, u1, v];
R1 = [cos(alpha) -sin(alpha) 0; 
      sin(alpha)  cos(alpha) 0; 
      0             0        1];
R7 = W*R1*inv(W);
p1_3R7 = R7*p1_3;

figure('Name','G')
hold on
fill3(p1_3(1,:), p1_3(2,:), p1_3(3,:), 'r');
fill3(p1_3R7(1,:), p1_3R7(2,:), p1_3R7(3,:), 'b');
quiver3(0,0,0,1,1,1, 'b');
quiver3(0,0,0,S(1,1),S(1,2),S(1,3), 'r');
quiver3(0,0,0,S(2,1),S(2,2),S(2,3), 'r');
quiver3(0,0,0,S(3,1),S(3,2),S(3,3), 'r');
axis equal
grid on
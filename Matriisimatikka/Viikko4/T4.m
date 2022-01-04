% Konsta Keski-Mattinen 08.04.2021

close all
clear

% A

v1=[1;0];
v2=[0;1];
u1=[2;0];
u2=[0;0.5];

% Av1=u1 Av2=u2 
% -> A*[v1 v2] = [u1 u2]
A=[u1 u2]*inv([v1 v2])

% B
v1=[1;0];
v2=[0;1];
u1=2^(-0.5)*[1;-1];
u2=2^(-0.5)*[1;1];

% Bv1=u1 Bv2=u2 
% -> A*[v1 v2] = [u1 u2]
B=[u1 u2]*inv([v1 v2])

% C
r = 3;
alpha = linspace(0, 2*pi, 100);
D = r*[cos(alpha);
    sin(alpha)];

DA = A*D;
DB = B*D;

figure
hold on
plot(D(1,:), D(2,:), 'k.');
plot(DA(1,:), DA(2,:), 'r.');
plot(DB(1,:), DB(2,:), 'b.');
plot(0, 0, 'kx');
axis equal
grid on

% D

r = 3;
alpha = linspace(0, 2*pi, 100);
D = r*[cos(alpha);
    sin(alpha)];

DAB = A*B*D;
DBA = B*A*D;

figure
hold on
plot(D(1,:), D(2,:), 'k.');
plot(DAB(1,:), DAB(2,:), 'r.');
plot(DBA(1,:), DBA(2,:), 'b.');
plot(0, 0, 'kx');
axis equal
grid on

% E

r = 1;
alpha = linspace(0, 2*pi, 100);
D = [2+cos(alpha);
    2+sin(alpha)];

DA = A*D;
DB = B*D;
DAB = A*B*D;
DBA = B*A*D;

figure
hold on
plot(D(1,:), D(2,:), 'k.');
plot(DA(1,:), DA(2,:), 'r.');
plot(DB(1,:), DB(2,:), 'b.');
plot(DAB(1,:), DAB(2,:), 'g.');
plot(DBA(1,:), DBA(2,:), 'm.');
plot(0, 0, 'kx');
axis equal
grid on

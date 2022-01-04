% Konsta Keski-Mattinen 27.4.

clear;
close all;
load('H7_data.mat');

% Ax = y
% USV'x=y
% USV'Vd=Uc
% USd=Uc
% U1*Sr*d1=U1*c1+U2*c2
% U1*Sr*d1=U1(U1')*y+U2(U2')*y
% U1*Sr*d1=U1(U1')*y
% U1*Sr*d1=y
% d1=inv(Sr)*U1'y

% x= V1d1+V2*d2                        pilkotaan x kahteen 
% I1*x1+I2*x2= V1*d1+V2*d2
% I2*x2-V2*d2= V1*d1-I1*x1
% [I2, -V2]*[x2, d2] = V1*d1-I1*x1
% Mu=b




[U, S, V] = svd(A1);
I=eye(7);
r=rank(A1);
V1 = V(:,1:r);
V2 = V(:,r+1:end);
U1 = U(:,1:r);
U2 = U(:,r+1:end);
Sr = S(:,1:r);
I1 = I(:,1:3);
I2 = I(:,3+1:end);
x1 = [0;0;0];

M=[I2 -V2];
b=V1*inv(Sr)*U1'*y1-I1*x1;

%tarkistetaan vastaus
rref([M b])
% ei ratkaisua -> optimoimaan

% x1 = K1d1+K2d2

K1= V1(1:3,:);
K2= V2(1:3,:);

% 0 = K1d1+K2d2
% -K1d1=K2d2

%ortagonaaliprojektio 
d2 = inv(K2'*K2)*K2'*(-K1*d1);
x = V1r*d1r + V2*d2

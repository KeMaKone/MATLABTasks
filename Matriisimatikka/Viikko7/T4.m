%Konsta Keski-Mattinen 28.4.2021

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

[U,S,V] = svd(A2);
r = rank(A2);

V1 = V(:,1:r);
V2 = V(:,r+1:end);
U1 = U(:,1:r);
U2 = U(:,r+1:end);
Sr = S(1:r,1:r);

%projektoidaan y2->y
%y=U'Uy2
y2
y = U1*U1'*y2

%d1=inv(Sr)*U1'*y;
d1=inv(Sr)*U1'*y2

x=V1*d1
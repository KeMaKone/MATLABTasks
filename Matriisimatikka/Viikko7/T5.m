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

[U,S,V] = svd(A3);
r = rank(A3);

V1 = V(:,1:r);
V2 = V(:,r+1:end);
U1 = U(:,1:r);
U2 = U(:,r+1:end);
Sr = S(1:r,1:r);


% |Ax-y|^2=|Sr*d1-c1|^2+|c2|^2
% d1=inv(Sr)*c1

d1 = inv(Sr)*U1'*y3;
x= V1*d1 % d2 valitaan 0 että tulisi lyhyin


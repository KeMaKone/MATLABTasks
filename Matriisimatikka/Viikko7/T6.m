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
t = [0;1;2;3;2;1;0]; 

V1 = V(:,1:r);
V2 = V(:,r+1:end);
U1 = U(:,1:r);
U2 = U(:,r+1:end);
Sr = S(1:r,1:r);
a1 = t(1:r);
a2 = t(r+1:end);

% |Ax-t|^2 =|Sr*d1-c1|^2+|c2|^2
% d1=inv(Sr)*c1
d1=inv(Sr)*a1;

% valitaan lähin sopiva
% |x-t|^2 = |V1d1+V2d2-t|^2
% |x-t|^2 = |V2d2-(t-V1d1|^2

%projektioidaan (t-V1d1) kantaan V2
p = V2*V2'*(t-V1*d1);


x = V1*d1+p
A3*x
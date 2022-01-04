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

% x= V1d1+V2*d2                                                 |x-p|
% x= V1*inv(Sr)*U1'y+V2*d2   valitaan lyhyimmäksi mahdolliseksi d2=a2
% x= V1*inv(Sr)*U1'y+V2*d2

[U, S, V] = svd(A1);
t = [0;1;2;3;2;1;0];
r=rank(A1);
V1 = V(:,1:r);
V2 = V(:,r+1:end);
U1 = U(:,1:r);
U2 = U(:,r+1:end);
Sr = S(:,1:r);
a2 = t(r+1:end);

x=V1*inv(Sr)*U1'*y1+V2*a2

A1*x-y1
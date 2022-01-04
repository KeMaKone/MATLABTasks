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

% x= V1d1+V2*d2
% x= V1*inv(Sr)*U1'y+V2*d2   valitaan lyhyimmäksi mahdolliseksi d2=0
% x= V1*inv(Sr)*U1'y

[U, S, V] = svd(A1);
r=rank(A1);

x=V(:,1:r)*inv(S(:,1:r))*U(:,1:r)'*y1
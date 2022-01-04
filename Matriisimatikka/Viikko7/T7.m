%Konsta Keski-Mattinen 28.4.2021

clear;
close all;
load('H7_data.mat');

[U, S, V] = svd(A1);
r=rank(A1);

x_A1=V(:,1:r)*inv(S(1:r,1:r))*U(:,1:r)'*y1
x_B1=V(:,1:r)*inv(S(1:r,1:r))*U(:,1:r)'*(y1+e1)

diff1 = norm(x_A1-x_B1)

% valitaan vain pyöristys rajaksi
diag(S)
r=3;

x_A2=V(:,1:r)*inv(S(1:r,1:r))*U(:,1:r)'*y1
x_B2=V(:,1:r)*inv(S(1:r,1:r))*U(:,1:r)'*(y1+e1)

diff2 = norm(x_A2-x_B2)

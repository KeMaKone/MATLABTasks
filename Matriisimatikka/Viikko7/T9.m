%Konsta Keski-Mattinen 28.4.2021

clear;
close all;
load('H7_data.mat');

[U, S, V] = svd(A3);
r=rank(A3);
%valitaan d2 että d2=a2
t=[0;1;2;3;2;1;0];
V1 = V(:,1:r);
V2 = V(:,r+1:end);
U1 = U(:,1:r);
U2 = U(:,r+1:end);
Sr = S(1:r,1:r);
% projektoidaan t kantaan V2
p=V2*V2'*t;

x_A1=V1*inv(Sr)*U1'*y3 +p
x_B1=V1*inv(Sr)*U1'*(y3+e3) +p

diff1 = norm(x_A1-x_B1)

% valitaan vain pyöristys rajaksi
diag(S)
r=3;
V1 = V(:,1:r);
V2 = V(:,r+1:end);
U1 = U(:,1:r);
U2 = U(:,r+1:end);
Sr = S(1:r,1:r);

x_A2=V1*inv(Sr)*U1'*y3 +p
x_B2=V1*inv(Sr)*U1'*(y3+e3) +p

diff2 = norm(x_A2-x_B2)

% Konsta Keski-Mattinen 13.4.2021

clear


v1=[1;0;0];
v2=[2;1;1];
v3=[1;-1;0];
V=[v1,v2,v3];

v1_L =[1;-1];
v2_L =[2;0];
v3_L =[1;1];


% A 
x_V=[2;-1;5];

% L=AV
L = [v1_L, v2_L, v3_L];
A = L*inv(V)
% x_L = A*x
x_L = A*V*x_V

% B
y = [1;0;2];
y_L = A*y
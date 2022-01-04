% Tekijä: Konsta Keski-Mattinen
% 19.03.2021

clear
close all

disp('Tehtävä 1')
figure('name','for-silmukka'), hold on

target = [33; 45; 3];
A = [ 36 51 13; 52 34 73; 0 7 1.1;];
x= zeros(3,1);
% Ax =target

% D ravinteet
Drav = [11;10;12];
i=0;
% x -> [A, ...; B, ...; C, ...]
for D=0:0.1:10
    i = i +1;
    x(:,i)= inv(A)*(target-D*Drav);    
end
plot(0:0.1:10, x(1,:), 'r', 0:0.1:10, x(2,:), 'b', 0:0.1:10, x(3,:), 'g');

figure('name', 'while-silmukka'), hold on
clear x D i

i=1;
D=0;
x= A\(target-D*Drav)
x_axel=[D];
D=D+0.1;
while x(1,i)>=0 && x(2,i)>=0 && x(3,i)>=0
    x=[x, A\(target-D*Drav)];
    x_axel = [x_axel, D];
    D = D + 0.1;
    i = i + 1;
end
plot(x_axel, x(1,:), 'r', x_axel, x(2,:), 'b', x_axel, x(3,:), 'g');
% Konsta Keski-Mattinen 08.04.2021

close all
clear

%% A)

x = [3;6];
alpha = -60/180 *pi
R = @(alpha) [cos(alpha), -sin(alpha); sin(alpha), cos(alpha)];


x_new = R(alpha)*x


figure, hold on
plot(x(1), x(2), "ro");
plot(x_new(1), x_new(2), "rx");
plot(0,0,"k.");
axis equal
grid on

%% B)

clear

x = [3;6];
p = [1;2];
alpha = -60/180 *pi
R = @(alpha) [cos(alpha), -sin(alpha); sin(alpha), cos(alpha)];


x_new = (R(alpha)*(x-p))+p


figure, hold on
plot(x(1), x(2), "ro");
plot(x_new(1), x_new(2), "rx");
plot(0,0,"bd");
plot(p(1), p(2), "bd")
axis equal
grid on
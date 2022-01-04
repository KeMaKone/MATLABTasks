% Konsta Keski-Mattinen 08.04.2021

close all
clear

%% A)

x = [3;6;0];
v = [2;1;1];
v = v/norm(v);
alpha = 60/180 *pi;
R = @(alpha) [cos(alpha), -sin(alpha); sin(alpha), cos(alpha)];
u1 = [0; 1; -1]; % luodaan ortagonaali esitetyllä kikalla
u1 = u1/norm(u1)
u2 = cross(v, u1)
% tästä eteenpäin niin vahva vihko
U= [u1 u2 v]

x_U=U'*x

x_UR = [R(alpha)*[x_U(1); x_U(2)]; x_U(3)];
x_new = U*x_UR


figure, hold on
plot3(x(1), x(2), x(3), "ro");
plot3(x_new(1), x_new(2), x_new(3), "bo");
quiver3(0,0,0,v(1), v(2), v(3));
axis equal
grid on

%% B)

clear

x = [3;6;0];
v = [2;1;1];
v = v/norm(v);
p = [1;2;0];
alpha = 60/180 *pi;
R = @(alpha) [cos(alpha), -sin(alpha); sin(alpha), cos(alpha)];
u1 = [0; 1; -1]; % luodaan ortagonaali esitetyllä kikalla
u1 = u1/norm(u1)
u2 = cross(v, u1)
% tästä eteenpäin niin vahva vihko
U= [u1 u2 v]

x_s_U=U'*(x-p)

x_s_UR = [R(alpha)*[x_s_U(1); x_s_U(2)]; x_s_U(3)];
x_new = U*x_s_UR+p


figure, hold on
plot3(x(1), x(2), x(3), "ro");
plot3(x_new(1), x_new(2), x_new(3), "bo");
quiver3(p(1),p(2),p(3),v(1), v(2), v(3));
axis equal
grid on


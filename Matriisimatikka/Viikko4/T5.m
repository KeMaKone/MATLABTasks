% Konsta Keski-Mattinen 08.04.2021

close all
clear

p1 = [0;0;0];
p2 = [2;2;0];
p3 = [4;2;0];
p1_3 = [p1,p2,p3];

v1 = 2^(-0.5)*[-1;0;1];
v2 = 3^(-0.5)*[1;1;1];
v3 = 6^(-0.5)*[1;-2;1];

S = [1 0 0;
     0 1 0;
     0 0 1];
V = [v1, v2, v3];
u1_3 = V*p1_3

% Todetaan vektorit ortonormaaleiksi ottamalla vektorikolmitulo tai
% kertomalla itsensä transpoosilla
cross(cross(v1, v2), v3)
V'*V

figure 
hold on
fill3(p1_3(1,:),p1_3(2,:),p1_3(3,:), 'r');
fill3(u1_3(1,:),u1_3(2,:),u1_3(3,:), 'b');
quiver3(0,0,0,S(1,1),S(1,2),S(1,3), 'r');
quiver3(0,0,0,S(2,1),S(2,2),S(2,3), 'r');
quiver3(0,0,0,S(3,1),S(3,2),S(3,3), 'r');
quiver3(0,0,0,V(1,1),V(1,2),V(1,3), 'b');
quiver3(0,0,0,V(2,1),V(2,2),V(2,3), 'b');
quiver3(0,0,0,V(3,1),V(3,2),V(3,3), 'b');
axis equal
grid on
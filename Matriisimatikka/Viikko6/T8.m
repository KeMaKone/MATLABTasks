% Konsta Keski-Mattinen 21.4.2021

clear
close all

phi = @(x,i) x.^i;

x = linspace(0,1,9)';

v1 = phi(x,0)
v2 = phi(x,1)
v3 = phi(x,2)
v4 = phi(x,3)

P = @(x, U) U*U'*x;

%u_tilde=vi-PU(i-1)*v_i
%u_tilde=vi-P(x, U(i-1))*v_i

% u = u_tilde / norm(u_tilde)

u1 = v1/norm(v1);
U1 = [u1];

u2_tilde = v2-P(v2,U1);
u2 = u2_tilde/norm(u2_tilde);
U2 = [U1 u2];

u3_tilde = v3-P(v3,U2);
u3 = u3_tilde/norm(u3_tilde);
U3 = [U2 u3];


u4_tilde = v4-P(v4,U3);
u4 = u4_tilde/norm(u4_tilde);
U4 = [U3 u4];

U4'*U4 % tarkistetaan ortogonaalisuus.
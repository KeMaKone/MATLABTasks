% Konsta Keski-Mattinen 21.4.2021

clear
close all

v1= [1;0;0];
v2= [2;1;1];
v3= [1;-1;0];
v4= [1;0;1];
v5= [0;-1;0];
m1=[1.1;-1.0];
m2=[2.2;0.1];
m3=[0.9;1.0];
m4=[1.0;-0.9];
m5=[-0.1;2.1];

V= [v1, v2, v3, v4, v5];
M= [m1, m2, m3, m4, m5];


%L(x)=Ax
%M=AV  selvitetään käyttämällä pns
%U'*Uc=U'x, jossa U=V', c=A', x=M'
%V''*V'*A'=V''M'
%V*V'*A'=V*M'
%A'=inv(V*V')*V*M'
%A=(inv(V*V')*V*M')'

A = (inv(V*V')*V*M')'

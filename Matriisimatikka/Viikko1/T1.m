% Tekijä Konsta Keski-Mattinen 
% 09.03.2021

disp("KOhta A")
a=[1 2 3 4];
b=[1 2^3 3^3 4^3];

a=1:4
b= a.^3;

disp("Kohta b")

A=[1 2 3 4;1 2^3 3^3 4^4];

A=[a;b]

B=[A;A]

disp("Kohta c")

C=B(1: 2,2:end)
D=B(:,3:4)

disp("Kohta d")

I=eye(4)
E=reshape(1:16, 4, 4)

disp("E-I")
E-I
disp("E+2E")
E+2*E

disp("I'E")
I'*E
disp("E^3")
E^3
disp("Ea'")
E*a'

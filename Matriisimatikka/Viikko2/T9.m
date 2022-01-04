% Konsta Keski-Mattinen
% 22.03.2021
clc
clear
close
disp('Tehtävä 9')

disp('Tehtävä 9a')
% Aa=b

A= [ 1, 1, 1, 0, 0, 0;...
     0, 0, 0, 1, 1, 1;...
     1, 0, 0, 1, 0, 0;...
     0, 1, 0, 0, 1, 0;...
     0, 0, 1, 0, 0, 1];
%b = [ln(I0/m12); ln(I0/m22); ln(I0/m11); ln(I0/m21); ln(I0/m31)];

disp('Tehtävä 9b')
%Aa=b
%Aa=ln(I0)-ln(m)
%ln(m)=ln(I0)-Aa
%m=exp(ln(I0-Aa)

a=log(2)*ones(6,1);
I0= 100;
m =exp(log(I0)- A*a)


disp('Tehtävä 9c')

rank(A)
% koska rank on vähemmän kuin muuttujien määrä on yhtälöryhmällä ääretön
% määrä ratkaisuja, jos on. (vapaiden muutujien takia)

disp('Tehtävä 9d')

rref(A')

% poistetaan samalla portaalla olevat eli x6, jottei tietoa häviä
% x6 voidaan toisin sanoen esittää muiden lin komp

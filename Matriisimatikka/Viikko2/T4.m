% Tekijä: Konsta Keski-Mattinen
% 20.03.2021

clc
clear
close all
disp('Tehtävä 4a')

A= [ 1, 1, 1;
     0,-2, 1;
     1,-1, 2;
     0, 2,-1];
 
rref(A)
disp('matriisissa on vain 2 riippumatonta matriisia ja valitaan sarakkeet s1 ja s2')


disp('Tehtävä 4b')

disp('b=x1*a1+x2*a2+x3*a3')
disp('huomioiden äskeisessä kohdassa huomioiten sarakkaiden riippuvuus')
disp('b=c1*s1+c2*s2')

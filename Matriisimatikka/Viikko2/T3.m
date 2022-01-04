% Tekijä: Konsta Keski-Mattinen
% 20.03.2021

clc
clear
close all
disp('Tehtävä 3a')

target=[0;1;-1];
a1=[ 1; 2; 3];
a2=[ 1;-1; 1];
a3=[-1; 0; 1];
tv=[-1; 0; 0]; 

rref([a1,a2,a3,tv, target])
disp('Nähdään että t jää vapaaksi, joten toimii kaikilla arvoilla')

disp('Tehtävä 3b')
rref([a1,a2,tv,target])

% Nähdään että
disp('Kelpaa vain t=-1')
% Tekijä Konsta Keski-Mattinen
% 09.03.2021

clear
close all

disp("Tehtävä 9")

% target values @ x=0
target=[0;...
        -1;...
        1];
    
% matrix A functions @ x=0
% A=[0^2, exp(-0), exp(2*0);...
%    2*0, -exp(-0), 2*exp(2*0);...
%    2, exp(-0), 4*exp(2*0)];
% ->
A=[0,1,1;...
   0,-1,2;...
   2,1,4];
    
% multipliers a, b, c

multipliers = A\target
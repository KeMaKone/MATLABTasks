% Konsta Keski-Mattinen 29.4.2021

close all
clear
load('H7_data.mat');

[U,S,V] = svd(M);

%sarakkeet, merkittävimmät
U10=U(:,1:10);

%projektoidaan
pM =U10*U10'*M;

sum(sum((M-pM).^2))

% Konsta Keski-Mattinen 28.4.2021

close all
clear
load('H7_data.mat');

mean1 = mean(D1')';

[U,S,V] = svd(D1-mean1);
coord = S*V'
figure
plot3(coord(1,:),coord(2,:),coord(3,:), 'r.');

%näkymästä näyttää että on kaksi erillaista joukkoa
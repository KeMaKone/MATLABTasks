% Tekijä Konsta Keski-Mattinen 2021:09:09
clear
close all

D = csvread('Matka-aikadata.txt');
x = D(:,1);
y = D(:,2);


anf = @(t0, k1, k2, x0, x) (t0+k1*(x./(1-x))).*(x<x0) + (t0+k1*(x0/(1-x0)+k2*(x-x0))).*(x>=x0);

f1 = fit(x, y, fittype(anf))

figure;
hold on
plot(x, y, 'k.')
plot(f1, 'r')
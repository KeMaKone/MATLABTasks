% Tekijä Konsta Keski-Mattinen
% 11.03.2021

clear
close all

disp("Tehtävä 10")

figure('name', 'Tehtävä 10'), hold on
n=10;

% Luodaan satunnaiset pisteet
x=2*rand(n,1)
%lasketaan arvot
g = @(x) x.^2-2*x+1+0.1*exp((x-1).^2);
values = g(x)

plot(x, g(x), 'gd');

% muodostetaan matriisi A jotta saadaan selvitettyä kaavalla
% Aa=g mitkä on a vektorin vakiot
A=zeros(n);

psi = @(x,i) sin(pi*i*x);

for c=1:1:n
    A(:,c)=psi(x,c);
end

%selvitetään vektori a
a=A\values

% muodostetaan piirtodata
x_p = linspace(0,2,10*n);
f = zeros(size(x_p));
for i = 1:1:n
    f=f+a(i)*psi(x_p,i);
end

%luodaan arvot plotattavaksi
plot(x_p, g(x_p), 'r', x_p, f, 'b');
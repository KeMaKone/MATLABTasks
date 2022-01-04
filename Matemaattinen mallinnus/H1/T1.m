% Tekijä Konsta Keski-Mattinen 2021:09:08
clear
close all

x = [-3; -2; -1; 0; 1; 2];
y = [1; -1; -7; -5; 5; 6];
x2 = x.^2;
one = ones(6,1);

% x^2+x+c=y
A = [x2, x, one];

m = A\y
fit1 = @(x) m(1)*x.^2+m(2)*x+m(3);

m2 = polyfit(x, y, 2);
fit2 = @(x) m2(1)*x.^2+m2(2)*x+m2(3);

hold on
plot(x, y, 'kx')
fplot(fit1, 'r')
fplot(fit2, 'b')
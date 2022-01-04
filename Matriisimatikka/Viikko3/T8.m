% Konsta Keski-Mattinen 29.3.2021

clear
close all


data = [0,4;
        1,3;
        2,2;
        3,0.5;
        4,0.01];
 
e = @(i, x) exp(-0.1*i*x)


x=data(:,1);
y=data(:,2); 
M = [e(1, x), e(2,x), e(3,x), e(4,x), e(5,x)];

det(M)

c=M\y

% plottaillaan
xplot= (min(x):0.01:max(x));
yplot = @(x) c(1)*e(1, x)+c(2)*e(2, x)+c(3)*e(3, x)+c(4)*e(4, x)+c(5)*e(5, x);

figure();

plot(xplot, yplot(xplot), 'r'); hold on
plot(x, y, 'b.'); hold on

grid on
% Konsta Keski-Mattinen 1.4.2021

clear
close all

xfunc = @(i) i/5;
yfunc = @(i) exp(-0.35*xfunc(i));
efunc = @(i, x) exp(-0.1*i*x);

n=15;

%Mc=b
%V'Vc=V'y
x=zeros(21,1);
y=zeros(21,1);
for i=0:1:20
    x(1+i,1)=xfunc(i);
    y(1+i,1)=yfunc(i);
end

M = zeros(21,n);
for i=1:n
   M(:,i)=efunc(i,x)
end

%c=M\y
c=inv(M'*M)*M'*y

% plottaillaan
xplot= (min(x):0.01:max(x))';
yplot = zeros(size(xplot, 1),1);
for i=1:n
    yplot=yplot + c(i)*efunc(i, xplot);
end


figure();

plot(xplot, yplot, 'r'); hold on
plot(x, y, 'b.'); hold on

grid on


% sovitus huononeen palojen lisääntyessä, sillä uuden pisteen painoarvo on
% suurempi kasvaa heitto palojen kanssa suuremmaksi

% numeerisesti hankalaa on myös se että numerot on kymmenkertojia
% toisistaan



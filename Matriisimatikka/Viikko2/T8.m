% Konsta Keski-Mattinen
% 22.03.2021
clc
clear
close
disp('Tehtävä 8')

f = @(t,i) sin((i-1)*t);
tn= linspace(0,pi*9/10,10)';

K=zeros(10);
K(:,1)=ones(10,1);
for i=2:10
   K(:,i) = f(tn,i);
   K(:,i) = K(:,i) /norm(K(:,i));
end

K

disp('Tehtävä 8a')

g1 = @(t) sin(2.3*t);
x1=g1(tn);
% vaihdetaan kantaa
x1K = inv(K)*x1

disp('Tehtävä 8b')
g2 = @(t) cos(t);
x2 = g2(tn);
x2K= inv(K)*x2

disp('Tehtävä 8c')
tn2 = linspace(0, 2*pi*9/10,10)';

K2=zeros(10);
K2(:,1)=ones(10,1);
for i=2:10
   K2(:,i) = f(tn2,i);
   K2(:,i) = K2(:,i) /norm(K2(:,i));
end

K2

rank(K2)

% koska matriisin arvo on vain 6 ei se muodostaisi R10 kantaa
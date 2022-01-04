% Konsta Keski-Mattinen
% 21.03.2021
clc
clear
close
disp('Tehtävä 7')
A= [ 1,-2, 0;...
     1, 1,-1;...
     1, 1, 1];
 
 B=[ 1, 0, 1;...
     1, 1, 0;...
     0, 1, 1];


v1=[1; 2; 0]./sqrt(5)
v2=[0;-1; 1]./sqrt(2)

rMatrix =zeros(3,10);
figure('name', 'tehtävä7');

for i=1:10
    rMatrix(:,i)=(rand()*5+5)*v1+(rand()*5+5)+(rand(3,1)/5-0.1);
end
plot3(rMatrix(1,:), rMatrix(2,:), rMatrix(3,:), 'r.'), grid on;

disp('Tehtävä 7a')
v3=cross(v1,v2);
v3=norm(v3);

disp('standardikanta')
rMatrix
disp('V kanta')
inv([v1,v2,v3])*rMatrix
disp('A kanta')
inv(A)*rMatrix
disp('B kanta')
inv(B)*rMatrix

disp('Tehtävä 7b')

kMatrix= zeros(3,10);

for i=1:10
    r1=rand();
    r2=rand();
    r3=rand()+10*(r1+r2);
   kMatrix(:,i)= [r1;r2;r3];
end    
kMatrix
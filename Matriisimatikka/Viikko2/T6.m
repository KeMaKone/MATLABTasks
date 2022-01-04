% Konsta Keski-Mattinen
% 21.03.2021
clc
clear
disp('Tehtävä 6a')
A= [ 1,-2, 0;...
     1, 1,-1;...
     1, 1, 1];
 
 B=[ 1, 0, 1;...
     1, 1, 0;...
     0, 1, 1];


disp('PA←B')
% x=Aa[x]a=Ab[x]b
%[x]a=Aa^-1 Ab [x]b
%[x]a=Pa<-b [x]b

Pab = inv(A)*B

disp('PB←A')

% x=Ab[x]b=Aa[x]a
%[x]b=Ab^-1 Aa [x]a
%[x]b=Pb<-a [x]a

Pba = inv(B)*A

disp('Tehtävä 6b')

V = zeros(3,5);
for i=1:5
    V(:,i)=rand()*A(:,2)+rand()*A(:,3); 
end

disp('standardikanta')
V

disp('A kanta')
inv(A)*V

disp('B kanta')
inv(B)*V
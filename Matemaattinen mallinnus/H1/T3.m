% Tekijä Konsta Keski-Mattinen 2021:09:10
clear
close all

% Lazy naive
%n = 1;
%A = [];
%while sum(A) < 21
%    A(end+1) = 1/n;
%    n = n+1;
%    sum(A)
%end
%n

n = 1;
sum = 0;
while sum<21
    sum = sum + 1/n;
    n = n+1;
end
tulos = n
% Konsta Keski-Mattinen 27.3.2021

% luodaaan matriisi A, ja vektori b

% A R6x2
A=rand(6,2)
%b R6x1
b=rand(6,1)

% minimoimaan neliöllä
% min |Ax-b|^2
% A'Ad=A'b

temp = rref([A'*A, A'*b]);
d= temp(:,end)
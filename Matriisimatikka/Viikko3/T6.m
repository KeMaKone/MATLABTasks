% Konsta Keski-Mattinen 29.3.2021
% kyseenalainen
clear

% Ax=b
% x=r+c1v1+...cnvn

A=[3, 1, 2, 2;
   3, 1, 2,-1];

b= [2; -1];

rank=rank(A)
[rmat, steps]=rref([A, b])


V=[A(:,steps(1)), A(:,steps(2))];
multi=(rmat(:,end));

% x=0*[3;3]+1*[2;1];
x = [0,0,0,1];

% ei aivan kaikesta voi. Matriisin arvo on vain 2 ja toisen kerroin on 0
% niin kaikki muut voi merkata nollaksi paitsi vektoria [2;-1]
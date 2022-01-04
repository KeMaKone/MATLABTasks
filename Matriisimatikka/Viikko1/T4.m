% Tekijä Konsta Keski-Mattinen
% 09.03.2021

A=rand(4);
b=rand(4,1);

Am=inv(A)

H=[A,eye(size(A))]

Hr=rref(H)

Hr=Hr(:, 1+size(A):end)

disp("Tarkistetaan onko suunnilleen samat")

Hr-Am

disp("Ratkaistaan yhtälöryhmä")
disp("inv() avulla")
x=Am*b
disp("Gauss-Jordanin avulla")
x=Hr*b
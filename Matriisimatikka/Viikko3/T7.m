% Konsta Keski-Mattinen 29.3.2021
% Vihko
clear


A=[ 5, 1, 2, 2;
    3, 3, 2,-1];

b=[2;-1];

% matlab \

matlab = A\b


%Lagrange

%muodostetaan kerroinmatriisi
kerroinmatriisi=[eye(4)*2, A(1,:)', A(2,:)'];
kerroinmatriisi= [kerroinmatriisi; 
                  A(1,:), 0, 0; 
                  A(2,:), 0, 0];

% variables = [x1;x2;x3;x4;l1;l2];
target = [zeros(4,1);2;-1];

lagrange =inv(kerroinmatriisi)*target

% vertaillaan
mag_matlab = sqrt(sum(matlab.^2))

mag_lagrange = sqrt(sum(lagrange.^2))
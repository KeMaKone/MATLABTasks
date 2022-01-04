% Konsta Keski-Mattinen 13.4.2021

H_S = [1   1   2   0;
       0  -1  -4 -12;
       0   0   1   0;
       0   0   0   8];

S_H = inv(H_S);

% p_S = H_S*p_H

% p_H = S_H*p_S
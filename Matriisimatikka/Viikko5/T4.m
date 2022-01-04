% Konsta Keski-Mattinen 13.4.2021

% H1=1S1
% H2=1S1-1S2
% H3=2S1-4S2+S3
% H4=-12S1+8S4
H_S = [1   1   2   0;
       0  -1  -4 -12;
       0   0   1   0;
       0   0   0   8]

S_H = inv(H_S)

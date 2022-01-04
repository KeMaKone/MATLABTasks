% Konsta Keski-Mattinen 13.4.2021

H_S = [1   1   2   0;
       0  -1  -4 -12;
       0   0   1   0;
       0   0   0   8];

S_H = inv(H_S);

% A

% p'(t) = V*D_V*p_V

% dS = S* Ds      | S on diagonaali(standardikanta)
% [ 0   = [0 1 0 0;  
%   1      0 0 2 0;     
%  2s1     0 0 0 3;
%  3s2]    0 0 0 0};
Ds=[0 1 0 0;  
    0 0 2 0;     
    0 0 0 3;
    0 0 0 0]


% Dh = S_H*Ds*H_S
Dh= S_H*Ds*H_S

% B

p_s = [4;2;0;6];
p_h = S_H * p_s;
t = sym('t');
S = [1, t, t^2, t^3];
H = [1, 1-t, 2-4*t+t^2, -12*t+8*t^3];

% dps = S * Ds* p_s
dps = S*Ds*p_s


%dph = H * Dh * p_h
dph = H*Dh*p_h

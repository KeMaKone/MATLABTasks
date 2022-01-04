% Konsta Keski-Mattinen 15.4.2021

% Konsta Keski-Mattinen 13.4.2021

H_S = [1   1   2   0;
       0  -1  -4 -12;
       0   0   1   0;
       0   0   0   8];

S_H = inv(H_S);

% A

% ip(t) = V*I_V*p_V

%c=0, 3.termi=0
% iS = S* Is      | S on diagonaali(standardikanta)
% [ t    =[0  0   0  0;   * [1 0  0   0; 
% 1/2t^2   1  0   0  0;      0 t  0   0;
% 1/3t^3   0 1/2  0  0;      0 0 t^2  0;
%  0    ]  0 0  1/3  0];     0 0  0  t^3];
Is=[0  0   0  0;  
    1  0   0  0;     
    0 1/2  0  0;
    0  0  1/3 0]


% Dh = S_H*Ds*H_S
Ih= S_H*Is*H_S

% B

p_s = [4;2;0;6];
p_h = S_H * p_s;
t = sym('t');
S = [1, t, t^2, t^3];
H = [1, 1-t, 2-4*t+t^2, -12*t+8*t^3];

% dps = S * Ds* p_s
ips = S*Is*p_s


%dph = H * Dh * p_h
iph = H*Ih*p_h

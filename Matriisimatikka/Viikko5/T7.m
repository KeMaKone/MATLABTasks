% Konsta Keski-Mattinen 13.4.2021

A = [3,2;
     0,-1];  %riippumattomalta näyttää

[V, D] = eig(A)
% testiin
V*D*inv(V)

% käyteään kaavaa A^k =XD^k*inv(x)
D10=D.^10;
A10 = V*D10*inv(V)

A*A*A*A*A*A*A*A*A*A
A^10
% Tekijä Konsta Keski-Mattinen
% 09.03.2021
disp("Tehtävä 3")

I=eye(4);
E=reshape(1:16, 4, 4);

M=E;
M(2:3,:)=E(:, 2:3)';
M(:, 2:3)=E(2:3,:)';

% Gauss-Jordan eliminaatio

GJ = rref(E)

% Selvitetään arvot
disp("Selvitetään arvot")

disp("E")
rank(E)
disp("GJ")
rank(GJ)

disp("Selvitetään ominaisarvot ja vektorit")
[V_E, D_E]=eig(E);
V_E
diag(D_E)

[V_GJ, D_GJ]=eig(GJ);
V_GJ
diag(D_GJ)
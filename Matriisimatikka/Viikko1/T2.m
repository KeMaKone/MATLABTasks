% Tekijä Konsta Keski-Mattinen
% 09.03.2021

disp("Tehtävä 2")

% Määritellään a, I ja E
a=1:4;
I=eye(4);
E=reshape(1:16, 4, 4);

% Transponoidaan E

% Määritetään kaksi apumatriisia muistiavarten

%voi toteuttaa myös suoraan säästääkseen muistia
rows = E(2:3,:)
cols = E(:, 2:3)

M=E;
M(2:3,:)=cols'
M(:, 2:3)=rows'



% ratkotaan Mx=a'

% x=inv(M)*a' % Bad way
x= M\ a'


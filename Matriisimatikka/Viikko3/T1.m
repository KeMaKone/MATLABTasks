% Konsta Keski-Mattinen 25.03.2021

clear
close all

disp('Tehtävä 1a')
x = [1;2];
v1 = [1;4];

V=[v1];

% Md=b
% V'Vd=V'x
% d=V'x
% V'*Vd=V'x

det=det(V'*V)
% erisuuri kuin nolla joten voidaan käyttää laskenta tapaa
d= (V'*V) \ (V'*x)

disp('->')
y=V*d
etaisyys=norm(y-x)

disp('Tehtävä 1b')
clear
x = [1;2;1];
v1 = [1;2;2];
v2 = [2;2;2];

V=[v1, v2];

% Md=b
% V'Vd=V'x
% d=V'x
% V'*Vd=V'x

det=det(V'*V)
% determinantti erisuuri kuin nolla joten voidaan käyttää laskenta tapaa
d= (V'*V) \ (V'*x)

disp('->')
y=V*d
etaisyys=norm(y-x)


disp('Tehtävä 1c')
clear
% tason normivektori
normv=[1;2;4];

%selvitetään tason virittävät vektorit
% toinen pistetulo =0
% toinen normin ja ylemmän ristitulolla

% x+2y+4z=0 % sovitaan x=1 ja y=2
% 1+2*2*2+4z=0
% 4z=-12
% z = -3
% yksi virittävistä vektoreista on 
v1= [1;2;-3]

% lasketaan ristitulolla toinen virittävä vektori
v2= cross(normv, v1)


x = [1;2;1];


V=[v1, v2];

% Md=b
% V'Vd=V'x
% d=V'x
% V'*Vd=V'x
det=det(V'*V)
% jos determinantti olisi nolla joutuisimme käyttämään menetelmää
temp = rref([V'*V, V'*x])
d= temp(:,end);

disp('->')
y=V*d
etaisyys=norm(y-x)

disp('Tehtävä 1d')
clear

x = [1;2;1;-1];
v1= [1;2;2;0];
v2= [2;0;1;1];
v3= [1;6;5;-1];

V=[v1, v2, v3];

% Md=b
% V'Vd=V'x
% d=V'x
% V'*Vd=V'x
det=det(V'*V)
% jos determinantti olisi nolla joutuisimme käyttämään menetelmää
temp = rref([V'*V, V'*x])
d= temp(:,end);

disp('->')
y=V*d
etaisyys=norm(y-x)
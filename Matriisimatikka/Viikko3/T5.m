% Konsta Keski-Mattinen 27.3.2021

clear
close all

%Ax=b

data = [1,-1,-1, 0;
        2,-1, 0, 2;
        3,-1, 1, 1;
        4, 0,-1, 3;
        5, 0, 0, 5;
        6, 0, 1, 4;
        7, 1,-1, 1;
        8, 1, 0, 3;
        9, 1, 1, 1];

x=data(:,2);
y=data(:,3);
z=data(:,4);

% luodaan matriisi V
V=[ones(size(x)), x, y, x+(y.^2), x.^2, y.^2];

% Ma=b
% V'Va=V'z
% a=inv(V'*V)V'z

det=det(V'*V)
% nolla joten voidaan käyttää laskenta tapaa
temp = rref([V'*V, V'*z])
a= temp(:,end)

%plottailua


[xplot, yplot] = meshgrid(-1:0.1:1, -1:0.1:1);
zplot = @(x,y) a(1)+a(2)*x+a(3)*y+a(4)*(x+(y.^2))+a(5)*x.^2+a(6)*y.^2;
zr=zplot(xplot, yplot);

figure();

mesh(xplot, yplot, zr); hold on
plot3(x,y,z, 'b.'); hold on

grid on
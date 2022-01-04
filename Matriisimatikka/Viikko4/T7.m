% Konsta Keski-Mattinen 08.04.2021

close all
clear

% A
n = [0; 0; 1];
v2 = n;

x = @(t) 10*cos(t);
y = @(t) 10*sin(t);

dx= @(t) -10*sin(t);
dy= @(t) 10*cos(t);

r = @(t) [x(t); y(t); 0*t];
dr= @(t) [dx(t);dy(t); 0*t];
v1= @(t) cross(v2, dr(t)) / norm(cross(v2, dr(t)));

t = linspace(0,2*pi,100);

curve = r(t);

figure
hold on
pause(1)
for i = 1: length(t)
    plot3(curve(1,:), curve(2,:), curve(3,:), 'r-');
    hold on
    plot3(curve(1,i), curve(2,i), curve(3,i), 'bo'); % character
    face = v1(t(i));
    plot3([0, face(1)]+curve(1,i), [0, face(2)]+curve(2,i), [0, face(3)]+curve(3,i), 'b')
    plot3([0, v2(1)]+curve(1,i), [0, v2(2)]+curve(2,i), [0, v2(3)]+curve(3,i), 'k')
    
    axis equal
    pause(0.05)
    hold off
end

% B


f = @(x,y) sin(4*x).*cos(2*y)
dfy = @(x,y) -2*sin(4*x).*sin(2*y);
dfx = @(x,y) 4*cos(4*x).*cos(2*y);

n = @(x,y) [-dfx(x,y); -dfy(x,y); 1]/norm([-dfx(x,y); -dfy(x,y); 1]);
r = @(t) [x(t); y(t); f(x(t), y(t))];
dr= @(t) [dx(t); dy(t); dfx(x(t),y(t)).*dx(t)+dfy(x(t),y(t)).*dy(t)];
v1= @(t) cross(n(x(t), y(t)), dr(t)) / norm(cross(n(x(t), y(t)), dr(t)));

t = linspace(0,2*pi,100);

curve = r(t);

figure
hold on
pause(1)
for i = 1: length(t)
    plot3(curve(1,:), curve(2,:), curve(3,:), 'r-');
    hold on
    plot3(curve(1,i), curve(2,i), curve(3,i), 'bo'); % character
    face = v1(t(i));
    plot3([0, face(1)]+curve(1,i), [0, face(2)]+curve(2,i), [0, face(3)]+curve(3,i), 'b')
    plot3([0, v2(1)]+curve(1,i), [0, v2(2)]+curve(2,i), [0, v2(3)]+curve(3,i), 'k')
    
    axis equal
    pause(0.05)
    hold off
end

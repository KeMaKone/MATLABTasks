% Konsta Keski-Mattinen 08.04.2021

close all
clear

% Konsta Keski-Mattinen 08.04.2021

close all
clear

p = [0; 0; 2];
n = [0; 0; 1];

x = @(t) 10*cos(t);
y = @(t) 10*sin(t);

dx= @(t) -10*sin(t);
dy= @(t) 10*cos(t);


f = @(x,y) sin(4*x).*cos(2*y);
dfy = @(x,y) -2*sin(4*x).*sin(2*y);
dfx = @(x,y) 4*cos(4*x).*cos(2*y);


n = @(x,y) [-dfx(x,y); -dfy(x,y); 1] / norm([-dfx(x,y); -dfy(x,y); 1]);
r = @(t) [x(t); y(t); f(x(t), y(t))];
dr= @(t) [dx(t); dy(t); dfx(x(t),y(t)).*dx(t)+dfy(x(t),y(t)).*dy(t)];
v1= @(t) cross(n(x(t), y(t)), dr(t)) / norm(cross(n(x(t), y(t)), dr(t)));
v2= @(t) n(x(t), y(t));
v = @(t) dr(t)/norm(dr(t));
B = @(t) [v1(t), v(t), v2(t)];

t = linspace(0,2*pi,1000);

p_t = @(t) p-r(t);

target = zeros(3,length(t));
for i = 1 : length(t)
   target(:,i)=B(t(i))'*p_t(t(i));
end

figure
plot3(target(1,:),target(2,:),target(3,:))
axis equal

% hyvä sipsi, hahmolla varmaan hyvät pahoinvoinnit
% Tekijä Konsta Keski-Mattinen
% 09.03.2021

clear all
close all

disp("Tehtävä 5")
disp("Kohta a")


disp("For-silmukka esille")
figure('Name','For-silmukka')

for n = 0:1:100
    x = 0.01*pi*n;
    plot(n, f(x), 'ro'), hold on
    pause(0.05);
end

disp("While simulla esille")
figure('Name', 'While-silmukka')

n = 0;
while n<100
    x = 0.01*pi*n;
    plot(n, f(x), 'bx'), hold on
    pause(0.05);
    n = n + 1;
end


disp("Kohta b")

disp("Plotin ominaisuuksia käyttäen")
figure('Name', 'Plotin ominaisuutta')

plot(0:0.01*pi:0.01*pi*100,f(0:0.01*pi:0.01*pi*100), 'g')


function out = f(x)
    out = sin(x);
end
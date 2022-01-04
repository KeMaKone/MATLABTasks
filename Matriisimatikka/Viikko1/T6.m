% Tekijä Konsta Keski-Mattinen
% 09.03.2021

clear
close all

disp("Tehtävä 6")

target=[33;45;3];

% matrix for foods. cols are foods and rows are nutrients

A=[36,51,13,11;...
    52,34,73,10;...
    0,7,1.1,12];

Ar=A(:,1:end-1);

% Jotta voitaisiin x ruualla toteuttaa dietti on dietin oltava vektorien 
% määräämässä avaruudessa
disp("Vain ravintolajit A, B ja C")
rref([Ar, target])

disp("Koska matriisi on täydellisen sievistynyt ravintoaineet ovat toisista ruuista riippumattomia, voidaan dietti toteuttaa\n")

disp("Ravintolajit A,B,C ja D")
rref([A, target])

disp("Ruokavaliolla A,B, C ja D ei voi täydellisesti diettiä toteuttaa, koska matriisi ei ole täydellisessä porrasmuodossa\n")


%Tekijä Konsta Keski-Mattinen 2021.11.08 
clear
close all;

a = 300; %Munien määrä per naaras;
b = 100; %Ympäristön kantokyky koteloille
i = 0.70; %Eri vaiheissa kuolevat-%
j = 0.70; %Eri vaiheissa kuolevat-% 
k = 0.70; %Eri vaiheissa kuolevat-% 
l = 0.60; %Eri vaiheissa kuolevat-% 

v = 500; %Simuloitavat vuodet 

M = 40; %Munia
T = 34; %Toukkia
K = 5; %Koteloita
P = 4; %Perhoset

records=zeros(4,v);

for iter = 1:v
    records(:,iter) = [M;T;K;P]; %Tallennetaan viimepopulaatio
    %Lasketaan yhden populaatioaskel
    
    M = round((1-rand(1)*i) * P /2 *a);
    T = round((1-rand(1)*j) * M);
    K = round((1-rand(1)*k) *(T*(T<=b)+ b*(T>b)));
    P = round((1-rand(1)*l) *(P + K));
end

%Piilotetaan munat ja toukat
plot(records(3:4,:)');
legend('Kotelot', 'Perhoset');
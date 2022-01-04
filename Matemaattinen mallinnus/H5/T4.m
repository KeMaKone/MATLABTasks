%Tekijä Konsta Keski-Mattinen 2021,10,21
clear
close all

x1 = 3;
x2 = 6;
x = [x1;x2];

%Luodaan odotusarvo ja kovarianssifunktiot
m = @(d) 5;
k = @(d) 4*2.^(-d.^2)+1*(d==0); %True = 1 

%Seuraavissa kovarianssi funktion laskuissa lasketaan etäisyys indekseillä
%Sigma_1 eli suhde(x,y)
%     x1,x1   x2,x1
%     x2,x1   x2,x2
s1 = [k(1-1), k(2-1);
      k(1-2), k(2-2)]
  
%Sigma_2 eli suhde(x3,x3)
s2 = [k(3-3)] 

%Sigma_21 eli miten x3 vaikuttaa aiemmat mittaustulokset
%      x3,x1  x3,x2
s21 = [k(3-1), k(3-2)];


% Odotusarvo ja varianssi
m_c = m(3)+s21*inv(s1)*(x-m(x))
k_c = s2 -s21*inv(s1)*s21'
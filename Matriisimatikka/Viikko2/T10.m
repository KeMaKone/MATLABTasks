% Konsta Keski-Mattinen
% 22.03.2021
clc
clear
close
disp('Tehtävä 10a')

A= [ 1, 1, 1, 0, 0, 0;...
     0, 0, 0, 1, 1, 1;...
     1, 0, 0, 1, 0, 0;...
     0, 1, 0, 0, 1, 0;...
     0, 0, 1, 0, 0, 1];
     
 
rank([A; [sqrt(2),0,0,0,sqrt(2),0]])
rref([A; [sqrt(2),0,0,0,sqrt(2),0]])
% ratkaisuja on yhä ääretön määrä, vaikka rank kasvoi

disp('Tehtävä 10b')
% säde kulkee palikassa hypotenusan lauseen mukaan c^2=1^2+0.5^2  -> c=sqrt(1.25)
% ln(m12b)=ln(I0)-(sqrt(1.25)a11+sqrt(1.25)a12+sqrt(1.25)a23)
rank([A; [sqrt(1.25),0,0,sqrt(1.25),0,0]])
% rank ei kasvanut, joten tietoa ei tullut lisää
% tämä tapahtuu, koska m13 on vain m11 kerrottuna vakiolla

disp('Tehtävä 10c')

% ln(m23) = ln(I0)-(sqrt(2)a12+sqrt(2)a23)
[A; [sqrt(2),0,0,0,sqrt(2),0]; [0,sqrt(2),0,0,0,sqrt(2)]]
rank([A; [sqrt(2),0,0,0,sqrt(2),0]; [0,sqrt(2),0,0,0,sqrt(2)]])

disp('Tehtävä 10d')
Ad = [A; [sqrt(2),0,0,0,sqrt(2),0]; [0,sqrt(2),0,0,0,sqrt(2)]];
Ad(5,:)=[]

I0=100;
target=[log(I0/2); log(I0/1); log(I0/5); log(I0/5); log(I0/1.5); log(I0/0.2)]

a=inv(Ad)*target

disp('Tehtävä 10e')
target=[log(I0/2); log(I0/1); log(I0/5); log(I0/5); log(I0/1.5); log(I0/0.02)]

a=inv(Ad)*target

% Mittauksessa on jotain vikaa koska arvolla m23=0.02 kuutiomme säteilisi
% tai olisi negatiivisesti tiheä
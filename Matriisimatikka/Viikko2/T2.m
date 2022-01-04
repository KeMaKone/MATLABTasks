% Tekijä: Konsta Keski-Mattinen
% 19.03.2021
% vertaa vihkoon
clc
clear
close all

disp('Tehtävä 2 a)')
% x=Ac
% k = lukumäärä vapaista muuttujista

A= [ 1,-3,-5;...
     0, 1, 1];

target=[0; 0];
rref([A, target])
% kaavassa on yksi vapaaksi jäävä muuttuja
disp('k=1')

% x1=2x3
% x2=-x3
% x3=x3

% joten yleinen ratkaisu on 
v1=[2;-1;1];
% x=c1[2; -1; 1]

% testataan
value = A*(rand()*100*v1)

disp('Tehtävä 2 b)')
clear

A= [ 1,-2,-1, 3;...
    -2, 4, 5,-5;...
     3,-6,-6,+8];
 
 target = [0;3;2];
 
 
rref([A, target])
% 0 == 1 
disp('ei ratkaisua 0==1')


disp('Tehtävä 2 c)')
clear

A=[ 1,-2,-1, 3,-1, 1;...
   -2, 4, 5,-5, 0, 0;...
    3,-6,-6, 8,-2, 7];

target = [0;3;2];

rref([A, target])
% vapaita muuttujia on 3
disp('k=3')

% valitaan vapaiksi muuttujiksi x2,x4,x6
% joten 

v1= [ 2; 1; 0; 0; 0; 0];
v2= [-(3+1/3);0;-1/3;1;0;0];
v3= [8+1/3; 0; 3+1/3; 0; 6; 1];
d = [-(7+1/3); 0; -(2+1/3); 0; -5; 0];


A*(rand()*100*v1+rand()*100*v2+rand()*100*v3+d)


disp('Tehtävä 2 BONUS')
clear

A= [1,-3,-5, 0, 0, 0;
    0, 1, 1, 0, 0, 0;
    1,-2,-1, 3, 0, 0;
   -2, 4, 5,-5, 0, 0;
    3,-6,-6, 8, 0, 0;
    1,-2,-1, 3,-1, 1;
   -2, 4, 5,-5, 0, 0;
    3,-6,-6, 8,-2, 7];

target = [0;0;0;3;2;0;3;2];

rref([A, target])
% seitsemännes rivi 
disp('0 != 1')
disp('ei ratkaisua')

% yhtälöryhmällä ei ole ratkaisua
% joten 

%v1= [ 2; 1; 0; 0; 0; 0];
%v2= [-(3+1/3);0;-1/3;1;0;0];
%v3= [8+1/3; 0; 3+1/3; 0; 6; 1];
%d = [-(7+1/3); 0; -(2+1/3); 0; -5; 0];


%A*(rand()*100*v1+rand()*100*v2+rand()*100*v3+d)


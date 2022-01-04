% Tekijä Konsta Keski-Mattinen
% 11.03.2021

clear
close all

disp("Tehtävä 12")

figure('name', 'Tehtävä 12'), hold on

% luodaan  kohdekenttä
% p(x), x<0
% q(x), x>=0
% pisteet A(-2,1) B(0,0) C(1,2)
% p'(0)=q'(0) q'(1)=5

%polynomilla p on vain 2 määrettä joten otetaan se 2 asteen
%polynomilla q on 4 määrettä valitaan se 3 asteen 
%Luodaan kohdevektori
target = [1;... % A(-2,1)
          0;... % B(0,0)
          0;... % Vaaditaan että käyrä on jatkuva
          2;... % C(1,2)
          0;... % p'(0)=q'(0)
          5]    % q'(1)=5

% polynomi p: a0x0+a1x1+a2x2
% polynomi q: b0x0+b1x1+b2x2+b3x3
% a0-2a1+4a2  =1
% a0          =0 
% b0          =0 
% b0+b1+b2+b3 =2
% a1-b1       =0
% b1+2b2+3b3  =5

%  a0,a1,a2,b0,b1,b2,b3
A=[ 1,-2, 4, 0, 0, 0, 0;...
    1, 0, 0, 0, 0, 0, 0;...
    0, 0, 0, 1, 0, 0, 0;...
    0, 0, 0, 1, 1, 1, 1;...
    0, 1, 0, 0,-1, 0, 0;...
    0, 0, 0, 0, 1, 2, 3];

%A*multi=target
multi = A\target
% piirrä käytä [-2,2]
x_p= -2:0.01:2;
plot(x_p, multi(1)+multi(2)*x_p+multi(3)*x_p.^2); % p(x)
plot(x_p, multi(4)+multi(5)*x_p+multi(6)*x_p.^2+multi(7)*x_p.^3); % q(x)
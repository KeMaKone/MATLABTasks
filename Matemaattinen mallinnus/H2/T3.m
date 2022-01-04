% Tekijä Konsta Keski-Mattinen 16.9.2021

%Mallinnetaan ötökkäkannat vektorilla
x = [1000;0;0;0];
x_r = x;

% Putkiverkko
% A - B
% |   |
% C _ D
%

%Mallinetaan ötökkäsiirtymä matriisilla
%    A, B, C, D Mihin
% A
% B
% C
% D
% Mistä

M = [0.98, 0.01, 0.01,  0;
     0.01, 0.98, 0,     0.01;
     0.01, 0,    0.98,  0.01;
     0,    0.01, 0.01,  0.98];

for i=1:30
    pause;
    disp(['Day ', num2str(i)])
    x_r = round(M*x_r)
    x = M*x;
end

disp('Kadonneet ötökät pyöristäessä')
sum(x) - sum(x_r)
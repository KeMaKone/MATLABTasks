clear all
close all

%% Tehtävä 1
%
% Kysytään käytännössä pistettä $$ [1, 2]^T $$ lähintä 
% pistettä vektorin $$ [1, 4]^T $$ virittämältä tasolta.

display('Tehtävä 1a')

y = [1 2]';
v1 = [1 4]';

V = [v1];

x = V*inv(V'*V)*V'*y % lähin piste
norm(x-y) % pisteiden etäisyys

display('Tehtävä 1b')

y = [1 2 2]';

v1 = [1 2 2]';
v2 = [2 2 2]' ;

V = [v1 v2];

x = V*inv(V'*V)*V'*y % % lähin piste
norm(x-y) % pisteiden etäisyys

display('Tehtävä 1c')

% Nyt pitää itse keksiä pari virittäjävektoria. Otetaan
% tason vektoreita pisteestä [0 0 0] pariin muuhun pisteeseen.

y = [1 2 1]';

v1 = [-2 1 0]';
v2 = [-4 0 1]' ;

V = [v1 v2];

x = V*inv(V'*V)*V'*y % lähin piste
norm(x-y) % pisteiden etäisyys

display('Tehtävä 1d')

y = [1 2 1 -1]';

v1 = [1 2 2 0]';
v2 = [2 0 1 1]';
v3 = [1 6 5 -1]';

V = [v1 v2];

x = V*inv(V'*V)*V'*y % lähin piste
norm(x-y) % pisteiden etäisyys

%% Tehtävä 2
% Koska ovat ortonormaaleja, niin pituuden neliö 
% on kertoiminen neliöiden summa, eli

display('Tehtävä 2a')

4^2+5^2+(-2)^2

display('Tehtävä 2b')

%%
% 
% $$ y - \widetilde{y}  = -e_1 v_1 - e_2 v_2 - e_3 v_3 $$
% 
% eli tämän pituuden neliö on
% 
% $$ (-e_1)^2 + (-e_2)^2 + (-e_3)^2. $$

clear all

%% Tehtävä 3

A = randn(6,2)
b =rand(6,1)
x = inv(A'*A)*A'*b

%% Tehtävä 4
%
% Olkoon polynomin kertoimet vektorissa $$ \textbf{a} $$.
% Yksittäinen datamatriisin rivi vastaa yhtälöä
% 
% $$ a_1 + a_2 x_i + a_3 x_i^2 = y_i, $$
% 
% missä  $$ x_i $$ ja $$ y_i $$ siis vaihtuvat rivin mukaan.
% Yhtäsuuruutta ei varmaankaan saada
% kaikille riveille aikaan, mutta etsitään ne kertoimet
% $$ a_i $$ joille yhtälön oikealle puolelle tuleva 6-ulotteinen 
% vektori on mahdollisimman lähellä vasemmalle puolelle
% tulevaan vektoria. Vasen puoli on matriisimuodossa
% 
% $$ A \textbf{a} . $$

display('Tehtävä 3')

DATA = [1 -1 7;
        2 0 4;
        3 1 3;
        4 2 4;
        5 3 3;
        6 4 8];

x = DATA(:,2);
y = DATA(:,3);

A = [ones(size(x)), x, x.^2];

a = inv(A'*A)*A'*y;

% Ihan vain varmistuksen vuoksi plottailua
xplot = ( x(1):0.01:x(end) )';
yplot = [ones(size(xplot)) xplot, xplot.^2]*a;

figure();
hold on

plot(x,y,'.r')
plot(xplot,yplot,'b');

%% Tehtävä 7
% 
% Nyt on siis rajoitteita pari kappaletta koska $$ A $$:ssa on kaksi riviä.
% Tällöin Lagrangen kertoimia tarvitaan kaksi, olkoon ne $$ u_1 $$ ja $$ u_2 $$.
% jos $$ A $$:n rivit ovat $$ \textbf{a}_1 $$ ja $$ \textbf{a}_2 $$ niin silloin rajoitteet ovat
% 
% $$ \textbf{a}_1 \textbf{x} = 2 $$
% 
% ja 
% 
% $$ \textbf{a}_2 \textbf{x} = -1. $$ 
% 
% $$ f(\textbf{x}) = x_1^2 + ... + x_4^2 $$
% 
% ja
% 
% $$ L(x_1,...,x_4,u_1,u_2) = f(\textbf{x})+ u_1 ( \textbf{a}_1 \textbf{x} - 2 ) + u_2 ( \textbf{a}_2 \textbf{x} - (-1) ) $$
% 
% Täten $$ L $$:n osittaisderivaatta $$ x_i $$:n suhteen on
% 
% $$ 2x_i + u_1 \textbf{a}_1(i) + u_2 \textbf{a}_2(i) = 0, $$
% 
% jossa merkintä $$ (i) $$ viittaa vektorin $$ i $$:nteen alkioon.
% 
% Kootaan nyt nämä yhtälöt ja rajoiteyhtälöt matriisimuotoon 
% 
% $$ B \textbf{y} = \textbf{z}, $$
% 
% missä $$ \textbf{y} = [x_1,...,x_4,u_1,u_2]^T, \textbf{z} = [0,...,0,2,-1]^T .$$

display('Tehtävä 8')

A = [5 1 2 2; 3 3 2 -1];

B = [2 0 0 0 A(1,1) A(2,1);
     0 2 0 0 A(1,2) A(2,2);
     0 0 2 0 A(1,3) A(2,3);
     0 0 0 2 A(1,4) A(2,4);
     A(1,:) 0 0 ;
     A(2,:) 0 0 ;]

z = [0,0,0,0,2,-1]'
y = inv(B)*z
x = y(1:4)
norm(x)
norm(A\[2 -1]') 
% Joo, näyttäisi että myö saatiin lyhyempi mutta 
% jälkimmäinen tapa tuottaisi enemmän nolla-alkioita. Puolensa kullakin.

clear all

%% Tehtävä 8

phi = @(i,x) exp(-0.1*i*x);
x =[0:4]';
n = 5;
for i = 1 : n
    A(:,i) = phi(i,x);
end
y= [4 3 2 0.5 0.01]';
c = inv(A)*y
% Tarkempi pisteikkö plottausta varten
x_plot = [0 : 0.1 : 5]';
figure
hold on
plot(x,y,'ro')
% Vältellään "isoja" matriiseja f:n laskennassa
f = zeros(size(x_plot));
for i = 1 : n
    f = f + c(i)*phi(i,x_plot);
end
plot(x_plot, f,'b.')

clear all

%% Tehtävä 9

phi = @(i,x) exp(-0.1*i*x);
x =[0:20]'/5;
n = 5;
for i = 1 : n
    A(:,i) = phi(i,x);
end
y= exp(-0.35*x);
c = inv(A'*A)*A'*y;
% Tarkempi pisteikkö plottausta varten
x_plot = [0 : 0.05 : 5]';
figure
hold on
plot(x,y,'ro')
% Vältellään "isoja" matriiseja f:n laskennassa
f = zeros(size(x_plot));
for i = 1 : n
    f = f + c(i)*phi(i,x_plot);
end
plot(x_plot, f,'b.')

clear all

%% Tehtävä 10

phi = @(i,x) exp(-0.1*i*x);
x =[0:20]'/5;
n = 15;
for i = 1 : n
    A(:,i) = phi(i,x);
end
y= exp(-0.35*x);
c = inv(A'*A)*A'*y;
% Tarkempi pisteikkö plottausta varten
x_plot = [0 : 0.05 : 5]';
figure
hold on
plot(x,y,'ro')
% Vältellään "isoja" matriiseja f:n laskennassa
f = zeros(size(x_plot));
for i = 1 : n
    f = f + c(i)*phi(i,x_plot);
end
plot(x_plot, f,'b.')

% Näyttäisi olevan aika karmea tuo sovitus ja 
% kyllähän sitä varoitellaankin singulaarisesta
% matriisista
clear all
close all

%% Teht�v� 1
%
% Kysyt��n k�yt�nn�ss� pistett� $$ [1, 2]^T $$ l�hint� 
% pistett� vektorin $$ [1, 4]^T $$ viritt�m�lt� tasolta.

display('Teht�v� 1a')

y = [1 2]';
v1 = [1 4]';

V = [v1];

x = V*inv(V'*V)*V'*y % l�hin piste
norm(x-y) % pisteiden et�isyys

display('Teht�v� 1b')

y = [1 2 2]';

v1 = [1 2 2]';
v2 = [2 2 2]' ;

V = [v1 v2];

x = V*inv(V'*V)*V'*y % % l�hin piste
norm(x-y) % pisteiden et�isyys

display('Teht�v� 1c')

% Nyt pit�� itse keksi� pari viritt�j�vektoria. Otetaan
% tason vektoreita pisteest� [0 0 0] pariin muuhun pisteeseen.

y = [1 2 1]';

v1 = [-2 1 0]';
v2 = [-4 0 1]' ;

V = [v1 v2];

x = V*inv(V'*V)*V'*y % l�hin piste
norm(x-y) % pisteiden et�isyys

display('Teht�v� 1d')

y = [1 2 1 -1]';

v1 = [1 2 2 0]';
v2 = [2 0 1 1]';
v3 = [1 6 5 -1]';

V = [v1 v2];

x = V*inv(V'*V)*V'*y % l�hin piste
norm(x-y) % pisteiden et�isyys

%% Teht�v� 2
% Koska ovat ortonormaaleja, niin pituuden neli� 
% on kertoiminen neli�iden summa, eli

display('Teht�v� 2a')

4^2+5^2+(-2)^2

display('Teht�v� 2b')

%%
% 
% $$ y - \widetilde{y}  = -e_1 v_1 - e_2 v_2 - e_3 v_3 $$
% 
% eli t�m�n pituuden neli� on
% 
% $$ (-e_1)^2 + (-e_2)^2 + (-e_3)^2. $$

clear all

%% Teht�v� 3

A = randn(6,2)
b =rand(6,1)
x = inv(A'*A)*A'*b

%% Teht�v� 4
%
% Olkoon polynomin kertoimet vektorissa $$ \textbf{a} $$.
% Yksitt�inen datamatriisin rivi vastaa yht�l��
% 
% $$ a_1 + a_2 x_i + a_3 x_i^2 = y_i, $$
% 
% miss�  $$ x_i $$ ja $$ y_i $$ siis vaihtuvat rivin mukaan.
% Yht�suuruutta ei varmaankaan saada
% kaikille riveille aikaan, mutta etsit��n ne kertoimet
% $$ a_i $$ joille yht�l�n oikealle puolelle tuleva 6-ulotteinen 
% vektori on mahdollisimman l�hell� vasemmalle puolelle
% tulevaan vektoria. Vasen puoli on matriisimuodossa
% 
% $$ A \textbf{a} . $$

display('Teht�v� 3')

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

%% Teht�v� 7
% 
% Nyt on siis rajoitteita pari kappaletta koska $$ A $$:ssa on kaksi rivi�.
% T�ll�in Lagrangen kertoimia tarvitaan kaksi, olkoon ne $$ u_1 $$ ja $$ u_2 $$.
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
% T�ten $$ L $$:n osittaisderivaatta $$ x_i $$:n suhteen on
% 
% $$ 2x_i + u_1 \textbf{a}_1(i) + u_2 \textbf{a}_2(i) = 0, $$
% 
% jossa merkint� $$ (i) $$ viittaa vektorin $$ i $$:nteen alkioon.
% 
% Kootaan nyt n�m� yht�l�t ja rajoiteyht�l�t matriisimuotoon 
% 
% $$ B \textbf{y} = \textbf{z}, $$
% 
% miss� $$ \textbf{y} = [x_1,...,x_4,u_1,u_2]^T, \textbf{z} = [0,...,0,2,-1]^T .$$

display('Teht�v� 8')

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
% Joo, n�ytt�isi ett� my� saatiin lyhyempi mutta 
% j�lkimm�inen tapa tuottaisi enemm�n nolla-alkioita. Puolensa kullakin.

clear all

%% Teht�v� 8

phi = @(i,x) exp(-0.1*i*x);
x =[0:4]';
n = 5;
for i = 1 : n
    A(:,i) = phi(i,x);
end
y= [4 3 2 0.5 0.01]';
c = inv(A)*y
% Tarkempi pisteikk� plottausta varten
x_plot = [0 : 0.1 : 5]';
figure
hold on
plot(x,y,'ro')
% V�ltell��n "isoja" matriiseja f:n laskennassa
f = zeros(size(x_plot));
for i = 1 : n
    f = f + c(i)*phi(i,x_plot);
end
plot(x_plot, f,'b.')

clear all

%% Teht�v� 9

phi = @(i,x) exp(-0.1*i*x);
x =[0:20]'/5;
n = 5;
for i = 1 : n
    A(:,i) = phi(i,x);
end
y= exp(-0.35*x);
c = inv(A'*A)*A'*y;
% Tarkempi pisteikk� plottausta varten
x_plot = [0 : 0.05 : 5]';
figure
hold on
plot(x,y,'ro')
% V�ltell��n "isoja" matriiseja f:n laskennassa
f = zeros(size(x_plot));
for i = 1 : n
    f = f + c(i)*phi(i,x_plot);
end
plot(x_plot, f,'b.')

clear all

%% Teht�v� 10

phi = @(i,x) exp(-0.1*i*x);
x =[0:20]'/5;
n = 15;
for i = 1 : n
    A(:,i) = phi(i,x);
end
y= exp(-0.35*x);
c = inv(A'*A)*A'*y;
% Tarkempi pisteikk� plottausta varten
x_plot = [0 : 0.05 : 5]';
figure
hold on
plot(x,y,'ro')
% V�ltell��n "isoja" matriiseja f:n laskennassa
f = zeros(size(x_plot));
for i = 1 : n
    f = f + c(i)*phi(i,x_plot);
end
plot(x_plot, f,'b.')

% N�ytt�isi olevan aika karmea tuo sovitus ja 
% kyll�h�n sit� varoitellaankin singulaarisesta
% matriisista
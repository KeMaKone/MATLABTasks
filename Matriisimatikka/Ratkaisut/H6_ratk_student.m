clear all 
close all

%% TEHTÄVÄ 6

clear all
close all
imdata = imread('Naama1.jpg');
image_gs = rgb2gray(imdata); % alkuperäinen värikuva harmaasävyksi
image_gs501 = image_gs(100:600,300:800); % leikataan pyydetyn kokoinen kuva
figure
imshow(image_gs501) % laitetaan alkuperäinen näkyviin
A = double(image_gs501); % muunnetaan muotoon jossa Matlab tykkää laskea

F = Fourier_kanta(501); % ladataan tehtävässä tarvittava kanta
% Nyt kun kuva on ladattu, päästään varsinaiseen laskentaan

% (a) Haarukoitu ja päädytty seuraavaan, 

M = 150; % Alkaa olla aika hyvä, jos ei isona tätä kuvaa katso. Vielähän 
         % tuota pitäisi kasvattaa jotta kaikki näpyt näkyis ja silmät olis
         % terävämmät jne.
C=F'*(F'*A)';
C_M = zeros(size(C));
C_M(1:M,1:M) = C(1:M,1:M);

A_M=(F*C_M*F')';
figure
imshow(uint8(A_M))


% (b) Haarukoitu ja päädytty seuraavaan, 

M = 30; % Toki jos ei kovin karvaisia naamoja olisi mihin sekoittaa niin 
        % M = 20 riittäisi varmaan Jounin tunnistamiseen.
C=F'*(F'*A)';
C_M = zeros(size(C));
C_M(1:M,1:M) = C(1:M,1:M);

A_M=(F*C_M*F')';
figure
imshow(uint8(A_M))

% (c) 

C=F'*(F'*A)';
for M = 1 : 1: 500
    C_M = zeros(size(C));
    C_M(1:M,1:M) = C(1:M,1:M);
    A_M=(F*C_M*F')';
    E(M) = sum(sum(abs(A-A_M).^2));
end
figure
plot(log(E)) % 

%% TEHTÄVÄ 7
%
% Mennään luentomonisteen esimerkin merkinnöillä ja 
% hypätään heti loppuun, vaikka ohje 
% kyllä suosittelee käymään välivaiheet.
%
clear all
close all
v1 = [1 0 0]'
v2 = [2 1 1]'
v3 = [1 -1 1]'
v4 = [1 0 1]'
v5 = [0 -1 0]'
m1 = [1.1, -1.0]'
m2 = [2.2, 0.1]'
m3 = [0.9, 1.0]'
m4 = [1.0, -0.9]'
m5 = [-0.1, 2.1]'

M = [m1 m2 m3 m4 m5]

V = [v1 v2 v3 v4 v5]



A = (inv(V*V')*V*M')'


%% TEHTÄVÄ 8

phi = @(x,i) x.^i;

x = linspace(0,1,9)'

v1 = phi(x,0)
v2 = phi(x,1)
v3 = phi(x,2)
v4 = phi(x,3)

% Kurssimateriaalien merkintöjä noudatellen
P = @(x, U) U*U'*x;

u1 = v1/norm(v1);
U1 = [u1];

u2_tilde = v2-P(v2,U1);
u2 = u2_tilde/norm(u2_tilde);
U2 = [U1 u2];

u3_tilde = v3-P(v3,U2);
u3 = u3_tilde/norm(u3_tilde);
U3 = [U2 u3];


u4_tilde = v4-P(v4,U3);
u4 = u4_tilde/norm(u4_tilde);
U4 = [U3 u4];

U4'*U4 % tarkistetaan ortogonaalisuus.


%% TEHTÄVÄ 9
% Koska x on V matriisin sarakkeiden lineaarikombinaatio niin
% x = V*x_V. Toisaalta jos otamme Fourier kannan (parametrislla N = 7) 
% niin voimme minkä tahansa N ulotteisen vektorin esittää F kannassa, eli 
% x = F*x_F. Saamme siis V*x_V = F*x_F. Näin olle x_F = F'*V*x_V. Tässä
% käytetty fourier kannan ortonormaalisuutta apuna käänteismatriisin
% määrittämisessä
F = Fourier_kanta(9)
V = [v1 v2 v3 v4]
% Pyydetty matriisi
F'*V

%% TEHTÄVÄ 10
%
% Ensinäkin S_1(x) = F*[S_1(x)]_F, eli ihan normaali "kantavektorit kertaa 
% koordinaatit" ajatus tässä. Toisaalta jos matriisi B määritellään
F = Fourier_kanta(7)

% (a)
B = [0 0 0 0 0 0 0;
     0 0 0 1 0 0 0;
     0 0 0 0 1 0 0;
     0 0 0 0 0 1 0;
     0 0 0 0 0 0 1;
     0 0 0 0 0 0 0;
     0 0 0 0 0 0 0]
 % niin [S_1(x)]_F = B [x]_F = B*F'*x. Saamme siis
 % S_1(x) = F*B*F'*x. Kysytty matriisi on siis
 
 A = F*B*F'
 
 % Eikös tämä ole aika luonnollista: voisimme ajatella että 
 % ensin siirrymme F koordinaatteihin, sitten teemme siellä 
 % muunnoksen ja sitten siirrymme takaisin standardikoordinaatteihin.
 
% (b)
% Koska F on ortnormaali kanta, pätee mille tahansa
% vektorille y että |y|^2 = |[y]_F|^2. Siispä
% |x|^2 = |[x]_F|^2 = (f_1)^2+ (f_2)^2+ ...+ (f_7)^2
% ja
% |S_1(x)|^2 = |[S_1(x)]_F|^2 =  0^2+(f_4)^2+ (f_5)^2+ (f_6)^2+ (f_7)^2 +
% 0^2 +0^2
% eli |x|^2 - |S_1(x)|^2  = (f_1)^2+ (f_2)^2+ (f_3)^2>=0. Ja jos sattuu
% ylemmät taajuuskomponentit nyt siis olemaan nollaa niin signaalihan menee
% nollaksi!

% (c)
% Kuvauksen ydin on siis se signaalijoukko joka häviää, eli menee nollaksi,
% kuvauksessa.
% Aloitetaan vaikka kuvauksesta S_1, sille meillä on jo kuvauksen määrittelevä
% matriisi A. Ratkaistaan nyt vain yhtälöryhmä Ax = 0
T=rref(A)
% tästä voidaan lukea että kuvauksen S_1 ydin: vapaat muuttujat
% yhtälöryhmän ratkaisussa ovat virittäjävektoreille kertoimina. 

% Kuvaukselle S_2 homma menee samoin, haetaan vain ensin kuvauksen
% määrittelevä matriisi C. Homma menee hyvin samaan tyyliin, jätetään 
% välivaiheet opiskelijalle
I = eye(7); 
C = F*(0.5*I+0.5*B)*F'
rref(C)
% Näyttäisi että nyt ainakaan koko signaali ei koskaan häviä.


function F = Fourier_kanta(N)
    
    % 1.
    t = 2*pi*[0:N-1]'/N;
   
    % 2.
    V = zeros(N,(N-1)/2+1); % Matriisi johon seuraavaksi talletetaan v_k vektorit sarakkeiksi
    for k = 0:(N-1)/2
        V(:,k+1) =  cos(k*t)/norm(cos(k*t));        
    end
    
    % 3.
    U = zeros(N,(N-1)/2); % Matriisi johon seuraavaksi talletetaan u_k vektorit sarakkeiksi
    for k = 1 : (N-1)/2
        U(:,k) = sin(k*t)/norm(sin(k*t));
    end
    
    % 4.
    
    F = zeros(N,N); % Matriisi johon seuraavaksi tallennetaan f vektorit
    
    F(:,1:2:end) = V;
    F(:,2:2:end) = U;
    
    
    
end




clear all 
close all
load('h7_data.mat')

% Yritet��n seurailla ratkaisuissa pitk�lti monisteen merkint�j�,
% vaikka joskus tarpeettomia indeksej� sitten tulisikin

%% t1 
A = A1;
y = y1;
[U,S,V] = svd(A)
diag(S) 
% tarkastetaan montako nollasta poikkeavaa singulaariarvoa
r = 5 % Sattuu olemaan sama kuin matriisi rivien m��r�
      % -> U2r matriisia ei ole ja siis k�yt�n�ss�
      % t�ll� kertaa U1r = U ja Sr = S.
      % Laitetaanpa kuitenkin koodiin yleisemmin niin
      % my�hemmin copy/paste toimii
% Koska yksik��n singulaariarvo ei ole 0, on yht�l�ll�
% varmasti ratkaisu (c2r vektoria ei edes ole).
      
U1r = U(:, 1:r); 
V1r = V(:, 1:r);
Sr = S(1:r,1:r); 
d1r = inv(Sr)*U1r'*y1;
x = V1r*d1r
% t�m� siis lyhin ratkaisuvektori, jossa valittu d2r = 0.

%% T2
%
% Kaikki alkulaskenta samaa kuin edellisess� teht�v�ss�.
% eli ei lasketa uudestaan
p = [ 0 1 2 3 2 1 0]';
a = V'*p;
a1r = a(1:r);
a2r = a(r+1:end);
d2r = a2r;
V2r = V(:,r+1:end);
x = V1r*d1r + V2r*d2r

%% T3
%
% T�m� onkin v�h�n hevimp�� setti�. Suositellaan ett� k�yd��n 
% v�livaiheet paperilla hahmotellen l�pi. 

% Ratkaisuvektori on 
% x = V1r*d1r + V2r*d2r, jossa j�lkimm�isen termin kertoimet
% on vapaasti valittavissa. Kirjoitetaah x = [h ; w], miss� h
% on 3x1 nollavektori ja w sis�lt�� 5 vapaata muuttujaa. Kirjoitetaan
% nyt x = I13*h + I23*w, miss�
I = eye(7);
I13 = I(:,1:3);
I23 = I(:,3+1:end);
% n�in saadaan I23*w -V2r*d2r = V1r*d1r - I13*h.
% Siis [I23, -V2r]*[w ; d2r] = V1r*d1r - I13*h.
% Merkit��n A = [I23, -V2r], b = V1r*d1r - I13*h
% ja u = [w ; d2r]. 
% Ratkaistaan A*u = b. Ei kun hommiin:
h = zeros(3,1);
A = [I23, -V2r];
b = V1r*d1r - I13*h;
rref([A b]);
% Eip� n�yt� olevan ratkaisua. Aletaan sitten minimoimaan h = [x1 x2 x3]'
% vektorin pituutta. Aloitetaan kuten aiemminkin, eli
% x = V1r*d1r + V2r*d2r.
% Kun olemme kiinnostuneet vain kolmesta ylimm�st� x:n alkioista
% niin merkit��n n�it� taas h:lla, ja vasemmalla puolella olkoon nyt
% kolme ensimm�ist� rivi� sis�lt�v�t matriisit K1 ja K2, eli
% h = K1*d1r +K2*d2r.

K1 = V1r(1:3,:);
K2 = V2r(1:3,:);

% Pit�isi siis minimoida h:n pituus, eli saada h mahdollisimman 
% l�helle nollavektoria. T�m� on sama asia kuin etsi�
% kertoimet d2r siten ett� K2*d2r on mahdollisimman l�hell� vektoria
% -K1*d1r. Lasketaan siis k�yt�nn�ss� vektorin -K1*d1r ortogonaaliprojektio
% avaruuteen jonka viritt�� K2 matriisin sarakevektorit. T�m�n
% projektion kertoimet K2 kannassa ovat optimaaliset arvot d2r:lle.

d2r = inv(K2'*K2)*K2'*(-K1*d1r);
x = V1r*d1r + V2r*d2r

%% T4
%
% Tehd��n ty�t� k�sketty�, eli siten kuin teht�v�nannossa k�sket��n.
% Col(A) tarkoittaa avaruutta jonka viritt�v�t A:n sarakevektorit
% T�m� on toisaalta ihan sama kuin U1r:n viritt�m� avaruus. K�ytet��n
% t�t� etsiess�mme y:t�, koska rakastamme ortonormaaleja vektoreita (ei muuta syyt�)
[U,S,V] = svd(A2);
diag(S) % Jotta n�hd��n r arvo (toki l�ytyisi rank komennollakin)
r = 7 % t�m� on siis maksimiarvo kun vain 7 sarakettakin. Voi olla
% ett� alla on nyt jokunen "turha" rivi kun V ja S matriisia ei tarvitsisi
% edes leikell�
U1r = U(:,1:r);
V1r = V(:,1:r);
Sr = S(1:r,1:r);
y = U1r*U1r'*y2
% Nyt siis viel� ratkaistaan $x$
d1r = inv(Sr)*U1r'*y;
x = V1r*d1r


%% T5 
% 
% Kun nyt ei ole k�sketty tehd� tietyll� tavalla, niin tehd��n 
% monisteen suoria kaavoja k�ytt�en:

[U,S,V] = svd(A3)
diag(S)
r =5;
U1r = U(:,1:r);
V1r = V(:,1:r);
Sr = S(1:r,1:r);
d1r = inv(Sr)*U1r'*y3;
x = V1r*d1r % d2r siis valitaan nollaksi kun tahdotaan lyhin x.

%% T6
% Jatketaan siit� mihin teht�v�ss� 5 j��tiin mutta nyt ei vain valita
% d2r:�� nollavektoriksi vaan ensialkuun se on tuntematon.
% jos merkit��n 
p = [0 1 2 3 2 1 0]';
% niin etsit��n d2r s.e. |x-p| minimoituu, eli |V2r*d2r-(p-V1r*d1r)|
% minimoituu, eli V2r*d2r on vektorin p-V1r*d1r ortogonaaliprojektio
% avaruuteen jonka viritt�v�t vektorit V2r. Merkit��n t�t� projektiota
% nyt symbolilla P.
P = V2r*V2r'*(p-V1r*d1r);
x = V1r*d1r +P

%% T7
%
% Ratkaistaan ensin yht�l�ryhm� A1*x1 = y1. Vaikkei kukaan sanonutkaan
% ett� pit�� k�ytt�� singulaariarvohajotelmaa niin k�ytet��n, on
% sitten helppo otta copy/paste
[U,S,V] = svd(A1)
diag(S)
r = 5;
U1r=U(:,1:r);
V1r=V(:,1:r);
Sr=S(1:r,1:r);
d1r = inv(Sr)*U1r'*y1;
x1 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni

% Yht�l�ryhm�n A1*x2 = y1+e1 ratkaisussa vain kaksi viimeist� rivi� vaihtuu
d1r = inv(Sr)*U1r'*(y1+e1);
x2 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni
norm(x1-x2)

% Jos singulaariarvoja nollataan ja yh� otetaan se lyhin mahdollinen
% pns-ratkaisu niin mik��n muu ei muutu kuin se ett� r vaihtuu pienemm�ksi.
% r = 3 n�ytt�isi hyv�lt�

r = 3;
U1r=U(:,1:r);
V1r=V(:,1:r);
Sr=S(1:r,1:r);
d1r = inv(Sr)*U1r'*y1;
x1 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni

% Yht�l�ryhm�n A1*x2 = y1+e1 ratkaisussa vain kaksi viimeist� rivi� vaihtuu
d1r = inv(Sr)*U1r'*(y1+e1);
x2 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni
norm(x1-x2)

%% T8
% 
% Nyt tehd��n iso copy/paste edellisest� teht�v�st�. K�yt�nn�ss� vain
% r arvoja pit�� p�ivitt�� (paitsi ett� sattumalta nekin ovat sopivat)
% ja svd laskea uudelleen ja ep�homogeenisuusosa vaihtaa.

% Ratkaistaan ensin yht�l�ryhm� A3*x1 = y3. Vaikkei kukaan sanonutkaan
% ett� pit�� k�ytt�� singulaariarvohajotelmaa niin k�ytet��n, on
% sitten helppo otta copy/paste
[U,S,V] = svd(A3)
diag(S)
r = 5;
U1r=U(:,1:r);
V1r=V(:,1:r);
Sr=S(1:r,1:r);
d1r = inv(Sr)*U1r'*y3;
x1 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni

% Yht�l�ryhm�n A3*x2 = y3+e3 ratkaisussa vain kaksi viimeist� rivi� vaihtuu
d1r = inv(Sr)*U1r'*(y3+e3);
x2 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni
norm(x1-x2)

% Jos singulaariarvoja nollataan ja yh� otetaan se lyhin mahdollinen
% pns-ratkaisu niin mik��n muu ei muutu kuin se ett� r vaihtuu pienemm�ksi.
% r = 3 n�ytt�isi hyv�lt�

r = 3;
U1r=U(:,1:r);
V1r=V(:,1:r);
Sr=S(1:r,1:r);
d1r = inv(Sr)*U1r'*y3;
x1 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni

% Yht�l�ryhm�n A3*x2 = y3+e3 ratkaisussa vain kaksi viimeist� rivi� vaihtuu
d1r = inv(Sr)*U1r'*(y3+e3);
x2 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni
norm(x1-x2)

%% T9
%
% Kaikki on l�hes kokonaan copy/pastea. Lis��mme vain osuudet joissa
% laskemme sopivan d2r kerroinvektorin ja otamme t�m�n osuuden
% mukaan kun ratkaisemme x:n

% Ratkaistaan ensin yht�l�ryhm� A3*x1 = y3. Vaikkei kukaan sanonutkaan
% ett� pit�� k�ytt�� singulaariarvohajotelmaa niin k�ytet��n, on
% sitten helppo otta copy/paste
[U,S,V] = svd(A3)
diag(S)
r = 5;
U1r=U(:,1:r);
V1r=V(:,1:r);
Sr=S(1:r,1:r);
d1r = inv(Sr)*U1r'*y3;


p = [0 1 2 3 2 1 0]';
% niin etsit��n d2r s.e. |x-p| minimoituu, eli |V2r*d2r-(p-V1r*d1r)|
% minimoituu, eli V2r*d2r on vektorin p-V1r*d1r ortogonaaliprojektio
% avaruuteen jonka viritt�v�t vektorit V2r. Merkit��n t�t� projektiota
% nyt symbolilla P.
V2r = V(:,r+1:end);
% Periaattessa siis P = V2r*V2r'*(p-V1r*d1r), mutta ortogonaalisuutta
% hyv�ksi k�ytt�en 
P = V2r*V2r'*p;
x1 = V1r*d1r +P

% Yht�l�ryhm�n A3*x2 = y3+e3 ratkaisussa vain kaksi viimeist� rivi� vaihtuu
d1r = inv(Sr)*U1r'*(y3+e3);
x2 = V1r*d1r +P
norm(x1-x2)

% Jos singulaariarvoja nollataan ja yh� otetaan se lyhin mahdollinen
% pns-ratkaisu niin mik��n muu ei muutu kuin se ett� r vaihtuu pienemm�ksi.
% r = 3 n�ytt�isi hyv�lt�

r = 3;
U1r=U(:,1:r);
V1r=V(:,1:r);
V2r = V(:,r+1:end);
Sr=S(1:r,1:r);
d1r = inv(Sr)*U1r'*y3;

P = V2r*V2r'*p;
x1 = V1r*d1r +P

% Yht�l�ryhm�n A3*x2 = y3+e3 ratkaisussa vain kaksi viimeist� rivi� vaihtuu
d1r = inv(Sr)*U1r'*(y3+e3);

x2 = V1r*d1r +P
norm(x1-x2)

% 

%% Teht�v� 10
% (a) ja (b) Tehd��n koodi josa yht� parametria vaihtamalla
% voidaan vaihtaa PCA:sta puhtaaseen SVD luokitteluun. Tulokset
% tulevat olemaan t�ll� datalla itseasiassa ihan samat. 

mode = 0 ; % mode = 1 on pca, mode = 0 on svd

means1=mode*mean(D1')'; % jos mode=0 niin means1 on nollavektori eik� vaikuta mihink��n jatkossakaan

[U1, S1, V1] = svd(D1-means1);
figure
plot(diag(S1))
% Selv�sti vain 3 v�h�nk��n isompaa singulaariarvoa
r1 = 3;

means2=mode*mean(D2')'; % jos mode=0 niin means2 on nollavektori eik� vaikuta mihink��n jatkossakaan

[U2, S2, V2] = svd(D2-means2);
figure
plot(diag(S2))
% Selv�sti vain 3 v�h�nk��n isompaa singulaariarvoa
r2= 3;
% Etsit��n huonot nyt hyvien joukosta katsomalla onko kunkin
% D matriisin vektorin
% et�isyys pienempi avaruuteen U1(:,1:r1) vai U2(:,1:r2).
% Jos keskitys on tehty (pca) niin pit�� my�s muostaa ensin siirt��
% saman verran D matriisin vektoreita.

% Et�isyyksien neli�t:
PL2 = sum((D-means2).^2)-sum((U2(:,1:r2)'*(D-means2)).^2);
PL1 = sum((D-means1).^2)-sum((U1(:,1:r1)'*(D-means1)).^2);
% vertailu: 
find((PL1-PL2)>0) 
figure
plot(PL1-PL2)
% viimeinen plotti ihan vain mielenkiinnosta. Jos katselee n�it� niin
% ehk�p� pca l�ysi n�m� v�h�n luotettavammin kun erot tuppasivat
% olemaan v�h�n isompia usein

%% T11

means1=1*mean(D1')'; % Tehd��n p��komponenttianalyysill�, tulos ei
% kyll� mihink��n muuttuisi vaikka suoraankin sovellettaisiin SVD:t�.

[U1,S1,V1] = svd(D1-means1);

coords = S1*V1';
figure
plot3(coords(1,:), coords(2,:),coords(3,:), 'b.');
% Eik�h�n tuossa oleellisti kaksi eri pistejoukkoa eli luokkaa ole.



%% T12
%
% T�m� on "one liner" kun vain ymm�rt�� mit� kysyt��n
[U,S,V] = svd(M);
% Pyydetyt vektorit matriisissa
U10 = U(:,1:10);



% lasketaan H sarakkeiden projektiot kyseiseen avaruuteen
PM = U10*U10'*M;
% huom! Koska meill� oli ortonormaali kanta niin itseasiassa pyydetty
% erotus saataisiin ilman varsinaista projektiota, ihan vain kertoimilla
% kikkaillen. Kannattaa kokeilla vaikkemme n�in alla teekk��n.
sum(sum((M-PM).^2)) 

% Ei pyydetty, mutta ihan mielenkiinnosta katsotaanpa v�h�n millaisilta
% ensimm�iset 5 projektiota n�ytt�v�t
figure
for i = 1 : 5
    plot(M(:,i),'b') % alkuper�inen
    hold on
    plot(PM(:,i),'r') % projektio
    hold off
    pause
end    

% Eih�n noissa ole k�yt�nn�ss� lainkaan eroa, 10 riitti hyvin.

%% T13

% a)


% lasketaan H sarakkeiden projektiot kyseiseen avaruuteen
PH = U10*U10'*H; 
sum(sum((H-PH).^2)) 

% Ei pyydetty, mutta ihan mielenkiinnosta katsotaanpa v�h�n millaisilta
% ensimm�iset 5 projektiota n�ytt�v�t
figure
for i = 1 : 5
    plot(H(:,i),'b') % alkuper�inen
    hold on
    plot(PH(:,i),'r') % projektio
    hold off
    pause
end    

% Eih�n noissa ole k�yt�nn�ss� lainkaan eroa, 10 riitti hyvin.


%% b)
F = Fourier_kanta(51);

H_F = F'*H; % H:n sarakkeiden koordinaatit F kannassa.
[~,Ind] = sort(abs(H_F),'descend');
H_rec_F = zeros(51,10000);
for i = 1 : 10000
    H_rec_F(:,i) = F(:,Ind(1:10,i))*H_F(Ind(1:10,i),i); % Varsinaiset projektiot, k�ytt�en suurimpiin kertoimiin liittyvi� kantavektoreita
end

sum(sum((H-H_rec_F).^2)) % Pystytt�isiin muuten taas laskemaan, jos haluttaisiin, pelkkien kertoimien avulla. 
figure % ihan vain mielenkiinnosta, katsotaanpa milt� nyt n�ytt��
for i = 1 : 5
    plot(H(:,i),'b')
    hold on
    plot(H_rec_F(:,i),'r')
    hold off
    pause
end
% No ei n�yt� ollenkaan niin hyv�lt� kuin svd:ll�. Paljonkos muuten 
% tarvitsee lukuja kummassakin talletella?
% SVD: 51*10 + 10*10000
% Fourier: 2*10*10000. Siis t�ll� kertaa Fourier kanta ei p�rj�nnyt.

%% Teht�v�ss� 13 tarvittava funktio
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





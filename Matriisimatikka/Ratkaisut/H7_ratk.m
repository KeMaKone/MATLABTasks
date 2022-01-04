clear all 
close all
load('h7_data.mat')

% Yritetään seurailla ratkaisuissa pitkälti monisteen merkintöjä,
% vaikka joskus tarpeettomia indeksejä sitten tulisikin

%% t1 
A = A1;
y = y1;
[U,S,V] = svd(A)
diag(S) 
% tarkastetaan montako nollasta poikkeavaa singulaariarvoa
r = 5 % Sattuu olemaan sama kuin matriisi rivien määrä
      % -> U2r matriisia ei ole ja siis käytänössä
      % tällä kertaa U1r = U ja Sr = S.
      % Laitetaanpa kuitenkin koodiin yleisemmin niin
      % myöhemmin copy/paste toimii
% Koska yksikään singulaariarvo ei ole 0, on yhtälöllä
% varmasti ratkaisu (c2r vektoria ei edes ole).
      
U1r = U(:, 1:r); 
V1r = V(:, 1:r);
Sr = S(1:r,1:r); 
d1r = inv(Sr)*U1r'*y1;
x = V1r*d1r
% tämä siis lyhin ratkaisuvektori, jossa valittu d2r = 0.

%% T2
%
% Kaikki alkulaskenta samaa kuin edellisessä tehtävässä.
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
% Tämä onkin vähän hevimpää settiä. Suositellaan että käydään 
% välivaiheet paperilla hahmotellen läpi. 

% Ratkaisuvektori on 
% x = V1r*d1r + V2r*d2r, jossa jälkimmäisen termin kertoimet
% on vapaasti valittavissa. Kirjoitetaah x = [h ; w], missä h
% on 3x1 nollavektori ja w sisältää 5 vapaata muuttujaa. Kirjoitetaan
% nyt x = I13*h + I23*w, missä
I = eye(7);
I13 = I(:,1:3);
I23 = I(:,3+1:end);
% näin saadaan I23*w -V2r*d2r = V1r*d1r - I13*h.
% Siis [I23, -V2r]*[w ; d2r] = V1r*d1r - I13*h.
% Merkitään A = [I23, -V2r], b = V1r*d1r - I13*h
% ja u = [w ; d2r]. 
% Ratkaistaan A*u = b. Ei kun hommiin:
h = zeros(3,1);
A = [I23, -V2r];
b = V1r*d1r - I13*h;
rref([A b]);
% Eipä näytä olevan ratkaisua. Aletaan sitten minimoimaan h = [x1 x2 x3]'
% vektorin pituutta. Aloitetaan kuten aiemminkin, eli
% x = V1r*d1r + V2r*d2r.
% Kun olemme kiinnostuneet vain kolmesta ylimmästä x:n alkioista
% niin merkitään näitä taas h:lla, ja vasemmalla puolella olkoon nyt
% kolme ensimmäistä riviä sisältävät matriisit K1 ja K2, eli
% h = K1*d1r +K2*d2r.

K1 = V1r(1:3,:);
K2 = V2r(1:3,:);

% Pitäisi siis minimoida h:n pituus, eli saada h mahdollisimman 
% lähelle nollavektoria. Tämä on sama asia kuin etsiä
% kertoimet d2r siten että K2*d2r on mahdollisimman lähellä vektoria
% -K1*d1r. Lasketaan siis käytännössä vektorin -K1*d1r ortogonaaliprojektio
% avaruuteen jonka virittää K2 matriisin sarakevektorit. Tämän
% projektion kertoimet K2 kannassa ovat optimaaliset arvot d2r:lle.

d2r = inv(K2'*K2)*K2'*(-K1*d1r);
x = V1r*d1r + V2r*d2r

%% T4
%
% Tehdään työtä käskettyä, eli siten kuin tehtävänannossa käsketään.
% Col(A) tarkoittaa avaruutta jonka virittävät A:n sarakevektorit
% Tämä on toisaalta ihan sama kuin U1r:n virittämä avaruus. Käytetään
% tätä etsiessämme y:tä, koska rakastamme ortonormaaleja vektoreita (ei muuta syytä)
[U,S,V] = svd(A2);
diag(S) % Jotta nähdään r arvo (toki löytyisi rank komennollakin)
r = 7 % tämä on siis maksimiarvo kun vain 7 sarakettakin. Voi olla
% että alla on nyt jokunen "turha" rivi kun V ja S matriisia ei tarvitsisi
% edes leikellä
U1r = U(:,1:r);
V1r = V(:,1:r);
Sr = S(1:r,1:r);
y = U1r*U1r'*y2
% Nyt siis vielä ratkaistaan $x$
d1r = inv(Sr)*U1r'*y;
x = V1r*d1r


%% T5 
% 
% Kun nyt ei ole käsketty tehdä tietyllä tavalla, niin tehdään 
% monisteen suoria kaavoja käyttäen:

[U,S,V] = svd(A3)
diag(S)
r =5;
U1r = U(:,1:r);
V1r = V(:,1:r);
Sr = S(1:r,1:r);
d1r = inv(Sr)*U1r'*y3;
x = V1r*d1r % d2r siis valitaan nollaksi kun tahdotaan lyhin x.

%% T6
% Jatketaan siitä mihin tehtävässä 5 jäätiin mutta nyt ei vain valita
% d2r:ää nollavektoriksi vaan ensialkuun se on tuntematon.
% jos merkitään 
p = [0 1 2 3 2 1 0]';
% niin etsitään d2r s.e. |x-p| minimoituu, eli |V2r*d2r-(p-V1r*d1r)|
% minimoituu, eli V2r*d2r on vektorin p-V1r*d1r ortogonaaliprojektio
% avaruuteen jonka virittävät vektorit V2r. Merkitään tätä projektiota
% nyt symbolilla P.
P = V2r*V2r'*(p-V1r*d1r);
x = V1r*d1r +P

%% T7
%
% Ratkaistaan ensin yhtälöryhmä A1*x1 = y1. Vaikkei kukaan sanonutkaan
% että pitää käyttää singulaariarvohajotelmaa niin käytetään, on
% sitten helppo otta copy/paste
[U,S,V] = svd(A1)
diag(S)
r = 5;
U1r=U(:,1:r);
V1r=V(:,1:r);
Sr=S(1:r,1:r);
d1r = inv(Sr)*U1r'*y1;
x1 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni

% Yhtälöryhmän A1*x2 = y1+e1 ratkaisussa vain kaksi viimeistä riviä vaihtuu
d1r = inv(Sr)*U1r'*(y1+e1);
x2 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni
norm(x1-x2)

% Jos singulaariarvoja nollataan ja yhä otetaan se lyhin mahdollinen
% pns-ratkaisu niin mikään muu ei muutu kuin se että r vaihtuu pienemmäksi.
% r = 3 näyttäisi hyvältä

r = 3;
U1r=U(:,1:r);
V1r=V(:,1:r);
Sr=S(1:r,1:r);
d1r = inv(Sr)*U1r'*y1;
x1 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni

% Yhtälöryhmän A1*x2 = y1+e1 ratkaisussa vain kaksi viimeistä riviä vaihtuu
d1r = inv(Sr)*U1r'*(y1+e1);
x2 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni
norm(x1-x2)

%% T8
% 
% Nyt tehdään iso copy/paste edellisestä tehtävästä. Käytännössä vain
% r arvoja pitää päivittää (paitsi että sattumalta nekin ovat sopivat)
% ja svd laskea uudelleen ja epähomogeenisuusosa vaihtaa.

% Ratkaistaan ensin yhtälöryhmä A3*x1 = y3. Vaikkei kukaan sanonutkaan
% että pitää käyttää singulaariarvohajotelmaa niin käytetään, on
% sitten helppo otta copy/paste
[U,S,V] = svd(A3)
diag(S)
r = 5;
U1r=U(:,1:r);
V1r=V(:,1:r);
Sr=S(1:r,1:r);
d1r = inv(Sr)*U1r'*y3;
x1 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni

% Yhtälöryhmän A3*x2 = y3+e3 ratkaisussa vain kaksi viimeistä riviä vaihtuu
d1r = inv(Sr)*U1r'*(y3+e3);
x2 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni
norm(x1-x2)

% Jos singulaariarvoja nollataan ja yhä otetaan se lyhin mahdollinen
% pns-ratkaisu niin mikään muu ei muutu kuin se että r vaihtuu pienemmäksi.
% r = 3 näyttäisi hyvältä

r = 3;
U1r=U(:,1:r);
V1r=V(:,1:r);
Sr=S(1:r,1:r);
d1r = inv(Sr)*U1r'*y3;
x1 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni

% Yhtälöryhmän A3*x2 = y3+e3 ratkaisussa vain kaksi viimeistä riviä vaihtuu
d1r = inv(Sr)*U1r'*(y3+e3);
x2 = V1r*d1r % valittu d2r nollaksi jolloin ratkaisu mahdollisimman pieni
norm(x1-x2)

%% T9
%
% Kaikki on lähes kokonaan copy/pastea. Lisäämme vain osuudet joissa
% laskemme sopivan d2r kerroinvektorin ja otamme tämän osuuden
% mukaan kun ratkaisemme x:n

% Ratkaistaan ensin yhtälöryhmä A3*x1 = y3. Vaikkei kukaan sanonutkaan
% että pitää käyttää singulaariarvohajotelmaa niin käytetään, on
% sitten helppo otta copy/paste
[U,S,V] = svd(A3)
diag(S)
r = 5;
U1r=U(:,1:r);
V1r=V(:,1:r);
Sr=S(1:r,1:r);
d1r = inv(Sr)*U1r'*y3;


p = [0 1 2 3 2 1 0]';
% niin etsitään d2r s.e. |x-p| minimoituu, eli |V2r*d2r-(p-V1r*d1r)|
% minimoituu, eli V2r*d2r on vektorin p-V1r*d1r ortogonaaliprojektio
% avaruuteen jonka virittävät vektorit V2r. Merkitään tätä projektiota
% nyt symbolilla P.
V2r = V(:,r+1:end);
% Periaattessa siis P = V2r*V2r'*(p-V1r*d1r), mutta ortogonaalisuutta
% hyväksi käyttäen 
P = V2r*V2r'*p;
x1 = V1r*d1r +P

% Yhtälöryhmän A3*x2 = y3+e3 ratkaisussa vain kaksi viimeistä riviä vaihtuu
d1r = inv(Sr)*U1r'*(y3+e3);
x2 = V1r*d1r +P
norm(x1-x2)

% Jos singulaariarvoja nollataan ja yhä otetaan se lyhin mahdollinen
% pns-ratkaisu niin mikään muu ei muutu kuin se että r vaihtuu pienemmäksi.
% r = 3 näyttäisi hyvältä

r = 3;
U1r=U(:,1:r);
V1r=V(:,1:r);
V2r = V(:,r+1:end);
Sr=S(1:r,1:r);
d1r = inv(Sr)*U1r'*y3;

P = V2r*V2r'*p;
x1 = V1r*d1r +P

% Yhtälöryhmän A3*x2 = y3+e3 ratkaisussa vain kaksi viimeistä riviä vaihtuu
d1r = inv(Sr)*U1r'*(y3+e3);

x2 = V1r*d1r +P
norm(x1-x2)

% 

%% Tehtävä 10
% (a) ja (b) Tehdään koodi josa yhtä parametria vaihtamalla
% voidaan vaihtaa PCA:sta puhtaaseen SVD luokitteluun. Tulokset
% tulevat olemaan tällä datalla itseasiassa ihan samat. 

mode = 0 ; % mode = 1 on pca, mode = 0 on svd

means1=mode*mean(D1')'; % jos mode=0 niin means1 on nollavektori eikä vaikuta mihinkään jatkossakaan

[U1, S1, V1] = svd(D1-means1);
figure
plot(diag(S1))
% Selvästi vain 3 vähänkään isompaa singulaariarvoa
r1 = 3;

means2=mode*mean(D2')'; % jos mode=0 niin means2 on nollavektori eikä vaikuta mihinkään jatkossakaan

[U2, S2, V2] = svd(D2-means2);
figure
plot(diag(S2))
% Selvästi vain 3 vähänkään isompaa singulaariarvoa
r2= 3;
% Etsitään huonot nyt hyvien joukosta katsomalla onko kunkin
% D matriisin vektorin
% etäisyys pienempi avaruuteen U1(:,1:r1) vai U2(:,1:r2).
% Jos keskitys on tehty (pca) niin pitää myös muostaa ensin siirtää
% saman verran D matriisin vektoreita.

% Etäisyyksien neliöt:
PL2 = sum((D-means2).^2)-sum((U2(:,1:r2)'*(D-means2)).^2);
PL1 = sum((D-means1).^2)-sum((U1(:,1:r1)'*(D-means1)).^2);
% vertailu: 
find((PL1-PL2)>0) 
figure
plot(PL1-PL2)
% viimeinen plotti ihan vain mielenkiinnosta. Jos katselee näitä niin
% ehkäpä pca löysi nämä vähän luotettavammin kun erot tuppasivat
% olemaan vähän isompia usein

%% T11

means1=1*mean(D1')'; % Tehdään pääkomponenttianalyysillä, tulos ei
% kyllä mihinkään muuttuisi vaikka suoraankin sovellettaisiin SVD:tä.

[U1,S1,V1] = svd(D1-means1);

coords = S1*V1';
figure
plot3(coords(1,:), coords(2,:),coords(3,:), 'b.');
% Eiköhän tuossa oleellisti kaksi eri pistejoukkoa eli luokkaa ole.



%% T12
%
% Tämä on "one liner" kun vain ymmärtää mitä kysytään
[U,S,V] = svd(M);
% Pyydetyt vektorit matriisissa
U10 = U(:,1:10);



% lasketaan H sarakkeiden projektiot kyseiseen avaruuteen
PM = U10*U10'*M;
% huom! Koska meillä oli ortonormaali kanta niin itseasiassa pyydetty
% erotus saataisiin ilman varsinaista projektiota, ihan vain kertoimilla
% kikkaillen. Kannattaa kokeilla vaikkemme näin alla teekkään.
sum(sum((M-PM).^2)) 

% Ei pyydetty, mutta ihan mielenkiinnosta katsotaanpa vähän millaisilta
% ensimmäiset 5 projektiota näyttävät
figure
for i = 1 : 5
    plot(M(:,i),'b') % alkuperäinen
    hold on
    plot(PM(:,i),'r') % projektio
    hold off
    pause
end    

% Eihän noissa ole käytännössä lainkaan eroa, 10 riitti hyvin.

%% T13

% a)


% lasketaan H sarakkeiden projektiot kyseiseen avaruuteen
PH = U10*U10'*H; 
sum(sum((H-PH).^2)) 

% Ei pyydetty, mutta ihan mielenkiinnosta katsotaanpa vähän millaisilta
% ensimmäiset 5 projektiota näyttävät
figure
for i = 1 : 5
    plot(H(:,i),'b') % alkuperäinen
    hold on
    plot(PH(:,i),'r') % projektio
    hold off
    pause
end    

% Eihän noissa ole käytännössä lainkaan eroa, 10 riitti hyvin.


%% b)
F = Fourier_kanta(51);

H_F = F'*H; % H:n sarakkeiden koordinaatit F kannassa.
[~,Ind] = sort(abs(H_F),'descend');
H_rec_F = zeros(51,10000);
for i = 1 : 10000
    H_rec_F(:,i) = F(:,Ind(1:10,i))*H_F(Ind(1:10,i),i); % Varsinaiset projektiot, käyttäen suurimpiin kertoimiin liittyviä kantavektoreita
end

sum(sum((H-H_rec_F).^2)) % Pystyttäisiin muuten taas laskemaan, jos haluttaisiin, pelkkien kertoimien avulla. 
figure % ihan vain mielenkiinnosta, katsotaanpa miltä nyt näyttää
for i = 1 : 5
    plot(H(:,i),'b')
    hold on
    plot(H_rec_F(:,i),'r')
    hold off
    pause
end
% No ei näytä ollenkaan niin hyvältä kuin svd:llä. Paljonkos muuten 
% tarvitsee lukuja kummassakin talletella?
% SVD: 51*10 + 10*10000
% Fourier: 2*10*10000. Siis tällä kertaa Fourier kanta ei pärjännyt.

%% Tehtävässä 13 tarvittava funktio
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





clear all 
close all
%% TEHTÄVÄ 1
% 
% Pyydetty funktio tehtävän 10 jälkeen. 

N = 11; % kokeile erilaisilla N:n ravoilla toimivuutta
F = Fourier_kanta(N);
% Jos F:n sarakevektorit ovat ortonormaaleja niin F'*F pitäisi olla
% identiteettimatriisi
e = sum(sum(abs(eye(N)-F'*F))) % jos tulee kovin pieni niin ok.


%% TEHTÄVÄ 2
%
N = 1001;
F = Fourier_kanta(N);

t = 2*pi*[0:N-1]'/N;
g = exp(-0.25*(t-pi).^2);
% (a)
% Ratkaistaan g =  F*g_F  yhtälöstä koordinaattivektori g_F
% Koska Fourier kanta on ortonormaali niin inv(F) = F', joten
g_F = F'*g 
figure
plot(g_F)
% Nähdään että g:llä on huomattavan vähän merkittävästi nollasta poikkeavia 
% koordinaatteja Fourier kannassa. Nämä nollasta poikkeavat liittyvät vielä
% alhaisen taajuuden kosinifunktioihin. Tämä johtuukin siitä että g on
% aika sileä (siksi ei korkean taajuuden funktiot ole sen esittämisessä
% kovin tärkeitä) ja toisaalta jos funktion määrittelyjoukon ottaisi ensin
% juurikin väliksi [0, 2*pi] ja laajentaisi sen sitten jaksolliseksi niin
% siitä tulisi parillinen funktio, kuten cosinifunktiot ovat. Sini funktiot
% ovat parittomia funktioita ja ovat mahdollisimman erilaisia parilliiin
% funktioihin nähden (ortogonaalisia), tästä johtuen sin(kx) funktioihin
% liittyvät koordinaatit käytännössä nollaa. 

% (b)

[~, indexes] = sort(abs(g_F),'descend');

A = F(:,indexes(1:10));

% Jos y on g_n kysytty ortogonaaliprojektio niin ja y = A*y_A kertoimet
% saadaan yhtälöstä(A'*A)*y_A = A'* g, joka sievenee tällä kertaa 
% (koska A:n sarakkeet ortonormaaleja) muotoon y_a = A'*g.

y_A = A'*g;
y = A*y_A;
norm(g-y); % g:n ja sen projektion erotuksen suuruus
figure
hold on
plot(g,'b')
plot(y,'r')
% Hyvin lähelle samaltahan näiden pitäisi näyttää
% Huomautus: Koska F matriis sisälsi samoja ORTONORMAALEJA vektoreita kuin
% A matriisikin, olisi y_A = g_F(indexes(1:10)), eli samaan vektoriin liittyvä
% kerroin pysyy samana, oli sitten kokonainen esitys (g_F) tai ortogonaaliprojektio
% kyseessä. Joten ei olisi tarvinnut näin monimutkaisesti laskeskella. 
% Mutta tälläinen pätee vain jos meillä on samat ortonormaalit vektorit
% kannoissa A ja F.


%% TEHTÄVÄ 3

e = 0.05*randn(N,1);
g_tilde = g+e;

% Olkoon y_tilde ortogonaaliprojektio g_tilde vektorille avaruuteen A
y_tilde = A*(A'*g_tilde)
% tämä siis oli "kantavektorit*koordinaatit" ja koordinaatit tulivat taas 
% helposti kun on ortonormaalit kantavektorit
figure
hold on
plot(g,'b'); plot(y,'r'); plot(g_tilde,'m'); plot(y_tilde,'k')

% Huomataan että aika kivastihan tuo ortogonaaliprojektio toimii kohinan 
% poistajana kun on funktioon g nähden sopivat kantafunktiot valittu!
%% TEHTÄVÄ 4

% (a)
% h_1 = 1 = 1*s_1 + 0*s_2 +0*s_3 +0*s_4, siis jos oltava h_1 =  S*h_1_S
% niin
h_1_S = [1 0 0 0]'
% h_2 = 1 -t = 1*s_1 -1*s_2 +0*s_3 +0*s_4, siis jos oltava h_2 =  S*h_2_S
% niin
h_2_S = [1 -1 0 0]'
% h_3 = 2 -4t +t^2 = 2*s_1 -4*s_2 +1*s_3 +0*s_4, siis jos oltava h_3 =  S*h_3_S
% niin
h_3_S = [2 -4 1 0]'
% h_4 = -12t +8*t^3 = 0*s_1 -12*s_2 +0*s_3 +8*s_4, siis jos oltava h_4 =  S*h_4_S
% niin
h_4_S = [0 -12 0 8]'

% (b)
% Voisimme alkaa kokoamaan pitkällistä tietä kertoimet määritteleviä
% yhtälöitä vektori kerrallaan, mutta pyöräytetäänpä tämä kaikki kerralla.

% Jos merkitsemme H_S = [h_1_S, h_2_S, h_3_S, h_4_S] niin voimme koota (a) kohdassa 
% esiintyneet yhtälöt yhteen muotoon H = S*H_S (eli vektori =
% kantavektori*vektorin koordinaatit kannassa, nyt vain neljälle vektorille tämä
% esitetty yhtä aikaa)
% Vastaavasti voimme kirjoittaa S = H*S_H, missä S_h sisältäisi kaikkien
% s_i vektoreiden koordinaatit kannassa H.
% Näin ollen H =  S*H_S =  H*S_H*H_S. Toisaalta kun I on
% identiteettimatriisi niin H = H*I. Saamme H*I = H*(S_H*H_S) eli oltava
% I = S_H*H_S (tämä viimeisin vaatii tietoa että funktiot H matriisisssa ovat
% lineaarisesti riippumattomia). Näin ollen S_H ja H_S ovat toisilleen
% käänteismatriiseja.
 H_S = [h_1_S, h_2_S, h_3_S, h_4_S]
 S_H = inv(H_S)


%% TEHTÄVÄ 5
%
% Ensinäkin p(t) = H*p_H ja edellisen tehtävän tyyliin siis
% p(t) = H*p_H = S*H_S*p_H. Toisaalta
% p(t) = S*p_S, eli oltava H_S*p_H = p_S.
% Näin ollen p_H = S_H*p_S koska S_H on H_S matriisin käänteismatriisi.
% Siis tehtässä kysytty kannanvaihtomatriisi kannasta S kantaan H on S_H.
% Ja kannanvaihtomatriisi kannasta H kantaan S on H_S.

%% TEHTÄVÄ 6
%
%(a)
% Muistetaan että s_1 = 1, s_2 = t,  s_3 = t^2,  s_4 = t^4.
% Merkitään jatkossa funktion f(t) derivaattaa merkinnällä df jotta
% ei sotketa  Matlabin transpoosioperaattoriin.
% Tällöin
%  ds_1 = 0 = 0*s_1 + 0*s_2 +0*s_3+ 0*s_4
%  ds_2 = 1 = 1*s_1 + 0*s_2 +0*s_3+ 0*s_4
%  ds_3 = 2t = 0*s_1 + 2*s_2 +0*s_3+ 0*s_4
%  ds_4 = 3t^2 = 0*s_1 + 0*s_2 +3*s_3+ 0*s_4.
% Kootaan nämä matriisiin, samaan tyyliin kuin kantafunktiot ladottiin
% matriisin S, merkitään tät matriisia dS = [ ds_1 ds_2 ds_3 ds_4].
% Yhtälöitä tarkastelemalla nähdään että dS = S*M, missä
M = [0 1 0 0;
     0 0 2 0;
     0 0 0 3
     0 0 0 0]
% eli M sisältään kantafunktioiden derivaattojen koordinaatit kannassa S.
% Matriisi M on siis sopiva ainakin siihen että kantafunktiot voidaan
% derivoida sen avulla (jokaiselle kantafunktiolle pätee [s_i']_S =
% M[s_i]_S.)

% Jäljellä on nyt katsoa että tämä toimii myös muillekin polynomeille, eikä
% vain kantafunktioille.

% Yleinen polynomi voidaan kirjoittaa p = a_1*s_1+a_2*s_2+a_3*s_3+a_4*s_4 = S*a 
% Derivoitaisiin termi kerrallaan saadaan
% dp = a_1*ds_1+a_2*ds_2+a_3*ds_3+a_4*ds_4 = dS*a.

% Muistaen että koska p = S*a niin itseasiassa a= p_S , saadan dp:lle esitysmuodot
% dp = dS*a = dS*p_S=S*M*p_S. Toisaalta tahdottin löytää D_S s.e. dp = S*D_S*p_S.
% Näin ollen etsitty matriisi D_S on juurikin edellä esitetty matriisimme
% M!
D_S = M

% Seuraavaksi etsitään matriisi D_H. Tahdotaan siis löytää D_H s.e. dp = H*D_H*p_H. 
% Tämä voitaisiin tehdä "käsityönä" vähän edellisen tehtävän malliin, joskin työläämmin.
% Mutta pyöritelläänpä käyttäen edellä muodostettuja matriiseja hyväksi.

% Käytetään edellisen tehtävän tietoa S = H*S_H, jolloin saadaan
% dp = S*D_S*p_S = H*S_H*D_S*p_S = H*(S_H*D_S*H_S)*p_H. Näin ollen oltava
D_H = S_H*D_S*H_S

% Mietitäänpä hetki onko tässä järkeä? D_H*p_H kertolaskun pitäisi
% oleellisesti tehdä derivointi. Nyt koska
% D_H*p_H = S_H*D_S*H_S*p_H = S_H*D_S*p_S, niin tämähän tarkoittaa että
% voidaan ajatella S_H:n ensin muuntavan p_H koordinaatit S kantaan, sitten
% tekevän derivoinnin matriisin D_S avulla ja sitten muuntavan nämä
% takaisin H kantaan.

% Tämä on itseasiassa erittäin tehokas ajatusmalli: Jos osaamme derivoida 
% jossakin kannassa S, eli tunnemme matriisi D_S, niin osaamme derivoida 
% missä tahansa muussa kannassa H,
% kunhan vain osaamme muodostaa kannanvaihtomatriisin H_S (S_H oli vain tämän
% käänteismatriisi)

% Olemme tässä erittäin jännän äärellä nimittäin tämähän pätee mihin
% tahansa lineaariseen kuvaukseen: jos osaat tehdä sen yhdessä kannassa niin
% osaat myös toisessa, mikäli osaat vaihtaa kantaa. Voipi olla varsin
% kätevää kun ei tarvitse keksiä pyörää aina uudelleen kun hieman eri
% kantilta katsoo asiaa. Tai jos vaikka on hullu maailmankaikkeus jossa
% valonkulkukin tuppaa kaareutumaan ja aika on suhteellista. Siinä silloin
% koordinaatistot vaihtuvat niin että vilisee ja joudutaan tekemään jotain
% varsin samantyylistä mitä nyt tehtiin, jotta pysytään "kartalla".

%(b)

p_S = [4 2 0 6]';
p_H = S_H*p_S;
t = sym('t');
S = [1, t, t^2, t^3];
H = [1, 1-t, 2-4*t+t^2, -12*t+8*t^3]
dp = S*D_S*p_S
dp = H*D_H*p_H


%% TEHTÄVÄ 7

A = [3 2; 0 -1];
[V,D] = eig(A)
% Mikäli ominaisvektorit lineaarisesti riippumattomia niin diagonaalihajoitelma 
% on olemassa ja se on A=V*D*inv(V). Kokeillaan
V*D*inv(V)
% Jeps.
d = diag(D)
d_to_10 = d.^10
A_to_10 = V*diag(d_to_10)*inv(V)
% testataan tuleeko " brute forcella sama"
A*A*A*A*A*A*A*A*A*A
% Jeps.

%% TEHTÄVÄ 8
%
% Erillisellä paperilla 


%% TEHTÄVÄ 9
% TAPA 1
% Tehdään harjoituksen vuoksi ensin "hölmöllä" tavalla, eli etsitään
% haluttuun lineaarikuvaukseen sopiva matriisi.
% Jotta lineaarikuvaus L(x) = Ax muuttaisi vektorin R^3:sta R^2:een niin sen
% kerroinmatriisin pitäisi olla kokoa 2x3. Oletetaan että kuvaus on nyt 
% tällainen ja etsitään A siten että halutut ominaisuudet
% L(v1) = A*v1 = b1, L(v2) = A*v2 = b2 ja  L(v3) = A*v3 = b3
% pätevät kun siis
v1 = [1 0 0]'
v2 = [2 1 1]'
v3 = [1 -1 0]'
b1 = [1 -1]'
b2 = [2 0]'
b3 = [1 1]'
% Yhtälöt voidaan koota muotoon A*[v1 v2 v3] = [b1 b2 b2] eli kun merkitään
% V = [v1 v2 v3] ja B = [b1 b2 b3] niin A*V = B. Kerrotaan yhtälön molemmat puolet vasemmalta V:n
% käänteismatriisilla jolloin saadaan A = B*inv(V).
V = [v1 v2 v3];
B = [b1 b2 b3];
A = B*inv(V);

% a) 
L = @(x) A*x
x_V = [2 -1 5]'
x = V*x_V
L(x)

% b) 
y = [1 0 2]'
L(y) % Tämä saatiin siis helposti JOS viitsittiin ensin etsiä matriisi A.

% TAPA 2

% (a) Koska x = V*x_V ja kuvaus on lineaarinen, voidaan kirjoittaa 
% L(x) = L(V*x_V) = L(V)*x_V = [L(v1) L(v2) L(v3)]*x_V.
% Jos yksityiskohdat eivät ole selviä niin kannattanee katsoa
% seuraavan tehtävän tehtävänannossa esiintyvää kaavamanipulaatiota (1).
% Jos B kuten edellisellä tavalla laskiessa niin on siis L(x)=B*x_V=
% B*inv(V)*x. 
% Mikäli saamme suoraan koordinaatit x_V tai niin tämä on erittäin näppärä
% tapa: B hoitaa täsmälleen saman tempun x:lle, kun x esitetään V koordinaateissa,
% mitä A tekee x:lle kun x esitetään standardikoordinaateissa.
% Eli jos määrittelemme L_V(x_V) = B*x_V  niin tällöin L(x) = B*x_V
L_V = @(x_V) B*x_V  

L_V(x_V)
%(b)
y_V = inv(V)*y
L_V(y_V)
% Huom! Isoilla matriiseilla käänteismatriisin tarve tässä kohtaa oikeastaan
% tuhoaisi kaiken tällä jälkimmäisellä tavalla saavutetun edun. Paitsi jos
% kanta V sattuisi olemaan ortogonaalinen niin tällöin olisi laskenta
% helppoa koska inv(V) = V'. Seuraava tehtävä esittelee vähän tarkemmin 
%tästä saavutettavaa etua.

%% TEHTÄVÄ 10
% (a) Aika paljon vs. (b) aika vähän laskutoimenpiteitä, mikäli M ja N arvoihin
% suhteutettuna indeksijoukon J koko on pieni. Jätetään tarkat laskelmat 
% opiskelijalle tällä kertaa.

%% Funktiot


% Tehtävän 1 funktio:

function F = Fourier_kanta(N)
    
    % 1.
    t = 2*pi*[0:N-1]'/N;
   
    % 2.
    V = zeros(N,(N-1)/2+1); % Matriisi johon seuraavaksi talletetaan v_k vektorit sarakkeiksi
    for k = 0:(N-1)/2
        V(:,k+1) =  cos(k*t);        
    end
    
    % 3.
    U = zeros(N,(N-1)/2); % Matriisi johon seuraavaksi talletetaan u_k vektorit sarakkeiksi
    for k = 1 : (N-1)/2
        U(:,k) = sin(k*t);
    end
    
    % 4.
    % Tehdään nyt kuten on käsketty, vaikka olisi kannattanut tehdä varmaan
    % normalisointi jo edellisessä vaiheessa.
    F = zeros(N,N); % Matriisi johon seuraavaksi tallennetaan f vektorit
    
    for k = 1:(N-1)/2+1
        F(:,k) =  V(:,k)/norm(V(:,k));        
    end
    for k = 1 : (N-1)/2
        F(:,(N-1)/2 + 1 + k) =  U(:,k)/norm(U(:,k));
    end    

end




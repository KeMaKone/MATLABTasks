clear all 
close all

display('Teht?v? 1a')

A = [ 36 51 13; 52 34 73 ; 0 7 1.1]

i=0;
for d = 0:0.1:10
    i = i + 1
    b = [33 45 3]' - d*[11 10 12]'; % d on ravintoaineen D m??r?
    x(:,i) = inv(A)*b; % x(:,i) sis?lt?? muiden ravintoaineiden m??r?t
end

plot(0:0.1:10,x(1,:),'b') % ravintoaine A
hold on
plot(0:0.1:10,x(1,:),'r') % ravintoaine B
plot(0:0.1:10,x(1,:),'g') % ravintoaine C

display('Teht?v? 1b')

clear x d 
i= 1;
d_temp = 0;
b = [33 45 3]' - d_temp*[11 10 12]'
x_temp = inv(A)*b;
while x_temp(1) >= 0 & x_temp(2) >= 0 & x_temp(3) >= 0 
    d(i) = d_temp;
    d_temp = d_temp + 0.1
    b = [33 45 3]' - d_temp*[11 10 12]'; % d on ravintoaineen D m??r?
    x(:,i) = x_temp;
    x_temp = inv(A)*b
    i = i + 1
end
figure
plot(d,x(1,:),'b') % ravintoaine A
hold on
plot(d,x(2,:),'r') % ravintoaine B
plot(d,x(3,:),'g') % ravintoaine C
% Huhhuh, tulipas tehty? purkkaa jottei while silmukassa lakettaisi yht??n 
% yht??n ylim??r?ist? kierrosta

display('Teht?v? 2a')

A = [1 -3 -5 ; 0 1 1];
b = [0 0 ]';

rref([A b])
% tuloksesta n?hd??n ett?
v_1 = [2 -1 1]'
d = [0 0 0]'

display('Teht?v? 2b')

A = [1 -2 -1 3 ; -2 4 5 -5; 3 -6 -6 8 ];
b = [0 3 2]';

rref([A b])
% tuloksesta n?hd??n ett? ett? yht?l?ryhm?ll? ei ratkaisua

display('Teht?v? 2c')

A = [1 -2 -1 3 -1 1; -2 4 5 -5 0 0; 3 -6 -6 8 -2 7];
b = [0 3 2]';

rref([A b])
% tuloksesta n?hd??n ett?
v_1 = [2 1 0 0 0 0]'
v_2 = [-(3+1/3) 0 -1/3 1 0 0]'
v_3 = [8+1/3, 0 , 3+1/3, 0, 6, 1]'
d = [-7-1/3 0 -2-1/3 0 -5 0]'

display('Teht?v? 3a')

% siis onko c1, c2, c3 ja t siten ett? 
% [t 1 -1]' = c1*a1 + c2*a2 + c3*a3
% Voidaan muotoilla my?s 
% [0 1 -1]' = c1*a1 + c2*a2 + c3*a3 + t[-1 0 0]', eli jos merk
% b = [0 1 -1]' ja x = [c1 c2 c3 t], niin ratkaistava
% Ax = b, miss?

A = [[1 2 3]', [1 -1 1]', [-1 0 1]', [-1 0 0]'];

b = [0 1 -1]'

rref([A b])

% tuloksesta n?hd??n ett? t j?? vapaaksi muuttujaksi, eli v(t)
% voidaan muodostaa kaikilla t:n arvoilla

display('Teht?v? 3b')

A = [[1 2 3]', [1 -1 1]', [-1 0 0]'];

b = [0 1 -1]'

rref([A b])

% tuloksesta n?hd??n ett? v(t) voidaan muodostaa kun t = -1

display('Teht?v? 4a')

A = [1 1 1; 0 -2 1; 1 -1 2; 0 2 -1];
rref(A)
% kaikki kolme eiv?t ole lin. riippumattomia sill? saadaan vain 2 
% ei nollarivi?. Varma valinta lineaarisesti riippumattomiksi
% on ottaa "portaiden" kohdalta vektorit, eli ensimm?inen ja toinen
% sarakevektori A matriisista.

display('Teht?v? 4b')

% Olkoon a1, a2 ja a3 matriisin A sarakevektorit. 
% Yht?l?ryhm?ll? on ratkaisu t?sm?lleen silloin kun b on 
% muotoa b = Ax, eli b= x1*a1+x2*a2+ x3*a3, eli kun b on
% A:n sarakkeiden lineaarikombinaatio. Sarakkeet eiv?t kuitenkaan
% ole lin. riippumattomia, mutta esim. a1 ja a2 ovat, eli kirjoitetaan
% b = c1*a1+c2*a2

display('Teht?v? 5')
% tehd??n pyydetty koodi t?h?n samaan skriptitiedostoon ja
% demonstroidaan satunnaisella matriisilla. Koodi j?ljittelee
% mahdollisimman paljon sit? tapaa miten itse "k?sin" laskien
% muodostaisin vektoreita fuksikurssilla.
% On olemassa vähän näppärämpiäkin tapoja.

A = rand(4,7);
b = rand(4,1);

[R, jb] = rref([A]) % jb sis?lt?? tiedon miss? sarakkeissa portaat ovat
%Huom! Toki portaat olisi voinut etsiä ihan "for" silmukkaa
% ja "if" ehtoa käyttäen.

% Etsit??n melkoisella purkalla vapaiden muuttujien indeksit
j = 1;
for i = 1 : size(A,2)
    if sum(i==jb)==0 % kyseess? ei ole porras
        vapaat(j)=i % tallennetaan l?ydetty j:nen vapaan muuttujan indeksi
        j = j + 1
    end
end
% sitten ladotaan kaikki paikalleen 
V = zeros(size(A,2),size(A,2)-length(jb)) % alustetaan matriisi V = [v1, v2, ...,vk]

for i = 1 : length(jb) % sidottujen muuttujien kohdalle vapaiden muuttujien kertoimet, negatiivisina
    V(jb(i),:) = -R(i,vapaat)
end
for i = 1 : length(vapaat) % vapaiden muuttujien kohdille ykk?set
    V(vapaat(i),i)=1
end
% sitten viel? vektori d
R= rref([A b])
d = zeros(size(A,2),1);
d(jb) = R(1:length(jb),end)


display('Teht?v? 6a')

A = [1 -2 0; 1 1 -1; 1 1 1];
B = [1 0 1; 1 1 0; 0 1 1];

inv(A)*B % kannanvaihtomatriisi kannasta B kantaan A
inv(B)*A % kannanvaihtomatriisi kannasta A kantaan B

display('Teht?v? 6b')

for i = 1 : 5 % luodaan vektorit yksi kerrallaan
    x = rand(1)*A(:,1)+rand(1)*A(:,2);
    X(:,i) = x; % tallennetaan viel? muodostetut vektorit suurempaan matriisiin
     % lasketaan koordinaatit kannassa A ja tallennetaan isompaan
     % matriisiin
    X_koord_A(:,i) = inv(A)*x;
    
    X_koord_B(:,i) = inv(B)*x; % tallennetaan viel? n?m?kin
end
X_koord_A 
X_koord_B 

% huomataan ett? kannassa A viimeinen koordinaatti aina 0, kuten pit??kin,
% kannassa B koordinaati eiv?t my?sk??n ihan "mit? sattuu". Vilkaiseppa
% kannanvaihtomatriisia kannasta A kantaan B ja mieti mit? koordinaatit
% kannassa A ovat.

display('Teht?v? 7')

v1 = [1 2 0]' / sqrt(5);
v2 = [0 -1 1]' / sqrt(2);

figure();
hold on;
grid on;
view(-10,40);

n = 10;

R = zeros(3,n);

for i = 1:n
    
    a1 = 5*rand() + 5;
    a2 = 5*rand() + 5;
    
    e = 0.2*rand(3,1) - 0.1;
    
    r = a1*v1 + a2*v2 + e;
    R(:,i) = r;
    
    plot3(r(1), r(2), r(3), 'r.');
end

display('a)');

v3 = cross(v1,v2); % Ristitulolla kohtisuora vektori ja normitus
v3 = v3 / norm(v3);

V = [v1 v2 v3];

%%
% $$ \textbf{r}_i $$ koordinaatit standardikannassa ovat suoraan vektorien
% perinteiset paikkakoordinaatit, jotka ovat n?kyviss? $$ R $$ -matriisissa.
% ja kannan $$ V $$ koordinaatit saadaan k??nteismatriisin avulla.

c_E = R
c_V = inv(V)*R

%%
% Huomataan ett? k?ytett?ess? kantaa $$ V $$ kolmas koordinaatti pysyy pienen?
% verrattuna muihin. T?m? on j?rkev??, koska $$ v_3 $$ suuntaista
% komponenttia syntyy vain kohinan luonnissa, jonka amplitudi (0.1) on
% huomattavasti pienempi kuin pisteiden luonnissa k?ytettyjen vektorien 
% $$ v_1 $$ ja $$ v_2 $$ satunnaisuuden amplitudi (5.0).

display('Teht?v? 8')

f = @(t,i) sin((i - 1)*t); % Sinifunktio, jolla muodostetaan kanta
g1 = @(t) sin(2.3*t); % g(x) kohdasta a
g2 = @(t) cos(t); % g(x) kohdasta b

t_n = linspace(0, 9/10*pi, 10)'; % a ja b kohdan t_n vektori
t_n2 = linspace(0, 18/10*pi, 10)'; % c kohdan t_n vektori

x1 = g1(t_n); % a ja b kohdan x vektori
x2 = g2(t_n); % c kohdan x vektori

V = zeros(10,10); % a ja b kohdan kanta
V2 = zeros(10,10); % c kohdan kanta

V(:,1) = ones(10,1);
V2(:,1) = ones(10,1);

for i = 2:10
    
    V(:,i) = f(t_n, i);
    V(:,i) = V(:,i) / norm(V(:,i));
    
    V2(:,i) = f(t_n2, i);
    V2(:,i) = V2(:,i) / norm(V2(:,i));
end

c_V_a = inv(V)*x1 % a kohdassa halutut koordinaatit
c_V_b = inv(V)*x2 % b kohdassa halutut koordinaatit

%%
% Mielenkiintoisena esiintyy ensimm?isen komponentin eli vakiofunktion
% koordinaatti. Sini on tunnetusti 0, kun t = 0 eli sovitettaessa cosiniin
% sinifunktioita, on vakiofunktion oltava 1 ja sinien kompensoitava vakio
% ''nostavaa'' vaikutusta muissa pisteiss?.

rref(V2)
rank(V2)

%%
% Huomataan ett? rank on vain 6 eli ei voida muodostaa $$ R^{10} $$ kantaa.


display('Teht?v? 9a')

% kerroinmatriisi A (viem?ll? kaikki tuntemattomat vasemmalle puolelle ja muut
% oikealle), ja ajattelemalla muuttujavektorina vektoria [a11 a12 a13 a21 a22 a23]

A = [1 1 1 0 0 0;
    0 0 0 1 1 1;
    1 0 0 1 0 0;
    0 1 0 0 1 0;
    0 0 1 0 0 1]

% b = [ln(I0)-ln(m12), ln(I0)-ln(m12), ln(I0)-ln(m22), ln(I0)-ln(m21), ln(I0)-ln(m31))]

display('Teht?v? 9b')

% merkit??n b = ln(I0)-ln(m), miss? ln funktiot otetaan siis alkioittain
% vektorien alkioista. T?ll?in
% Aa=b <=> Aa = ln(I0)-ln(m) <=> m = exp(ln(I0)-Aa), miss? kaikki
% funktiot otetaan taas alkioittain vektoreista.

a = log(2)*ones(6,1);
I0= 100;
m = exp(log(I0)-A*a)

display('Teht?v? 9c')

rank(A)

% koska rank on pienempi kuin muuttujien m??r?, on yht?l?ryhm?ll?
% ??ret?n m??r? ratkaisuja (j?? vapaita muuttujia) mik?li ratkaisua on
% ylip??t??n (ja nyth?n oletettiin ett? ratkaisu on, kun mittauksissa ei
% virheit?). Tietysti t?m? oli itsest??n selv?? kun jo siit? ett?
% muuttujia 6 mutta rivej? (mittauksia) 5.

display('Teht?v? 9d')

rref(A')
% viidenness? sarakkeessa ei porrasta, joten viides rivi yht?l?ryhm?st?
% voidaan varmasti esitt?? muiden rivien lineaarikombinaationa, eli
% se on periaatteessa turha.

display('Teht?v? 10a')

A = [A;
    sqrt(2) 0 0 0 sqrt(2) 0];
rank(A)
% ratkaisuja on yh? ??ret?n m??r?, uutta informaatiota kuitenkin
% taidettiin saada mittauksista koska rank kasvoi.

display('Teht?v? 10b')

% nyt s?de etenee kuution johon liittyy a11 sis?ss? matkan sqrt(1^2+0.5^2),
% ja saman matkan sen kuution sis?ss? johon liittyy a21. T?st?
% tulee yht?l? ln(m13)=ln(I0)-(sqrt(1.25)a11 +sqrt(1.25)a21).
% Jos t?t? verrataan yht?l?ryhm?n (3) ensimm?iseen yht?l??n niin
% saadaan ln(m13)=ln(I0)-sqrt(1.25)(ln(I0)-ln(m11)). Siis
% mittaus m13 saataisiin itseasiassa johdettua mittauksesta m11.
% t?m? ei tietenk??n ole yll?tt?v?? kun kummissakin mittauksissa s?de
% etenee suhteessa saman matkan kummankin kuution l?pi. Voidaan my?s
% ajatella ett? kerroinmatriisissa olevat rivit ovat lin. riippuvia
% toinen saadaan toisesta kertoimella sqrt(1.25) kertomalla.

display('Teht?v? 10c')

% Nyt s?de menee niiden kuutioiden l?pi joihin liittyy a12 ja a23,
% kummankin kuution sis?ll? edet??n matka sqrt(2). Yht?l?ksi saadaan

% ln(m23) = ln(I0)-(sqrt(2)a12+sqrt(2)a23), matriisiin lis?t??n siis 
% seuraava rivi

A = [A;
    0 sqrt(2) 0 0 0 sqrt(2)]
rank(A)

% Jee! Taas tuli uusi "hyv?" mittaus.

display('Teht?v? 10d')

A = A([1 2 3 4 6 7],:) % poistettiin viides rivi joka liittyi m31:een
m = [2 1 5 5 1.5 0.2]'
I0 = 100; 
% Koska poistimme lin riippuvan rivin, pit?isi rank olla yh? 6 ja
% t?ll?in 6x6 kerroinmatriisillamme on k??nteismatriisi. Ratkaistaan 
% yht?l?ryhm? vaikkapa t?m?n avulla.

b = log(I0)*ones(6,1)-log(m);
a = inv(A)*b

display('Teht?v? 10e')
m = [2 1 5 5 1.5 0.02]'
b = log(I0)*ones(6,1)-log(m);
a = inv(A)*b

% Huomataan ett? yksi a:n alkioista heilahtikin negatiiviseksi, mik?
% on tietysti v?h?n outoa jos pit?isi olla kyse tiheydest?.



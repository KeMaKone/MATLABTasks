clear all 
close all

display('Teht?v? 1')
% a)
R = @(alpha) [cos(alpha) -sin(alpha); sin(alpha) cos(alpha)];
x = [3, 6]';
Rx = R(-pi/3)*x;
figure
hold on
plot(0,0,'kx')
plot(x(1),x(2),'ro')
plot(Rx(1),Rx(2),'bo')
axis equal
% b) 
p = [1,2]'
x_temp = x-p; % siirretään s.e. nyt kierto kuten origon suhteen
Rx_temp = R(-pi/3)*x_temp; % tehdään kierto
Rx = Rx_temp+p % siirretään takaisin 
figure
hold on
plot(0,0,'kx')
plot(p(1),p(2),'gx')
plot(x(1),x(2),'ro')
plot(Rx(1),Rx(2),'bo')
axis equal


display('Teht?v? 2')
% a)
x = [3,6,0]';
v = [2,1,1]'/sqrt(6)'; % normitetaanpa tämä vektori heti, ei se haittaakaan tee
% Seuraillaan löyhästi videoissa esitettyä ideaa.
% Tarvitan ensin pari vektoria v vastaan kohtisuorassa olevaa
% yksikkövektoria, olkoon nämä vektorit u1 ja u2
u2 = (1/sqrt(2))*[0 -1 1]'; 
u1 = cross(v,u2);
% Jos nyt tahdotaan pyörittää x pistettä v vektorin suuntaisen suoran ympäri 
% myötäpäivään, voidaan tehdä se tehdä näppärästi kun esitetään se 
% u1,u2,v vektoreiden kannassa ja pyöräytetään sitten u1 ja u2 vektoreihin
% liittyviä koordinaatteja. 
%Koska kanta on ortonormaali niin 
U = [u1, u2, v]
x_U = U'*x

x_U_rotated = [R(-pi/3)*[x_U(1),x_U(2)]'; x_U(3)];
x_rotated = U*x_U_rotated;


figure
hold on
plot3(0,0,0,'kx')
plot3(x(1),x(2),x(3),'ro')
plot3(x_rotated(1), x_rotated(2), x_rotated(3),'bo')
plot3([0 v(1)], [0 v(2)], [0, v(3)])
axis equal

% b)
% Ero edelliseen ainoastaan että aluksi siirretään koordinaatistoa niin
% että suora kulkee origon kautta ja ihan lopuksi
% sitten siirretään takaisin
p = [1 2 0]';

U = [u1, u2, v]
x_siirretty_U = U'*(x-p)

x_siirretty_U_rotated = [R(-pi/3)*[x_siirretty_U(1),x_siirretty_U(2)]'; x_siirretty_U(3)];
x_siirretty_rotated = U*x_siirretty_U_rotated;
x_rotated = x_siirretty_rotated+p;

figure
hold on
plot3(0,0,0,'kx')
plot3(x(1),x(2),x(3),'ro')
plot3(x_rotated(1), x_rotated(2), x_rotated(3),'bo')
plot3([0 v(1)]+p(1), [0 v(2)]+p(2), [0, v(3)]+p(3))
axis equal



display('Teht?v? 3a')

% Teht?v? on tarkoitettu k?sin laskettavaksi.  
% (a) kohdan kuvaus on lineaarinen, se voidaan kirjoittaa muotoon
% T(x)=Ax, miss?

A= [-2 1 5; -1 0 1]

% Tarkempi perustelu: Matriisien kertolaskus??nt?jen nojalla T(ax)=Aax=aAx=aT(x)
% ja T(x+y)=A(x+y)=Ax+Ay=T(x)+T(y), mik? osoittaa lineaarisuuden.

display('Teht?v? 3b')

% Kuvaus ei ole lineaarinen. T?m? voidaan osoitta helpoimmin vaikkapa valitsemalla
% x = [0 0 0]', jolloin T(2x)=T([0 0 0]') = [0 0 1]' = T(x), vaikka pit?isi
% 2T(x).

display('Teht?v? 4')
% (a)
v1 = [1 0]';
v2 = [0 1]';
u1 = [2 0]';
u2 = [0 0.5]';

% Täytyy olla  A*v1 = u1 ja A*v2 = u2. Siis A[v1 v2] = [u1 u2] eli
A =[u1 u2]*inv([v1 v2])

% (b) sama lähestymistapa kuin edellä:

v1 = [1 0]';
v2 = [0 1]';
u1 = 2^(-0.5)*[1, -1]';
u2 = 2^(-0.5)*[1, 1]';

% Täytyy olla  B*v1 = u1 ja B*v2 = u2. Siis B[v1 v2] = [u1 u2] eli
B =[u1 u2]*inv([v1 v2])

% (c) 
alpha = linspace(0, 2*pi,101)
for i = 1 : 100
   D(:,i) = 3*[cos(alpha(i)), sin(alpha(i))]'; 
end

AD = A*D;
BD = B*D;
figure
hold on
plot(D(1,:),D(2,:),'r.')
plot(AD(1,:),AD(2,:),'b.')
plot(BD(1,:),BD(2,:),'k.')
axis equal

%(d)
ABD = A*B*D;
BAD = B*A*D;
figure
hold on
plot(D(1,:),D(2,:),'r.')
plot(ABD(1,:),ABD(2,:),'b.')
plot(BAD(1,:),BAD(2,:),'k.')
axis equal


%(e)
alpha = linspace(0, 2*pi,101)
for i = 1 : 100
   D(:,i) = 1*[cos(alpha(i)), sin(alpha(i))]'+[2,2]'; 
end

AD = A*D;
BD = B*D;
figure
hold on
plot(D(1,:),D(2,:),'r.')
plot(AD(1,:),AD(2,:),'b.')
plot(BD(1,:),BD(2,:),'k.')
axis equal

ABD = A*B*D;
BAD = B*A*D;
figure
hold on
plot(D(1,:),D(2,:),'r.')
plot(ABD(1,:),ABD(2,:),'b.')
plot(BAD(1,:),BAD(2,:),'k.')
axis equal

% Kun näitä oikein tarkasti miettii, niin B kääntää pisteitä origon ympäri
% ja A skaalaa koordinaatteja. Tulos on varsin erilainen, riippuen
% siit ämissä järjestyksessä operaatioita tehdään. Kannattaa koikeilla
% muillakin geometrioilla, esim. jananpäitkillä ja suorakulmioilla.
%
display('Teht?v? 5')
v1 = 2^(-0.5)*[-1 0 1]';
v2 = 3^(-0.5)*[1 1 1]';
v3 = 6^(-0.5)*[1 -2 1]';
V = [v1 v2 v3];
V'*V % pitäisi tulla identiteettimatriisi

% Kolmion kärkipisteiden koordinaatit:
p1 = [0 0 0]'
p2 = [2 2 0]'
p3 = [4 2 0]'

% Jos käytetään samoja koordinaatteja V koordinaatistossa niin
p1_V = p1;
p2_V = p2;
p3_V = p3;
% ja näin ollen "siirretyt" pisteet ovat
u1 = V*p1_V;
u2 = V*p2_V;
u3 = V*p3_V;
% piirretään kolmiot
K_alkup = [p1 p2 p3 p1];
K_siirretty = [u1 u2 u3 u1];
figure
plot3(K_alkup(1,:),K_alkup(2,:),K_alkup(3,:),'b')
hold on
plot3(K_siirretty(1,:),K_siirretty(2,:),K_siirretty(3,:),'r')

% ja kantavektorit
S = eye(3);
plot3([0, S(1,1)],[0, S(2,1)],[0, S(3,1)],'y') 
plot3([0, S(1,2)],[0, S(2,2)],[0, S(3,2)],'m') 
plot3([0, S(1,3)],[0, S(2,3)],[0, S(3,3)],'r') 

plot3([0, V(1,1)],[0, V(2,1)],[0, V(3,1)],'k') 
plot3([0, V(1,2)],[0, V(2,2)],[0, V(3,2)],'g') 
plot3([0, V(1,3)],[0, V(2,3)],[0, V(3,3)],'b') 
axis equal

display('Teht?v? 6a')

% Tehdään ensin rotaatiomatriisi 2D:ssä muistin virkistykseksi
theta = pi/3
R2D = [cos(theta) -sin(theta); 
       sin(theta) cos(theta)];
% Rotaatiomatriisi 3D:ssä z-akselin ympäri:
R1 = [cos(theta) -sin(theta) 0; 
      sin(theta) cos(theta) 0; 
      0 0 1];

K_alkup_rot = R1*K_alkup;
figure
hold on
plot3(K_alkup(1,:),K_alkup(2,:),K_alkup(3,:),'b')
plot3(K_alkup_rot(1,:),K_alkup_rot(2,:),K_alkup_rot(3,:),'r')
axis equal

display('Teht?v? 6b')
R2 = [cos(theta) 0 -sin(theta) ; 
      0 1 0
      sin(theta) 0 cos(theta) ];

K_alkup_rot = R2*K_alkup;
figure
hold on
plot3(K_alkup(1,:),K_alkup(2,:),K_alkup(3,:),'b')
plot3(K_alkup_rot(1,:),K_alkup_rot(2,:),K_alkup_rot(3,:),'r')
axis equal

display('Teht?v? 6c')
% Ei sillä väliä, mitä kolmiota siirrellään, sama rotaatiomatriisi
% on kun on sama rotaatioakselikin, eli
R3 = R1;

K_siirretty_rot = R3*K_siirretty;
figure
hold on
plot3(K_siirretty(1,:),K_siirretty(2,:),K_siirretty(3,:),'b')
plot3(K_siirretty_rot(1,:),K_siirretty_rot(2,:),K_siirretty_rot(3,:),'r')
% hahmottamisen helpottamiseksi myös standardikantavektoreita
plot3([0, S(1,1)],[0, S(2,1)],[0, S(3,1)],'y') 
plot3([0, S(1,2)],[0, S(2,2)],[0, S(3,2)],'m') 
plot3([0, S(1,3)],[0, S(2,3)],[0, S(3,3)],'r') 
axis equal

display('Teht?v? 6d')
% Ei sillä väliä, mitä kolmiota siirrellään, sama rotaatiomatriisi
% on kun on sama rotaatioakselikin, eli
R4 = R2;

K_siirretty_rot = R4*K_siirretty;
figure
hold on
plot3(K_siirretty(1,:),K_siirretty(2,:),K_siirretty(3,:),'b')
plot3(K_siirretty_rot(1,:),K_siirretty_rot(2,:),K_siirretty_rot(3,:),'r')
% hahmottamisen helpottamiseksi myös standardikantavektoreita
plot3([0, S(1,1)],[0, S(2,1)],[0, S(3,1)],'y') 
plot3([0, S(1,2)],[0, S(2,2)],[0, S(3,2)],'m') 
plot3([0, S(1,3)],[0, S(2,3)],[0, S(3,3)],'r') 
axis equal

display('Teht?v? 6e')
% Tehdään tahallaan vähän kökösti, eli ikään kuin ei tiedettäisi
% alunperin mitä ovat siirretyn kolmion koordinaatit V kannassa.

Ks_V = inv(V)*K_siirretty % siirretyn kolmion pisteiden koordinaatit kannassa V
% Koska meillä on ortonormaali kanta V niin viimeinen kantavektori v3
% on samankaltaisessa roolissa kuin normaalin koordinaatiston z-akseli
% Eli pyöräytetään vain Ks_V koordinaatteja (a) kohdan matriisilla R1

K_siirretty_rot_v3 = V*R1*Ks_V %koordinaattien pyöräytys ensin kannassa V ja sitten paluu standardikantaan
% Käytännössä siis rotaatiomatriisi R5 olisi
R5 = V*R1*inv(V)

figure
hold on
plot3(K_siirretty(1,:),K_siirretty(2,:),K_siirretty(3,:),'b')
plot3(K_siirretty_rot_v3(1,:),K_siirretty_rot_v3(2,:),K_siirretty_rot_v3(3,:),'r')
% hahmottamisen helpottamiseksi myös V kantavektoreita
plot3([0, V(1,1)],[0, V(2,1)],[0, V(3,1)],'y') 
plot3([0, V(1,2)],[0, V(2,2)],[0, V(3,2)],'m') 
plot3([0, V(1,3)],[0, V(2,3)],[0, V(3,3)],'r') 
axis equal

display('Teht?v? 6f')
% Sama juoni kuin edellisessä kohdassa, tehdään nyt vaan suoraan rotaatio
% matriisi R6 ja käytetään sitä.
R6 = V*R2*inv(V);
K_siirretty_rot_v2 = R6*K_siirretty;

figure
hold on
plot3(K_siirretty(1,:),K_siirretty(2,:),K_siirretty(3,:),'b')
plot3(K_siirretty_rot_v2(1,:),K_siirretty_rot_v2(2,:),K_siirretty_rot_v2(3,:),'r')
% hahmottamisen helpottamiseksi myös V kantavektoreita
plot3([0, V(1,1)],[0, V(2,1)],[0, V(3,1)],'y') 
plot3([0, V(1,2)],[0, V(2,2)],[0, V(3,2)],'m') 
plot3([0, V(1,3)],[0, V(2,3)],[0, V(3,3)],'r') 
axis equal

% HUOM!!! Tehtävissä e ja f ei sinällään ollut mitään merkitystä mitä
% pistejoukkoa oltiin siirtämässä. Tärkeää oli vain että oli ortonormaali
% kanta jossa yksi vektori oli juurikin rotaatioakseli.
%
display('Teht?v? 7')

% a)

n = [0, 0, 1]';
v2 = n;

%r' = [-10sin(t), 10cos(t),0]'
r = @(t) [10*cos(t); 10*sin(t); zeros(size(t))];
dr = @(t) [-10*sin(t);10*cos(t); zeros(size(t))];
v1=  @(t) cross(v2,dr(t))/norm(cross(v2,dr(t)));

plot_points = linspace(0,2*pi,100)
curve = r(plot_points);
figure
pause(1)
for i = 1:length(plot_points)
   plot3(curve(1,:),curve(2,:),curve(3,:),'r-')
   hold on
   plot3(curve(1,i),curve(2,i),curve(3,i),'bo')
   plot3(curve(1,i),curve(2,i),curve(3,i))
   nokan_suunta = v1(plot_points(i));
   plot3([0, nokan_suunta(1)]+curve(1,i),[0, nokan_suunta(2)]+curve(2,i),[0, nokan_suunta(3)]+curve(3,i),'b')
   plot3([0, n(1)]+curve(1,i),[0, n(2)]+curve(2,i),[0, n(3)]+curve(3,i),'k')
   
   axis equal
   pause(0.005)
   hold off
end

% b) Tehdään copy/paste ja muutetaanpa rakennetta muutenkin vähän
% yleisempään
x = @(t) 10*cos(t);
y = @(t) 10*sin(t);
% derivaatat
dxt = @(t) -10*sin(t);
dyt = @(t) 10*cos(t)

% pinta
% tää on vain yksi mukava parametri jota kiva vaihdella
f = @(x,y) sin(4*x).*cos(2*y)
% osittaisderivaatat
dfy = @(x,y) -2*sin(4*x).*sin(2*y);
dfx = @(x,y) 4*cos(4*x).*cos(2*y);

n = @(x,y) [-dfx(x,y); -dfy(x,y); 1]/norm([-dfx(x,y); -dfy(x,y); 1]);

%r' = [-10sin(t), 10cos(t),0]'
r = @(t) [x(t); y(t); f(x(t),y(t))];
dr = @(t) [dxt(t);dyt(t); dfx(x(t),y(t)).*dxt(t)+dfy(x(t),y(t)).*dyt(t)];
v1=  @(t) cross(n(x(t),y(t)),dr(t))/norm(cross(n(x(t),y(t)),dr(t)));

plot_points = linspace(0,2*pi,100)
curve = r(plot_points);
figure
pause(1)
for i = 1:length(plot_points)
   plot3(curve(1,:),curve(2,:),curve(3,:),'r-')
   hold on
   plot3(curve(1,i),curve(2,i),curve(3,i),'bo')
   plot3(curve(1,i),curve(2,i),curve(3,i))
   nokan_suunta = v1(plot_points(i));
   plot3([0, nokan_suunta(1)]+curve(1,i),[0, nokan_suunta(2)]+curve(2,i),[0, nokan_suunta(3)]+curve(3,i),'b')
   v2 = n(x(plot_points(i)),y(plot_points(i)));
   plot3([0, v2(1)]+curve(1,i),[0, v2(2)]+curve(2,i),[0, v2(3)]+curve(3,i),'k')
   
   axis equal
   pause(0.001)
   hold off
end

display('Teht?v? 8')

v = @(t) dr(t)/norm(dr(t));
v2 = @(t) n(x(t),y(t));
B = @(t) [v1(t),v(t),v2(t)];

p = [0 0 2]';
p_tilde = @(t) p-r(t);
t = linspace(0,2*pi,1000);
kohde = zeros(3,1000);
for i = 1 : length(t)
   kohde(:,i)=B(t(i))'*p_tilde(t(i));
end
figure
plot3(kohde(1,:),kohde(2,:),kohde(3,:))
axis equal
% Onpas hässäkkä, plotataanpa vielä animaationa
figure
for i = 1 : length(t)
   plot3(kohde(1,:),kohde(2,:),kohde(3,:))
   hold on
   plot3(kohde(1,i),kohde(2,i),kohde(3,i),'ro')
   axis equal
   hold off
   pause(0.001)
end
% No olihan tuo aika mäkinen maasto, mutta on melkoista möykytystä myös
% jos vaikka olisi katselemassa sivuikkunasta vasemmalle: kohde vilistää
% melko villisti silmissä. Funktiota f voi vähän vaihdella ja katsoa jos
% vaikka maaston vaihtelunopeutta laskisi kymmenesosaan.

display('Teht?v? 9')

% Tämä on tietysti käsin tehtävä, mutta hahmotellaan tämä nyt tässäkin
% karkeasti i) L(f+g) = int(exp(-x)(f(x)+g(x))dx 
%                     = int(exp(-x)f(x)dx+ int(exp(-x)g(x)dx
%                     = L(f)+L(g)
%           ii) L(af) =int(exp(-x)af(x))dx = a int(exp(-x)f(x)dx = a L(f)

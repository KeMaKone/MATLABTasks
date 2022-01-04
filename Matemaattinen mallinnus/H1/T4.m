% Tekijä Konsta Keski-Mattinen 2021:09:11
clear
close all

%% Analysoitava toteutus
%Maaritellaan indeksijoukot ja lahtoarvot muuttujiin 
I =(1:16); %tyontekijat
J=(1:21); %tyovuorot
nt = length(J); % eri tyovuoroja
nh = length(I); % henkiloita
n = nh*nt; % Muuttujan x komponenttien lkm
U=(1:nh/2); %uudet tyontekijat
V=(nh/2+1:nh); %vanhat tyontekijat
Tyot= length(J)/3; %tyopaivien lkm
erityot=length(J)*3; %tyovuorojen lkm
nhu = length(U); % uusia henkiloita
nhv = length(V); % vanhoja henkiloita
yot = 3:3:nt; % yovuorot 
su = [19:19:nt,20:20:nt,21:21:nt]; % sunnuntaivuorot
hintaU = 18*8; % uusien tyontekijoiden perustuntihinta*vuoronpituus
hintaV = 26*8; % vanhojen tyontekijoiden perustuntihinta*vuoronpituus 
yolisa = 1.5; % yolisa 50%
sulisa = 2; % sunnuntailisa 100%

disp(['Tyopaivia on yhteensa ' num2str(Tyot)])
disp(['Yhteensa tyovuoroja on ' num2str(length(J))])
disp(['Eri tyovuoroja on ' num2str(erityot)])
disp(['Tyontekijoita on yhteensa ' num2str(length(I))])
disp(['Uusia tyontekijoita on yhteensa ' num2str(length(U))])
disp(['Vanhoja tyontekijoita on yhteensa ' num2str(length(V))])
disp(['Luodaan optimoitava muuttuja x=X(:)'])
disp(['Matriisin X rivit kuvaavat tyontekijoita ja sarakkeet tyovuoroja'])

% Matriisin X rivit 1:nh/2 kuvaavat uusia tyontekijoita ja loput vanhoja 
% tyontekijoita. Matriisin sarakkeet kuvaavat 
% tyovuoroja aikajarjestyksessa niin, etta sarake j=1 kuvaa maanantain 
% aamuvuoroa jne. 
%tilan dimensio
intcon = (1:n)'; % indeksijoukko, joka maaraa muuttujan x
 % vastaavan komponentin kokonaisluvuksi
LB = zeros(n,1); % muuttujan x alaraja
UB = ones(n,1); % muuttujan x ylaraja
% intcon, LB ja UB maaraavat nyt muuttujan x binaarimuuttujaksi
% eli x voi saada vain arvoja 0-1.
%MAARITETAAN yhtasuuruus rajoitteet
% eli matriisi Aeq ja vektori beq, joille Aeqx=beq
disp('MAARITETAAN yhtasuuruus rajoitteet')

%Jokaisessa tyovuorossa 3 hloa
% Matriisin X jokaisen sarakkeen komponenttien
% summa = 3
disp('Jokaisessa tyovuorossa 3 hloa')

Aeq = sparse(kron(eye(nt),ones(1,nh)));
beq = 3*ones(nt,1);
%MAARITETAAN epayhtalorajoitteet
% eli matriisi A ja vektori b, joille Ax <= b.
disp('MAARITETAAN epayhtalorajoitteet')

A = sparse(zeros(0,n));
b = zeros(0,1);
hwait = waitbar(0,'Odota hetki, kasataan ongelmaa');
disp('Maarataan, etta aina vahintaan yksi vanha tyontekija toissa')

disp('Maarataan, etta tyontekijalle ei tule perakkaisia tyovuoroja')
disp('Tyontekijalla maksimissaan viisi tyovuoroa')

%Yksi vanha aina toissa
for jj=1:nt
 aa = zeros(nh,nt);
 aa(:,jj) = [zeros(1,nhu),ones(1,nhv)]';
 A = [A;-(aa(:))'];
 b = [b;-1];
end
% tyontekijalla ei perakkaisia tyovuoroja
% 
for ii=1:nh
 aa = zeros(nh,nt);
 for jj=1:(nt-1)
 nollat=zeros(1,nt);
 nollat(jj)=1;
 nollat(jj+1)=1;
 rivi = nollat;
 aa(ii,:)=rivi;
 A = [A;(aa(:))'];
 b = [b;1];
 end
%max 5 vuoroa/ henkilo
 rivi = ones(1,nt);
 aa(ii,:)=rivi;
 A=[A;aa(:)'];
 b=[b;5];
end

% kohdefunktio
% maaritetaan ensin matriisi FF, missa rivit ovat tyontekijoita
% ja sarakkeet tyovuoroja. Komponentti FF(ij) kuvaa nyt kustannusta
% joka syntyy kun tyontekija i tekee tyovuoron j. 
FF= zeros(nh,nt);
FF(U,:)=hintaU; %uusien tyotekijoiden perustuntihinta*vuoronpituus
FF(V,:)=hintaV; %vanhojen tyotekijoiden perustuntihinta*vuoronpituus
FF(:,yot)=FF(:,yot)*yolisa; %yo lisat
FF(:,su)=FF(:,su)*sulisa; %sunnuntai lisat
ff=FF(:)'; %Kohdefunktio on nyt vaakavektori ff 
close(hwait)
options = optimoptions('intlinprog', 'Maxtime',60*60*3,'CutGeneration','none','TolGapRel',1)

tic;
[XX,FVAL,EXITFLAG,OUTPUT] = intlinprog(ff,intcon,A,b,Aeq,beq,LB,UB, options);

aika2 = toc;
disp(['Optimointiin kului aikaa ' num2str(aika2) ' s'])

FVAL
EXITFLAG
OUTPUT

X = XX(1:(nh*nt));
tulos = reshape(X,nh,nt)

%% Analyysi

% Matemaattinen kirjoitus
% 
% Standardikaava:
% min f(x) = c^T*x  ehd(Ax<=b, Ae R^mxn, beR^m xeZ^n)
% jossa c on kustannukset
% x on binaarinen paikallaolo
%
% Lopullinen kaava
% sum(CX), jossa C, X on samankokoisia työntekijä/työvuorotaulukkoja
% Selvitys
% 
% FVAL = optimipisteen arvo eli tässä tapauksessa halvin mahdollinen
% järjestely
% EXITFLAG = Poistumisehdon ID 
% OUTPUT = Tietoa optimointiprosessista
% X = vektori, jossa on työvuorotekijä paikat, joka järjestetään uudestaan
% taulukoksi joka olisi lopputulos
% tulos = taulukko jossa riveillä on tekijät ja sarakkeissa on työvuorot
%
%
clear
%% Muokattu toteutus
%lahtoarvot muuttujiin 
tekijaaVuorolla = 3;
vuorojaPaivassa = 3;
tyoPaivat = 7; %Tyopaivien lkm
yolisa = 1.5; % yolisa 50%
sulisa = 2; % sunnuntailisa 100%
nUusiaHenkiloita = 8; % uusia henkiloita
nVanhojaHenkiloita = 8; % vanhoja henkiloita
tuntiHintaUusi = 18;
tuntiHintaVanha = 26;
%Periaatteessa jokaisen eri työntekijän tuntipalkka voitaisiin asettaa,
%mutta se olisi vain csv taulukon täyttöä


%Lasketaan muita arvoja ja määritellään indeksijoukot
nTyoVuoroja = tyoPaivat*vuorojaPaivassa; % tyovuorojen lkm
nHenkiloita = nUusiaHenkiloita + nVanhojaHenkiloita; %henkiloiden lkm
n = nHenkiloita*nTyoVuoroja; % Muuttujan x komponenttien lkm
U =(1:nUusiaHenkiloita); %uudet tyontekijat
V =(nUusiaHenkiloita+1:nHenkiloita); %vanhat tyontekijat
yot = vuorojaPaivassa:vuorojaPaivassa:nTyoVuoroja; % yovuorot 
su = [7*vuorojaPaivassa-2:7*vuorojaPaivassa-2:nTyoVuoroja,7*vuorojaPaivassa-1:7*vuorojaPaivassa-1:nTyoVuoroja,7*vuorojaPaivassa:7*vuorojaPaivassa:nTyoVuoroja]; % sunnuntaivuorot
hintaU = tuntiHintaUusi*(24/vuorojaPaivassa); % uusien tyontekijoiden perustuntihinta*vuoronpituus
hintaV = tuntiHintaVanha*(24/vuorojaPaivassa); % vanhojen tyontekijoiden perustuntihinta*vuoronpituus 

disp(['Tyopaivia on yhteensa ' num2str(tyoPaivat)])
disp(['Yhteensa tyovuoroja on ' num2str(nTyoVuoroja)])
disp(['Eri tyovuoroja on ' num2str(nTyoVuoroja*tekijaaVuorolla)])
disp(['Tyontekijoita on yhteensa ' num2str(nHenkiloita)])
disp(['Uusia tyontekijoita on yhteensa ' num2str(nUusiaHenkiloita)])
disp(['Vanhoja tyontekijoita on yhteensa ' num2str(nVanhojaHenkiloita)])
disp(['Luodaan optimoitava muuttuja x=X(:)'])
disp(['Matriisin X rivit kuvaavat tyontekijoita ja sarakkeet tyovuoroja'])

% Matriisin X rivit 1:nHenkiloita/2 kuvaavat uusia tyontekijoita ja loput vanhoja 
% tyontekijoita. Matriisin sarakkeet kuvaavat 
% tyovuoroja aikajarjestyksessa niin, etta sarake j=1 kuvaa maanantain 
% aamuvuoroa jne. 
%tilan dimensio
intcon = (1:n)'; % indeksijoukko, joka maaraa muuttujan x
 % vastaavan komponentin kokonaisluvuksi
LB = zeros(n,1); % muuttujan x alaraja
UB = ones(n,1); % muuttujan x ylaraja
% intcon, LB ja UB maaraavat nyt muuttujan x binaarimuuttujaksi
% eli x voi saada vain arvoja 0-1.
%MAARITETAAN yhtasuuruus rajoitteet
% eli matriisi Aeq ja vektori beq, joille Aeqx=beq
disp('MAARITETAAN yhtasuuruus rajoitteet')

%Jokaisessa tyovuorossa 3 hloa
% Matriisin X jokaisen sarakkeen komponenttien
% summa = tekijaaVuorolla
disp(['Jokaisessa tyovuorossa on henkiloita ', num2str(tekijaaVuorolla)])

Aeq = sparse(kron(eye(nTyoVuoroja),ones(1,nHenkiloita)));
beq = tekijaaVuorolla*ones(nTyoVuoroja,1);
%MAARITETAAN epayhtalorajoitteet
% eli matriisi A ja vektori b, joille Ax <= b.
disp('MAARITETAAN epayhtalorajoitteet')

A = sparse(zeros(0,n));
b = zeros(0,1);
hwait = waitbar(0,'Odota hetki, kasataan ongelmaa');
disp('Maarataan, etta aina vahintaan yksi vanha tyontekija toissa')

disp('Maarataan, etta tyontekijalle ei tule perakkaisia tyovuoroja')
disp('Tyontekijalla maksimissaan viisi tyovuoroa')

%Yksi vanha aina toissa
for jj=1:nTyoVuoroja
    aa = zeros(nHenkiloita,nTyoVuoroja);
    aa(:,jj) = [zeros(1,nUusiaHenkiloita),ones(1,nVanhojaHenkiloita)]';
    A = [A;-(aa(:))'];
    b = [b;-1];
end
% tyontekijalla ei perakkaisia tyovuoroja
% 
for ii=1:nHenkiloita
    aa = zeros(nHenkiloita,nTyoVuoroja);
    for jj=1:(nTyoVuoroja-1)
        nollat=zeros(1,nTyoVuoroja);
        nollat(jj)=1;
        nollat(jj+1)=1;
        rivi = nollat;
        aa(ii,:)=rivi;
        A = [A;(aa(:))'];
        b = [b;1];
    end
    %max 5 vuoroa/ henkilo
    rivi = ones(1,nTyoVuoroja);
    aa(ii,:)=rivi;
    A=[A;aa(:)'];
    b=[b;5];
end

% kohdefunktio
% maaritetaan ensin matriisi FF, missa rivit ovat tyontekijoita
% ja sarakkeet tyovuoroja. Komponentti FF(ij) kuvaa nyt kustannusta
% joka syntyy kun tyontekija i tekee tyovuoron j. 
FF= zeros(nHenkiloita,nTyoVuoroja);
FF(U,:)= hintaU; %uusien tyotekijoiden perustuntihinta*vuoronpituus
FF(V,:)= hintaV; %vanhojen tyotekijoiden perustuntihinta*vuoronpituus
FF(:,yot)=FF(:,yot)*yolisa; %yo lisat
FF(:,su)=FF(:,su)*sulisa; %sunnuntai lisat
ff=FF(:)'; %Kohdefunktio on nyt vaakavektori ff 
close(hwait)
options = optimoptions('intlinprog', 'Maxtime',60*60*3,'CutGeneration','none','TolGapRel',1)

tic;
[XX,FVAL,EXITFLAG,OUTPUT] = intlinprog(ff,intcon,A,b,Aeq,beq,LB,UB, options);

aika2 = toc;
disp(['Optimointiin kului aikaa ' num2str(aika2) ' s'])

FVAL
EXITFLAG
OUTPUT

X = XX(1:(nHenkiloita*nTyoVuoroja));
tulos = reshape(X,nHenkiloita,nTyoVuoroja)
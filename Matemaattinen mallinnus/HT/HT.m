% Tekijä Konsta Keski-Mattinen 01.12.2021
clear
close all
 
%###Syöttö###
v = 100;        %Simuloitavat vuodet
vT= 0;          %Otetaanko mallin variaatiotarkistelu käyttöön
 
%Hiiltä gigatonneina
A = 800;        %Ilmakehässä
B = 38000;      %Vedessä
C = 550;        %Biomassassa(maa)
D = 700;        %Biomassassa(vesi)
E = 12300;      %Fossiilissa yhdisteissä
 
%Seuraavat siirtymät gigatonneissa
AB=92;          %Ilmakehästä veteen siirtyvät
AC=123;         %Ilmakehästä biomassa(maa) siirtyvät
AD=0;           %Ilmakehästä biomassa(vesi) siirtyvät
AE=0;           %Ilmakehästä fossiiliksi siirtyvät

BA=90;          %Vedestä ilmakehään siirtyvät
BC=0;           %Vedestä biomassa(maa) siirtyvät
BD=103;         %Vedestä biomassa(vesi) siirtyvät
BE=2;           %Vedestä Fossiiliyhdisteihin siirtyvät

CA=120;         %Biomassasta(maa) ilmakehään siirtyvät
CB=1.7;         %Biomassasta(maa) veteen siirtyvät
CD=0;           %Biomassasta(maa) biomassa(vesi) siirtyvät
CE=0;           %Biomassasta(maa) fossiilisiksi siirtyvät

DA=0;           %Biomassasta(vesi) ilmakehään siirtyvät
DB=103;         %Biomassasta(vesi) veteen siirtyvät
DC=0;           %Biomassasta(vesi) biomassa(maa) siirtyvät
DE=2;           %Biomassasta(vesi) fossiilisiksi siirtyvät

EA=12;          %Fossiilisidoksista ilmakehään siirtyvät
EB=0;           %Fossiilisidoksista veteen siirtyvät
EC=0;           %Fossiilisidoksista biomassaan(maa) siirtyvät
ED=0;           %Fossiilisidoksista biomassaan(vesi) siirtyvät

%Siirretty tähän laskennallisten temppujen takia
AA=A-(AB+AC+AD+AE); %Ilmakehässä säilyvät
BB=B-(BA+BC+BD+BE); %Vedessä säilyvät
CC=C-(CA+CB+CD+CE); %Biomassana(maa) säilyvät
DD=D-(DA+DB+DC+DE); %Biomassana(vesi) säilyvät
EE=E-(EA+EB+EC+ED); %Fossiilisidoksina säilyvä
 
%Kasvualueet hehtaareina
kA = 1.8*10^8;          %Trooppinen Metsä
kB = 10*10^8;           %Lauhkea metsä
kC = 12*10^8;           %Havumetsä
kD = (21.8+8.8)*10^8;   %Savanni ja ruohomaa
kE = 13.7*10^8;         %Tundra
 
%Kasvualueiden hiilennielemiskyky Gt/ha
hnkA = 6.6*10^-3;         %6.6 Mt C per ha
hnkB = 4.4*10^-3;         %4.4 Mt C per ha
hnkC = 2.8*10^-3;         %2.8 Mt C per ha
hnkD = 2*10^-9;           %2.0  t C per ha
hnkE = 1*10^-9;           %1.0  t C per ha
 
%###Mallit###
%Mallinnetaan hiilimääriä vektorilla
x = [A;B;C;D;E];
 
%Mallinetaan kasvualueiden suhdetta tilavektorilla
f = [kA; kB; kC; kD; kE];
%kasvualueiden suhteellinen hiilen imämisvauhti
fm= [hnkA; hnkB; hnkC; hnkD; hnkE];
 
%Mallinetaan hiilisiirtymä siirtymämatriisilla ja korjataan prosenteiksi
M = [AA/A, BA/B, CA/C, DA/D, EA/E;
     AB/A, BB/B, CB/C, DB/D, EB/E;
     AC/A, BC/B, CC/C, DC/D, EC/E;
     AD/A, BD/B, CD/C, DD/D, ED/E;
     AE/A, BE/B, CE/C, DE/D, EE/E];
 
%Pientä muistinhallintaa
clear A B C D E 
clear AA AB AC AD AE BA BB BC BD BE CA CB CC CD CE DA DB DC DD DE EA EB EC ED EE 
clear kA kB kC kD kE kF kG
clear hnkA hnkB hnkC hnkD hnkE
 
%###Simulointi###
%Toteutetaan simulointi oikealla datalla
recordsReal = model(M, x, v, 3);
 
%Toteutetaan numeerinen tarkastelu vakaudelle
if 1==vT
    for i=1:5
        %Muutetaan arvoja
        M1 = unit(M + rand(5)./500)
        x1 = x;
        %Ajetaan malli uusilla arvoilla
        model(M1, x1, v, 1);
    end
end
%Haetaan dataa mallista
abs(recordsReal(:,100)./recordsReal(:,1))

%Muisti halliintuu
clear M1 x1
%clear i v x f fm  G recordsReal 
clear vT 
 
 
%###Mallin funktiot###

%Iterointi funktiot
 
%Sisään: Hiilenmuutosmatriisi, hiilivektori, kasvisuhdannevektori, 
% kasvisuhteellinen imu ja iteroitavat vuodet
%Ulos:Tallennematriisi
function records=model(M, x, v, printWindows)
    %Tallenne matriisi
    records=zeros(length(x),v);
 
    for i=1:v
        %Mallintaminen
        x = iter(M, x);
        %Tallenteiden lisäys
        records(:,i) = x;
    end
    
    %###Kaavion piirto###
    if 0<printWindows
        printWindows = printWindows - 1;
        figure();
        plot([records(1,:)',records(3:4,:)']);
        title('Hiilen määrät simuloituna sata vuotta eteenpäin');
        ylabel('Hiili gigatonneissa');
        xlabel('Vuosia nykyvuodesta');
        legend('Ilmakehä', 'Biomassa(maa)', 'Biomassa(vesi)');
    end
    if 0<printWindows
        printWindows = printWindows - 1;
        figure();
        plot(records(2,:)');
        title('Hiilen määrät simuloituna sata vuotta eteenpäin');
        ylabel('Hiili gigatonneissa');
        xlabel('Vuosia nykyvuodesta');
        legend('Vesi');
    end
    if 0<printWindows
        printWindows = printWindows - 1;
        figure();
        plot(records(5,:)');
        title('Hiilen määrät simuloituna sata vuotta eteenpäin');
        ylabel('Hiili gigatonneissa');
        xlabel('Vuosia nykyvuodesta');
        legend('Fossiiliset');
    end
end

 
%Laskentafunktiot

%Sisään: Muutosmatriisi tilavektori
%Ulos: tilavektori
function x = iter(M, x) 
    x = M * x;
end
 
%Sisään: Matriisi
%Ulos: yhden summamatriisi
function unit = unit(x)
    unit = x./sum(x);
end
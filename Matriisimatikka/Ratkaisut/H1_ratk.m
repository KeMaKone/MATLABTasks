clear all 
close all

display('Teht?v? 1 a')

a = [1 2 3 4]
b = [1^2 2^2 3^2 4^2]

a = 1:4
b = a.^2

display('Teht?v? 1 b')

A =[1 2 3 4; 1 2^2 3^2 4^2]

A =[a; b]

B = [A ; A]

display('Teht?v? 1 c')

C = B([1 2], :) % otetaan B:st? rivit 1 ja 2 ja kaikki sarakkeet

D = B(:, [1 2])


display('Teht?v? 1 d')

I = eye(4)

E = reshape(1:16, 4, 4)

E-I

E+2*E

I'*E

E^3

E*a'

display('Teht?v? 2')

M = E; % alustetaan ensin matriisi M

M([2 3],:) = E(:,[2,3])'; % E:n toinen ja kolmas sarake M:n toiseksi ja kolmanneksi riviksi

M(:,2:3) = E(2:3,:)'  % E:n toinen ja kolmas rivi M:n sarakkeiksi. Ja v?h?n lyhyemm?ll? syntaksilla

x = inv(M)*a'

display('Teht?v? 3')

U = rref(E) % porrasmatriisi

rank(E)
rank(U)
[V_E,D_E]=eig(E)
[V_U,D_U]=eig(U)

display('Teht?v? 4')

A = rand(4,4)
b = rand(4,1)
Ainv = inv(A)
x = Ainv*b

display('Teht?v? 5a')
figure
hold on % piirret??n samaan kuvaan aina
for n = 0 : 1 : 100
    x = 0.01*pi*n
    f = sin(x)
    plot(x,f,'ro')     
    %pause(0.05) % pidet??n pieni tauko niin n?hd??n my?s piirto
end

display('Teht?v? 5b')
figure % uusi kuva
plot(0:0.01*pi:0.01*pi*100,sin(0:0.01*pi:0.01*pi*100),'r') 
% Huomataan ett? pisteet olikin nyt yhdistetty. 
% Jos tahdotaan kovin samanlainen kuva niin
figure
plot(0:0.01*pi:0.01*pi*100,sin(0:0.01*pi:0.01*pi*100),'r.','MarkerSize',5) 

display('Teht?v? 6')

% Jos ravintoaineiden A, B ja C m??r?t on x vektorissa ja ravinteiden
% suositukset b vektorissa, niin ratkaistaan yht?l?ryhm? Ax=b, miss?

A = [ 36 51 13; 52 34 73 ; 0 7 1.1]
b = [33 45 3]'
x = inv(A)*b

% Otetaan nyt D ravintoainen mukaan. T?ll?in

A = [A ,[11 10 12]']
rref([A b])
% n?hd??n ett? j?? vapaita parametreja (ravintaineen D m??r?)

display('Teht?v? 7')

% Esimerkiksi solmussa B sis??n ja ulostulevien virtojen m??r? t?sm?tt?v?,
% eli x_1 +x_4 = 400 + x_2, joka voidaan kirjoittaa my?s standardi muodossa
% x_1 -x_2 + x_4 =400. Tehd??n n?in jokaiselle solmulle ja muodostetaan
% n?ist? kuudesta yht?l?st? matriisiesitys Ax=b, jossa

A = [-1 0 0 0 -1 0 0;
     1 -1 0 1 0 0 0;
     0 1 -1 0 0 0 0;
     0 0 1 0 0 0 -1;
     0 0 0 -1 0 -1 1;
     0 0 0 0 1 1 0]
b = [-800, 400, 600, -1600+400, 0 400+600]'

rref([A b])
% n?hd??n ett? vapaiksi muuttujiksi valittavissa x_6 ja x_7, mik? ei
% ole yll?tt?v?? sill? "silmukan sis?ist?" liikennett? ei ole rajoitettu

display('Teht?v? 8')

% Kun l?mp?tila on naapureiden keskiarvo niin silloin l?mp?tila
% solmussa 1 (merkit??n x_1) on x_1 = 0.25(10+20+x_2+x_4),
% joka voidaan kirjoittaa standardimuodossa 
% x_1 - 0.25x_2-0.25x_4 = 0.25(10+20). Muodostetaan samoin yht?l?t
% jokaiselle solmulle ja kirjoitetaan ne matriisimuodossa Ax=b, miss?

A = [1 -0.25 0 -0.25 0 0;
    -0.25 1 -0.25 0 -0.25 0;
    0 -0.25 1 0 0 -0.25;
    -0.25 0 0 1 -0.25 0;
    0 -0.25 0 -0.25 1 -0.25;
    0 0 -0.25 0 -0.25 1]
b = 0.25*[10+20, 20, 20+40, 10+20, 20, 20+40]'
x = inv(A)*b

display('Teht?v? 9')

% Jos y(x)= a*x^2 + b*exp(-x) + c*exp(2*x) niin
% y'(x) = 2*a*x -b*exp(-x)+2*c*exp(2*x) ja
% y''(x) = 2*a +b*exp(-x)+4*c*exp(2*x)

% T?ll?in yht?l?ryhm?
% y(0)=1
% y'(0) = -1
% y''(0) = 1
% saa muodon
% a*0 +b*1 +c*1= 1
% a*0 -b*1 +c*2 = -1
% a*2 +b*1 +c*4 = 1
% joka on matriisimuodossa
% Ad = b, miss? d=[a b c]' ja
A = [0 1 1; 0 -1 2; 2 1 4]
b = [1 -1 1]'
d = inv(A)*b

display('Teht?v? 10')

n = 5 ;
x = rand(n,1)*2;
g = @(x) x.^2-2*x+1+0.1*exp((x-1).^2);
psi = @(x,i) sin(pi*i*x);
A = zeros(n,n)
for i = 1 : n
   A(:,i) = psi(x,i);
end
a = inv(A)*g(x);
cond(A) 
x_p = linspace(0,2,10*n)'; % plottaus pisteet
f = zeros(size(x_p));
for i = 1 : n
    f = f + a(i)*psi(x_p,i);
end
figure
plot(x,g(x),'ro',x_p,g(x_p),'r',x_p,f,'b')


display('Teht?v? 11')



n = 10  ;
x = rand(n,1)*2;
g = @(x) x.^2-2*x+1+0.1*exp((x-1).^2)+0.01*sin(10*x);
psi = @(x,i) x.^(i-1);
A = zeros(n,n)
for i = 1 : n
   A(:,i) = psi(x,i);
end
a = inv(A)*g(x);
cond(A) 
x_p = linspace(0,2,10*n)'; % plottaus pisteet
f = zeros(size(x_p));
for i = 1 : n
    f = f + a(i)*psi(x_p,i);
end
figure
plot(x,g(x),'ro',x_p,g(x_p),'r',x_p,f,'b')

display('Teht?v? 12')


% p:lle on kaksi ehtoa, eli
% p(-2) = 1 ja p'(0)=q'(0).
% q:lle on nelj? ehtoa, eli
% q(0)=0, q(1)=2, p'(0)=q'(0), ja q'(1) = 5
% Teht?v?nannossa ei ole vaadittu, mutta lis?t??np? ehto
% ett? muodostuvan k?yr?n on oltava jatkuva (eli my?s p(0)=0)
% N?in ajatellen p:lle on kolme ehtoa ja q:lle on nelj? ehtoa.
% Varman p??lle pelaten riitt?isi varmaankin otta sek? q:ksi kolmannen asteen ja
% p:ksi toisen asteen polynomit. Yksi ehdoista on kuotenkin
% kummallekin polynomille t?sm?lleen sama (p'(0)=q'(0)) jolloin
% ehtoja onkin oikeastaan yhteens? vain kuusi ja j??nee v?h?n
% pelivaraa miten polynomit valitsee. Otetaankin vain toisen asteen polynomi
% q:ksi.

% Siis merkit??n p(x) = a_0 + a_1x + a_2x^2  ja q(x) = b_0 + b_1x +b_2x^2.
% N?ill? merkinn?ill?, yll? olevat yht?l?t ovat
% a_0 -2a_1 + 4a_2 = 1
% a_1 = b_1
% b_0 = 0
% b_0 + b_1 + b_2 = 2
% b_1 + 2b_2 = 5
% a_0 = 0
% Jos merkit??n d = [a_0 a_1 b_0 b_1 b_2]' niin yll? oleva
% yht?l?ryhm? on Ad = b, miss?

A = [1 -2 4 0 0 0;
    0 1 0 0 -1 0;
    0 0 0 1 0 0;
    0 0 0 1 1 1;
    0 0 0 0 1 2;
    1 0 0 0 0 0]
b = [ 1 0 0 2 5 0]'

d = inv(A)*b

% plotataan ensin p
x = -2:0.01:0;
figure
plot(x, d(1)+d(2)*x+d(3)*x.^2,'b')
% ja sitten q
x = 0 : 0.01 : 1
hold on
plot(x, d(4)+d(5)*x+d(6)*x.^2, 'r')

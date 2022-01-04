% Konsta Keski-Mattinen 12.4.2021

clear
close all
% A

n=1001;
F=fourie(n);
% selvitetään pisteet
t = (0:n-1)'*2*pi/n;
g = exp(-1/4*(t-pi).^2);

% vaihdetaan g kanta F
% g=F*g_F -> inv(F)*g=g_F -> F'*g=g_F   % johtuu ortonormaaliudesta
g_F = F'*g;
figure
hold on
plot(g_F);
plot(g);

% huomataan että g_F on hyvin nollasta poikkeamaton.
% ainoat jotka muuttivat alhaisen taajuuden kosinit. Mikä on loogista,
% sillä ne ovat ensimmäiset määriteltävät ja g on hyvin pitkätaajuinen

% B

% etsitään suurimpien itsearvojen indeksit
temp_g_F = abs(g_F);
iMax10Values= zeros(10,1);
for i=1:1:size(iMax10Values,1)
    [value, index] =max(temp_g_F);
    iMax10Values(i)=index;
    temp_g_F(index) = 0;
end
clear temp_g_F

A=zeros(n,10);
for i=1:1:size(iMax10Values,1)
    A(:,i)=F(:,iMax10Values(i))
end


% Mc=b
% A'A*g_A=A'*g
% g_A=A'*g
g_A = A'*g;
gp = A*g_A;

% lasketaan erotus
g-gp

plot(gp);



function F = fourie(n)
    if mod(n,2) ~= 1
        F = 0
        return
    end
    

    % 1.
    t = (0:n-1)'*2*pi/n;
    
    % 2.
    v=zeros(size(t,1), (n-1)/2);
    for k=0:1:(n-1)/2
        v(:,k+1)=cos(k*t);
    end
    
    %3.
    u=zeros(size(t,1), (n-1)/2);
    for k=1:1:(n-1)/2
        u(:,k)=sin(k*t);
    end
    
    %.4
    F=[v, u];
    for i=1:1:size(F,2)
        F(:,i)=F(:,i)/norm(F(:,i));
    end
end
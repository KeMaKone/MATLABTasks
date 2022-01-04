% Konsta Keski-Mattinen 13.4.2021

clear
close all

n=1001;
F=fourie(n);
t = (0:n-1)'*2*pi/n;

e=0.05*randn(1001, 1);
g = exp(-1/4*(t-pi).^2);

g_koh = g+e;

figure 
hold on
plot(g, 'b')
plot(g_koh, 'r.')


temp_g_F = abs(F*g);
iMax10Values= zeros(10,1);
for i=1:1:size(iMax10Values,1)
    [value, index] =max(temp_g_F);
    iMax10Values(i)=index;
    temp_g_F(index) = 0;
end
clear temp_g_F

A=zeros(n,10);
for i=1:1:size(iMax10Values,1)
    A(:,i)=F(:,iMax10Values(i));
end

% Mc=b
% A'A*g_A=A'*g
% g_A=A'*g
g_A=A'*g;
g_koh_A=A'*g_koh;

figure
hold on
plot(g_A, 'b');
plot(g_koh_A, 'r');

g_koh_AS = A*g_koh_A;
figure
hold on
plot(g, 'b')
plot(g_koh_AS, 'r')


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
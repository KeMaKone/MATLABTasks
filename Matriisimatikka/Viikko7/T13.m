% Konsta Keski-Mattinen 29.4.2021

close all
clear
load('H7_data.mat');

%% A
%edellistehtävä
[U,S,V] = svd(M);

%sarakkeet, merkittävimmät
U10=U(:,1:10);

%projektoidaan uudelle h:lle
pH=U10*U10'*H;

%lasketaan summa
sum(sum((H-pH).^2))


%% B
F = Fourier_kanta(size(H, 1));
H_F = F'*H;
% otetaan merkittävimmät
[~,indexes] = sort(abs(H_F), 'descend');

%luodaan Fi
Fi = zeros(size(H));
for i=1:size(H,2)
    % projektoidaan
    Fi(:,i) = F(:,indexes(1:10,i))*H_F(indexes(1:10,i),i);
end

sum(sum((H-Fi).^2))
%Tällä ei kyllä voiteta


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
    
    F = zeros(N); % Matriisi johon seuraavaksi tallennetaan f vektorit
    
    F(:,1:2:end) = V;
    F(:,2:2:end) = U;
end
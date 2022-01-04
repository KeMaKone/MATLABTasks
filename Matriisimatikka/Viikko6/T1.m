% Konsta Keski-Mattinen 20.4.2021

clear
close all

image = imresize(imread('naama.jpg'), 0.80);
figure('name', 'vakio');
imshow(image);
image_gs= rgb2gray(image);
image_cut = image_gs(230:230+500,100:100+500);
figure('name', 'leikattu');
imshow(image_cut);

A=double(image_cut);

[X, D] = eig(A);

% testataan diagonalisointi A=X*D*inv(X)
sum(sum(abs(A-X*D*inv(X))))
sum(sum(abs(A-X*D/X)))

M = 50;

d=diag(D);
% tarkistellaan d
figure('name', 'eigenvalues');
plot(log10(abs(d)));

[~, index] = sort(d, 'descend');
index(M+1:end)=0;

dm = zeros(size(d,1),1);
for i=1:size(d,1)
    if(ismember(i, index))
        dm(i)=d(i);
    end
end

D_M = diag(dm);
figure('name', 'eigenvalues after nulling');
plot(log10(abs(dm)));


A_M = X*D_M*inv(X);
figure('name', 'diagonaalihajotelma m=50');
imshow(uint8(real(A_M)));
figure('name', 'A and A_M');
hold on
plot(A, 'r');
plot(A_M, 'b');
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

A = double(image_cut);
% A
figure('name', 'a');
imshow(uint8(real(singdistcomp(A, 75))));

% B
figure('name', 'b');
imshow(uint8(real(singdistcomp(A, 15))));

% C
tic
F=zeros(size(A,1),1);
for i=1:500
    F(i)=sum(sum((A-singdistcomp(A,i)).^2));
end
figure('name', 'Frob');
plot(log10(abs(F)), 'b');
toc

function A_M=singdistcomp(A, M)

    [U, S, V] = svd(A);

    s=diag(S);

    [~, index] = sort(s, 'descend');
    index(M+1:end)=0;

    sm = zeros(size(s,1),1);
    for i=1:size(s,1)
        if(ismember(i, index))
            sm(i)=s(i);
        end
    end
    
    S_M = diag(sm);

    A_M = U*S_M*V';
end

% Konsta Keski-Mattinen .4.2021

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
imshow(uint8(real(fouriecomp(A, 180))));

% B
figure('name', 'b');
imshow(uint8(real(fouriecomp(A, 20))));

% C
tic
F=zeros(size(A,1),1);
for i=1:500
    F(i)=sum(sum((A-fouriecomp(A,i)).^2));
end
figure('name', 'Frob');
plot(log10(abs(F)), 'b');
toc

function A_M = fouriecomp(A, M)
    N = size(A,2);
    F = fourie(N);
    FM = F;
    FM = F(:,1:M);
    
    A_M = FM*FM'*A;
end

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
    F=zeros(size(v,1),size(v,2)+size(u,2));
    j=1;
    for i=1:1:(size(F,2))
        if(mod(i,2)==0)
            F(:,i)=u(:,j);
            j=j+1;
        else 
            F(:,i)=v(:,j);
        end
    end
    for i=1:1:size(F,2)
        F(:,i)=F(:,i)/norm(F(:,i));
    end
end
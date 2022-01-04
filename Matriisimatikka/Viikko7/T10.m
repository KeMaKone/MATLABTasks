%Konsta Keski-Mattinen 28.4.2021

clear;
close all;
load('H7_data.mat');

%% A

mean1 = mean(D1')';
[U1 S1 V1] = svd(D1-mean1);
figure
plot(diag(S1));
r1=3;

mean2 = mean(D2')';
[U2 S2 V2] = svd(D2-mean2);
figure
plot(diag(S2));
r2=3;

% Etäisyyksien neliöt
% |(D-m)-Ur(D-m)|^2
% |D-m|^2-|Ur(D-m)|^2
PL1 = sum((D-mean1).^2)-sum((U1(:,1:r1)'*(D-mean1)).^2);
PL2 = sum((D-mean2).^2)-sum((U2(:,1:r2)'*(D-mean2)).^2);

% vertaillaan
find((PL1-PL2)>0) 
figure
plot(PL1-PL2)

%% B
[U1 S1 V1] = svd(D1);
figure
plot(diag(S1));
r1=3;

[U2 S2 V2] = svd(D2);
figure
plot(diag(S2));
r2=3;

% Etäisyyksien neliöt
% |(D-m)-Ur(D-m)|^2
% |D-m|^2-|Ur(D-m)|^2
PL1 = sum(D.^2)-sum(((U1(:,1:r1)'*D).^2));
PL2 = sum(D.^2)-sum(((U2(:,1:r2)'*D).^2));

% vertaillaan
find((PL1-PL2)>0) 
figure
plot(PL1-PL2)
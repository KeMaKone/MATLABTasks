% Tekijä: Konsta Keski-Mattinen
% 20.03.2021

clc
clear
close all
disp('Tehtävä 5')


A=[ 1,-2,-1, 3,-1, 1;...
   -2, 4, 5,-5, 0, 0;...
    3,-6,-6, 8,-2, 7];

target = [0;3;2];

[V d] = solfinder(A, target)

function [V d]=solfinder(A, target)
    [R, steps] = rref([A, target])
    lenMatrix = size(R,2)-1;
    rankMatrix = rank(R);
    freeV=zeros(lenMatrix-rankMatrix,1);
    
    j = 1;
    for i=1:1:lenMatrix
        if(ismember(i, steps)==0)
            freeV(j)=i;
            j = j +1;
        end
    end
    

    V = zeros(lenMatrix, rankMatrix);
    for i= 1:size(steps,2)
       V(steps(i),:)= -R(i, freeV); % asetetaan sidotulle muuttujalle vapaan -kerroin
    end
    for i= 1:size(freeV, 1)
       V(freeV(i), i)=1; % asetetaan vapaalle muuttujalle kerroin 1 
    end
    
    d = zeros(lenMatrix,1);
    d(steps) = R(1:size(steps,2),end);
end

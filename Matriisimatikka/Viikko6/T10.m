% Konsta Keski-Mattinen 21.4.2021

clear
close all

% A
F= fourie(7);

%  x_B_F = B*  x_F
%   0    = B*  f1
%   f4         f2
%   f5         f3
%   f6         f4
%   f7         f5
%   0          f6
%   0  }       f7

B= [0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 1, 0, 0, 0;
    0, 0, 0, 0, 1, 0, 0;
    0, 0, 0, 0, 0, 1, 0;
    0, 0, 0, 0, 0, 0, 1;
    0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 0, 0, 0, 0];

% F'*x_B = B*F'*x
% x_B=F*B*F'*x

A=F*B*F'


% B

%|[S(x)]_F| <= |[x]_F|            ^2
%|[S(x)]_F|^2 <= |[x]_F|^2        |[x]_F| = |x|
%|S(x)|^2 <= |x|^2                |x|^2=dot(x,x)
%f4^2+f5^2+f6^2+f7^2 <= f1^2+f2^2+f3^2+f4^2+f5^2+f6^2+f7^2
%0 <= f1^2+f2^2+f3^2


% C
%S_1
%Ax=0
rref(A)
% valitaan vapaat muuttujat, eli virittäjävektoreista muodostuvat vektorit
% ytimeksi


% luodaan muutosvektori S2:lle
C =F*(0.5*eye(7)+0.5*B)*F'

%Cx=0
rref(C)
% maksimaalista vaimentumista ei tapahdu koska s2 ei ole ydinjoukkoa eli
% signaalin voimakkuus pysyy ehjänä


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
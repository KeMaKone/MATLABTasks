% Konsta Keski-Mattinen 21.4.2021

clear
close all

phi = @(x,i) x.^i;

x = linspace(0,1,9)';

v1 = phi(x,0);
v2 = phi(x,1);
v3 = phi(x,2);
v4 = phi(x,3);

V= [v1,v2,v3,v4];
F= fourie(9);

% x=x
%Fx_F=Vx_V
%x_F=F'*V*x_V
%x_F=A*x_V

A=F'*V

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

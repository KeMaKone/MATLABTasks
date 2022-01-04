% Konsta Keski-Mattinen 12.04.2021


a=fourie(5)
disp('tarkistetaan')
a'*a
a=fourie(11)
disp('tarkistetaan')
a'*a


function F = fourie(n)
    if mod(n,2) ~= 1
        F = 0
        return
    end
    

    % 1.
    t = (0:n-1)'*2*pi/n
    
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
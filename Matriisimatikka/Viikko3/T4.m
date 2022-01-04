% Konsta Keski-Mattinen 27.3.2021

%Ax=b
A=[(-1)^2,-1, 1;
    (0)^2, 0, 1;
    (1)^2, 1, 1;
    (2)^2, 2, 1;
    (3)^2, 3, 1;
    (4)^2, 4, 1];

% x= [a;b;c]

b= [7;4;3;4;3;8];

temp = rref([A'*A, A'*b]);
d= temp(:,end)

xplot = (A(1,2):0.01:A(end, 2))';
yplot = [xplot.^2, xplot, ones(size(xplot))]*d;


figure(); hold on
plot(A(:,2), b(:,1), 'r.');
plot(xplot, yplot, 'b');
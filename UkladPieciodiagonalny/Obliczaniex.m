function [x] = Obliczaniex(B,b)
%{ 
Parametry:
B - macierz pięciodiagonalna w formacie 5xn
b -wektor b
%}

%{ 
Działanie:
Wyzancza rozwiazanie ukladu 
%}

n=size(B,2);
x=zeros(n,1);

x(n)=b(n)/B(3,n);
x(n-1)=(b(n-1)-x(n)*B(2,n-1))/B(3,n-1);

for i=n-2:-1:1
    a=B(1:3,i);
    x(i)=(b(i)-a(1)*x(i+2)-a(2)*x(i+1))/a(3);
end    
end 

















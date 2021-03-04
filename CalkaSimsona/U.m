function [Y] = U(x,k)
% T zwraca macierz Y o k+1 wierszach i len(x) kolumnach
% gdzie Y(i,j) to wartość wielomianu Czebyszewa drugiego rodzaju stopnia i-1 dla argumentu x(j)
%x- wektor rzeczywisty - argumenty dla wyznaczania wielomianów
%k-liczba naturalna - do jakiego stopnia włącznie chcemy obliczyć wielomiany 
n=size(x,2);
if k==0
    Y=ones(1,n)
    return
end    
if k==1
    Y=ones(2,n);
    Y(2,:)=2*x;
    return
end    
Y=ones(k+1,n);
Y(2,:)=2*x;
for i=3:k+1
Y(i,:)=2*x.*Y(i-1,:) - Y(i-2,:);
end
end
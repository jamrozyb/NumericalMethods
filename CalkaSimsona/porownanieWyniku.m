function [y] = porownanieWyniku(a,b,n,a_vector,k)
%obliczanie błędu na potrzeby rysowania wykresu(nie jest elementem funkcji
%obliczania całki)
sim=calkaSimsona(a,b,a_vector,k);
% całka wbudowana
fun=@(x)w(x,n,a_vector);
int=integral(fun,a,b);
y=sim-int;
function [y] = w(x,n,a)
%wyznacza wartosci funcji w dla argumnetów x, a0,a1,a2... jako wektor a
% długosc n+1
W=(a.').*T(x,n).*U(x,n);
y=sum(W);
end
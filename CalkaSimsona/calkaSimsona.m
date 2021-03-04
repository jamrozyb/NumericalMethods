function [y] = calkaSimsona(a,b,a_vector,k)
%wyznacza przybliżoną całke metodą simsona dla funcji w na
%przedziale (a,b) wywołanej z parametrem n oraz wartosciami ak z wektora
%a_vector obliczonej na k węzłach
%a,b liczby rzeczywiste - przedział całkowania
%k liczba naturalna - ilosc węzłów
%a_vector vektor vektor wartosci a
%k min 2
%parametr n wyznaczany jako długosc a_vecror -1

if nargin <4
    error("za mało argumnentów");
end
validateattributes(a,{'numeric'},{'scalar'},1)
validateattributes(b,{'numeric'},{'scalar'},2)
validateattributes(a_vector,{'numeric'},{'row'},3)
validateattributes(k,{'numeric'},{'scalar'},4)
if a>=b
    error("zły przedział całkowania");
end 
if k<2
    error("k powinno być wieksze bądź równe 2")
end

n=size(a_vector,2)-1;

h=(b-a)/k;
x=linspace(a+h,b-h,k-1);
x_center=linspace(a+h/2,b-h/2,k);

y=h/6*(sum(w([a,b],n,a_vector)) + 2*sum(w(x,n,a_vector)) + 4*sum(w(x_center,n,a_vector)));

end
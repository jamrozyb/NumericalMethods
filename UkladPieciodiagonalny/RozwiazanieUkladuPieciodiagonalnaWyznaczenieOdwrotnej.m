function [x,det_A,det_A_inverse] = RozwiazanieUkladuPieciodiagonalnaWyznaczenieOdwrotnej(A,b)
%{ 
Parametry:
A - macierz pięciodiagonalna
b -wektor b
%}

%{ 
Działanie:
Transformuje A do macierzy 5xn, dokonuje elimiancji Gaussa, wylicza wetor
rozwiązań x 

Gdy A nie bedzie pięciodiagonalna jej niezerowe wartości poza diagonalami
zostaną zignorowane
%}

if nargin <2
    error("za mało argumnentów");
end
validateattributes(A,{'numeric'},{'2d'},1)
validateattributes(b,{'numeric'},{'row'},2)

if size(A,1)~=size(A,2)
    error("Macierz nie jest kwadratowa");
end 
if size(A,1)~=size(b,2) & size(A,1)~=size(b,1)
    error("Wymiar macierzy i wektora wyrazów wolnych nie odpowiadają sobie");
end

B=PienciodiagonalnaJakoProstokatna(A);

n=size(B,2);
Inverse=zeros(5,n);
Inverse(3,:)=ones(1,n);
[Be,be,Inverse] = EliminacjaGaussaIMacierzOdwrotna(B,b,Inverse);
det_A=prod(B(3,:));
x = Obliczaniex(Be,be);
% delej wynaczanie macierzy odwrotnej, i wyznacznika prez EliminacjeGaussa

%przestawianie wierszy w macierzy 5xn 1<->5,2<->4
C=zeros(5,n);
C(3,:)=Be(3,:);
C(4,2:n)=Be(2,1:n-1);
C(5,3:n)=Be(1,1:n-2);

%przestawianie wierszy w macierzy 5xn 1<->5,2<->4
I=zeros(5,n);
I(3,:)=Inverse(3,:);
I(2,1:n-1)=Inverse(4,2:n);
I(1,1:n-2)=Inverse(5,3:n);

% c,b,i nie mają juz naczenia 

[Ce,c,Ie] = EliminacjaGaussaIMacierzOdwrotna(C,b,I);
% bo maciez Ce nie ma na diagonali jedynek tylko inne liczby 
det_ce=prod(Ce(3,:));

[Inverse_gauss,c,i] = EliminacjaGaussaIMacierzOdwrotna(Ie,b,I);

det_A_inverse=-prod(Inverse_gauss(3,:))/det_ce;



end

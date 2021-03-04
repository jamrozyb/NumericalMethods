function [B] = PienciodiagonalnaJakoProstokatna(A)

%{ 
Parametry:
% A-Maciez kwadratowa 
%}

%{ 
Działanie:
Zwraca macierz B, której wiersze są diagonalami 
(odpowiednio rozszerzonymi zerami do długości n rozmiaru A, 
diagonala 1 i 2 przedłużone z tyłu, 4 i 5 z przodu) z A
%}


n=size(A,1);
B=zeros(5,n);

B(1,1:n-2)=diag(A,2);
B(2,1:n-1)=diag(A,1);
B(3,:)    =diag(A,0);
B(4,2:n)  =diag(A,-1);
B(5,3:n)  =diag(A,-2);
end


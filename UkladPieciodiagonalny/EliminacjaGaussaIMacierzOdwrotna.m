function [B,b,Inverse] = EliminacjaGaussaIMacierzOdwrotna(B,b,Inverse)

%{ 
Parametry:
B - macierz pięciodiagonalna w formacie 5xn
b -wektor b
%}

%{ 
Działanie:
Dokonuje operacji na B odpowiadającej podstawowej eliminacji gausa
na oryginalniej macierzy pięciodiagonalnej.
Dokonuje te same działania na Inverse tak by wyznaczyć macierz odwrotną 
%}


n=size(B,2);

% Inverse=zeros(5,n);
% Inverse(3,:)=ones(1,n);

for i=1:n-2;
    % w przypadku 0 na diagonali da NaNy 
    a0=B(3,i);   %  A(i,i)
    a1=B(4,i+1); %  A(i,i+1)
    a2=B(5,i+2); %  A(i,i+2)
    ratio01=a1/a0;
    ratio02=a2/a0;
    rowi=B(1:3,i); % A(i,i:i+2)
    B(2:4,i+1)=B(2:4,i+1)-ratio01*rowi;
    B(3:5,i+2)=B(3:5,i+2)-ratio02*rowi;
    
    b(i+1)=b(i+1) - ratio01*b(i);
    b(i+2)=b(i+2) - ratio02*b(i);
    
    row_inverse=Inverse(1:3,i);
    Inverse(2:4,i+1)=Inverse(2:4,i+1)-ratio01*row_inverse;
    Inverse(3:5,i+2)=Inverse(3:5,i+2)-ratio02*row_inverse;
end 
i=n-1;
a0=B(3,i);   %  A(i,i)
a1=B(4,i+1); %  A(i,i+1)

ratio01=a1/a0;
rowi=B(2:3,i);% A(i,i:i+2)
B(3:4,i+1)=B(3:4,i+1)-ratio01*rowi;

b(i+1)=b(i+1) - ratio01*b(i);

row_inverse=Inverse(2:3,i);% A(i,i:i+2)
Inverse(3:4,i+1)=Inverse(3:4,i+1)-ratio01*row_inverse;

end
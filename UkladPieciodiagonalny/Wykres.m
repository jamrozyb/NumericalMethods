%Skrypt rysuje mape ciepła błedu (norma z wyniku zaimplementowanej funcji -
%norma wyniku z funcji matlabowej) dla losowych macierzy o różnych
%wymiarach, oraz dla różnuch norm


    

liczba_norm=10;
max_rozmiar_macierzy=10;

X=ones(liczba_norm,max_rozmiar_macierzy);
for i=2:max_rozmiar_macierzy+1
    A=rand(i);
    b=ones(1,i);
    X(1,i-1)=Blad(A,b,-inf);
    for j=1:liczba_norm-2
        X(j+1,i-1)=Blad(A,b,j);
    end
    X(liczba_norm,i-1)=Blad(A,b,inf);
    
end     

figure,
h=heatmap(X)
h.YDisplayLabels = string(["-inf",1:liczba_norm-2,"inf"]);
h.XDisplayLabels = string(2:max_rozmiar_macierzy+1);
% 
ylabel("Norma")
xlabel("Rozmaiar macierzy nxn")
title("Różnica norm z napisaj funcji do rozwiązania systemowego: A\ b ")


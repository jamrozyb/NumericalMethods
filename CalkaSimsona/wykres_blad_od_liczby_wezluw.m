%Skrypt do wizualizacji błędu(nie jest elementem funkcji
%obliczania całki)
a=1
b=2
k=10
n=2

X=zeros(k-1,10);
a_random=rand(k,n+1)

for i=2:(k)
    for j=1:k
        X(i-1,j)=porownanieWyniku(a,b,n,a_random(j,:),i);
    end
end

figure,
h=heatmap(X)
h.YDisplayLabels = string(2:k);

ylabel("Liczba wezłów")
xlabel("Losowe wektory parametrów a w przedziale (0,1)")
title({"Błąd obliczania całki(implementacja - funcja wbudowana 'intergral')"," na przedziale (1,2)"})


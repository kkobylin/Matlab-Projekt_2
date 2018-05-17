function [X] = Oblicz_X(U,b,n)
%Obliczanie ukladu rownan z macierza trojkatna U 
%i przeksztalconym wektorem b

%macierz wynikow
X=zeros(n,1);

%Pierwszy element od dolu
X(n,1) = b(n)/U(n,n);

%Drugi element od dolu
X(n-1,1)=(b(n-1)-U(n-1,n)*X(n))/U(n-1,n-1);

%i - numer równania w którym siê znajdujemy
i=2;
%k - liczba pozosta³ych równañ do policzenia
k=n-i;
%j - zmienna u¿ywana do sumy
j=k+1;

%Obliczanie pozostalych elementow ze wzoru z podrecznika
while k>=1
    %Temp tymczasowo przechowuje wynik sumy
    Temp=0;
    j=k+1;
    while j <= n
        Temp=Temp+U(k,j)*X(j);
        j=j+1;
    end
    X(k,1)=(b(k)-Temp)/U(k,k);
    i=i+1;
    k=n-i;
end

end


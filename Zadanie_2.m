function [U,b,n] = Zadanie_2(A,b,n)
%Rozwiazanie ukladu rownan metoda Eliminacji Gaussa z czesciowym
%wyborem elementu podstawowego

if det(A) == 0 
       warning('Macierz osobliwa. Nie da siê wykonaæ zadania');
       return;
end


%L-macierz (lower triangular) z rozk³adu LU macierzy A
L=eye(n);
%U-macierz (upper triangular) z rozk³adu LU macierzy A
U=A;


for k=1:n-1 %kolumny
    %P-macierz przestawieñ, ró¿ni¹ca siê od jednostkowej tylko dwoma
    %jedynkami
    P=eye(n);
        %odnalezienie najwiêkszego elementu w kolumnie
        max = abs(U(k,k));
        %ind - numer wiersza zawieraj¹cy najwiêkszy element w kolumnie
        ind=k;
        j = k; %kolumna
        for i = j:n %wiersz
            if abs(U(i,j)) > max
                max = abs(U(i,j));
                ind = i;
            end
        end
        %end odnalezienie max
        %Uzupe³nianie macierzy przestawieñ (jeœli konieczne)
        if (ind ~= k)
            P(ind,k)=1;
            P(k,ind)=1;
            P(k,k)=0;
            P(ind,ind)=0;
        end
        %Zamiana wierszy
        U=P*U;
        b=P*b;
        L=P*L*P;
        
        %Wypelnienie macierzy L 
        for i=k+1:n
            %wspolczyniik l
            L(i,k)=U(i,k)/U(k,k);
            %mno¿ymy dane wiersze macierzy U przez wspó³czynnik l
            U(i,:) = U(i,:) - L(i,k) * U(k,:);
            %tak samo przemna¿amy wektor b
            b(i) = b(i) - L(i,k) * b(k);
        end
end
       
end


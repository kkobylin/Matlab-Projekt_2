function [lambda] = EigQRShifts( A, tol, imax )
%tol -  tolerancja element�w zerowanych
%imax - maksymalna liczba iteracji
n = size ( A, 1);
iterations = 0;
lambda = diag ( zeros(n) );
SM = A; % macierz pocz�tkowa(oryginalna)
for k=n:-1:2
    DK = SM; %macierz startowa dla jednej warto�ci w�asnej
    i = 0;
    while (i <= imax) & ( max ( abs ( DK ( k,1:k-1 ) ) ) > tol )
        DD = DK( k-1:k, k-1:k ); %2x2 podmacierz dolnego prawego rogu
        %wsp - wektor zawieraj�cy wsp�czynniki r�wnania kwadratowego
        wsp = [1, -( DD(1, 1) + DD(2, 2)), DD(2, 2)*DD(1, 1) - DD(2, 1)*DD(1, 2)];
        ev = roots( wsp );
        if abs(ev(1,1) - DD(2, 2) ) < abs ( ev(2,1) - DD(2, 2) )
            shift = ev(1,1); %najbli�sza DK(k,k) warto�� w�asna podmacierzy DD
        else
            shift = ev(2,1);
        end
        DK = DK - eye( k ) * shift; %macierz przesuni�ta
        [Q1, R1] = QRdecomposition ( DK );
        DK = R1 * Q1 + eye( k ) * shift; %macierz przekszta�cona
        i = i+1;
        iterations = iterations + 1;
    end
    if ( i > imax )
        disp('Too many iterations needed');
    else
        lambda( k ) = DK (k , k);
        if ( k > 2 )
            SM = DK ( 1:k-1, 1:k-1 ); %deflacja macierzy
        else
            lambda(1) = DK(1, 1); %ostatnia warto�� w�asna
        end
    end
end
    disp(iterations)
end
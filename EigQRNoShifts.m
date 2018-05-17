function [lambda] = EigQRNoShifts( A, tol, imax )
%tol -  tolerancja elementów zerowanych
%imax - maksymalna liczba iteracji
n = size (A, 1);
i = 1;
iterations=0;
while (i <= imax & (max ( max ( A - diag ( diag ( A ) ) ) ) > tol ) )
    [Q, R] = QRdecomposition ( A ) ;
    A = R * Q;
    i = i + 1;
    iterations=iterations+1;
end
if ( i > imax )
    disp('Too many iterations needed.');
    iterations=0;
else
    lambda = diag(A);
    %disp(iterations)
end
end
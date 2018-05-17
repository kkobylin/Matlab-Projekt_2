function [a] = Approximation(x,y,n)
%Aproksymacja danych f(x)=y metod¹ najmniejszych kwadratów, wyznaczaj¹c
%funkcjê wielomianow¹ o stopniu n
n=n+1;
w=size(x);
A=zeros(w(1,2),n);

for i=1:w(1,2) %wiersze
    for j=1:n %kolumny
        A(i,j)=x(i)^(j-1);
    end
end
b=A'*A;
c=A'*y;
[U,b,n]=Zadanie_2(b,c,n);
a=Oblicz_X(U,b,n);

%f - funkcja aproksymuj¹ca

if ( n == 1)
f = @(x) a(1);
elseif (n == 2)
f = @(x) a(1) + a(2)*x.^1;
elseif (n == 3)
f = @(x) a(1) + a(2)*x.^1 + a(3)*x.^2;
elseif (n == 4)
f = @(x) a(1) + a(2)*x.^1 + a(3)*x.^2 + a(4)*x.^3;
elseif (n == 5)
f = @(x) a(1) + a(2)*x.^1 + a(3)*x.^2 + a(4)*x.^3 + a(5)*x.^4;
elseif (n == 6)
f = @(x) a(1) + a(2)*x.^1 + a(3)*x.^2 + a(4)*x.^3 + a(5)*x.^4 + a(6)*x.^5;
elseif (n == 7)
f = @(x) a(1) + a(2)*x.^1 + a(3)*x.^2 + a(4)*x.^3 + a(5)*x.^4 + a(6)*x.^5; +a(7)*x.^6;
elseif (n == 8)
f = @(x) a(1) + a(2)*x.^1 + a(3)*x.^2 + a(4)*x.^3 + a(5)*x.^4 + a(6)*x.^5; +a(7)*x.^6 +a(8)*x.^7;
end
xf = -5:0.1:5;
hold on
plot(xf, f(xf));
for i = 1:w(1,2)
plot(x(i), y(i), 'r*');
r(i)=f(x(i))-y(i);
end

r=norm(r);
disp(r)

end


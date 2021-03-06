%Este programa desarrolla la interpolaci?n mediante difernecias divididas
%f es la funci?n definida entre comillas
%X es un vector fila que contiene los valores de X
%Y es un vector fila que contiene los valores de la funci?n
%xo es el valor a interpolar
function [D]=diferencia3(f,X,Y,xo)
%EJEMPLO 1
%X=[0 1 2 3 4 5 6];Y=X.*log(X+1);xo=4.125;f='x*log(x+1)';
%EJEMPLO 2
%X=0.3:0.3:2.4;Y=cos(exp(X/2)-1/2);xo=1.75;f='cos(exp(x/2)-1/2)';
%[D]=diferencia3(f,X,Y,xo)
syms x
n=length(X);
D=zeros(n,n);
D(:,1)=Y';
for j=2:n
    for k=j:n
        D(k,j)=(D(k,j-1)-D(k-1,j-1))/(X(k)-X(k-j+1));
    end
end
P=D(1,1)+D(2,2)*(x-X(1))+D(3,3)*(x-X(1))*(x-X(2))+D(4,4)*(x-X(1))*(x-X(2))*(x-X(3))+...
    D(5,5)*(x-X(1))*(x-X(2))*(x-X(3))*(x-X(4))*D(6,6)*(x-X(1))*(x-X(2))*(x-X(3))*(x-X(4))*(x-X(5))+...
    D(7,7)*(x-X(1))*(x-X(2))*(x-X(3))*(x-X(4))*(x-X(5))*(x-X(6))
valor_aproximado=double(subs(P,xo))
valor_exacto=double(subs(f,xo))
error=abs(valor_aproximado-valor_exacto)








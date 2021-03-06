%Soluciones numericas de sistemas de Ecua no lineales 
%x^(k)=G(x^(k-1)), k>=1
%|x^(k)-x^(k-1)|<?
%Despejar x1,x2,x3
%Ver evaluacion en cada formula
%Si el sistema solo es de 2 ecuaciones nada mas asignar cero en:
%Introduzca la funci?n fx3: 0
%Introduzca el valor de x3: 0
clear all;
p=0;
w=0;
syms x1 x2 x3
fx1=input('Introduzca la funci?n fx1: ');
fx2=input('Introduzca la funci?n fx2: ');
fx3=input('Introduzca la funci?n fx3: ');
x(1,1)=input('Introduzca el valor de x1: ');
x(1,2)=input('Introduzca el valor de x2: ');
x(1,3)=input('Introduzca el valor de x3: ');
k=input('Valor de k= ');
error=input('Introduzca el valor de precisi?n: ');
for i=1:2
    p(i)=x(1,i);
end
x(2,1)=subs(fx1,{x1,x2,x3},{x(1,1),x(1,2),x(1,3)});
x(2,2)=subs(fx2,{x1,x2,x3},{x(1,1),x(1,2),x(1,3)});
x(2,3)=subs(fx3,{x1,x2,x3},{x(1,1),x(1,2),x(1,3)});
for i=1:2
    w(i)=x(2,i);
end
tol=norm(p-w,inf);
fprintf('\nK         x1(k)             x2(k)               x3(k)             error')
fprintf('\n%d  %10.15f  %10.15f  %10.15f',k,x(1,1),x(1,2),x(1,3))
fprintf('\n%d  %10.15f  %10.15f  %10.15f  %e',k+1,x(2,1),x(2,2),tol)
k=k+2;
j=2;
while tol>error
    x(j,1)=subs(fx1,{x1,x2,x3},{x(j-1,1),x(j-1,2),x(j-1,3)});
    x(j,2)=subs(fx2,{x1,x2,x3},{x(j-1,1),x(j-1,2),x(j-1,3)});
    x(j,3)=subs(fx3,{x1,x2,x3},{x(j-1,1),x(j-1,2),x(j-1,3)});
    p=w;
    for i=1:2
        w(i)=x(j,i);
    end
    tol=norm(p-w,inf);
    fprintf('\n%d  %10.15f  %10.15f  %10.15f  %e',k,x(j,1),x(j,2),tol)
    k=k+1;
    j=j+1;
end
fprintf('\n');
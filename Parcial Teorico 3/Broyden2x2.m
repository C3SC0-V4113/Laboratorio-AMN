%Metodo de Broyden para ecua no lineales
%x^(k)=x^(k-1)-(J(x^(k-1))^(-1)*F(x^(k-1))
clear all
syms x1 x2
A=0; F=0; x=0; Y=0; S=0; F1=0; xk=0;
f1=input('Introduzca la funcion fx= ');
f2=input('Introduzca la funcion fy= ');
%Primero se sacan las derivadas y asi se evaluan las constantes
f11=diff(f1,x1);
f12=diff(f1,x2);
f21=diff(f2,x1);
f22=diff(f2,x2);
x1=input('Introduzca el valor de x1= ');
x2=input('Introduzca el valor de x2= ');
error=input('Introduzca la precision= ');
A(1,1)=subs(f11,{'x1','x2'},{x1,x2});
A(1,2)=subs(f12,{'x1','x2'},{x1,x2});
A(2,1)=subs(f21,{'x1','x2'},{x1,x2});
A(2,2)=subs(f22,{'x1','x2'},{x1,x2});
F1(1,1)=subs(f1,{'x1','x2'},{x1,x2});
F1(2,1)=subs(f2,{'x1','x2'},{x1,x2});
fprintf('\n\nDerivadas Parciales:\n');
parciales=[f11,f12;f21,f22]
x=[x1 x2]';
fprintf('-------------------------------------------------------------\n')

k=1;
fprintf('k=%d\nx(0)=\n',k)
for i=1:2
    fprintf('     %10.15f\n',x(i,1))
end
fprintf('\nF(x0)=\n')
for i=1:2
    fprintf('     %10.15f\n',F1(i,1))
end
fprintf('\nJ(x0)=\n')
for i=1:2
    for j=1:2
        fprintf('     %10.15f',A(i,j))
    end
    fprintf('\n')
end
A=inv(A);
xk=x-A*F1;
fprintf('\nx(1)=x(0)-J^(-1)(x(0))F(x(0))\n')
for i=1:2
    fprintf('     %10.15f\n',xk(i,1))
end
tol=norm(xk-x,inf);
fprintf('Error=|x(1)-x(0)|=%1.15e\n',tol)
while tol>error
    fprintf('\n-------------------------------------------------------------\n')
    k=k+1;
    x1=xk(1,1);
    x2=xk(2,1);
    F(1,1)=subs(f1,{'x1','x2'},{x1,x2});
    F(2,1)=subs(f2,{'x1','x2'},{x1,x2});
    Y=F-F1;
    F1=F;
    S=xk-x;
    ST=S';
    A=A+((S-A*Y)*ST*A)/(ST*A*Y);
    x=[x1 x2]';
    fprintf('k=%d\nx(%d)=\n',k,k-1)
    for i=1:2
       fprintf('     %10.15f\n',x(i,1))
    end
    fprintf('\nF(x%d)=\n',k-1)
    for i=1:2
       fprintf('     %10.15f\n',F(i,1))
    end   
    fprintf('\nY%d=F(X%d)-F(X%d)=\n',k-1,k-1,k-2)
    for i=1:2
       fprintf('     %10.15f\n',Y(i,1))
    end
    fprintf('\nS%d=x(%d)-x(%d)=\n',k-1,k-1,k-2)
    for i=1:2
       fprintf('     %10.15f\n',S(i,1))
    end
    fprintf('\nA%d=A%d+((S%d-A%d*Y%d)ST%d*A%d)/(ST%d*A%d*Y%d)\n',k-1,k-2,k-1,k-2,k-1,k-1,k-2,k-1,k-2,k-1)
    for i=1:2
      for j=1:2
          fprintf('     %10.15f',A(i,j))
      end
      fprintf('\n')
    end
    xk=x-A*F;
    fprintf('\nx(%d)=x(%d)-A^(-1)(x(%d))F(x(%d))\n',k,k-1,k-1,k-1)
    for i=1:2
       fprintf('     %10.15f\n',xk(i,1))
    end
    tol=norm(xk-x,inf);
    fprintf('Error=|x(%d)-x(%d)|=%1.15e\n',k,k-1,tol)
end
fprintf('-------------------------------------------------------------\n')
fprintf('\nx1= %10.15f',xk(1,1))
fprintf('\nx2= %10.15f',xk(2,1))
fprintf('\n\n')

%Memorias de un aprendiz de METNUM By NH se igualan las funciones a cero
%Introduzca la funcion fx= log(x1^2+x2^2)-sin(x1*x2)-log(2*pi)
%Introduzca la funcion fy= exp(x1-x2)+cos(x1*x2)
%Introduzca el valor de x1= 1.76
%Introduzca el valor de x2= 1.76
%Introduzca la precision= 10^-6

%otro ejemplo
%-----------------
%Dado el siguiente sistema de ecuaciones no lineales 
%  x1*(1-x1)+4*x2=12
% (x1-2)^2+(2*x2-3)^2=25
% y x^0=(-0.9,3.35)^T   (si no lo dan elegirlo del intervalo dado)
%Determine la solucion aproximada empleando el metodo de Broyden

%entonces:
% igualar las funciones a cero
% f1=x1*(1-x1)+4*x2-12=0
% f2=(x1-2)^2+(2*x2-3)^2-25=0

%  Fx= [x1*(1-x1)+4*x2-12 ; (x1-2)^2+(2*x2-3)^2-25 ]



%en el programa:
%Introduzca la funcion fx= x1*(1-x1)+4*x2-12
%Introduzca la funcion fy= (x1-2)^2+(2*x2-3)^2-25
%Introduzca el valor de x1= -0.9
%Introduzca el valor de x2= 3.35
%Introduzca la precision= 10^-9
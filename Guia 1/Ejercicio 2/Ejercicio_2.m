clc
clear all
syms x
%2 valores cualquier cerca de la raíz(graficas secantes acordate)
disp('Ejercicio 2')
%Entrada de datos%
xo=input('Introduzca el valor inicial xo: ');
%po = input('Introduzca el valor inicial (po): ');
%p1= input('Introduzca el otro valor inicial (p1): ');
f=(((3.346-x+(3.346-x)^(1/5))*(x+(x)^(1/5)))-7.533340127832330);
fplot(@(y)(((3.346-y+(3.346-y)^(1/5))*(y+(y)^(1/5)))-7.533340127832330),[1,2.3])
grid on

%----------------------------
error = input('Introduzca el valor de presición: ');
fxo=subs(f,xo);
dfxo= subs(diff(f,x), xo);
xn=xo-fxo/dfxo;
cont=1;
tol=abs(xn-xo);
disp(' n          xo                  xn            error')
fprintf('%2.0f  %9.15f  %9.15f %e\n',double(cont),double(xo),double(xn),double(tol))
while tol>error
    cont=cont+1;
    xo=xn;
    fxo=subs(f,xo);
    dfxo=subs(diff(f,x),xo);
    xn=xo-fxo/dfxo;
    tol=abs(xn-xo);
    fprintf('%2.0f  %9.15f  %9.15f %e\n',double(cont),double(xo),double(xn),double(tol))
end
fprintf('El valor aproximado de x= %9.15f\n',double(xn))


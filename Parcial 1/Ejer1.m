clc
clear all
syms h
disp('MÉTODO DE NEWTON RAPHSON')
%xo graficando
xo=input('Introduzca el valor inicial (xo): '); %2.48
V=input('Introduzca el valor del Vólumen (V): ');
%h=input('Introduzca la profundidad del agua (h): ');
R=input('Introduzca el radio del tanque (R): ');
L=input('Introduzca la longuitud del tanque (L): ');
f = input('Introduzca la función f: ');
%(R^2*acos((R-h)/R)-(R-h)*(2*R*h-(h^2))^(1/2))*L-V
fplot(@(h) ((R^2*acos((R-h)/R)-(R-h)*(2*R*h-(h^2))^(1/2))*L-V),[2,3])
grid on
error = input('Introduzca el valor de presición: ');
fxo=subs(f,xo);
dfxo= subs(diff(f,h), xo);
xn=xo-fxo/dfxo;
cont=1;
tol=abs(xn-xo);
disp(' n          xo                  xn            error')
fprintf('%2.0f  %9.15f  %9.15f %e\n',double(cont),double(xo),double(xn),double(tol))
while tol>error
    cont=cont+1;
    xo=xn;
    fxo=subs(f,xo);
    dfxo=subs(diff(f,h),xo);
    xn=xo-fxo/dfxo;
    tol=abs(xn-xo);
    fprintf('%2.0f  %9.15f  %9.15f %e\n',double(cont),double(xo),double(xn),double(tol))
end
fprintf('El valor aproximado de x= %9.15f\n',double(xn))
clc
clear all
syms w
disp('Ejercicio 2 de Parcial Práctica')
R=input('Ingrese la resistencia (R): ');
C=input('Ingrese la Capacitancia (C): ');
L=input('Ingrese la inductancia (L): ');
Z=input('Ingrese la impedancia (Z): ');
%fplot(@(w)((sqrt((1/(R^2))+(w*C-(1/(w*L)))^2))-(1/Z)),[-2,2])
%grid on
xo=input('Escriba el punto inicial: ');
%113.2112
f=input('Escriba la funcion: ');
p=input('Escriba la precision: ');
fxo=subs(f,xo);
dfxo=subs(diff(fxo,w),xo);
xn=xo-(fxo/dfxo);
error=abs(xn-xo);
disp('n           xo               xn             error')
cont=1;
fprintf('%2.0f         %9.15f         %9.15f         %2.2e\n',double(cont),double(xo),double(xn),double(error))
while error>p
    xo=double(xn);
    fxo=subs(f,xo);
    dfxo=subs(diff(fxo,w),xo);
    xn=xo-(fxo/dfxo);
    error=abs(xn-xo);
    cont=cont+1;
    fprintf('%2.0f         %9.15f         %9.15f         %2.2e\n',double(cont),double(xo),double(xn),double(error))
end
fprintf('El valor de w es de: %9.15f',double(xn))
fzero('((sqrt((1/(208^2))+(x*0.9e-6-(1/(x*0.55)))^2))-(1/60))',100)
    
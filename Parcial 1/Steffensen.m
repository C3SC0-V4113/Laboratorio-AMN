clc
clear all
syms x
%g(x) debe cumplir las condiciones de punto fijo
disp('MÉTODO DE STEFFENSEN')
xo =input('Introduzca el valor inicial (xo): ');
g= input('Introduzca la función g: ');
criterio = input('Introduzca el valor de presición: ');
x1= subs(g,xo);
x2=subs(g,x1);
cont=1;
x=xo-((x1-xo)^(2))/(x2-2*x1+xo);
error=abs(x-xo);
disp(' n          xo                  x1              x2                 x            error')
fprintf('%2.0f  %9.15f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(xo),double(x1),double(x2),double(x),double(error));
while error>criterio
    cont=cont+1;
    xo=double(x);
    x1=subs(g,xo);
    x2=subs(g,x1);
    x=xo-((x1-xo)^(2))/(x2-2*x1+xo);
    error=abs(x-xo);
    fprintf('%2.0f  %9.15f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(xo),double(x1),double(x2),double(x),double(error));
end
fprintf('%9.15f\n',double(x))
    
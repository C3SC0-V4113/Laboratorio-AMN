clc
clear all
syms x
%Intervalo que cumpla la condicion de cambio de signo
disp('MÉTODO DE POSICIÓN FALSA')
xo =input('Introduzca el valor inicial del intervalo (xo): ');
x1= input('Introduzca el valor final del intervalo (x1): ');
f= input('Introduzca la función f: ');
criterio = input('Introduzca el valor de presición: ');
%Verificación
fxo=subs(f,xo);
fx1=subs(f,x1);
verifi = fxo*fx1;
while verifi >0
    fprintf('Intervalo inválido, no hay cambio de signo\n');
    xo=input('Ingrese el primer valor del intervalo (xo): ');
    x1=input('Ingrese el segundo valor del intervalo (x1): ');
    verifi = (subs(func,xo))*(subs(func,x1));
end
cont=1;
x2=x1-((subs(f,x1))*(x1-xo))/((subs(f,x1))-(subs(f,xo)));
error = abs(x2-x1);
disp(' n          xo                  x1              x2             error')
fprintf('%2.0f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(xo),double(x1),double(x2),double(error));
while error>criterio
    cont=cont+1;
    if (subs(f,x1))*(subs(f,x2))<0
        xo=x1;
        x1=x2;
    else
        x1=x2;
    end
    x2=x1-((subs(f,x1))*(x1-xo))/((subs(f,x1))-(subs(f,xo)));
    error = abs(x2-x1);
    fprintf('%2.0f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(xo),double(x1),double(x2),double(error));
end
fprintf('%9.15f\n',double(x2))
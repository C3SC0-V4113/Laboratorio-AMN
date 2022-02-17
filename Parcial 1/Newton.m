clc
clear all
syms x y
disp('MÉTODO DE NEWTON RAPHSON')
%xo graficando
xo=input('Introduzca el valor inicial (xo): ');
f= input('Introduzca la función f: ');
fy = input('Introduzca la ecuacion de y: ');
criterio = input('Introduzca el valor de presición: ');
cont=1;
P=xo-(subs(f,xo))/(subs(diff(f,x),xo));
error = abs(P-xo);
disp(' n          xo                  x              error')
fprintf('%2.0f  %9.15f  %9.15f %2.2e\n',double(cont),double(xo),double(P),double(error))
while error>criterio
    cont=cont+1;
    xo=P;
    P=xo-(subs(f,xo))/(subs(diff(f,x),xo));
    error = abs(P-xo);
    fprintf('%2.0f  %9.15f  %9.15f %2.2e\n',double(cont),double(xo),double(P),double(error))
end
fprintf('El valor de x es %9.15f pies\n',double(P))
x=P;
fprintf('El valor de y es %9.15f pies\n ',double(subs(fy,P)));
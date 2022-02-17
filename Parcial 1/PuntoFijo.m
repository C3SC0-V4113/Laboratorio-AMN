clc
clear all
syms x
%Para este script debo meter la funcion g(x), una vez que este cersiorado 
%que cumpla las condiciones.
%El punto inicial lo elijo graficando la funcion original f(x)
%Introducción de datos
disp('MÉTODO DE ITERACIÓN DE PUNTO FIJO')
po=input('Introduzca el valor inicial (po): ');
criterio = input('Introduzca el valor de presición: ');
g = input('Introduzca la función g: ');
cont=1;
%Evaluando en g(x)
P= subs(g,po);
%Sacando error y comprobando
error = abs(P-po);
disp(' n          po                  P           error')
fprintf('%2.0f  %9.15f  %9.15f  %2.2e\n',double(cont),double(po),double(P),double(error))
while error > criterio
    cont = cont +1;
    po = P;
    P= subs(g,po);
    error = abs(P-po);
    fprintf('%2.0f  %9.15f  %9.15f  %2.2e\n',double(cont),double(po),double(P),double(error))
end
fprintf('La raíz aproximada es x= %9.15f\n', double(P));
  
    

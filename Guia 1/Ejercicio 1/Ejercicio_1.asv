clc
clear all
syms x
%2 valores cualquier cerca de la raíz(graficas secantes acordate)
disp('Ejercicio 1')
%Entrada de datos%
po = input('Introduzca el valor inicial (po): ');
p1= input('Introduzca el otro valor inicial (p1): ');
f= input('Introduzca la función f: ');
criterio = input('Introduzca el valor de presición: ');
cont=1;
%Se hace la primera iteración y se guarda el 
%número para la segunda iteracion
P=p1-((subs(f,p1))*(p1-po))/((subs(f,p1))-(subs(f,po)));
error = abs(P-p1);
%Se hace la tabla
disp(' n          po                  p1              p2             error')
fprintf('%2.0f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(po),double(p1),double(P),double(error));
% Mientras el error sea mayor que el criterio, se repetirá
while error>criterio
    cont=cont+1;
    po=double(p1);
    p1=double(P);
    P=p1-((subs(f,p1))*(p1-po))/((subs(f,p1))-(subs(f,po)));
    error = abs(P-p1);
    fprintf('%2.0f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(po),double(p1),double(P),double(error))
end
fprintf('El valor de x = %9.15f\n',double(P))
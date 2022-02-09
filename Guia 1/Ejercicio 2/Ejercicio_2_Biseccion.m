clc
clear all
syms x
%2 valores cualquier cerca de la raíz(graficas secantes acordate)
disp('Ejercicio 2 Por Bisección')
xa=input('Ingrese el primer valor del intervalo (xa): ');
xb=input('Ingrese el segundo valor del intervalo (xb): ');
%Entrada de datos%
func=(((3.346-x+(3.346-x)^(1/5))*(x+(x)^(1/5)))-7.533340127832330);
fplot(@(y)(((3.346-y+(3.346-y)^(1/5))*(y+(y)^(1/5)))-7.533340127832330),[1,2.3])
grid on
criterio = input('Introduzca el valor de presición: ');
cont=1;
%Verificación
fa=subs(func,xa);
fb=subs(func,xb);
verifi = fa*fb;
while verifi >0
    fprintf('Intervalo inválido, no hay cambio de signo\n');
    xa=input('Ingrese el primer valor del intervalo (xa): ');
    xb=input('Ingrese el segundo valor del intervalo (xb): ');
    verifi = (subs(func,xa))*(subs(func,xb));
end
disp(' n          xa                  xb              xp             error')
%Sacando raiz aproximada
xp = (xa+xb)/2;
%Sacando error
error1 = abs(subs(func,xp));
%Primera iteración
fprintf('%2.0f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(xa),double(xb),double(xp),double(error1))
if error1>criterio
    terminar = 1;
    while terminar == 1
        cont = cont +1;
        %Verificar la funcion en los nuevos puntos y escoger
        verifi = (subs(func,xp))*(subs(func,xa));
        if verifi >0
            xa= xp;
            xp= (xa+xb)/2;
            error = abs(xp-xa);
        else
            xb=xp;
            xp= (xa+xb)/2;
            error = abs(xp-xb);
        end
     %Imprimir nueva iteración
     fprintf('%2.0f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(xa),double(xb),double(xp),double(error))
     %Verificar error, elegir si terminar o seguir iterando
         if error < criterio
             terminar =0;
         else
             terminar =1;
         end
    end
end
fprintf('El valor aproximado de x= %9.15f\n',double(xp))
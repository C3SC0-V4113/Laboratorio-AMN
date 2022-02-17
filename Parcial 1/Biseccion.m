clc
clear all
syms x
%la raiz debe estar dentro del intervalo(cambio de signo)
disp('MÉTODO DE BISECCIÓN')
xa=input('Ingrese el primer valor del intervalo (xa): ');
xb=input('Ingrese el segundo valor del intervalo (xb): ');
func = input('Introduzca la función: ');
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
fprintf('%2.0f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(xa),double(xb),double(xp),double(error1))
if error1>criterio
    terminar = 1;
    while terminar == 1
        cont = cont +1;
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
     
     fprintf('%2.0f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(xa),double(xb),double(xp),double(error))
         if error < criterio
             terminar =0;
         else
             terminar =1;
         end
    end
end
fprintf('%9.15f\n',double(xp))
     
            
        

        
    
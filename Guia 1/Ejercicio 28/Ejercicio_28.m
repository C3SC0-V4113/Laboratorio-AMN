clc
clear all
syms t
disp('Ejercicio 28')
a=input('Ingrese el primer limite del intervalo: ');
b=input('Ingrese el segundo limite del intervalo: ');
func=75*exp((-3*t)/20)+20*exp((-3*t)/40)-8;
p=input('Ingrese la precisión: ');
verif=subs(func,a)*subs(func,b);
while verif>0
    printf('No hay cambio de signo, inserte nuevos limites');
    a=input('Ingrese el primer limite del intervalo');
    b=input('Ingrese el segundo limite del intervalo');
    verif=subs(func,a)*subs(func,b);
end
xp=(a+b)/2;
error=abs(subs(func,xp));
cont=1;
disp(' n          xa                  xb              xp             error')
fprintf('%2.0f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(a),double(b),double(xp),double(error))
while error>p
    verif=subs(func,xp)*subs(func,a);
    cont=cont+1;
    if verif>0
        a=xp;
        xp=(a+b)/2;
        error = abs(xp-a);
    else
        b=xp;
        xp=(a+b)/2;
        error = abs(xp-b);
    end
    fprintf('%2.0f  %9.15f  %9.15f  %9.15f %2.2e\n',double(cont),double(a),double(b),double(xp),double(error))
end
fprintf('El tiempo t necesario es: %9.15f',double(xp))
clc
clear all
syms x
disp('MÉTODO DE MULLER')
x0 = input('Introduzca el valor de x0: ');
x1 = input('Introduzca el valor de x1: ');
x2 = input('Introduzca el valor de x2: ');
f= input('Introduzca la función f: ');
criterio = input('Introduzca el valor de presición: ');
fx0= subs(f,double(x0));
fx1= subs(f,double(x1));
fx2=subs(f,double(x2));
arrA= ((x1-x2)*(fx0-fx2))-((x0-x2)*(fx1-fx2));
abaA=(x0-x2)*(x1-x2)*(x0-x1);
a= arrA/abaA;
arrB= (((x0-x2)^(2))*(fx1-fx2))-(((x1-x2)^(2))*(fx0-fx2));
abaB= (x0-x2)*(x1-x2)*(x0-x1);
b = arrB/abaB;
c=fx2;
cont=1;
if b<0
    abajo = b - sqrt(b^(2) - 4*a*c);
else
    abajo = b + sqrt(b^(2) - 4*a*c);
end
x3=x2-(2*c)/(abajo);
error = abs(x3-x2);
disp(' n          x0                  x1              x2                     x3                    a                    b                    c             error')
fprintf('%2.0f  %9.15f  %9.15f  %9.15f  %9.15f  %9.15f  %9.15f  %9.15f   %2.4e\n',double(cont),double(x0),double(x1),double(x2),double(x3),double(a),double(b),double(c),double(error));
while error>double(criterio)
    x0=double(x1);
    x1=double(x2);
    x2=double(x3);
    fx0= subs(f,double(x0));
    fx1= subs(f,double(x1));
    fx2=subs(f,double(x2));
    arrA= ((x1-x2)*(fx0-fx2))-((x0-x2)*(fx1-fx2));
    abaA=(x0-x2)*(x1-x2)*(x0-x1);
    a= arrA/abaA;
    arrB= (((x0-x2)^(2))*(fx1-fx2))-(((x1-x2)^(2))*(fx0-fx2));
    abaB= (x0-x2)*(x1-x2)*(x0-x1);
    b = arrB/abaB;
    c=fx2;
    if b<0
        abajo = b - sqrt(b^(2) - 4*a*c);
    else
        abajo = b + sqrt(b^(2) - 4*a*c);
    end
    x3=x2-(2*c)/(abajo);
    error = abs(x3-x2);
    cont=cont+1;
    fprintf('%2.0f  %9.15f  %9.15f  %9.15f  %9.15f  %9.15f  %9.15f  %9.15f   %2.4e\n',double(cont),double(x0),double(x1),double(x2),double(x3),double(a),double(b),double(c),double(error));
end
fprintf('La ráiz aproximada del polinomio es x3 = %9.12f\n', double(x3));
    

clc
clear all
syms t
disp('FÓRMULA CENTRADA DE TRES PUNTOS')
g=input('Ingresa la gravedad: ');%9.81
q=input('Ingresa la tasa de combustible: ');%2850
ux=input('Ingresa la velocidad del gasto: ');%8820
u=ux*(1000/(60*60));
mo=input('Ingresa la masa: ');%295000
V=input('Ingresa la función: ');%u*log(mo/(mo-(q*t)))-(g*t)
disp('Datos fuera de la función')
xo=input('Ingrese el valor de xo: ');%5.65
h=input('Ingrese el valor de h: ');%1/500
plush=double(subs(V,xo+h));
minush=double(subs(V,xo-h));
fprintf('f(xo+h)=%9.15f           f(xo-h)=%9.15f\n',plush,minush);

aproximada=double((1/(2*h))*(plush-minush));
fprintf('Raíz aproximada: %9.15f\n',aproximada);
exacta=double(subs(diff(V,t),xo));
fprintf('Raíz exacta: %9.15f\n',exacta);
error=abs(exacta-aproximada);
fprintf('Error: %9.15e\n',error);
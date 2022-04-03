syms t
disp('FÓRMULA CENTRADA DE TRES PUNTOS Y TRES TERMINOS')
g=input('Ingresa la gravedad: ');%9.8
k=input('Ingresa el valor de k: ');%12.5
m=input('Ingresa la masa: ');%70
S=input('Ingresa la función: ');%(m*g*t/k)-(((m^2)/(k^2))*g*(1-exp((-k*t)/m)))
disp('Datos fuera de la función')
xo=input('Ingrese el valor de xo: ');%6.75
h=input('Ingrese el valor de h: ');%1/100
normal=subs(S,xo);
plush=subs(S,xo+h);
plussh=subs(S,xo+(2*h));
fprintf('f(xo)=%9.15f           f(xo+h)=%9.15f           f(xo+2h)=%9.15f\n',double(normal),double(plush),double(plussh));

aproximada=(1/(2*h))*((-3*normal)+(4*plush)-plussh);
fprintf('Raíz aproximada: %9.15f\n',double(aproximada));
exacta=subs(diff(S,t),xo);
fprintf('Raíz exacta: %9.15f\n',double(exacta));
error=abs(exacta-aproximada);
fprintf('Error: %9.15e\n',double(error));

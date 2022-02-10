clc
clear all
syms c
v=input('Determine la velocidad: ');
m=input('Determine la masa: ');
t=input('Determine el tiempo: ');
g=input('Determine la gravedad: ');
f=input('Escriba la función despejada en c: ');
p=input('Determine la precision: ');
%fplot(@(c)(((m*g)/v)*(1-exp((-c*t)/m))),[-5,5]);
%grid on
xo=input('Escriba el punto inicial: ');
xn=subs(f,xo);
cont=1;
error=abs(xn-xo);
disp('n           xo               xn            error')
fprintf('%2.0f            %9.15f            %9.15f            %2.2e\n',double(cont),double(xo),double(xn),double(error));
while error>p
    xo=double(xn);
    xn=subs(f,xo);
    cont=cont+1;
    error=abs(xn-xo);
    fprintf('%2.0f            %9.15f            %9.15f            %2.2e\n',double(cont),double(xo),double(xn),double(error));
end
fprintf('El valor aproximado del rozamiento es: %9.15f',double(xn))
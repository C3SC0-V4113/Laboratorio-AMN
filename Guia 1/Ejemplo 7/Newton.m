disp('Método de Newton Raphson')
xo=input('Introduzca el valor inicial xo: ');
syms x
f = input('Introduzca la función f: ');
error = input('Introduzca el valor de presición: ');
fxo=subs(f,xo);
dfxo= subs(diff(f,x), xo);
xn=xo-fxo/dfxo;
cont=1;
tol=abs(xn-xo);
disp(' n          xo                  xn            error')
fprintf('%2.0f  %9.15f  %9.15f %e\n',double(cont),double(xo),double(xn),double(tol))
while tol>error
    cont=cont+1;
    xo=xn;
    fxo=subs(f,xo);
    dfxo=subs(diff(f,x),xo);
    xn=xo-fxo/dfxo;
    tol=abs(xn-xo);
    fprintf('%2.0f  %9.15f  %9.15f %e\n',double(cont),double(xo),double(xn),double(tol))
end
fprintf('El valor aproximado de x= %9.15f\n',double(xn))
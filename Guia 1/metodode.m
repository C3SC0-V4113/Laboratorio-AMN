%Método para calcular
clc
clear all
disp('Método de ')
xn=input('Introduzca el valor de xo: ');
fxn=funcion(xn);
error=0.000001;
fprintf('Tolerancia= %e\n',error)
cont=0;
fprintf('n= %3.0f xn= %e f(xn)= %e\n', cont,xn,fxn);
while abs(fxn)>error
    cont=cont+1;
    xo=xn;
    fx0=funcion(xo);
    dfxo=dfuncion(xo);
    xn=xo-fx0/dfxo;
    fxn=funcion(xn);
    fprintf('n= %3.0f xn= %e f(xn)= %e\n',cont,xn,fxn);
end

xn
fxn=funcion(xn)
function y=pfalsa(a,q,Q)
syms x
fplot(@(x)((1/(4*pi*8.85e-12))*((70e-6*95e-6*x)/((x^2+0.8^2)^(3/2)))-6.35),[-3,3])
grid on;
%((1/(4*pi*8.85e-12))*((q*Q*x)/((x^2+a^2)^(3/2)))-6.35)
disp('Distancia por Posicion Falsa')
xo=input('Ingrese el primer valor inicial: ');
x1=input('Ingrese el segundo valor inicial: ');
f=input('Ingrese la función f: ');
p=input('Ingrese la precisión: ');
verif=subs(f,xo)*subs(f,x1);
while verif>0
    disp('No hay cambio de signo, reingrese ');
    xo=input('Ingrese el primer valor inicial: ');
    x1=input('Ingrese el segundo valor inicial: ');
    verif=subs(f,xo)*subs(f,x1);
end
xn=x1-((subs(f,x1)*(x1-xo))/(subs(f,x1)-subs(f,xo)));
error=abs(xn-x1);
cont=1;
disp('n            xa                 xb                   xn                error');
fprintf('%3.0f         %9.15f         %9.15f         %9.15f         %2.2e\n',double(cont),double(xo),double(x1),double(xn),double(error))
while error>p
    verif=subs(f,xo)*subs(f,x1);
    if verif>0
        x1=double(xn);
    else
        xo=double(x1);
        x1=double(xn);
    end
    xn=x1-((subs(f,x1)*(x1-xo))/(subs(f,x1)-subs(f,xo)));
    error=abs(xn-x1);
    cont=cont+1;
    fprintf('%3.0f         %9.15f         %9.15f         %9.15f         %2.2e\n',double(cont),double(xo),double(x1),double(xn),double(error))
end
fprintf('La distancia es igual a: %9.15f',double(xn))
    


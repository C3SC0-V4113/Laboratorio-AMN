clc
clear all
syms x
disp('MÉTODO DE HERMITE CON LAGRANGE')
xbuscada=input('Ingrese valor al que desea aproximar: ');
X = input('Ingrese los valores de las x  [x1 x2 ... xn]: ');
n = size(X) -1;
%FUNCION
FUN = 1:n;
FDerivadas = 1:n;
fprintf('Valores de la función:\n\t1-Utilizar una función.\n\t2-Ingresar valores\n');
opc=input('Opción: ');
switch opc
    case 1
        f = input('Introduzca la función f: ');
        for i=1:length(X)
            FUN(i)= subs(f,X(i)); 
            FDerivadas(i)=subs(diff(f,x),X(i));
        end
        bandera = 0;
    case 2
        FUN = input('Ingrese los valores de las f(x) [f(x1) f(x2) ... f(xn)]: ');
        FDerivadas = input('Ingrese los valores de las f''(x) [f''(x1) f''(x2) ... f''(xn)]: ');
        bandera = -1;
end
%RECORDANDO
fprintf('------------------------------------------- DATOS -------------------------------------------\n');
fprintf('x = %9.15f\n---------------------------------------------------------------------------------------------\n',double(xbuscada));
for i=1:length(X)
    fprintf('x%d = %9.15f    ',double(i-1),double(X(i)));
    fprintf('f(x%d) = %9.15f    ',double(i-1),double(FUN(i)));
    fprintf('f''(x%d) = %9.15f\n',double(i-1),double(FDerivadas(i)));
end

fprintf('---------------------------------------------------------------------------------------------\n');
fprintf('                        Grado del Polinomio: Grado %d\n---------------------------------------------------------------------------------------------\n',double(2*length(X)-1))


%Haciendo las L y L'
fprintf('CONSTRUCCIÓN DE ECUACIONES Ln,j(X) y Ln,j''(Xj)\n');
L=1:n;
LDerivadas = 1:n;
for i=1:length(X)
    fprintf('L%d,%d(x) = ',double(length(X)-1),double(i-1));
    la =1;
    lb=1;
    LA=1;
    for j=1:length(X)
        if X(i) ~= X(j)
            LA= LA*(x - double(X(j)));
            fprintf('(x - (%3.15f))',double(X(j)));
            la = la*(xbuscada-X(j));
        end
    end
    fprintf('/');
    for j=1:length(X)
        if X(i) ~= X(j)
            fprintf('(%f - (%3.15f))',double(X(i)),double(X(j)));
            lb = lb*(X(i)-X(j));
        end
    end
    fprintf('\n');
    L(i)=la/lb;
    ld = diff(LA,x);
    LDerivadas(i) = subs(ld/lb,X(i));
    fprintf('L%d,%d''(x) = ',double(length(X)-1),double(i-1));
    disp(ld/lb)
    
end
fprintf('---------------------------------------------------------------------------------------------\n');
%IMPRIMIENDO RESULTADOS DE L
fprintf('IMPRIMIENDO EL VALOR DE LAS ECUACIONES Ln,j(X) y Ln,j''(X)\n');
for i=1:length(L)
    fprintf('L%d,%d(%3.15f) = %9.15f           ',double(length(X)-1),double(i-1),double(xbuscada),double(L(i)));
    fprintf('L%d,%d''(%3.15f) = %9.15f\n',double(length(X)-1),double(i-1),double(X(i)),double(LDerivadas(i)));
end
fprintf('---------------------------------------------------------------------------------------------\n');
%HACIENDO LA H Y H^
H = 1:n;
HA = 1:n;
fprintf('VALORES DE Hn,j y H^n,j\n');
for i= 1:length(L)
    l2= (L(i).^2);
    H(i)= (1-2*(xbuscada-X(i))*LDerivadas(i)).*l2;
    HA(i) = (xbuscada-(X(i)))*((L(i))^(2));
    fprintf('H%d,%d(x) = [1-2(x-(%9.15f))(%9.15f)][(%9.15f)^(2)]\n',double(length(X)-1),double(i-1),double(X(i)),double(LDerivadas(i)),double(L(i)));
    fprintf('H%d,%d(%3.15f) = %9.15f\n',double(length(X)-1),double(i-1),double(xbuscada),double(H(i)));
    fprintf('H^%d,%d(x) = (x-(%9.15f))(%9.15f)^(2)\n',double(length(X)-1),double(i-1),double(X(i)),double(L(i)));
    fprintf('H^%d,%d(%3.15f) = %9.15f\n\n',double(length(X)-1),double(i-1),double(xbuscada),double(HA(i)));
end
fprintf('---------------------------------------------------------------------------------------------\n');    
%POLINOMIO H
fprintf('CONSTRUYENDO EL POLINOMIO H2*n+1(x)\n');
PolH=0;
fprintf('H%d(x) = ', double(length(X)*2-1));
for i=1:length(X)
    if i==1
        fprintf('f(x%d)*H%d,%d(x)',double(i-1),double(length(X)-1),double(i-1));
    else
        fprintf('+ f(x%d)*H%d,%d(x)',double(i-1),double(length(X)-1),double(i-1));
    end
end
for i=1:length(X)
    fprintf('+ f''(x%d)*H^%d,%d(x)',double(i-1),double(length(X)-1),double(i-1));
end
fprintf('\n');
fprintf('H%d(%9.15f) = ', double(length(X)*2-1),double(xbuscada));
for i=1:length(X)
    if i==1
        fprintf('(%9.15f)*(%9.15f)',double(FUN(i)),double(H(i)));
    else
        fprintf('+ (%9.15f)*(%9.15f)',double(FUN(i)),double(H(i)));
    end
    PolH = PolH + (FUN(i))*(H(i));
end
for i=1:length(X)
        fprintf('+ (%9.15f)*(%9.15f)',double(FDerivadas(i)),double(HA(i)));
        PolH = PolH + (FDerivadas(i))*(HA(i));
end
fprintf('\n');
fprintf('H%d(%9.15f) = %9.15f', double(length(X)*2-1),double(xbuscada),double(PolH));

fprintf('\n-------------------------------------------------------------------------------------------------------------\n');
fprintf('RESULTADOS\n');
if bandera == 0
    fprintf('El valor aproximado es f(%9.15f) = H%d(%9.15f) = %9.15f\n',double(xbuscada),double(2*length(X)-1),double(xbuscada),double(PolH));
    ValorExacto = subs(f,xbuscada);
    fprintf('El valor exacto es f(%9.15f) = %9.15f\n',double(xbuscada),double(ValorExacto));
    Error = abs(ValorExacto-PolH);
    fprintf('El error es |Valor Exacto - H%d(%9.15f)| = %9.15e\n',double(2*length(X)-1),double(xbuscada),double(Error));
else
    fprintf('El valor aproximado es f(%9.15f) = H%d(%9.15f) = %9.15f\n',double(xbuscada),double(2*length(X)-1),double(xbuscada),double(PolH));
end

clc
clear all
syms x
disp('MÉTODO DEL POLINOMIO DE LAGRANGE')
xbuscada=input('Ingrese valor al que desea aproximar: ');
X = input('Ingrese los valores de las x  [x1 x2 ... xn]: ');
n = size(X) -1;

%FUNCION
FUN = 1:n;
fprintf('Valores de la función:\n\t1-Utilizar una función.\n\t2-Ingresar valores\n');
opc=input('Opción: ');
switch opc
    case 1
        f = input('Introduzca la función f: ');
        for i=1:length(X)
            FUN(i)= subs(f,X(i)); 
        end
        bandera = 0;
    case 2
        FUN = input('Ingrese los valores de las f(x) [f(x1) f(x2) ... f(xn)]: ');
        bandera = -1;
end

%RECORDANDO
fprintf('------------------------------------------- DATOS -------------------------------------------\n');
fprintf('x = %9.15f\n---------------------------------------------------------------------------------------------\n',double(xbuscada));
for i=1:length(X)
    fprintf('x%d = %9.15f    ',double(i-1),double(X(i)));
    fprintf('f(x%d) = %9.15f\n',double(i-1),double(FUN(i)));
end
fprintf('---------------------------------------------------------------------------------------------\n');
fprintf('Grado del Polinomio: Grado %d\n---------------------------------------------------------------------------------------------\n',double(length(X)-1))
%Haciendo las L
fprintf('CONSTRUCCIÓN DE ECUACIONES L\n');
L=1:n;
for i=1:length(X)
    fprintf('L%d = ',double(i-1));
    la =1;
    lb=1;
    for j=1:length(X)
        if X(i) ~= X(j)
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
end
fprintf('---------------------------------------------------------------------------------------------\n');
%IMPRIMIENDO RESULTADOS DE L
fprintf('IMPRIMIENDO EL VALOR DE LAS ECUACIONES L(X)\n');
for i=1:length(L)
    fprintf('L%d(%3.15f) = %9.15f\n',double(i-1),double(xbuscada),double(L(i)));
end
%POLINOMIO
P=0;
fprintf('---------------------------------------------------------------------------------------------\n');
fprintf('CONSTRUYENDO EL POLINOMIO Pn(x)\n');
fprintf('P%d(x) = ',double(length(X)-1))
for i=1:length(L)
    if i~=length(L)
         fprintf('f(x%d)*L%d(x) + ',double(i-1),double(i-1))
    else
        fprintf('f(x%d)*L%d(x)',double(i-1),double(i-1))
    end
end
fprintf('\n');
fprintf('P%d(%9.15f) = ',double(length(X)-1),double(xbuscada))
for i=1:length(L)
    if i~=length(L)
         fprintf('(%9.15f)*(%9.15f) + ',double(FUN(i)),double(L(i)))
    else
        fprintf('(%9.15f)*(%9.15f)',double(FUN(i)),double(L(i)))
    end
    P = P + (FUN(i)*L(i));
end
fprintf('\n');
fprintf('P%d(%9.15f) = %9.15f\n',double(length(X)-1),double(xbuscada),double(P))
fprintf('---------------------------------------------------------------------------------------------\n');
fprintf('RESULTADOS\n')
if bandera ==0
    fprintf('El valor aproximado es P%d(%9.15f) = %9.15f\n',double(length(X)-1),double(xbuscada), double(P));
    fprintf('El valor exacto es f(%9.15f) = %9.15f\n',double(xbuscada), double(subs(f,xbuscada)));
    error = abs((subs(f,xbuscada))- P);
    fprintf('El error es |Valor Exacto - Valor Aproximado| = %2.15e\n', double(error));
else
    fprintf('El valor aproximado es P%d(%9.15f) = %9.15f\n',double(length(X)-1),double(xbuscada), double(P));
end




    

clc
clear all
syms x
disp('MÉTODO DE NEVILLE')
xbuscada=input('Ingrese valor al que desea aproximar: ');
X = input('Ingrese los valores de las x [x1 x2 ... xn]: ');
n = length(X);

%FUNCION
Q0 =1:n;
Q = zeros(n,n);
fprintf('Valores de la función:\n\t1-Utilizar una función.\n\t2-Ingresar valores\n');
opc=input('Opción: ');
switch opc
    case 1
        f = input('Introduzca la función f(x): ');
        for i=1:length(X)
            Q0(i)= subs(f,X(i)); 
        end
        bandera = 0;
    case 2
        Q0 = input('Ingrese los valores de las f(x) [f(x1) f(x2) ... f(xn)]: ');
        bandera = -1;
end
Q(:,1)= Q0;


%RECORDANDO
fprintf('------------------------------------------- DATOS -------------------------------------------\n');
fprintf('x = %9.15f\n---------------------------------------------------------------------------------------------\n',double(xbuscada));
for i=1:length(X)
    fprintf('x%d = %9.15f    ',double(i-1),double(X(i)));
    fprintf('f(x%d) = Q(%d0) = %9.15f\n',double(i-1),double(i-1),double(Q(i,1)));
end
fprintf('---------------------------------------------------------------------------------------------\n')
fprintf('Grado del Polinomio: Grado %d\n---------------------------------------------------------------------------------------------\n',double(n-1))

%Haciendo Ecuaciones Q
fprintf('IMPRIMIENDO EL VALOR DE LAS ECUACIONES Q\n');
for j=2:n
    for i =j:n
        fprintf('Q%d%d = ((x - x%d)(Q%d%d) - (x - x%d)(Q%d%d))/(x%d-x%d) = ',double(i-1),double(j-1),double(i-j),double(i-1),double(j-1-1),double(i-1),double(i-1-1),double(j-1-1),double(i-1),double(i-j));
        Q(i,j)= ((xbuscada-X(i-j+1))*Q(i,j-1)-(xbuscada-X(i))*Q(i-1,j-1))/(X(i)-X(i-j+1));
        fprintf('%9.15f\n',double(Q(i,j)));
    end
end
%Matriz
fprintf('----------------------------------------------------- MATRIZ -----------------------------------------------------\n');
format long
disp(Q)
%Valor Exacto y Error
fprintf('-------------------------------------------------------------------------------------------------------------\n');
fprintf('RESULTADOS\n');
if bandera == 0
    fprintf('Valor aproximado Q(%d%d) = %9.15f\n',double(length(Q)-1),double(length(Q)-1),double(Q(n,n)));
    ValorExacto = subs(f,xbuscada);
    fprintf('Valor exacto f(%9.15f) = %9.15f\n',double(xbuscada),double(ValorExacto));
    Error = abs(ValorExacto-Q(n,n));
    fprintf('El error es |Valor Exacto - Q(%d%d)| = %9.15e\n',double(n-1), double(n-1),double(Error));
else
    fprintf('Valor aproximado Q(%d%d) = %9.15f\n',double(length(Q)-1),double(length(Q)-1),double(Q(n,n)));
end
        
clc
clear all
syms x
disp('MÉTODO DE DIFERENCIAS DIVIDIDAS')
xbuscada = input('Ingrese valor al que desea aproximar: ');
X = input('Ingrese los valores de las x [x1 x2 ... xn]: ');
n = length(X);

%FUNCION
D0 =1:n;
D = zeros(n,n);
fprintf('Valores de la función:\n\t1-Utilizar una función.\n\t2-Ingresar valores\n');
opc=input('Opción: ');
switch opc
    case 1
        f = input('Introduzca la función f(x): ');
        for i=1:length(X)
            D0(i)= subs(f,X(i)); 
        end
        bandera = 0;
    case 2
        D0 = input('Ingrese los valores de las f(x) [f(x1) f(x2) ... f(xn)]: ');
        bandera = -1;
end
D(:,1)= D0;
fprintf('\n')

%RECORDANDO
fprintf('-------------------------------------------------------------------------------------------------------------\n');
fprintf('DATOS\n');
fprintf('x = %9.15f\n-----------------------------------------------------------------\n',double(xbuscada));
for i=1:length(X)
    
    fprintf('x%d = %9.15f      ',double(i-1),double(X(i)));
    fprintf('f(x%d) = %9.15f\n',double(i-1),double(D(i,1)));
end
fprintf('-------------------------------------------------------------------------------------------------------------\n');
fprintf('Grado del Polinomio: Grado %d\n-------------------------------------------------------------------------------------------------------------\n\n',double(n-1))

%FORMULAS DE LAS DIFERENCIAS
fprintf('OBTENIENDO LAS DIFERENCIAS DIVIDIDAS\n')
for j=2:n
    fprintf('- Columna %d de la matriz de Diferencias Divididas\n',double(j))
    for i=j:n
        fprintf('(%9.15f - (%9.15f))/(%9.15f - (%9.15f)) =', double(D(i,j-1)), double(D(i-1,j-1)), double(X(i)), double(X(i-j+1)));
        D(i,j) = (D(i,j-1)-D(i-1,j-1))/(X(i)-X(i-j+1));
        fprintf('%9.15f\n',double(D(i,j)));
    end
end

%MATRIZ
fprintf('\n-------------------------------------------------------------------------------------------------------------\n');
fprintf('MATRIZ TRIANGULAR INVERSA\n')
format long
disp(D)

%POLINOMIO
fprintf('-------------------------------------------------------------------------------------------------------------\n');
fprintf('POLINOMIO P%d(x):\n',double(n-1));
%IMPRIMIENDO SIMBOLICAMENTE
fprintf('P%d(x) = A0 + ',double(n-1));
for i=1:n-1
    fprintf('A%d', double(i));
    for j=0:i-1
        fprintf('(x-x%d)',double(j));
    end
    if i ~= n-1
        fprintf(' + ')
    end
end
fprintf('\n')
%IMPRIMIENDO CON NÚMEROS
fprintf('P%d(x) = %9.15f + ',double(n-1),double(D(1,1)));
for i=2:n
    fprintf('(%9.15f)', double(D(i,i)));
    for j=1:i-1
        fprintf('(x - (%9.15f))',double(X(j)));
    end
    if i ~= n
        fprintf(' + ')
    end
end
fprintf('\n')
%CALCULOS
Poli = D(1,1);
for i=2:n
    P = D(i,i);
    M=1;
    for j=1:i-1
        M = M*(xbuscada - X(j));
    end
    Poli = Poli + P*M;
end
%Valor Exacto y Error
fprintf('\n-------------------------------------------------------------------------------------------------------------\n');
fprintf('RESULTADOS\n');
if bandera == 0
    fprintf('El valor aproximado es P%d(%9.15f) = %9.15f\n',double(n-1),double(xbuscada),double(Poli));
    ValorExacto = subs(f,xbuscada);
    fprintf('El valor exacto es f(%9.15f) = %9.15f\n',double(xbuscada),double(ValorExacto));
    Error = abs(ValorExacto-Poli);
    fprintf('El error es |Valor Exacto - P%d(%9.15f)| = %9.15e\n',double(n-1),double(xbuscada),double(Error));
else
    fprintf('El valor aproximado es f(%9.15f) = P%d(%9.15f) = %9.15f\n',double(xbuscada),double(n-1),double(xbuscada),double(Poli));
end
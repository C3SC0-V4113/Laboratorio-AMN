clc
clear all
syms x
disp('MÉTODO DE HERMITE CON DIFERENCIAS DIVIDIDAS')
xbuscada = input('Ingrese valor al que desea aproximar: ');
X = input('Ingrese los valores de las x [x1 x2 ... xn]: ');
L = input('Ingrese valor de la Inductancia: ');
C = input('Ingrese valor de la Capacitancia: ');
R = input('Ingrese valor de la Resistencia: ');
q0 = input('Ingrese valor de la Carga Inicial: ');
n = length(X);
%Duplicando
Z = 1:2*n;
k=1;
i=1;
while(k<=2*n)
    Z(k) = X(i);
    Z(k+1)=X(i);
    k=k+2;
    i=i+1;
end 

%FUNCION
D0 =1:2*n;
Derivadas =1:2*n;
D = zeros(2*n,2*n);
fprintf('Valores de la función y su derivada:\n\t1-Utilizar una función.\n\t2-Ingresar valores\n');
opc=input('Opción: ');
switch opc
    case 1
        f = input('Introduzca la función f(x): ');
        for i=1:length(Z)
            D0(i)= subs(f,Z(i)); 
        end
        fdiff = diff(f,x); 
        for i=1:length(Z)
            Derivadas(i)= subs(fdiff,Z(i)); 
        end
        bandera = 0;
    case 2
        V = input('Ingrese los valores de las f(x) [f(x1) f(x2) ... f(xn)]: ');
        bandera = -1;
        k=1;
        i=1;
        while(k<=2*n)
            D0(k) = V(i);
            D0(k+1)=V(i);
            k=k+2;
            i=i+1;
        end 
        Vdiff = input('Ingrese los valores de las f''(x) [f''(x1) f''(x2) ... f''(xn)]: ');
        bandera = -1;
        k=1;
        i=1;
        while(k<=2*n)
            Derivadas(k) = Vdiff(i);
            Derivadas(k+1)=Vdiff(i);
            k=k+2;
            i=i+1;
        end
end
D(:,1)= D0;
n= length(Z);
%RECORDANDO
fprintf('-------------------------------------------------------------------------------------------------------------\n');
fprintf('DATOS\n');
fprintf('x = %9.15f\n-----------------------------------------------------------------\n',double(xbuscada));
for i=1:length(Z)
    
    fprintf('Z%d = %9.15f      ',double(i-1),double(Z(i)));
    fprintf('f(Z%d) = %9.15f      ',double(i-1),double(D(i,1)));
    fprintf('f''(Z%d) = %9.15f\n',double(i-1),double(Derivadas(i)));
end
fprintf('-------------------------------------------------------------------------------------------------------------\n');
fprintf('Grado del Polinomio: Grado %d\n---------------------------------------------------------\n\n',double(n-1))

%FORMULAS DE LAS DIFERENCIAS
fprintf('OBTENIENDO LAS DIFERENCIAS DIVIDIDAS\n')
for j=2:n
    fprintf('- Columna %d de la matriz de Diferencias Divididas\n',double(j))
    for i=j:n
        if Z(i) == Z(i-j+1) && j==2
            fprintf('f[Z%d,Z%d] = ',double((i-j+1-1)),double((i-1)));
            D(i,j) = Derivadas(i);
            fprintf('%9.15f\n',double(D(i,j)));
        else
            fprintf('(%9.15f - (%9.15f))/(%9.15f - (%9.15f)) =', double(D(i,j-1)), double(D(i-1,j-1)), double(Z(i)), double(Z(i-j+1)));
            D(i,j) = (D(i,j-1)-D(i-1,j-1))/(Z(i)-Z(i-j+1));
            fprintf('%9.15f\n',double(D(i,j)));
        end
    end
end

%MATRIZ
fprintf('\n-------------------------------------------------------------------------------------------------------------\n');
fprintf('MATRIZ TRIANGULAR INVERSA\n')
format long
disp(D)

%POLINOMIO
fprintf('-------------------------------------------------------------------------------------------------------------\n');
fprintf('POLINOMIO H%d(x):\n',double(n-1));
%IMPRIMIENDO SIMBOLICAMENTE
fprintf('H%d(x) = A0 + ',double(n-1));
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
fprintf('H%d(x) = %9.15f + ',double(n-1),double(D(1,1)));
for i=2:n
    fprintf('(%9.15f)', double(D(i,i)));
    for j=1:i-1
        fprintf('(x - (%9.15f))',double(Z(j)));
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
        M = M*(xbuscada - Z(j));
    end
    Poli = Poli + P*M;
end
%Valor Exacto y Error
fprintf('\n-------------------------------------------------------------------------------------------------------------\n');
fprintf('RESULTADOS\n');
if bandera == 0
    fprintf('El valor aproximado es f(%9.15f) = H%d(%9.15f) = %9.15f\n',double(xbuscada),double(n-1),double(xbuscada),double(Poli));
    ValorExacto = subs(f,xbuscada);
    fprintf('El valor exacto es f(%9.15f) = %9.15f\n',double(xbuscada),double(ValorExacto));
    Error = abs(ValorExacto-Poli);
    fprintf('El error es |Valor Exacto - H%d(%9.15f)| = %9.15e\n',double(n-1),double(xbuscada),double(Error));
else
    fprintf('El valor aproximado es f(%9.15f) = H%d(%9.15f) = %9.15f\n',double(xbuscada),double(n-1),double(xbuscada),double(Poli));
end
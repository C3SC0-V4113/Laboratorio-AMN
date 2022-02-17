fprintf('\n');
fprintf('                  ------------------------------------------------------\n')
fprintf('                                    MÉTODO DE LAGRANGE                  \n')
fprintf('                  ------------------------------------------------------\n')
fprintf('\n');
syms x
val=input('Valor a interpolar x: ');
dato=input('Datos [X0 X1 X2 ... Xn]: ');
t=length(dato);
fprintf('Valores de la función:\n\t1-Utilizar una función.\n\t2-Ingresar valores\n');
opc=input('Opción: ');
switch opc
    case 1
        f=input('Función f(x): ');
        fun=zeros(1,t);
        fprintf('Valores de F(x): ');
        for i=1:t
            fun(i)=double(subs(f,dato(i)));
            fprintf('%f,', double(fun(i)));
        end
    case 2
        fun=input('Valores F(x) [F(X0) F(X1) ... F(Xn)]: ');
end
fprintf('\nGrado del Polinomio: %2.0f\n',double(t-1));
fprintf('\nObteniendo las Funciones de Lagrange\n');
L=zeros(1,t);
for i=1:t
    num=1;
    fprintf('\t   ')
    for j=1:t        
        if j~=i
            fprintf('(x-%3.3f)',double(dato(j)));
            num=num*(val-dato(j));
        end
    end
    fprintf('\nL%1.0f(x)=',double(i-1));
    for j=1:t
        fprintf('------------');
    end
    fprintf('\n\t   ');
    den=1;
    for j=1:t 
        if j~=i
            fprintf('(%3.3f-%3.3f)',double(dato(i)),double(dato(j)));
            den=den*(dato(i)-dato(j));
        end
    end
    L(i)=num/den;
    fprintf('\nL%1.0f(%.3f)=%.15f\n\n',double(i-1),double(val),double(L(i)));
end
fprintf('Polinomio:\n');
fprintf('P%1.0f(x)=',double(t-1));
pol=0;
for i=1:t
    fprintf('L%1.0f(x)*F(X%1.0f)',double(i-1),double(i-1));
    pol=pol+(L(i)*fun(i));
    if i==t
        fprintf('\n');
    else
        fprintf(' + ');
    end
end
fprintf('P%1.0f(%3.3f)=',double(t-1),double(val));
for i=1:t
    fprintf('(%.15f)*(%.15f)',double(L(i)),double(fun(i)));
    if i==t
        fprintf('\n');
    else
        fprintf(' + ');
    end
end
fprintf('P%1.0f(%3.3f)= %.15f\n\n',double(t-1),double(val),double(pol));
if opc==1
    fprintf('Valor exacto de la función: %.15f',double(subs(f,val)));
    fprintf('\nError: %e\n\n',abs(pol-double(subs(f,val))));
end
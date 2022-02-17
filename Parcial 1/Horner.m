%MÉTODO DE HORNER
%Este método establece el uso de un polinomio P(x) de la forma P(x)=(x-xo)*q(x)+bo donde 
%q(x) es un polinomio de grado n-1 con respecto del grado de P(x), el método de iteración
%lo podemos expresar de la siguiente manera:
%xn=xo-P(xo)/q(xo)
%Emplee el método de horner para obtener la raíz del polinomio P(x)=(x^4)+(2(x^2))+x-3
%con una precisión de 10^(-7) y utilize xo=0.9 
clc
clear all
fprintf('\n')
fprintf('                                     ----------------\n')
fprintf('                                     MÉTODO DE HORNER\n')
fprintf('                                     ----------------\n')
fprintf('\n')
syms x
xo=input('Introduzca el valor xo: ');
error=input('Introduzca el valor de la precisión: ');
mg=error+1;  
m=input('Introduzca el grado del polinomio de f(x): ');
x5=m;
n=m+1;
for i=1:n,
   fprintf('Introduzca el %1.0f ',i);
   c(i)=input('coeficiente: ');
   c2(i)=c(i);
end
fprintf('\n\n')
r(1)=c(1);

for i=1:(n-1),
    r(i+1)=(r(i)*xo)+c(i+1);
end
for i=1:n,
    fprintf('%2.9f ',c(i));
end
fprintf(' | %2.9f \n',xo);
for i=1:(n),
    fprintf('_____________');
end

fprintf('\n');

for i=1:n,
    fprintf('%2.9f ',r(i));
end

bop=r(n);

fprintf('\n\n\n');
m=m-1;
fprintf('\n');
n=m+1;
for i=1:n,
   c(i)=r(i);
end
fprintf('\n\n')
r(1)=c(1);
for i=1:(n-1),
    r(i+1)=(r(i)*xo)+c(i+1);
end
for i=1:n,
    fprintf('%2.9f ',c(i));
end
fprintf(' | %2.9f \n',xo);
for i=1:(n),
    fprintf('_____________');
end

fprintf('\n');

for i=1:n,
    fprintf('%2.9f ',r(i));
end

boq=r(n);

xn= xo-(bop/boq);
fprintf('\n\n bop(x)= %2.9f   boq(x)= %2.9f       xn= %2.9f\n\n',bop,boq,xn);%Valores generados
mg=xn-xo;
Xo=xn;
fprintf('El valor del error es: %e\n', abs(mg));
fprintf('El valor de Xo es: %10.9f\n',Xo);

while abs(mg) > error
xo=xn;   
m=x5;
fprintf('\n')
n=m+1;
for i=1:n,
   c(i)=c2(i);
end
fprintf('\n\n')
r(1)=c(1);

for i=1:(n-1),
    r(i+1)=(r(i)*xo)+c(i+1);
end
for i=1:n,
    fprintf('%2.9f ',c(i));
end
fprintf(' | %2.9f \n',xo);
for i=1:(n),
    fprintf('_____________');
end

fprintf('\n');

for i=1:n,
    fprintf('%2.9f ',r(i));
end

bop=r(n);

fprintf('\n\n\n');
m=m-1;
fprintf('\n');
n=m+1;
for i=1:n,
   c(i)=r(i);
end
fprintf('\n\n')
r(1)=c(1);
for i=1:(n-1),
    r(i+1)=(r(i)*xo)+c(i+1);
end
for i=1:n,
    fprintf('%2.9f ',c(i));
end

fprintf(' | %2.9f \n',xo);

for i=1:(n),
    fprintf('_____________');
end

fprintf('\n');

for i=1:n,
    fprintf('%2.9f ',r(i));
end

boq=r(n);

xn= xo-(bop/boq);
fprintf('\n\n bop(x)= %2.9f   boq(x)= %2.9f       xn= %2.9f\n\n',bop,boq,xn);%Valores generados
mg=xn-xo;
xo=xn;
fprintf('El valor del error es: %e\n', abs(mg));
fprintf('El valor de Xo es: %10.9f\n',xo);
end
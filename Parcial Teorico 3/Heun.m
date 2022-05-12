%MÉTODO DE HEUN

% - Introduzca la ecuación diferencial        : 'Dy=y-(x^2)+1'
% - Introduzca la condición y(a)=b            : 'y(0)=0.5'
% - Introduzca la función de trabajo          : y-(x^2)+1
% - Introduzca la condición inicial           : 0.5
% - Introduzca el valor de a                  : 0
% - Introduzca el valor de b                  : 1
% - Introduzca el tamaño de paso h            : 0.1

fprintf('\n');
clear all
clc
fprintf('                                     --------------\n')
fprintf('                                     MÉTODO DE HEUN\n')
fprintf('                                     --------------\n')
fprintf('\n');
syms x y
d=input(' - Introduzca la ecuación diferencial        : ');
n=input(' - Introduzca la condición y(a)=b            : ');
f1=input(' - Introduzca la función de trabajo          : ');
ya=input(' - Introduzca la condición inicial           : ');
a=input(' - Introduzca el valor de a                  : ');
b=input(' - Introduzca el valor de b                  : ');
h=input(' - Introduzca el tamaño de paso h            : ');

fprintf('\n\n');

fprintf(' - La solución de la ecuación diferencial es : \n\n\n');

m = dsolve(d,n,'x');
pretty(m);

fprintf('\n\n\n');

%Condiciones para el funcionamiento de los lazos FOR
f=f1;
w(1)=ya;
i=0;
t(1)=a;
v(1)=a;
d=0;
c=0;
g=0;

%Este for obtiene y guarda todos los valores de t
%También se utiliza para evaluar la ecuación diferencial
for p=a:h:b
   d=1+d;
   t(d)=p;
   v(d)=subs(m,p);
end

%Este for se usa para contabilizar las iteraciones
for s=c:1:(d-1)
   g=1+g;
   k(g)=(g-1);
end

k3=k(end);
   
%Este for obtiene los valores aproximados de solución
fprintf('-------------------------------------------------------------------------------------------------------');
fprintf('\n');
fprintf('                                      FÓRMULAS DE CADA ITERACIÓN');
fprintf('\n');
fprintf('-------------------------------------------------------------------------------------------------------');
fprintf('\n\n');
fprintf('- w0 = %1.15f ',ya);
fprintf('\n');

for j=a:h:(b-h)
   i=1+i;
   w(i+1)=w(i)+((h/4)*(subs(f,{x,y},{t(i),w(i)})))+(((3/4)*h)*(subs(f,{x,y},{(t(i)+((2/3)*h)),(w(i)+(((2/3)*h)*(subs(f,{x,y},{t(i),w(i)}))))})));
   fprintf('\n');
   fprintf('- w%1.0f = w%1.0f + h/4 f(t%1.0f,w%1.0f) + 3/4 h f(t%1.0f + 2/3 h,w%1.0f + 2/3 h f(t%1.0f,w%1.0f))',i,i-1,i-1,i-1,i-1,i-1,i-1,i-1);
   fprintf('\n');
   fprintf('- w%1.0f = w%1.0f + %1.5f f(%1.9f,w%1.0f) + %1.5f f(%1.9f + %1.5f,w%1.0f + %1.5f f(%1.9f,w%1.0f))',i,i-1,h/4,t(i),i-1,(3/4)*h,t(i),(2/3)*h,i-1,(2/3)*h,t(i),i-1);
   fprintf('\n');
end

fprintf('\n');
fprintf('-------------------------------------------------------------------------------------------------------');
fprintf('\n');

%Presentación de los datos 
fprintf('\n\n');

fprintf('              i             ti              wi+1                  y(t)');   
fprintf('\n\n');

for k1=0:k3
   k2=k1+1;
   fprintf('\n');
   fprintf('              %1.0f        %10.15f        %10.15f         %10.15f',k(k2),t(k2),w(k2),v(k2));
   fprintf('\n');                                      
end

fprintf('\n');  
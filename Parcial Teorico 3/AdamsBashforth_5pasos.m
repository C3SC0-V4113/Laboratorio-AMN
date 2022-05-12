%MÉTODO EXPLÍCITO DE ADAMS-BASHFORTH DE CINCO PASOS

% - Introduzca la ecuación diferencial        : 'Dy=y-(x^2)+1'
% - Introduzca la condición y(a)=b            : 'y(0)=0.5'
% - Introduzca la función de trabajo          : y-(x^2)+1
% - Introduzca el valor de a                  : 0
% - Introduzca el valor de b                  : 1
% - Introduzca el tamaño de paso h            : 0.1
% - Introduzca la condición inicial           : 0.5

fprintf('\n');
clear all
clc
fprintf('                  -----------------------------------------------------\n')
fprintf('                  MÉTODO DE EXPLÍCITO DE ADAMS BASHFORTH DE CINCO PASOS\n')
fprintf('                  -----------------------------------------------------\n')
fprintf('\n');
syms x y
d=input(' - Introduzca la ecuación diferencial        : ');
n=input(' - Introduzca la condición y(a)=b            : ');
f1=input(' - Introduzca la función de trabajo          : ');
a=input(' - Introduzca el valor de a                  : ');
b=input(' - Introduzca el valor de b                  : ');
h=input(' - Introduzca el tamaño de paso h            : ');
ya=input(' - Introduzca la condición inicial           : ');

tx(1)=a;
vx(1)=a;
ax=a;
bx=b;
hx=h;
dx=0;

mx = dsolve(d,n,'x');

for px=ax:hx:bx
   dx=1+dx;
   tx(dx)=px;
   vx(dx)=subs(mx,px);
end

yb=subs(mx,tx(2));
yc=subs(mx,tx(3));
yd=subs(mx,tx(4));
ye=subs(mx,tx(5));

fprintf('\n\n');

fprintf(' - La solución de la ecuación diferencial es : \n\n\n');

m = dsolve(d,n,'x');
pretty(m);

fprintf('\n\n\n');

%Condiciones para el funcionamiento de los lazos FOR
f=f1;
w(1)=ya;
w(2)=yb;
w(3)=yc;
w(4)=yd;
w(5)=ye;
i=4;
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

a=a+(5*h);
k3=k(end);

fprintf('---------------------------------------------------------------------------------------------------------------------------------------------------');
fprintf('\n');
fprintf('                                                            FÓRMULAS DE CADA ITERACIÓN');
fprintf('\n');
fprintf('---------------------------------------------------------------------------------------------------------------------------------------------------');
fprintf('\n\n');
fprintf('- w0 = %1.15f ',ya);
fprintf('\n\n');
fprintf('- w1 = %1.15f ',yb);
fprintf('\n\n');
fprintf('- w2 = %1.15f ',yc);
fprintf('\n\n');
fprintf('- w3 = %1.15f ',yd);
fprintf('\n');
fprintf('- w4 = %1.15f ',ye);
fprintf('\n');

%Este for obtiene los valores aproximados de solución
for j=a:h:b
   i=1+i;
   w(i+1)=w(i)+((h/720)*((1901*(subs(f,{x,y},{t(i),w(i)})))-(2774*(subs(f,{x,y},{t(i-1),w(i-1)})))+(2616*(subs(f,{x,y},{t(i-2),w(i-2)})))-(1274*(subs(f,{x,y},{t(i-3),w(i-3)})))+(251*(subs(f,{x,y},{t(i-4),w(i-4)})))));   
   fprintf('\n');
   fprintf('- w%1.0f = w%1.0f + h/720 [1901*f(t%1.0f,w%1.0f) - 2774*f(t%1.0f,w%1.0f) + 2616*f(t%1.0f,w%1.0f) - 1274*f(t%1.0f,w%1.0f) + 251*f(t%1.0f,w%1.0f)]',i,i-1,i-1,i-1,i-2,i-2,i-3,i-3,i-4,i-4,i-5,i-5);
   fprintf('\n');
   fprintf('- w%1.0f = w%1.0f + %1.15f [1901*f(%1.15f,w%1.0f) - 2774*f(%1.15f,w%1.0f) + 2616*f(%1.9f,w%1.0f) - 1274*f(%1.15f,w%1.0f) + 251*f(%1.15f,w%1.0f)]',i,i-1,h/12,t(i),i-1,t(i-1),i-2,t(i-2),i-3,t(i-3),i-4,t(i-4),i-5);
   fprintf('\n');
end

fprintf('\n');
fprintf('---------------------------------------------------------------------------------------------------------------------------------------------------');
fprintf('\n');

%Presentación de los datos
fprintf('\n\n');

fprintf('              i             ti                 wi                 y(t)');   

fprintf('\n\n');

for k1=0:k3
   k2=k1+1;
   fprintf('\n');
   fprintf('              %1.0f        %10.15f        %10.15f         %10.15f',k(k2),t(k2),w(k2),v(k2));
   fprintf('\n');                                      
end

fprintf('\n');
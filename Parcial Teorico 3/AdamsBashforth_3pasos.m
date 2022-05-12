%MÉTODO EXPLÍCITO DE ADAMS-BASHFORTH DE TRES PASOS

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
fprintf('                   ----------------------------------------------------\n')
fprintf('                   MÉTODO DE EXPLÍCITO DE ADAMS BASHFORTH DE TRES PASOS\n')
fprintf('                   ----------------------------------------------------\n')
fprintf('\n');
syms x y
d=input(' - Introduzca la ecuación diferencial(x,y)   : ');
n=input(' - Introduzca la condición y(a)=b            : ');
f1=input(' - Introduzca la función de trabajo         : ');
ya=input(' - Introduzca la condición inicial          : ');
a=input(' - Introduzca el valor de a                  : ');
b=input(' - Introduzca el valor de b                  : ');
h=input(' - Introduzca el tamaño de paso h            : ');


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
i=2;
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

a=a+(3*h);
k3=k(end);

%Este for obtiene los valores aproximados de solución

fprintf('   -------------------------------------------------------------------------------------------');
fprintf('\n');
fprintf('                                   FÓRMULAS DE CADA ITERACIÓN');
fprintf('\n');
fprintf('   -------------------------------------------------------------------------------------------');
fprintf('\n\n');
fprintf('   - w0 = %1.15f ',double(ya));
fprintf('\n');
fprintf('\n\n'); 
fprintf('   - w1 = %1.15f ',double(yb));
fprintf('\n');
fprintf('\n\n');
fprintf('   - w2 = %1.15f ',double(yc));
fprintf('\n');

%Este for obtiene los valores aproximados de solución
for j=a:h:b
   i=1+i;
   w(i+1)=w(i)+((h/12)*((23*(subs(f,{x,y},{t(i),w(i)})))-(16*(subs(f,{x,y},{t(i-1),w(i-1)})))+(5*(subs(f,{x,y},{t(i-2),w(i-2)})))));   
   fprintf('\n');
   fprintf('   - w%1.0f = w%1.0f + h/12 [23*f(t%1.0f,w%1.0f) - 5*f(t%1.0f,w%1.0f) + 16*f(t%1.0f,w%1.0f)]',double(i),double(i-1),double(i-1),double(i-1),double(i-2),double(i-2),double(i-3),double(i-3));
   fprintf('\n');
   fprintf('   - w%1.0f = w%1.0f + %1.9f [23*f(%1.9f,w%1.0f) - 16*f(%1.9f,w%1.0f) + 5*f(%1.9f,w%1.0f)]',double(i),(i-1),double(h/12),double(t(i)),double(i-1),double(t(i-1)),double(i-2),double(t(i-2)),double(i-3));
   fprintf('\n');
end

fprintf('\n');
fprintf('   -------------------------------------------------------------------------------------------');
fprintf('\n');

%Presentación de los datos 
fprintf('\n\n');

fprintf('              i             ti                 wi                 y(t)');   

fprintf('\n\n');

for k1=0:k3
   k2=k1+1;
   fprintf('\n');
   fprintf('              %1.0f        %10.15f        %10.15f         %10.15f',double(k(k2)),double(t(k2)),double(w(k2)),double(v(k2)));
   fprintf('\n');                                      
end

fprintf('\n');
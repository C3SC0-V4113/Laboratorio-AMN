%M�TODO DE EULER

% - Introduzca la ecuaci�n diferencial        : 'Dy=cos(2*x)+sin(3*x)'
% - Introduzca la condici�n y(a)=b            : 'y(0)=1'
% - Introduzca la funci�n de trabajo          : cos(2*x)+sin(3*x)
% - Introduzca la condici�n inicial           : 1
% - Introduzca el valor de a                  : 0
% - Introduzca el valor de b                  : 1
% - Introduzca el tama�o de paso h            : 1/4

fprintf('\n');
clear all
clc
fprintf('                                     ---------------\n')
fprintf('                                     M�TODO DE EULER\n')
fprintf('                                     ---------------\n')
fprintf('\n');
syms x y
d=input(' - Introduzca la ecuaci�n diferencial        : ');
n=input(' - Introduzca la condici�n y(a)=b            : ');
f1=input(' - Introduzca la funci�n de trabajo          : ');
ya=input(' - Introduzca la condici�n inicial           : ');
a=input(' - Introduzca el valor de a                  : ');
b=input(' - Introduzca el valor de b                  : ');
h=input(' - Introduzca el tama�o de paso h            : ');

fprintf('\n\n');

fprintf(' - La soluci�n de la ecuaci�n diferencial es : \n\n\n');

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
%Tambi�n se utiliza para evaluar la ecuaci�n diferencial
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

%Este for obtiene los valores aproximados de soluci�n

%Tambi�n imprime en pantalla la f�rmula de la ecuaci�n para
%cada iteraci�n

fprintf('           ------------------------------------------------');
fprintf('\n');
fprintf('                      F�RMULAS DE CADA ITERACI�N');
fprintf('\n');
fprintf('           ------------------------------------------------');
fprintf('\n\n');
fprintf('            - w0 = %1.15f ',ya);
fprintf('\n');

for j=a:h:(b-h)
   i=1+i;
   w(i+1)=w(i)+(h*(subs(f,{x,y},{t(i),w(i)})));   
   fprintf('\n');
   fprintf('            - w%1.0f = w%1.0f + h f(t%1.0f,w%1.0f)',double(i),double(i-1),double(i-1),double(i-1));
   fprintf('\n');
   fprintf('            - w%1.0f = w%1.0f + %1.5f f(%1.15f,%1.15f)',double(i),double(i-1),double(h),double(t(i)),double(w(i)));
   fprintf('\n');
end

fprintf('\n');
fprintf('           ------------------------------------------------');
fprintf('\n');

fprintf('\n\n');

fprintf('      i             ti               wi+1                 y(t)');   

fprintf('\n\n');

for k1=0:k3
   k2=k1+1;
   fprintf('\n');
   fprintf('      %1.0f        %10.15f        %10.15f         %10.15f',double(k(k2)),double(t(k2)),double(w(k2)),double(v(k2)));
   fprintf('\n');                                      
end

fprintf('\n');
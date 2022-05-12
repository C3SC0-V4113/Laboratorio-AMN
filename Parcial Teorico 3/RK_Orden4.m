%MÉTODO DE RUNGE-KUTTA DE ORDEN CUATRO

%EN TERMINOS DE T Y

% - Introduzca la ecuación diferencial        : 'Dy=y-(t^2)+1'
% - Introduzca la condición y(a)=b            : 'y(0)=0.5'
% - Introduzca la función de trabajo          : y-(t^2)+1
% - Introduzca la condición inicial           : 0.5
% - Introduzca el valor de a                  : 0
% - Introduzca el valor de b                  : 1
% - Introduzca el tamaño de paso h            : 0.1

clc
clear all
disp('---------------------------------------------------------------------------');
disp('Método de RUNGE-KUTTA de orden 4');
disp('---------------------------------------------------------------------------');
fprintf('\n')
syms t y 

d=input(' - Ingrese la ecuación diferencial en (t,y): ');
n=input(' - Ingrese la condición y(a)=b: ');
f1=input(' - Ingrese la función de trabajo: ');
ya=input(' - Ingrese el valor de la condicion: ');
a=input(' - Ingrese el valor de a: ');
b=input(' - Ingrese el valor de b: ');
h=input(' - Ingrese el valor h: ');

fprintf('\n');
%fprintf(' - La solución de la ecuación diferencial es : \n');
%m = dsolve(d,n,'t');
%pretty(m);
fprintf('\n');
f=f1;
w(1)=ya;
ti=a;
n=(b-a)/h;
q(1)=a;
v(1)=a;
d=0;
c=0;
g=0;
e=1;
 disp('---------------------------------------------------------------------------');
disp('Formulas de cada iteracion');
disp('---------------------------------------------------------------------------');
fprintf('\n') 
fprintf('- w0 = %1.8f ',double(ya));
fprintf('\n\n');
for i=0:(n)

   fprintf('- Iteración: %1.0f\n',e);  
   k1=h*subs(f,{t,y},{ti,w(i+1)});
   fprintf('- K1 = h * f(t%1.0f,w%1.0f)',double(i),double(i));
   fprintf('\n');
   fprintf('- K1 = %1.9f * f(%1.9f,w%1.0f)',double(h),double(ti),double(i));
   fprintf('\n');
   fprintf('- K1 = %2.15f',double(k1))
   fprintf('\n\n');
   k2=h*subs(f,{t,y},{(ti+(h/2)),(w(i+1)+(k1/2))});
   fprintf('- K2 = h * f(t%1.0f + h/2 , w%1.0f + K1/2)',double(i),double(i));
   fprintf('\n');
   %fprintf('- K2 = %1.9f * f(%1.9f + %1.9f , w%1.0f + %1.9f)',h,ti,h/2,i,(k1)/2);
   fprintf('\n');
   fprintf('- K2 = %2.15f',double(k2))
   fprintf('\n\n');
   k3=h*subs(f,{t,y},{(ti+(h/2)),(w(i+1)+(k2/2))});
   fprintf('- K3 = h * f(t%1.0f + h/2 , w%1.0f + K2/2)',double(i),double(i));
   fprintf('\n');
  %fprintf('- K3 = %1.9f * f(%1.9f + %1.9f , w%1.0f + %1.9f)',h,ti,h/2,i,(k2)/2);
   fprintf('\n');
   fprintf('- K3 = %2.15f',double(k3))
   fprintf('\n\n');
   k4=h*subs(f,{t,y},{(ti+h),(w(i+1)+k3)});
   fprintf('- K4 = h * f(t%1.0f + h , w%1.0f + K3)',double(i),double(i));
   fprintf('\n');
  % fprintf('- K4 = %1.9f * f(%1.9f + %1.9f , w%1.0f + %1.9f)',h,ti,h,i,k3);
   fprintf('\n');
   fprintf('- K4 = %2.15f',double(k4))
   fprintf('\n\n');
   w(i+2)=w(i+1)+((1/6)*(k1+(2*k2)+(2*k3)+k4));
   fprintf('- w%1.0f = w%1.0f + (1/6)*(K1+2K2+2K3+K4)',double(i+1),double(i))
   fprintf('\n');
   fprintf('- w%1.0f = w%1.0f + (1/6)*(%1.15f+2*%1.15f+2*%1.9f+%1.15f)',double(i+1),double(i),double(k1),double(k2),double(k3),double(k4))
   fprintf('\n');
   fprintf('- w%1.0f = %2.15f',double(i+1),double(w(i+2)))
   fprintf('\n\n');
   ti=ti+h;
   e=e+1;
end
fprintf('\n\n');
%Este for obtiene y guarda todos los valores de t
%También se utiliza para evaluar la ecuación diferencial
for p=a:h:b
   d=1+d;
   q(d)=p;
   %v(d)=subs(m,p);
end
%Este for se usa para contabilizar las iteraciones
for s=c:1:(d-1)
   g=1+g;
   k(g)=(g-1);
end
k3=k(end);
%Presentación de los datos 
fprintf('              i             ti                wi+1');   
fprintf('\n');
for k1=0:k3
   k2=k1+1;
   fprintf('\n');
   fprintf('              %1.0f        %10.15f        %10.15f',double(k(k2)),double(q(k2)),double(w(k2)));
   fprintf('\n');                                      
end
fprintf('\n');
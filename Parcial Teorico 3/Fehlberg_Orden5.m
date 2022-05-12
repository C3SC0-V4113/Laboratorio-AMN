%M�TODO DE RUNGE-KUTTA-FEHLBERG ORDEN 5
%Terminos de X y Y
% - Introduzca la ecuaci�n diferencial        : 'Dy=y-(x^2)+1'
% - Introduzca la condici�n y(a)=b            : 'y(0)=0.5'
% - Introduzca la funci�n de trabajo          : y-(x^2)+1
% - Introduzca la condici�n inicial           : 0.5
% - Introduzca el valor de a                  : 0
% - Introduzca el valor de b                  : 1
% - Introduzca el tama�o de paso h            : 0.1

clear all
disp('---------------------------------------------------------------------------');
disp('M�todo de RUNGE-KUTTA-FEHLBERG de orden 5');
disp('---------------------------------------------------------------------------');
fprintf('\n')

syms x y
d=input(' - Ingrese la ecuaci�n diferencial en (x,y): ');
n=input(' - Ingrese la condici�n y(a)=b: ');
f1=input(' - Ingrese la funci�n de trabajo: ');
ya=input(' - Ingrese el valor de la condicion inicial: ');
a=input(' - Ingrese el valor de a: ');
b=input(' - Ingrese el valor de b: ');
h=input(' - Ingrese el valor de h: ');
fprintf('\n');

%fprintf(' - La soluci�n de la ecuaci�n diferencial es : \n\n\n');
%m = dsolve(d,n,'x');
%pretty(m);
fprintf('\n');
f=f1;
w(1)=ya;
i=0;
t(1)=a;
q(1)=a;
v(1)=a;
d=0;
c=0;
g=0;
e=1;

disp('---------------------------------------------------------------------------');
disp('Formulas para cada iteracion');
disp('---------------------------------------------------------------------------');
fprintf('\n')

fprintf('- w0 = %1.9f ',double(ya));
fprintf('\n');

for j=a:h:(b-h)
   i=1+i;
   t(i)=j;
  
   fprintf('- Iteraci�n: %1.0f\n',double(e));
   fprintf('\n');
   k1=h*subs(f,{x,y},{t(i),w(i)});
   fprintf('- K1 = h * f(t%1.0f,w%1.0f)',double(i-1),double(i-1));
   fprintf('\n');
   fprintf('- K1 = %1.15f * f(%1.15f,w%1.0f)',double(h),double(t(i)),double(i-1));
   fprintf('\n');
   fprintf('- K1 = %2.15f',double(k1))
   fprintf('\n\n');
   k2=h*subs(f,{x,y},{t(i)+h/4,w(i)+k1/4});
   fprintf('- K2 = h * f(t%1.0f + h/4 , w%1.0f + K1/4)',double(i-1),double(i-1));
   fprintf('\n');
   fprintf('- K2 = %1.15f * f(%1.15f + %1.15f , w%1.0f + %1.15f)',double(h),double(t(i)),double(h/4),double(i-1),double(k1)/4);
   fprintf('\n');
   fprintf('- K2 = %2.15f',double(k2))
   fprintf('\n\n');
   k3=h*subs(f,{x,y},{t(i)+(3.*h/8),w(i)+(3.*k1/32)+(9.*k2/32)});
   fprintf('- K3 = h * f(t%1.0f + (3/8)h , w%1.0f + 3K1/32 + 9K2/32)',double(i-1),double(i-1));
   fprintf('\n');
   fprintf('- K3 = %1.15f * f(%1.15f + %1.15f , w%1.15f + %1.15f + %1.15f)',double(h),double(t(i)),double(((3/8)*h)),double(i-1),(3*(double(k1))/32),(9*(double(k2))/32));
   fprintf('\n');
   fprintf('- K3 = %2.15f',double(k3))
   fprintf('\n\n');
   k4=h*subs(f,{x,y},{t(i)+(12.*h/13),w(i)+(1932.*k1/2197)-(7200.*k2/2197)+(7296.*k3/2197)});
   fprintf('- K4 = h * f(t%1.0f + (12/13)h , w%1.0f + 1932K1/2197 - 7200K2/2197 + 7296K3/2197)',double(i-1),double(i-1));
   fprintf('\n');
   fprintf('- K4 = %1.15f * f(%1.15f + %1.15f , w%1.0f + %1.15f - %1.15f + %1.15f)',double(h),double(t(i)),double(((12/13)*h)),double(i-1),(1932*(double(k1))/2197),(7200*(double(k2))/2197),(7296*(double(k3))/2197));
   fprintf('\n');
   fprintf('- K4 = %2.15f',double(k4))
   fprintf('\n\n');
   k5=h*subs(f,{x,y},{t(i)+h,w(i)+(439.*k1/216)-(8.*k2)+(3680.*k3/513)-(845.*k4/4104)});
   fprintf('- K5 = h * f(t%1.0f + h , w%1.0f + 439K1/216 - 8K2 + 3680K3/513 - 845K4/4104)',double(i-1),double(i-1));
   fprintf('\n');
   fprintf('- K5 = %1.15f * f(%1.15f + %1.15f , w%1.0f + %1.15f - %1.15f + %1.15f - %1.15f)',double(h),double(t(i)),double(h),double(i-1),(439*(double(k1))/216),(8*(double(k2))),(3680*(double(k3))/513),(845*(double(k3))/4104));
   fprintf('\n');
   fprintf('- K5 = %2.15f',double(k5))
   fprintf('\n\n');
   k6=h*subs(f,{x,y},{t(i)+h/2,w(i)-(8.*k1/27)+(2*k2)-(3544.*k3/2565)+(1859.*k4/4104)-(11.*k5/40)});
   fprintf('- K6 = h * f(t%1.0f + h/2 , w%1.0f + 8K1/27 + 2K2 - 3544K3/2565 + 1859K4/4104 - 11K5/40)',double(i-1),double(i-1));
   fprintf('\n');
   fprintf('- K6 = %1.15f * f(%1.15f + %1.15f , w%1.0f + %1.15f + %1.15f - %1.15f + %1.15f - %1.15f)',double(h),double(t(i)),double(h),double(i-1),(8*(double(k1))/27),(2*(double(k2))),(3544*(double(k3))/2565),(1859*(double(k3))/4104),(11*(double(k3))/40));
   fprintf('\n');
   fprintf('- K6 = %2.15f',double(k6))
   fprintf('\n\n');
   w(1+i)=w(i)+(16.*k1/135)+(6656.*k3/12825)+(28561.*k4/56430)-(9.*k5/50)+(2.*k6/55);
   fprintf('- w%1.0f = w%1.0f + (16/135) K1 + (6656/12825) K3 + (28561/56430) K4 - (9/50) K5 + (2/55) K6)',double(i),double(i-1))
   fprintf('\n');
   fprintf('- w%1.0f = w%1.0f + %1.15f + %1.15f + %1.15f - %1.15f + %1.15f',double(i),double(i-1),(16/135)*double(k1),(6656/12825)*double(k3),(28561/56430)*double(k4),(9/50)*double(k5),(2/55)*double(k6))
   fprintf('\n');
   fprintf('- w%1.0f = %2.15f',double(i),double(w(i+1)))
   fprintf('\n\n');
   e=e+1;
end

fprintf('\n');
%Este for obtiene y guarda todos los valores de t
%Tambi�n se utiliza para evaluar la ecuaci�n diferencial
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

%Presentaci�n de los datos 
fprintf('              i             ti                wi+1');   
fprintf('\n\n');

for k1=0:k3
   k2=k1+1;
   fprintf('\n');
   fprintf('              %1.0f        %10.15f        %10.15f         %10.15f        %10.15f',double(k(k2)),double(q(k2)),double(w(k2)));
   fprintf('\n');                                      
end

fprintf('\n'); 
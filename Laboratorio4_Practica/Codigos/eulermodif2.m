%Este programa resuelve ED usando el metodo de euler modificado
%f es la funcion definida entre comillas ///g es la ED entre comillas 
%e es la condicion inicial entre comillas///a y b son los extremos del intervalo
%ya es el valor inicial                  /// h es el tamaño de paso
function E=eulermodif2(f,g,e,a,b,ya,h)
syms t y
m=(b-a)/h;
T=a:h:b;
F=dsolve(g,e)
w(1)=ya; %Primera condicion es igual al valor inicial
for j=1:m+1
    w(j+1)=w(j)+0.5*h*subs(f,{t,y},{T(j),w(j)})+0.5*h*subs(f,{t,y},{T(j+1),w(j)+h*subs(f,{t,y},{T(j),w(j)})});
end
Y=double(subs(F,t,T));
fprintf('        T                   Wi+1                 y(t)');
fprintf('\n');
E=[T'       w'       Y'];

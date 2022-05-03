%Resuelve ecuaciones diferenciales empleando
%EL metodo de Euler Modificado
%F es la función definida
%a y b son los extremos del intervalo
%ya es el valor inicial
%h es el tamaño del paoso
function E=Ejemplo4Euler(a,b,ya,h)
warning('off','MATLAB:dispatcher:InexactCaseMatch')
syms t y
f=y+cos(t);
m=(b-a)/h;
T=a:h:b;
Y(1)=ya;
for j=1:m
    Y(j+1)=Y(j)+0.5*h*subs(f,{t,y},{T(j),Y(j)})+0.5*h*subs(f,{t,y},{T(j+1),Y(j)+h*subs(f,{t,y},{T(j),Y(j)})});
end
E=[T' Y'];


%Valor aproximado
%E=Ejemplo4Euler(0,0.45,0,0.05)

%Valor exacto
%exacta_y=dsolve('Dy=y+cos(t)','y(0)=0')
%Y=double(subs(exacta_y,E(:,1)))

%Error
%error=norm(Y-E(:,2),inf)
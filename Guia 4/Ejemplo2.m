function p=Ejemplo2(t,w)
p=zeros(size(w));
%Matriz obtenida
p=[-17/8 0;0 -17/8]*w+[(1+t+exp(t))/8;(-3-6*t+8*exp(t))/8];

%Obtener aproximada
%[t xy]=ode45(@Ejemplo2,t,[1;0])
%(archivo function,[rango de valores],condicion inicial)

%Obtener exacta
%[X Y]=dsolve('Dx+17/8*x=(t+exp(t)+1)/8','Dy+17/8*y=(8*exp(t)-6*t-3)/8','x(0)=1','y(0)=0')
%exacta_x=double(subs(X,t));
%exacta_y=double(subs(Y,t));
%exacta=[exacta_x  exacta_y]

%Obtener error
%error_x=norm(exacta_x-xy(:,1));
%error_y=norm(exacta_y-xy(:,2));
%error=[error_x  error_y]
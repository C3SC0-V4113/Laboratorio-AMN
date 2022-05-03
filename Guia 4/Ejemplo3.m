function dy=Ejemplo3(t,xy)
dy=[-4*xy(1)-2*xy(2)+cos(t)+4*sin(t);3*xy(1)+xy(2)-3*sin(t)];

%Solución aproximada
%[t xy]=ode45(@Ejemplo3,[0:1/50:1/5],[0;-1])

%Solucion exacta
%[X Y]=dsolve('Dx=-4*x-2*y+cos(t)+4*sin(t)','Dy=3*x+y-3*sin(t)','x(0)=0','y(0)=-1')
%Exacta=[double(subs(X,t))  double(subs(Y,t))]

%Error
%error=[norm(Exacta(:,1)-xy(:,1),inf)    norm(Exacta(:,2)-xy(:,2),inf)]
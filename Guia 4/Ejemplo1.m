function dy=Ejemplo1(t,y)
dy=2*sin(2*t)-1-2*y;

%[t,y] = ode23(@Ejemplo1,[pi/4:pi/50:5*pi/12],0)

%Se obtiene la aproximada de está forma
%(archivo function,[rango de valores],condicion inicial)

%Se obtiene la exacta de está forma
%exacta=dsolve('Dy+2*y=2*sin(2*t)-1','y(pi/4)=0')
%Y=double(subs(exacta,t))

%Se obtiene el error asi
%error=norm(Y-y,inf)





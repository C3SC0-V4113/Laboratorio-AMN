function P1=Ejer1(t,y)
P1=(t-(y^2))/(2*y);

%Aproximada
%[t,y]=ode23(@Ejer1,[0:1/80:3/40],1)

%Exacta
%exacta=dsolve('Dy=(t-(y^2))/(2*y)','y(0)=1')
%exacta_y=double(subs(exacta,t))
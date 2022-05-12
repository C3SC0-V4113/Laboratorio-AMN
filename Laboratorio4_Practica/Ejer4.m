function P1=Ejer4(t,u)
P1=zeros(4,1);
P1(1)=u(2);
P1(2)=u(3);
P1(3)=u(4);
P1(4)=u(4)+10*u(3)-4*u(2)-24*u(1)+t*exp(-2*t)+(t^3)*exp(3*t)+10*exp(3*t);

%Aproximada
%[t,w]=ode45(@Ejer4,[0:1/100:3/50],[15;12;10;5])

%Exacta
%exacta=dsolve('D4y-D3y-10*D2y+4*Dy+24*y=t*exp(-2*t)+(t^3)*exp(3*t)+10*exp(3*t)','y(0)=15','Dy(0)=12','D2y(0)=10','D3y(0)=5')
%exacta_y=double(subs(exacta,t))
function P1=Ejer3(t,u)
P1=[((2668/25)*exp(2*t)+(69764/175)*exp(7*t)-128*t-(1432/7)-64*u(1))/84;((-10672/25)*exp(2*t)+(69764/175)*exp(7*t)+384*t+(4168/7)-64*u(2))/84];

%Aproximada
%[t u]=ode45(@Ejer3,[0:1/100:3/50],[1/2;1/5])

%Exacta
%[X Y]=dsolve('Dx=((2668/25)*exp(2*t)+(69764/175)*exp(7*t)-128*t-1432/7-64*x)/84','Dy=((-10672/25)*exp(2*t)+(69764/175)*exp(7*t)+384*t+4168/7-64*y)/84','x(0)=1/2','y(0)=1/5')
%exacta_x=double(subs(X,t));
%exacta_y=double(subs(Y,t));
%exacta=[exacta_x exacta_y]
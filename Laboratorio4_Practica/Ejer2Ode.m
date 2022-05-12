function P1=Ejer2Ode(t,y)
P1=(y*(3*t+2)+2*t*exp(3*t))/t;

%Aproximada
%[t,y]=ode113(@Ejer2Ode,[1/3:1/100:59/150],0)
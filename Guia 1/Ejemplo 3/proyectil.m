%Este script ,gr�fica el movimiento de un proyectil con una velocidad
%inicial Vo y un �ngulo inicial 0o.
%Adem�s,calcula la altura m�xima y el alcance m�ximo del proyectil

clc
vo=input('Introduzca la velocidad inicial en mts/seg v0 = ');
theta=input('Introduzca el �ngulo inicial en grados, theta0 = ');
theta0=theta*pi/180;
tf=2*vo*sin(theta0)/9.81;
t=0:tf/1000:tf;
x=vo*cos(theta0)*t;
y=vo*sin(theta0)*t-0.5*9.81*t.^2;
hmax=max(y);
rmax=max(x);
fprintf('\n');
fprintf('Altura m�xima= %6.2f \n',hmax);
fprintf('Alcance m�xima= %6.2f \n',rmax);
plot(x,y,'r:');
axis([0 rmax+1 0 hmax+1]);
xlabel('Posici�n en x del proyectil');
ylabel('Posici�n en y del proyectil');
title('Movimiento del proyectil');
text(0.5*rmax-1,hmax+0.2,'hmax');
text(rmax+.2,0,'rmax');
grid on